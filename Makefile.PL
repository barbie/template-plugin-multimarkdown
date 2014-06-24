use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Template::Plugin::MultiMarkdown',
    VERSION_FROM      => 'lib/Template/Plugin/MultiMarkdown.pm',
    PREREQ_PM         => {
        Template            => 2.16,
	Text::MultiMarkdown => '1.0.1',
    },
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Template/Plugin/MultiMarkdown.pm',
       AUTHOR         => 'Andrew Ford <andrew@ford-mason.co.uk>') : ()),
);
