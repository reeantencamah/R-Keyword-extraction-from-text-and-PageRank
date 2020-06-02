library(ontologyIndex)
library(tm)
library(SnowballC)

ontology <- get_ontology("C:/Users/galaxy/Documents/Icms CSE/YEAR 3/CSE 3125Y IRKEM/Assign/Food3.owl", extract_tags="everything")


# text from each in ontology
ab<- data.frame(ontology$comment)
desc.list <- as.list(as.data.frame(t(ab)))
desc.list


food<-"Food is usually of plant or animal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals"
apple <-"Apples are among the most popular fruits, and also happen to be incredibly      nutritious. They contain a high amount of fiber, vitamin C, potassium and vitamin K. They also provide some B vitamins (19)"
orange <-" Orange helps normalize bowel movements, lowers cholesterol levels, controls blood sugar, maintains bowel health and aids in achieving a healthy weight.Oranges are an excellent source of vitamin C"
dailyproduct<-"Daily products are primarily produced from mammals such as cattle, water buffaloes, goats, sheep, camels and humans."
cheese<-"Cheese is a dairy product derived from milk. Cheese contains the goodness of a number of essential nutrients, including protein, calcium, zinc, phosphorus, magnesium, vitamin A, vitamin B2 (riboflavin) and vitamin B12"
butter<-" Butter is a dairy product made from the fat and protein components of milk or cream. It is a semi-solid emulsion at room temperature, consisting of approximately 80% butterfat."
buttermilk<-"Buttermilk is the liquid that is leftover after churning butter. It's low in fat and contains most of the protein originally in the milk. True buttermilk ferments naturally into a thick, tangy cream"
seafood<-"Seafood is any form of sea life regarded as food by humans, prominently including fish and shellfish."
salmon<-"Salmon is a common food classified as an oily fish with a rich content of protein and omega-3 fatty acids. Choosing salmon as your lean protein source might not only help you lose weight, but also help prevent insulin resistance"
tuna<-"It contains all essential amino acids required by the body for growth and maintenance of lean muscle tissue. Canned tuna can be a good source of heart-healthy omega-3 fatty acids, with 150 milligrams or more per four-ounce serving."
shrimp<-"It is high in several vitamins and minerals, and is a rich source of protein. Eating shrimp may also promote heart and brain health."
vegetable<-"Vegetables are parts of plants that are consumed by humans or other animals as food."
carrot<-"Carrots, among other non-starchy vegetables, are a great addition to a healthy diet for people with diabetes. They contain plenty of important nutrients that benefit blood sugar levels, such as vitamin A and fiber."
cauliflower<-"It provides antioxidants and phytonutrients that can protect against cancer. It also contains fiber to enhance weight loss and digestion"
proteinpowder<-"People use them to increase muscle mass, improve overall body composition and help meet their protein needs"
wheyprotein<-"People commonly use whey as supplementation, alongside resistance exercise, to help improve muscle protein synthesis and promote the growth of lean muscle mass"
eggprotein<-"Given its value as a high quality natural protein, egg whites and egg white protein powder have been a favored food supplement for many years"
caseinprotein<-"Casein protein is derived from milk. It is a slow-digesting protein that contains all the essential amino acids your body needs"
mealplan<-"A meal plan is any strategy used to map out what you're going to eat. This term may refer to following a specific diet, or it may just indicate the process of thinking through what you plan to eat beforehand. A meal plan helps with weight control, and contributes to an overall nutritionally balanced diet and reduces stress."
breakfastplan<-"Breakfast is a meal eaten in the morning as the first meal of the day. A healthy breakfast should consist of a variety of foods, for example, low-fat or fat free milk, whole grains, lean meats or meat alternates, and fruits and vegetables. It is good to eat apples for breakfast. A healthy meal in the morning may help to combat obesity and both children  and adults need at least 3 servings per morning including either milk, yogurt, cheese, butter, one fruit."
dinner<-"Dinner is a formal evening meal. A dinner should have proteins (meat, seafood, beans, nuts, meat substitutes like burgers), vegetables (broccoli, cauliflowers, greens, tomatoes, carrots), fruits (bananas, apples, melons, oranges, grapes), grains (rice, potatoes, corn, pasta, bread, oats), and dairy (yogurt, cheese, milk and milk substitutes)"
lunch<-"Lunch is a meal eaten in the middle of the day, typically one that is lighter or less formal than an evening meal. To have a healthy lunch, one needs to have a selection of fresh salads, vegetables like carrot, cauliflowers, nutritious snacks, soup with some protein like chicken, salmon, tuna, shrimp or other seafood with bread or sandwich"
morningsnack<-"morning snack is a small portion of food or drink or a light meal, especially one eaten between breakfast and lunch. A morning snack may consist of a low fat yogurt and fresh fruits, you can  add a little whole grain cereal or a small roll with ham or cheese and a piece of fruit"
proteindrink<-"The best time to consume a protein for muscle growth (protein supplement) is 15-60 minutes after exercise. The types of protein drinks are whey protein, egg protein and casein protein. This protein drink helps to increase muscle mass and improve overall body composition"
nutrient<-"A nutrient is a substance used by an organism to survive, grow, and reproduce"
carbohydrates<-"Carbohydrates are the sugars, starches and fibers found in fruits, grains, vegetables and milk products."
rice<-"Rice is an excellent food source, low in fat and high in starchy carbohydrates. Rice is packed full of vitamins and minerals and provides an excellent source of vitamin E, B vitamins (thiamin, niacin) and potassium"
bread<-"Breads are rich in complex carbohydrates. Carbohydrates are an important part of our diet as they provide us with energy. Our bread contains various B vitamins."
potato<-"Potatoes are considered a heart healthy food, too, because they are rich in potassium, vitamin C and fiber."
minerals<-"Minerals are those elements on the earth and in foods that our bodies need to develop and function normally"
calcium<-"The main foods rich in calcium are dairy products like milk, cheese and yogurt. However, many non-dairy sources are also high in this mineral"
magnesium<-"Magnesium is found in a variety of foods, but the best sources tend to be green leafy vegetables, raw cacao, nuts and seeds"
potassium<-"Bananas, oranges, cantaloupe, honeydew, apricots, grapefruit (some dried fruits, such as prunes, raisins, and dates, are also high in potassium)"
protein<-"Protein is a macronutrient that is essential to building muscle mass. It is commonly found in animal products, though is also present in other sources, such as nuts and legumes."
vitaminA<-"Vitamin A is important for normal vision, the immune system, and reproduction. Best sources of vitamin A are: egg, cheese, carrot, leafy vegetables, broccoli"
vitaminB<-"Vitamin B plays  important roles in cell metabolism. They are found in cheese, meat, dairy products, and green vegetables."
vitaminB12<-"Vitamin B12 is essential for the production of your red blood cells and DNA, as well as the proper functioning of your nervous system. B12 is found in cheese, meats, fish, eggs"
vitaminC<-"Vitamin C helps form and maintain bones, skin, and blood vessels. Vitamin C are found in Oranges, Broccoli, cauliflower, kiwi and potato"
vitaminK<-"Vitamin K makes proteins for healthy bones and normal blood clotting. People gets vitamin K while consuming green leafy vegetables such as Kale, spinach, lettuce and vegetables like cauliflowers, cabbage and broccoli"


