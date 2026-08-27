{ pkgs, config, lib, ... }:

{
  # ===== Kernel Parameters =====
  boot.kernelParams = [
    "slab_nomerge"                    # Complicates use-after-free attacks
    "init_on_free=1"                  # Clear memory upon deallocation
    "pti=on"                          # Kernel page table isolation (Spectre/Meltdown)
    "mitigations=auto"                # Enable all CPU vulnerability mitigations
    "randomize_kstack_offset=on"      # Randomize kernel stack offset
    "vsyscall=none"                   # Disable legacy vsyscall interface
    "page_alloc.shuffle=1"            # Randomize memory page allocation
    "random.trust_cpu=off"            # Don't trust CPU RNG
    "random.trust_bootloader=off"     # Don't trust bootloader RNG
  ];

  # ===== Advanced Kernel Settings =====
  boot.kernel.sysctl = {
    # Prevent information leakage
    "kernel.kptr_restrict" = 2;        # Hide kernel addresses
    "kernel.dmesg_restrict" = 1;       # Restrict access to kernel logs
    "kernel.yama.ptrace_scope" = 1;    # Restrict ptrace to child processes only
    
    # Network security
    "net.core.bpf_jit_harden" = 2;     # Enable BPF JIT hardening
    "net.ipv4.tcp_syncookies" = 1;     # Protect against SYN flood attacks
    "net.ipv4.conf.all.rp_filter" = 1; # Enable reverse path filtering
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.accept_redirects" = 0;  # Ignore ICMP redirects
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;     # Ignore ICMP broadcasts
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1; # Ignore bogus ICMP errors
    
    # ASLR and memory protection
    "kernel.randomize_va_space" = 2;   # Full ASLR (Address Space Layout Randomization)
    
    # Prevent fork bombing
    "kernel.pid_max" = 65536;
    "vm.max_map_count" = 65530;
    
    # Filesystem protection
    "fs.protected_fifos" = 2;          # Restrict FIFO access
    "fs.protected_regular" = 2;        # Restrict regular file access
    "fs.protected_symlinks" = 1;       # Protect against symlink attacks
    "fs.protected_hardlinks" = 1;      # Protect against hardlink attacks
  };

  # ===== Nginx Service Hardening =====
  systemd.services.nginx = {
    serviceConfig = {
      # Filesystem protection
      ProtectSystem = "strict";         # Make system files read-only
      ProtectHome = true;               # Protect home directories
      PrivateTmp = true;                # Isolated temporary directories
      PrivateDevices = true;            # Restrict device access
      
      # Memory and process protection
      MemoryDenyWriteExecute = true;    # Prevent writable executable memory
      NoNewPrivileges = true;           # Prevent privilege escalation
      RestrictRealtime = true;          # Prevent real-time scheduling
      
      # Kernel protection
      ProtectKernelTunables = true;     # Protect kernel tunables
      ProtectKernelModules = true;      # Prevent kernel module loading
      ProtectKernelLogs = true;         # Protect kernel logs

      # System restrictions
      RestrictAddressFamilies = [       # Allowed network address families
        "AF_INET"                       # IPv4
        "AF_INET6"                      # IPv6
        "AF_UNIX"                       # Unix domain sockets
      ];
      SystemCallArchitectures = "native"; # Prevent 32-bit code execution
      SystemCallFilter = [              # System call filter
        "@system-service"               # Allow standard service syscalls
        "~@privileged"                  # Block privileged syscalls
        # Nginx-specific requirements:
        "epoll_create1"                 # For efficient connection handling
        "epoll_wait"                    # For event polling
        "eventfd2"                      # For event notifications
        "sendfile"                      # For fast file transfers
        "splice"                        # For zero-copy data transfer
        # TLS/SSL exception:
        "getrandom"                     # For cryptographic randomness
      ];

      # Resource limits
      LimitNOFILE = 65535;              # Max open file descriptors
      LimitNPROC = 512;                # Max processes

      # Additional isolation
      PrivateIPC = true;               # Isolate inter-process communication
      PrivateUsers = true;             # Isolate user namespace
    };
  };
}
