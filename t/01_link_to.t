use strict;
use Template::Test;

test_expect(\*DATA, undef, { });

__END__

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    hoge => 'huga',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to?hoge=huga">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to?foo=bar',
    hoge => 'huga',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to?foo=bar&hoge=huga">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    hoge => 'huga',
    foo => 'bar',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to?foo=bar&hoge=huga">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    target => '_blank',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to" target="_blank">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    hoge => 'huga',
    target => '_blank',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to?hoge=huga" target="_blank">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    target => '_blank',
    confirm => 'Are you sure?',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to" target="_blank" onclick="return confirm('Are you sure?');">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    hoge => 'huga',
    target => '_blank',
    confirm => 'really ?',
} -%]
[% LinkTo.link_to('link_<br />a&b<br />"text"', args) %]
--expect--
<a href="/link/to?hoge=huga" target="_blank" onclick="return confirm('really ?');">link_&lt;br /&gt;a&amp;b&lt;br /&gt;&quot;text&quot;</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    target => '_blank',
    confirm => 'Are you sure?',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
<a href="/link/to" target="_blank" onclick="return confirm('Are you sure?');">link_text</a>

--test--
[% USE LinkTo -%]
[% args = {
    href => '/link/to',
    target => '_blank',
    confirm => 'Are you sure?',
} -%]
[% LinkTo.link_to('', args) %]
--expect--
<a href="/link/to" target="_blank" onclick="return confirm('Are you sure?');"></a>

### not href

--test--
[% USE LinkTo -%]
[% args = {
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
link_text

--test--
[% USE LinkTo -%]
[% args = {
    confirm => 'Are you sure?',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
link_text

--test--
[% USE LinkTo -%]
[% args = {
    target => '_blank',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
link_text

--test--
[% USE LinkTo -%]
[% args = {
    confirm => 'Are you sure?',
    target => '_blank',
} -%]
[% LinkTo.link_to('link_text', args) %]
--expect--
link_text


