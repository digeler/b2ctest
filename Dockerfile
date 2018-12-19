FROM microsoft/dotnet:aspnetcore-runtime
RUN apt-get update
RUN apt-get install -y nginx
WORKDIR /app
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx
COPY start.sh .
RUN chmod 755 /app/start.sh
COPY /bin/Debug/netcoreapp2.1/publish .
#ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS=http://+:5000
EXPOSE 5000 80
ENTRYPOINT ["dotnet", "WebApplication5.dll"]