'''
Created on Mar 7, 2014

@author: kyanyoga
'''
from textblob import TextBlob

class sentiPoint(object):
    def __init__(self):
        x = 1
        data = {}
        
        print "Analysis of Sentiment: PointInside Apps Related : RetailWire Quotes"
        print "The polarity score is a float within the range [-1.0, 1.0]."
        # print "The subjectivity is a float within the range [0.0, 1.0] where 0.0 is very"
        # print "objective and 1.0 is very subjective."
        
        quotes = {
        '''
        Both Hillary Clinton?s and Donald Trump?s teams see September as the month that will make
        or break their candidate?s case for the White House. A confident Clinton fighting to keep
        expectations in check will ratchet up her get-out-the-vote operation while courting more
        Republicans to her camp. A defiant Trump will double down on the America-first message that
        he thinks got him this far in the first place. The Democrat's allies will continue to blanket
        the battleground airwaves with stinging attacks on Trump?s character. And three weeks into the
        month, early voting periods will open, state by state.
        '''
        }
        
        for quote in quotes:
            print "*quote:" + str(x) + "-*"
            data = self.parse_text(quote)
            print "Quote Polarity: %s" % (data.sentiment.polarity)
            print 
            x += 1
    
    def parse_text(self,text):
        x = 0
        data = TextBlob(text)
        
        for sentence in data.sentences:
            x += 1
            # print sentence.translate(to="es")
            print "%s - %s" % (x, sentence)
            print "---------- ---------- ---------- ---------"
            print "sentence polarity: %s" % (sentence.sentiment.polarity)
    
        return data
        
    
if __name__ == '__main__':
    sp = sentiPoint()   