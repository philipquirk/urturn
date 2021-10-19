/-  urturn
/+  default-agent, dbug
|%
+$  versioned-state
    $%  state-0
    ==
+$  state-0  [%0 url=(unit @t) port=(unit @ud) key=(unit @t)]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this     .
    default   ~(. (default-agent this %|) bowl)
::
++  on-init
~&  >  'on-init'
  `this
++  on-save
  ^-  vase
  !>(state)
++  on-load
  ~&  >  'on-load'
  on-load:default
++  on-poke  
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:default mark vase)
      %urturn-request
      ~&  >  'urturn-request'
      =/  =request:http  [%'GET' (need url) ~ ~]
      =/  =card:agent:gall  [%pass /http-req %arvo %i %request request *outbound-config:iris]
      [~[card] this]
      ::
      %urturn-configure 
      ~&  >  'urturn-configure'
      =/  data  !<  configure:urturn  vase 
      ?-  data  
        [%set-url *]
          `this(url (some url.data), port (some port.data))
        [%set-access-key *]
          `this(key (some key.data))
      ==
    ==
::
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-peek   on-peek:default
++  on-agent  on-agent:default
++  on-arvo  
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?>  ?=  [%iris %http-response *]  sign-arvo 
  ?.  ?=  [%finished *]  client-response.sign-arvo
    `this
  ~&  >  client-response.sign-arvo
  `this
++  on-fail   on-fail:default
--
