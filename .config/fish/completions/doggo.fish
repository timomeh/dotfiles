
function __fish_doggo_no_subcommand
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        return 0
    end
    return 1
end

# Meta options
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'version' -d "Show version of doggo"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'help'    -d "Show list of command-line options"

# Query options
complete -c doggo -n '__fish_doggo_no_subcommand' -s 'q' -l 'query'      -d "Hostname to query the DNS records for" -x -a "(__fish_print_hostnames)"
complete -c doggo -n '__fish_doggo_no_subcommand' -s 't' -l 'type'       -d "Type of the DNS Record" -x -a "A AAAA CAA CNAME HINFO MX NS PTR SOA SRV TXT"
complete -c doggo -n '__fish_doggo_no_subcommand' -s 'n' -l 'nameserver' -d "Address of a specific nameserver to send queries to" -x -a "(__fish_print_hostnames)"
complete -c doggo -n '__fish_doggo_no_subcommand' -s 'c' -l 'class'      -d "Network class of the DNS record being queried" -x -a "IN CH HS"
complete -c doggo -n '__fish_doggo_no_subcommand' -s 'r' -l 'reverse'    -d "Performs a DNS Lookup for an IPv4 or IPv6 address"

# Resolver options
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'strategy'  -d "Strategy to query nameserver listed in etc/resolv.conf" -x -a "all random first"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'ndots'     -d "Specify ndots parameter"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'search'    -d "Use the search list defined in resolv.conf" -x -a "true false"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'timeout'   -d "Specify timeout (in seconds) for the resolver to return a response"
complete -c doggo -n '__fish_doggo_no_subcommand' -s '4' -l 'ipv4' -d "Use IPv4 only"
complete -c doggo -n '__fish_doggo_no_subcommand' -s '6' -l 'ipv6' -d "Use IPv6 only"

# Output options
complete -c doggo -n '__fish_doggo_no_subcommand' -s 'J' -l 'json'  -d "Format the output as JSON"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'short'        -d "Shows only the response section in the output"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'color'        -d "Colored output" -x -a "true false"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'debug'        -d "Enable debug logging"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'time'         -d "Shows how long the response took from the server"

# TLS options
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'tls-hostname'               -d "Hostname for certificate verification" -x -a "(__fish_print_hostnames)"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'skip-hostname-verification' -d "Skip TLS hostname verification in case of DoT lookups"

# Globalping options
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'gp-from'  -d "Query using Globalping API from a specific location"
complete -c doggo -n '__fish_doggo_no_subcommand' -l 'gp-limit' -d "Limit the number of probes to use from Globalping"

# Completions command
complete -c doggo -n '__fish_doggo_no_subcommand' -a completions -d "Generate shell completion scripts"
complete -c doggo -n '__fish_seen_subcommand_from completions' -a "bash zsh fish" -d "Shell type"

