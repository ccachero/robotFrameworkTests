*** Variables ***
# Hub Version
${version}    v0

# Hub common
${hubAddress}    https://192.168.39.111:8080
${pingEndpoint}    /${version}/ping

# Admin
${retentionEndpoint}    /${version}/admin/retention
${infoEndpoint}    /${version}/admin/info

# Dataview
${dataviewEndpoint}    /${version}/dataview
${dataviewErrorsEndpoint}    /${version}/dataview/errors
${ac2QueryEndpoint}    /${version}/dataview/ac2/query

# Entities
${entitiesSummary}    /${version}/entities/summary
${entitiesAttributes}    /${version}/entities/attributes