# add all text to a single doc
doc.list <- list(food,apple,orange,dailyproduct,cheese,butter,buttermilk,seafood,salmon,tuna,shrimp,vegetable,carrot,potato,cauliflower,proteinpowder,wheyprotein,eggprotein,caseinprotein,mealplan,breakfastplan,dinner,lunch,morningsnack,proteindrink,nutrient,carbohydrates,rice,bread,minerals,calcium,magnesium,protein,vitaminA,vitaminB,vitaminB12,vitaminC,vitaminK)
doc.list
names(doc.list)<-c("food","apple","orange","dailyproduct","cheese","butter","buttermilk","seafood","salmon","tuna","shrimp","vegetable","carrot","potato","cauliflower","proteinpowder","wheyprotein","eggprotein","caseinprotein","mealplan","breakfastplan","dinner","lunch","morningsnack","proteindrink","nutrient","carbohydrates","rice","bread","minerals","calcium","magnesium","protein","vitaminA","vitaminB","vitaminB12","vitaminC","vitaminK")
N.docs <- length(doc.list)
N.docs

# query
query <- "food and fruits with vitamin A"



#Make  A Corpus
my.docs <- VectorSource(c(doc.list, query))
my.docs$Names <- c(names(doc.list), "query")
my.docs

my.corpus <- Corpus(my.docs)
my.corpus

#Clean and Transform the corpus

# Convert to Lower Case
my.corpus2<- tm_map(my.corpus, tolower)
my.corpus2

