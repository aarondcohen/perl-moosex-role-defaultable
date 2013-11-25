use strict;
use warnings;

use ExtUtils::MakeMaker;
use ExtUtils::MakeMaker::CPANfile;

WriteMakefile(
	NAME                => 'MooseX::Role::Defaultable',
	AUTHOR              => q{Aaron Cohen <acohen@shutterstock.com>},
	VERSION_FROM        => 'lib/MooseX/Role/Defaultable.pm',
	ABSTRACT            => '',
);
