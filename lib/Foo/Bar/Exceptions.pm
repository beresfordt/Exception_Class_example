
package Foo::Bar::Exceptions ;

use strict ;

use Exception::Class (
    
    'Foo::Bar::Exception::System' => {
        description => 'system related exception' 
    },

    'Foo::Bar::Exception::IO' => {
        isa => 'Foo::Bar::Exception::System',
        fields => 'message',
        description => 'IO error reported by system'
    },
);

1 ;