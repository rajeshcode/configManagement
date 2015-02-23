#!/usr/bin/perl
#
# jvaldez

use Socket;
use strict;

my $slaves_pathname = "/apache/hadoop/conf/slaves";

sub read_slaves {
	my($path) = @_;

	if (open SLAVES, $path) {
		my @slaves = map {chomp; $_;} <SLAVES>;
		\@slaves;
	} else {
		undef;
	}
}

sub ipres {
	my($name, $slaves) = @_;

	if ($slaves and !grep /^$name$/, @$slaves) {
		$name = $slaves->[rand(@$slaves)];
	}

	$name = (split(/:/, $name, 2))[0];
	my $iaddr = inet_ntoa((gethostbyname($name))[4]);

	my @ip = split(/\./, $iaddr);
	return $ip[2];
}

my $slaves = read_slaves $slaves_pathname;

for my $hostname (@ARGV) {
	my $rack = ipres($hostname, $slaves);
	print "/default/rack$rack\n";
}
