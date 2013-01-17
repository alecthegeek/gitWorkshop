; $Id: README.txt,v 1.1.2.1 2009/06/25 04:11:56 danielb Exp $

CONTENTS OF THIS FILE
----------------------

  * Introduction
  * Installation
  * Configuration
  * Usage
  

INTRODUCTION
------------
Maintainer: Daniel Braksator (http://drupal.org/user/134005)

Project page: http://drupal.org/project/misery.


INSTALLATION
------------
1. Copy misery folder to modules (usually 'sites/all/modules') directory.
2. At 'admin/build/modules' enable the Misery module and the Misery PHP module.


CONFIGURATION
-------------
1. Enable permissions at 'admin/user/permissions'.  Any roles with the
   'endure misery' permission and without the 'administer misery' permission
   will enjoy the effects of the Misery module by default.
2. Configure Misery at 'admin/user/misery'.


USAGE
-----
There are a number of ways to inflict misery:
  a) Using roles and permission as per the configuration above.
  b) By editing an individual user's account page and ticking 'endure misery'.
  c) Using the Troll module's "blacklist" feature to punish IP addresses' with
     misery.  Troll is available at http://drupal.org/project/troll.
  d) By programatically flagging an account with $user->endure_misery = TRUE.
  e) By programatically responding to hook_misery_access() with TRUE.

