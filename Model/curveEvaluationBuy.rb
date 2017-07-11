

def volatilityCalc(a1, h1, l1, a2, h2, l2, a3, h3, l3, a4, h4, l4)
  #Calculates the volatility of a stock over the course of the last few Days
  #Stock volatility is calcuated by the following formula
  # all of these numbers are changes in percent
  #   1 - (((DayHi - 1) + (DayLo - 1)) + ... + ... + ...) / 4) * 10


  hi1 = h1 / a1 #fraction of the averages of each.  Equal to day hi and day lo
  lo1 = l1 / a1

  hi2 = h2/ a2
  lo2 = l2 / a2

  hi3 = h3/ a3
  lo3 = l3/ a3

  hi4 = h4 / a4
  lo4 = l4 / a4

  volatility = ((((hi1 - 1) + (1 - lo1) + (hi2 - 1) + (1 - lo2) + (hi3 - 1) + (1 - lo3) + (hi4 - 1) + (1 - lo4)) / 4)) * 10

  puts "Volatilty = #{volatility} / 10"


end


def calcIdealCurve(hi5, lo5, hi4, lo4, hi3, lo3, hi2, lo2, hi1, lo1, curr)
# Evaluates the curve based on the 1/2, 1/4, 1/8, 1/8 model for valley detection


rating = 0;

hiAvg = (hi5 + hi4 + hi3 + hi2 + hi1) / 5;
loAvg = (lo5 + lo4 + lo3 + lo2 + lo1) / 5;

hiDelta5 = (curr - hi5)
hiDelta4 = (curr - hi4)
hiDelta3= (curr - hi3)
hiDelta2 = (curr - hi2)
hiDelta1 = (curr - hi1)

loDelta5 = (curr - lo5)
loDelta4 = (curr - lo4)
loDelta3 = (curr - lo3)
loDelta2 = (curr - lo2)
loDelta1 = (curr - lo1)

avgDelta5 = (hiDelta5 + loDelta5) / 2
avgDelta4 = (hiDelta4 + loDelta4) / 2
avgDelta3 = (hiDelta3 + loDelta3) / 2
avgDelta2 = (hiDelta2 + loDelta2) / 2
avgDelta1 = (hiDelta1 + loDelta1) / 2

# Calculates How well the Data Matches the Ideal Curve Model by comparing the averages
# Change in delta between consecutive days.
if avgDelta5 < 0  # if the change of the first day is negative
  if avgDelta4 < 0 # and the second day is negative
    if avgDelta5 < avgDelta4 # if the negative change is becoming less
      rating = rating + 15  # this is allready a majority of the way there so add 15 to the rating, which is out of 100
      if ((avgDelta4 > ((avgDelta5 / 2) + (avgDelta5 / 10))) and (avgDelta4 < ((avgDelta5 / 2) - (avgDelta5 / 10)))) # Bonus Round, if it is half of the Delta plus or minus 10%        rating = rating + 5
      end
    end
  end
end

  if avgDelta4 < 0
    if avgDelta3 < 0
      if avgDelta4 < avgDelta3
        rating = rating + 15
        if ((avgDelta3 > ((avgDelta4 / 2) + (avgDelta3 / 10))) and (avgDelta3 < ((avgDelta4 / 2) - (avgDelta4 / 10))))
          rating = rating + 5
        end
      end
    end
  end

    if avgDelta3 < 0
      if avgDelta2 < 0
        if avgDelta3 < avgDelta2
          rating = rating + 15
          if ((avgDelta2 > ((avgDelta3 / 2) + (avgDelta3 / 10))) and (avgDelta2 < ((avgDelta3 / 2) - (avgDelta3 / 10))))
            rating = rating + 5
          end
        end
      end
    end

      if avgDelta2 < 0
        if avgDelta1 < 0
          if avgDelta2 < avgDelta4
            rating = rating + 15
            if (avgDelta1 > ((avgDelta2 / 2) + (avgDelta2 / 10))) and (avgDelta1 < ((avgDelta2 / 2) - (avgDelta2 / 10)))
              rating = rating + 5
            end
          end
        end
      end

        if curr > (((hi1 + lo1)) / 2)  # If the stock is trending upwards add 15, if it rocket above the average, then buy buy buy
          rating = rating + 15
          if curr > ((hiAvg+ loAvg) / 2)
            rating = rating + 5
          end
        end


        puts "Ideal Curve Rating = #{rating} / 100"

end

def rateCurve()
  curverating = 100


  calcIdealCurve 28.2, 28.19, 28.2, 28.0, 28.2, 27.6, 27.75, 26.2, 26.2, 25.5, 27
  volatilityCalc 28.19, 28.2, 28.17, 28.0, 28.2, 27.6, 26.2, 27.75, 25.55, 27.6, 27.8, 27.5


  puts "BUY RATING FOR GENERAL ELECTRIC (GE) ON 6/26/2017 "
  puts "#{curverating} / 100"

end


rateCurve
