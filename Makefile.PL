use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'      => 'Template::Plugin::LinkTo',
    'VERSION_FROM' => 'lib/Template/Plugin/LinkTo.pm', # finds $VERSION
    'PREREQ_PM' => {
	Test::More => 0.32,
    },
);
