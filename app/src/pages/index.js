import React from "react"

export default function Home({ data }) {
  let feltLike = data.weather.getCityByName.weather.temperature.feelsLike
  let actuallyIs = data.weather.getCityByName.weather.temperature.actual
  return <div>Hello world - from Wellington, where, at build time the temperature felt like {feltLike} but was actually {actuallyIs}</div>
}


export const query = graphql`
  query {
    weather { getCityByName(name:"Wellington") {
      weather {
        temperature {
          feelsLike
          actual
        }
      }
    }
    }
  }
`