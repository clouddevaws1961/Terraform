vpc_cidr ="192.168.0.0/16"
public_subnets=["192.168.1.0/24","192.168.2.0/24","192.168.4.0/24"]
public_subnets_az=["ap-south-1a","ap-south-1b","ap-south-1c"]
private_subnets=["192.168.3.0/24"]
private_subnets_az=["ap-south-1c"]

ami="ami-03f4878755434977f"
publickeyjenkins="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxkuVa/fY1jXtWSdxFDzxhAKcyPUFITv7M8U6pD3om9ZkpnZWCEnJ/+mYKk6YSaSpQ1FSU99u6dNtXhhDS0LE3QH9NKmNQuEm37OsuwtRMGOGbCTCT/i6fbZwRY5dPuQxJmNJHIZNA1e8vpQeBegobkf1pWvL+2gd5+XhQkYuV3VwFtU5dTwUbYGDulfK3NZfn1juK8xUnZ95mWPIVIcgS4EB1oevVcv3TbJEVJFHIG3Rim+qoVkPsY8ZfvXG2Nwbbl71JojEm4tqFJJGEbmd4mGMuCq4XAPk4LZBj8sZ1i9ux35CxD+jTZYMIc68ETiheVL3Sq1H6V4ItQF3Zaly3"
awsjenkinssecuritygroup = ""