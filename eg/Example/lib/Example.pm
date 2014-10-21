package Example;
use strict;
use warnings;
use Egg qw/ -Debug
  IxHash
  Dispatch::Fast
  Debugging
  Log
  /;

our $VERSION= '0.01';

__PACKAGE__->egg_startup(

  title      => 'Example',
  root       => '/path/to/Example',
  static_uri => '/',
  dir => {
    lib      => '< $e.root >/lib',
    static   => '< $e.root >/htdocs',
    etc      => '< $e.root >/etc',
    cache    => '< $e.root >/cache',
    tmp      => '< $e.root >/tmp',
    template => '< $e.root >/root',
    comp     => '< $e.root >/comp',
    },
  template_path=> ['< $e.dir.template >', '< $e.dir.comp >'],

  );

our $ixHash= __PACKAGE__->ixhash(
  foo1 => 'booo1',
  foo2 => 'booo2',
  foo3 => 'booo3',
  foo4 => 'booo4',
  foo5 => 'booo5',
  );

# Dispatch. ------------------------------------------------
__PACKAGE__->run_modes(

  _default => sub {
    my($dispatch, $e)= @_;
    my $body= $e->cache('Content')->get('BlankPage') || do {
        require Egg::Helper::BlankPage;
        my $tmp= Egg::Helper::BlankPage->out($e);
        $e->cache('Content')->set('BlankPage' => \$tmp);
        \$tmp;
      };
    $e->response->body( $body );
    },

  );
# ----------------------------------------------------------

1;
