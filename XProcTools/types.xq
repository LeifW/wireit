declare namespace d="http://docbook.org/ns/docbook"; 
declare namespace p="http://www.w3.org/ns/xproc"; 
declare namespace e="http://www.w3.org/1999/XSL/Spec/ElementSyntax"; 
for $type in distinct-values(doc("http://www.w3.org/TR/xproc/langspec.xml")/id("std-components")/d:section/d:section/p:declare-step/p:option/@e:type) 
  return concat(string($type),"
")

