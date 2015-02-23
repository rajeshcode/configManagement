#!/usr/bin/perl
#
# jvaldez

use Socket;

sub ipres{
        my $name = shift;
        my $iaddr;


        $iaddr = inet_ntoa((gethostbyname($name))[4]);

	@ip = split(/\./,$iaddr);
	return ("$ip[2]");
	

}

$rack=ipres($ARGV[0]);
chomp $rack;

print "/default/rack$rack\n";

