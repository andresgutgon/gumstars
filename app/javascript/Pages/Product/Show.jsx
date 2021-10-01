import * as React from 'react'
import { usePage } from '@inertiajs/inertia-react'

import Stars from '../../components/Stars'
import Reviews from '../../components/Reviews'
import CreateReviewModal from '../../components/CreateReviewModal'

/**
 * Average comes from backend SQL AVG function of numbers
 * between 5 and 50.
 * We divide by 10 and then aproximate to max decimal.
 * This is done this way to simulate what `ReviewsHelper.rating_format` does in
 * the vanilla version
 */
const approximateAverage = (value) => Math.round((value / 10) * 10) /10

const ProductShow = ({
  product,
  createReviewApiPath,
  averageRating,
  reviews
}) => {
  const [open, setOpen] = React.useState(false)
  const average = approximateAverage(averageRating)
  return (
    <>
      <div
        itemScope
        itemType="https://schema.org/Review"
        className='mb-10 mt-10 sm:mt-20 pb-14 border-b border-gray-300'
      >
        <div
          itemProp="itemReviewed"
          itemScope
          itemType="https://schema.org/Book"
        >
          <h1
            itemProp="name"
            data-test="product.title"
            className="font-sans font-bold text-3xl mb-10"
          >
            {product.name}
          </h1>
          <div className='flex flex-col space-y-2 sm:space-y-0 sm:flex-row sm:items-center sm:justify-between'>
            <div className='flex space-x-6'>
              {averageRating > 0 && (
                <div
                  className='font-normal text-5xl'
                  data-test='product.average.number'
                  itemProp="reviewRating"
                  itemScope
                  itemType="https://schema.org/Rating"
                >
                  {average}
                </div>
              )}
              <Stars fullStars rating={averageRating} />
            </div>
            <button
              onClick={() => setOpen(true)}
              data-test='product.add_review_button'
              className='gs-button'
            >
              Add review
            </button>
          </div>
        </div>
      </div>

      <Reviews reviews={reviews} />
      {open && (
        <CreateReviewModal
          apiPath={createReviewApiPath}
          onClose={() => setOpen(false)}
        />
      )}
    </>
  )
}

export default ProductShow