## Remove Stopwords
my.corpus3<- tm_map(my.corpus2, removeWords, stopwords("english"))
## Remove Punctuations
my.corpus4<- tm_map(my.corpus3, removePunctuation)
## Remove Numbers
my.corpus5<- tm_map(my.corpus4, removeNumbers)
# Eliminating Extra White Spaces
my.corpus6<- tm_map(my.corpus5, stripWhitespace)


# stemming
my.corpus7 <- tm_map(my.corpus6, stemDocument)

dtm <- DocumentTermMatrix(my.corpus7)
dtm
inspect(dtm)

# do tfxidf
dtm_tfxidf <- weightTfIdf(dtm)
inspect(dtm_tfxidf)

#Calculate page rank
m<-(as.matrix(dtm_tfxidf))
m

# filter to keep values greater than 0
Filt_m <-m[,m[39,]>0]
Filt_m

# # calculate cosine distance
# CosineCoeff<-0*(1:N.docs)
# for (i in 1:N.docs) {
#   CosineCoeff[i]<-sum(Filt_m[i,]*Filt_m[9,])/(sum(Filt_m[i,]^2)^0.5 *sum(Filt_m[9,]^2)^0.5)
# }
# 
# PageRank<-CosineCoeff[order(CosineCoeff,decreasing=TRUE)]
# RankedPages<-desc.list[order(CosineCoeff,decreasing=TRUE)]



EuclCoeff<-0*(1:N.docs)
for (i in 1:N.docs) {
  EuclCoeff[i]<-sum((Filt_m[i,]-Filt_m[39,])^2)^0.5
}
order(EuclCoeff)
PageRank<-EuclCoeff[order(EuclCoeff)]
RankedPages<-doc.list[order(EuclCoeff)]

# display result based on query
PageRank
RankedPages




##################################
#keyword for classes 

doc.listfood <- list(food,apple,orange,dailyproduct,cheese,butter,buttermilk,seafood,salmon,tuna,shrimp,vegetable,carrot,potato,cauliflower,proteinpowder,wheyprotein,eggprotein,caseinprotein)
doc.listfood
names(doc.listfood)<-c("food","apple","orange","dailyproduct","cheese","butter","buttermilk","seafood","salmon","tuna","shrimp","vegetable","carrot","potato","cauliflower","proteinpowder","wheyprotein","eggprotein","caseinprotein")

doc.listmealplan<-list(mealplan,breakfastplan,dinner,lunch,morningsnack,proteindrink)
names(doc.listmealplan)<-c("mealplan","breakfastplan","dinner","lunch","morningsnack","proteindrink")

doc.listnurtrients<-list(nutrient,carbohydrates,rice,bread,minerals,calcium,magnesium,protein,vitaminA,vitaminB,vitaminB12,vitaminC,vitaminK)
names(doc.listnurtrients)<-c("nutrient","carbohydrates","rice","bread","minerals","calcium","magnesium","protein","vitaminA","vitaminB","vitaminB12","vitaminC","vitaminK")


#Make  A Corpus
my.docs <- VectorSource(doc.listnurtrients)
my.docs
N.docs <- length(doc.listfood)
N.docs

my.corpus <- Corpus(my.docs)
my.corpus

#Clean and Transform the corpus

# Convert to Lower Case
my.corpus2<- tm_map(my.corpus, tolower)
my.corpus2

## Remove Stopwords
my.corpus3<- tm_map(my.corpus2, removeWords, stopwords("english"))
## Remove Punctuations
my.corpus4<- tm_map(my.corpus3, removePunctuation)
## Remove Numbers
my.corpus5<- tm_map(my.corpus4, removeNumbers)
# Eliminating Extra White Spaces
my.corpus6<- tm_map(my.corpus5, stripWhitespace)


# stemming
my.corpus7 <- tm_map(my.corpus6, stemDocument)

dtm <- DocumentTermMatrix(my.corpus6)
dtm
inspect(dtm)

# do tfxidf
dtm_tfxidf <- weightTfIdf(dtm)
inspect(dtm_tfxidf)

library(tidytext)
table<- tidy(dtm_tfxidf)
#sum for each term in the collection
table<-tapply(table$count, table$term, FUN=sum)

zx<-data.frame(sapply(table,max[5]))






#keyword for each class

keyword<-data.frame(food =c("vitamin","food","humans","protein","fiber"),mealplan =c("protein","plan","morning","muscle","diet"),nutrient =c("carbohydrates","vitamin","vegetables","grow","nutrient"))
