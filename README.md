# PowerBI Integration with Jupyter Notebooks README

## Overview

This project demonstrates the seamless integration of Jupyter Notebooks with PowerBI, utilizing the power of Python and its data analysis libraries, including Pandas and Pandasql. By combining the strengths of Jupyter for exploratory data analysis and PowerBI for interactive visualizations, users can gain deeper insights into their data and create compelling reports and dashboards.

## Requirements

- [PowerBI Desktop](https://powerbi.microsoft.com/desktop/)
- [Jupyter Notebooks](https://jupyter.org/install)
- [pandasql](https://github.com/yhat/pandasql) (install using `!pip install pandasql` in your Jupyter Notebook)

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/powerbi-jupyter-integration.git
   cd powerbi-jupyter-integration
   ```

2. **Install Dependencies:**
   Open a Jupyter Notebook and install the required Python packages using the following command:
   ```python
   !pip install pandas pandasql
   ```

3. **Explore Jupyter Notebooks:**
   Explore the `notebooks` directory for Jupyter Notebooks containing data analysis and preprocessing scripts. Run these notebooks to understand the data and prepare it for PowerBI.

4. **PowerBI Integration:**
   Open the `PowerBI_Integration.pbix` file in PowerBI Desktop. This file is designed to connect to the Jupyter Notebook and import the preprocessed data.

5. **Edit Data Source Connection:**
   Update the data source connection in PowerBI to point to the location of your Jupyter Notebook. Use the "Home" tab in PowerBI Desktop to refresh the data and apply changes.

6. **Create Visualizations:**
   Utilize the power of PowerBI to create interactive visualizations based on the preprocessed data from the Jupyter Notebooks.

## Project Structure

- `notebooks/`: Contains Jupyter Notebooks for data analysis and preprocessing.
- `PowerBI_Integration.pbix`: PowerBI file integrating with the Jupyter Notebook data source.
- `data/`: Placeholder directory for your dataset.

## Additional Notes

- Ensure that you have a working Python environment in your Jupyter Notebook with the necessary libraries installed.
- Modify the PowerBI file as needed to suit your specific dataset and analysis requirements.
- Feel free to contribute by adding more Jupyter Notebooks for specific analyses or additional visualizations in PowerBI.

## Support and Contribution

For any issues, questions, or contributions, please feel free to [open an issue](https://github.com/EltonDlamini97/powerbi-jupyter-integration/issues) or submit a pull request.

Happy analyzing and visualizing with PowerBI and Jupyter Notebooks!
