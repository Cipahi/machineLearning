# >>> import nltk
# >>> nltk.download()
# Download Everything used in book. You need the corpa to test this.

from textblob import TextBlob
from textblob.classifiers import NaiveBayesClassifier
train = [
     ('I love this sandwich.', 'pos'),
     ('This is an amazing place!', 'pos'),
     ('I feel very good about these beers.', 'pos'),
     ('I do not like this restaurant', 'neg'),
     ('I am tired of this stuff.', 'neg'),
     ("I can't deal with this", 'neg'),
     ("My boss is horrible.", "neg")
]
cl = NaiveBayesClassifier(train)
cl.classify("I feel amazing!")  #'pos'

# check sentiment on blob
blob = TextBlob("The beer is good. But the hangover is horrible.", classifier=cl)
for s in blob.sentences:
    print('Sentence: %s' %  s)
    print('Sentiment: %s\n' % s.classify())