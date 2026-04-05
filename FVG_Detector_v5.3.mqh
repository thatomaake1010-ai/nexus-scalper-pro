// FVG_Detector_v5.3.mqh

// Import necessary libraries
#include <Trade.mqh>

// Class for Fair Value Gap detection
class FairValueGap {
public:
    // Constructor
    FairValueGap(double gapSize, double fillProbability) : 
        m_gapSize(gapSize), 
        m_fillProbability(fillProbability) {}

    // Method to detect Fair Value Gaps
    bool DetectFVG(double high, double low, double close) {
        // Logic to calculate fair value gaps
        if ((high - low) >= m_gapSize) {
            // A gap is detected
            return true;
        }
        return false;
    }

    // Method to calculate gap size
    double CalculateGapSize(double high, double low) {
        return high - low;
    }

    // Method to estimate fill probability
    double EstimateFillProbability(double close, double expectedFill) {
        return (close / expectedFill) * 100; // Returns percentage
    }

private:
    double m_gapSize;           // Minimum gap size
    double m_fillProbability;    // Probability of gap fill
};

// Entry point for testing
void OnStart() {
    FairValueGap fvg(10, 75); // Example values

    double high = 145.50;
    double low = 135.00;
    double close = 140.00;

    if (fvg.DetectFVG(high, low, close)) {
        Print("Fair Value Gap detected!");
        Print("Gap Size: ", fvg.CalculateGapSize(high, low));
        Print("Estimated Fill Probability: ", fvg.EstimateFillProbability(close, (high + low) / 2));
    } else {
        Print("No Fair Value Gap detected.");
    }
}