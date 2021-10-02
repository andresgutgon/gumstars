import * as React from 'react'

import Stars from '../Stars'

const Reviews = ({ reviews }) => {
  if (!reviews.length) return null

  return (
    <>
      <h2 className="font-sans font-bold text-2xl mb-6" data-test='product.reviews.title'>
        Reviews
      </h2>
      <ul className='space-y-8'>
        {reviews.map((review, index) =>
          <li key={index} className='flex flex-col sm:flex-row space-y-6 sm:space-y-0 sm:items-end'>
            <div className='sm:order-last sm:ml-6'>
              <span className='font-bold text-xl'>{review.rating / 10}</span>&nbsp;
              <span data-test={`product.review_${review.id}.comment`} className='text-xl text-gray-400'>
                {review.comment}
              </span>
            </div>
            <Stars rating={review.rating} />
          </li>
        )}
      </ul>
    </>
  )
}

export default Reviews
