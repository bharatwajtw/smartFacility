# Smart Facility
A unified platform that integrates smart devices across diverse facilities, empowering users with remote access, real-time monitoring, insights, and automated scheduling for smarter facility management.

## Project Setup

### Requirements

1. [Docker](https://docs.docker.com/get-started/get-docker)
2. [Makefile](https://formulae.brew.sh/formula/make) _(Optional)_ ([What is Makefile?](https://opensource.com/article/18/8/what-how-makefile))

### To run the project

1. Clone the repository:
   ```bash
   git clone git@github.com:bharatwajtw/smartFacility.git
   cd smartFacility
   ```

2. Run the application:
   ```bash
   make run
   ```

   OR

   ```bash
   docker compose up
   ```

### Logging
The app uses a centralized logging configuration. Logs are printed to the console in the following format:
```
<timestamp> - <logger_name> - <log_level> - <message>
```

## Additional Information

- For detailed contribution guidelines, refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Thank you for using Smart Facility!
