import * as React from 'react'
import { Inertia } from '@inertiajs/inertia'
import { usePage } from '@inertiajs/inertia-react'

import Modal from '../Modal'

const isEven = (number) => number % 2 === 0
const CreateReviewModal = ({ apiPath, onClose }) => {
  const [formErrors, setErrors]= React.useState([])
  const formRef = React.useRef(null)
  const { props: { starsReverse, stars } } = usePage()
  const onSubmit = (event) => {
    event.preventDefault()

    // Clean way of getting values of a <form />
    // This component is not using managed inputs for React.
    // This is super simple and just read the form directly from the DOM
    // and send it to the Rails controller
    const formData = new FormData(event.target)
    const values = Object.fromEntries(formData)
    Inertia.post(
      apiPath,
      {
        review: {
          rating: values['review[rating]'],
          comment: values['review[comment]']
        }
      },
      {
        preserveState: true, // Keep open the modal if errors
        onSuccess: (page) => { onClose() },
        onError: (errors) => { setErrors(errors) }
      }
    )
  }
  return (
    <Modal onClose={onClose}>
      <form onSubmit={onSubmit} ref={(node) => formRef.current = node}>
        <div className='space-y-10'>
            {formErrors.length > 0 && (
              <ul className="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                {formErrors.map((error, index) =>
                  <li key={index}>{error}</li>
                )}
              </ul>
            )}
          <h3 className='font-bold text-2xl sm:text-3xl mb-30'>What’s your rating?</h3>
          <fieldset className='flex flex-col space-y-5'>
            <legend className='block text-2xl'>Rating</legend>
            <div className="radio-stars">
              {[...starsReverse, 0].map((rating, index) => {
                const labelClass = rating > 0 && isEven(rating) ? 'star-end' : 'star-begining'
                const id = `review_rating_${rating}`
                return (
                  <React.Fragment key={index}>
                    <input
                      name="review[rating]"
                      id={id}
                      type="radio"
                      value={rating}
                      className={rating === 0 ? 'stars-reset' : null}
                    />
                    <label
                      htmlFor={id}
                      data-test={`product.${id}`}
                      className={labelClass}
                    >
                      <div className="sr-only">{rating}</div>
                    </label>
                  </React.Fragment>
                )
              })}
            </div>
          </fieldset>
          <div className='flex flex-col space-y-5'>
            <label htmlFor='review_comment' className='block text-2xl'>
              Review
            </label>
            <textarea
              placeholder="Start typing..."
              className="resize-none text-xl pl-0 ring-0 focus:ring-0 border-0 outline-none focus:outline-none rounded placeholder-gray-300 form-textarea"
              data-test="product.review.comment"
              name="review[comment]"
              id="review_comment"
            />
          </div>
          <input
            type="submit"
            value="Submit review"
            className="gs-button gs-button--wide w-full sm:w-auto"
            data-test="product.review.submit_button"
          />
        </div>
      </form>
    </Modal>
  )
}

export default CreateReviewModal
