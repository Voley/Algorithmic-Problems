/*
  XML Encoding
     Since XML is very verbose, you are given a way of encoding it where each tag gets mapped to a pre-defined integer value.
*/

class Element {
    var name = ""
    var value: String? = ""
    var attributes: Array<Attribute> = []
    var children: Array<Element> = []
}

class Attribute {
    var name = ""
}

func encode(_ element: Element) -> String {
    var result = ""
    result += encodeString(element.name)
    
    for attr in element.attributes {
        result += encodeString(attr.name)
    }
    
    result += encodeString("0")
    if let val = element.value {
        result += encodeString(val)
    } else {
        for el in element.children {
            result += encode(el)
        }
    }
    result += encodeString("0")
    return result
}

func encodeString(_ str: String) -> String {
    return ""
}
