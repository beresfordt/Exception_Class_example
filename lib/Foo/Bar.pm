
package Foo::Bar ;

our $VERSION = '0.01' ;

use Moose ;
use Foo::Bar::Exceptions ;

sub open{

    my ( $self, $arg ) = @_ ;

    unless( -e $arg ){
        Foo::Bar::Exception::IO->throw( message => 'File does not exist' ) ;
        return ;
    }
}

1 ;