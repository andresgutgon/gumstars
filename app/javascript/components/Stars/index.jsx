import * as React from 'react'
import { usePage } from '@inertiajs/inertia-react'

const Stars = ({ rating, fullStars }) => {
  const { props: { stars } } = usePage()
  return (
    <ul className='flex space-x-1'>
      {stars.map((starGroup, index) => {
        const prevStar =  stars[index - 1 < 0 ? 0 : index - 1]
        const starMin = starGroup[0]
        const showFullStar = fullStars && prevStar.max <= rating
        return (
          <li key={index} className='flex items-center justify-center'>
            <div className='star'>
              {showFullStar && (
                <div className='starIcon starIcon--full' />
              )}

              {(!showFullStar && rating >= starMin) && (
                <div className='starIcon starIcon--halfStart' />
              )}

              {(!showFullStar && rating > starMin) && (
                <div className='starIcon starIcon--halfEnd' />
              )}
            </div>
          </li>
        )
      })}
    </ul>
  )
}

export default Stars
