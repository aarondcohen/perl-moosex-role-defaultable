package MooseX::Role::Defaultable;

use strict;
use warnings;

use Moose::Role;
use Sub::IsEqual qw{is_equal};
use namespace::autoclean;

sub is_default {
	my $self = shift;

	my @attributes = @_
		? map { $self->meta->find_attribute_by_name($_) } @_
		: $self->meta->get_all_attributes;

	for my $attribute (grep { $_->has_default } @attributes) {
		return 0
			unless defined $attribute
			&& is_equal($attribute->default($self), $attribute->get_value($self));
	}

	return 1;
}

sub restore_default {
	my $self = shift;

	my @attributes = @_
		? grep { defined $_ } map { $self->meta->find_attribute_by_name($_) } @_
		: $self->meta->get_all_attributes;

	for my $attribute (grep { $_->has_default } @attributes) {
		$attribute->clear_value($self);
		$attribute->set_value($self, $attribute->default($self));
	}

	return;
}

1;
