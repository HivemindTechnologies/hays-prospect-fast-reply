# hays-prospect-fast-reply

## Project Goal
- bla

## Specifications, Requirements and User Stories

- [Specifications (Confluence)](https://atari:8443/wiki/display/SAL/Spezifikation+Prospect+Fast+Reply)

## Components

- bla

### Architecture and Workflow

#### Blackbox Overview
```mermaid
flowchart LR
is(IrisDB)
isT[Iris-transformer]
sfmc(Data Extension SFMC)
sfmcT[SFMC transformer]

    is --> isT
    isT --- sfmc
    sfmcT --- sfmc
    is --- sfmcT  
    
```

#### Components Overview
```mermaid
flowchart LR
is(IrisDB)
deb[debezium]
dbex[db-exporter-prospect]
abcon[airbyte-connect: SFMC prospect]
sfmc(Data Extension SFMC)
sfmcT[SFMC transformer]

    is --> deb
    
    subgraph iris-transformer
        deb -->|kafka:iris.debezium.DBNAME.TABLENAME| dbex
        dbex -->|kafka:iris.dbexporter.prospect| abcon
    end

    abcon --- sfmc
    is ---|query| dbex
    
    sfmcT --- sfmc
    is --- sfmcT  
    
```

```mermaid
flowchart LR
is(IrisDB)
deb[debezium]
dbex[db-exporter-prospect]
abcon[airbyte-connect: SFMC prospect]
sfmc(Data Extension SFMC)
    is --> deb
    
    subgraph iris-transformer
        deb -->|kafka:iris.debezium.DBNAME.TABLENAME| dbex
        dbex -->|kafka:iris.dbexporter.prospect| abcon
    end

    abcon --- sfmc
    is ---|query| dbex
    
    sfmc --- airbyte-connect
    
    subgraph SFMC-transformer
        airbyte-connect  -->|kafka:sfmc.response| sfmc-exporter
    end
    
    sfmc-exporter ---|kafka:sfmc.response.iris| is
    
    
```