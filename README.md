# NAME

MooseX::Role::Defaultable - "factory reset" for a Moose class

# VERSION

Version 1.01

# SYNOPSIS

This module provides methods to verify and restore default values for a
Moose object's attributes, essentially providing a "factory reset" option.

Example usage:

        package Foo;
        use Moose;
        use MooseX::Role::Defaultable;

        has field1 => (is => 'rw');
        has field2 => (is => 'rw', default => 'blah');
        has field3 => (is => 'rw', default => sub { [] });

        __PACKAGE__->meta->make_immutable;

        package main;

        my $foo = Foo->new();
        print "Yes" if $foo->is_default;
        $foo->field1('ignored');
        $foo->field2('active');
        $foo->field3(['complex']);
        print "No" unless $foo->is_default;
        print "Yes" if $foo->is_default('field1');
        $foo->restore_default;
        print "Yes" if $foo->is_default;

# METHODS

## is\_default

Return true if an object's attributes are set to their defaults.  A list of
attribute names can be provided, restricting the check to only those
attributes.  Unknown attributes and attributes with no defaults are both
considered to be in their default states.

## restore\_default

Set an object's attributes back to their defaults.  This operation bypasses the
writers so triggers, coercions, and access restrictions will not apply.  Any
attribute that does not have a default is ignored.  A list of attribute names
can be provided, restricting the reset to only those attributes.

# AUTHOR

Aaron Cohen, `<aarondcohen at gmail.com>`

# ACKNOWLEDGEMENTS

This module was made possible by [Shutterstock](http://www.shutterstock.com/)
([@ShutterTech](https://twitter.com/ShutterTech)).  Additional open source
projects from Shutterstock can be found at
[code.shutterstock.com](http://code.shutterstock.com/).

# BUGS

Please report any bugs or feature requests to `bug-MooseX-Role-Defaultable at rt.cpan.org`, or through
the web interface at [https://github.com/aarondcohen/perl-moosex-role-defaultable/issues](https://github.com/aarondcohen/perl-moosex-role-defaultable/issues).  I will
be notified, and then you'll automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::Role::Defaultable

You can also look for information at:

- Official GitHub Repo

    [https://github.com/aarondcohen/perl-moosex-role-defaultable](https://github.com/aarondcohen/perl-moosex-role-defaultable)

- GitHub's Issue Tracker (report bugs here)

    [https://github.com/aarondcohen/perl-moosex-role-defaultable/issues](https://github.com/aarondcohen/perl-moosex-role-defaultable/issues)

- CPAN Ratings

    [http://cpanratings.perl.org/d/MooseX-Role-Defaultable](http://cpanratings.perl.org/d/MooseX-Role-Defaultable)

- Official CPAN Page

    [http://search.cpan.org/dist/MooseX-Role-Defaultable/](http://search.cpan.org/dist/MooseX-Role-Defaultable/)

# LICENSE AND COPYRIGHT

Copyright 2013 Aaron Cohen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
