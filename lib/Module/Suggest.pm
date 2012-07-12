package Module::Suggest;
use strict;
use warnings;
use 5.008008;
our $VERSION = '0.01';
use Carp;

BEGIN {
    our %SUGGEST_MAP = (
        'JSON::Any' => 'There is no reason to use JSON::Any today. use JSON.pm instead.',
        'base' => 'use parent.pm',
        'Unicode::Japanese' => 'use Encode and Lingua::JA::Regular::Unicode',
        'HTTP::MobileAttribute' => "It's deprecated. use HTTP::MobileAgent instead.",
    );
    unshift @INC, sub {
        my ($code, $name) = @_;
        $name =~ s!/!::!g;
        $name =~ s/\.pm$//;
        if (my $message = $SUGGEST_MAP{$name}) {
            carp $message;
        }
        return 0;
    }
}

1;
__END__

=encoding utf8

=head1 NAME

Module::Suggest - A suggestion for you

=head1 SYNOPSIS

    perl -MModule::Suggest -e 'use JSON::Any'

=head1 DESCRIPTION

Module::Suggest suggests better module, i seem.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF@ GMAIL COME<gt>

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
