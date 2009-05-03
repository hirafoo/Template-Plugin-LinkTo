use strict;
use inc::Module::Install;

name 'Template-Plugin-LinkTo';
all_from 'lib/Template/Plugin/LinkTo.pm';

requires 'Template';
requires 'Template::Plugin';
requires 'URI::Escape';
auto_install;

build_requires 'Test::More';
WriteAll;
