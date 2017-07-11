class CompanyProfile

# Share Price Data
  @CurrentPrice
  @AvgDailyPrice
  @Day5Price
  @Day30Price

# Altman Z Score Variables
  @WorkingCapital
  @RetainedEarnings
  @EarningsBeforeInterestTax
  @MarketValueOfEquity
  @Sales  # Quantitative Analyasis
  @TotalAssets # Quantitaive Analyasis
  @TotalLiabilites

# Beneish M Score Variables
# https://www.oldschoolvalue.com/blog/investment-tools/beneish-earnings-manipulation-m-score/
  @DSRI
  @GMI
  @AQI
  @SGI
  @DEPI
  @SGAI
  @LVGI
  @TATA





  def initialize(name, symbol, inPortfolio)
    @name = name
    @symbol = symbol

  end

# Using the provided address give/update the location of the latest 10k form for the company
  def set10KForm(pdfAddress)

  end

# Scrapes the 10k for the data needed for data calculation
  def scrape10kForm()

  end


# The Altman Z Score rates the Credit Strength of a Company
# It measures the likelyhood of a company going bankrupt
# The Formula is 1.2(Working Captial / Total Assests) + 1.4(Retained Earning/ TA) +
# 3.3(Earnings Before Interest&Tax / TA) + (Market Value of Equity / Total Liabilites)
# + (Sales / TA)
# If the score is below 1.8 = destined for bankruptcy
# If the score is above 3.0, bankruptcy not likely
  def calcAltmanZScore()

    zScore = (1.2 * (WorkingCapital / TotalAssets)) + (1.4 * (RetainedEarnings / TotalAssets)) + (3.3 * (EarningsBeforeInterestTax / TotalAssets) + (0.6 * (MarketValueOfEquity / TotalLiabilites)) + (Sales / TotalAssets)

    return zScore

  end
# M Score is a check for currency manipulation.  Good for smaller firms, more volatile comanies.
# The Implementation of this is low priority
#https://www.oldschoolvalue.com/blog/investment-tools/beneish-earnings-manipulation-m-score/
  def calcBeneishMScore()

    mScore = -4.84 + 0.92 * DSRI + 0.528 * GMI + 0.404 * AQI + 0.892 * SGI + 0.115 * DEPI – 0.172 * SGAI + 4.679 * TATA – 0.327 * LVGI

    return mScore

  end

  # Price Multiples

  def calcPriceMultipleNumbers(price)

    # Price Earnings

    price /




  end


  def updateData()

  end




  end
