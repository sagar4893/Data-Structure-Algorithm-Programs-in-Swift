let tagger = NSLinguisticTagger(tagSchemes: [.nameTypeOrLexicalClass], options: 0)
        tagger.string = string
        
        let fullRange = NSRange(location: 0, length: string.utf8.count)
        tagger.enumerateTags(in: fullRange, unit: .word, scheme: .nameTypeOrLexicalClass, options: [.omitPunctuation, .omitWhitespace]) { tag, range, stop in
            
            let str = (tagger.string! as NSString).substring(to: range.length)
            
            if tag == .word {
                print("Word = \(str)")
            }
            else if tag == .noun {
                print("Noun = \(str)")
            }
            else if tag == .adjective {
                print("Adjective = \(str)")
            }
        }
