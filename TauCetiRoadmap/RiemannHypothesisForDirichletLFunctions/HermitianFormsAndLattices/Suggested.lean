import Mathlib

/-!
# Hermitian forms and lattices: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, as far as they are
statable there.

Throughout, `E/F` is a quadratic extension of number fields with its nontrivial involution `σ`, an
`F`-algebra homomorphism `E → E` different from the identity. A Hermitian space of dimension `n`
over `E` is `E^n` with the form `(x, y) ↦ σ(x)^T H y` for a matrix `H ∈ GL_n(E)` with
`σ(H)^T = H`, two forms being isometric when their Gram matrices are congruent,
`H′ = σ(P)^T H P` with `P ∈ GL_n(E)`. Its localization at a place `v` of `F` (README 1.7) is the
same Gram matrix over `E ⊗_F F_v`, with the involution `σ ⊗ 1`, where `F_v` is Mathlib's
completion `v.adicCompletion F` at a finite place and `v.Completion` at an infinite place.

* Landherr's theorem (3.1, 3.2) is stated below, in this matrix form, which has the generality of
  the README statement: two Hermitian spaces are isometric if and only if they are isometric at
  every place; and Hermitian spaces over the `E ⊗_F F_v`, one at every place, almost all with norm
  determinant, are the localizations of a Hermitian space over `E` if and only if the number of
  places at which the determinant is not a norm is even (the product formula
  `∏_v η_v(det V_v) = 1`). The Hasse principle is stated a second time for CM extensions, the
  setting of the formal proof that the family follows.
* The Tamagawa number `τ(U(V)) = 2` (6.0, 6.0b) for every Hermitian space `V` of dimension
  `n ≥ 1`. It lacks the unitary group scheme `U(V)` as an algebraic group over `F` with its adelic
  points, and the Tamagawa measure and Tamagawa number of a connected reductive group
  (AdelicAlgebraicGroups §2.4). Mathlib has the adele ring of a number field but no algebraic
  groups over it; Tau Ceti has Tamagawa numbers of elliptic curves only.
* The mass formula (6.2 (a), 6.3): for `F` totally real, `E/F` a CM extension, `V` totally
  definite of dimension `n ≥ 1` and a lattice `L ⊂ V`, `mass(L)` is
  `2·L(1, η)·β_∞(L)^{−1}·∏_{v<∞}(L_v(1, η_v)β_v(L))^{−1}`, with the closed form of 6.3. It lacks
  the genus of a lattice (completions of `O_E`-lattices at the finite places of `F` and the groups
  `U(V)(F_v)` acting on them), the class set and the mass defined through it, the local densities
  `β_v(L)` (limits of normalized congruence counts, 6.1) and the archimedean density `β_∞(L)`
  (6.1b). Mathlib has `NumberField.dedekindZeta`, from which `L(k, η^k)` is a quotient, and
  `Submodule.IsLattice`; Tau Ceti has the genus `TauCeti.IntegralLattice.SameGenus`, the mass
  `TauCeti.IntegralLattice.mass` and the local densities `Matrix.localDensity` of integral
  quadratic lattices over `ℤ`, none of which applies to Hermitian lattices over `O_E`.
* Siegel's main theorem (6.5 (b)): for `V` totally positive definite, `1 ≤ k ≤ n − 1` and `T`
  totally positive definite, the mass-weighted genus average of the number of representations of
  `T` is `α_∞(L, T)·∏_{v<∞} α_v(L, T)`. It lacks, besides the genus and the mass, the
  representation densities `α_v(L, T)` and `α_∞(L, T)` (6.1, 6.1b); its form for every space
  (6.5 (a)) lacks, besides these, the Tamagawa measure of `U(V)(𝔸)` and adelic Schwartz–Bruhat
  functions on `V(𝔸)^k`.

Statements of the README that are statable at the pins but are not headlines are not stated
here: the lattice lemmas over a Dedekind domain (4.0 (g), 4.0a (b), 4.0b) and the gluing along
discriminant forms (4.9) are steps and tools of Layer 4, and the bound on the orders of elements
of `GL_n(E)` (5.2 (e)) is a step towards small levels.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HermitianFormsAndLattices

open NumberField IsDedekindDomain TensorProduct Matrix

/-! ## Layer 3: global classification -/

/-- **Landherr's theorem, the Hasse principle** (README 3.1, in Gram matrices). Let `E/F` be a
quadratic extension of number fields with nontrivial involution `σ`, and `H, H′ ∈ GL_n(E)` with
`σ(H)^T = H` and `σ(H′)^T = H′`. Then `σ(P)^T H P = H′` for some `P ∈ GL_n(E)` if and only if, at
every finite and every infinite place `v` of `F`, `(σ ⊗ 1)(P)^T H P = H′` for some
`P ∈ GL_n(E ⊗_F F_v)`. (Landherr 1936.) This is the classical theorem, in its published
generality; `hermitian_congr_iff_forall_place_of_cm` is its case for CM extensions. -/
theorem hermitian_congr_iff_forall_place {F E : Type*} [Field F] [NumberField F] [Field E]
    [NumberField E] [Algebra F E] [Algebra.IsQuadraticExtension F E]
    (σ : E →ₐ[F] E) (hσ : σ ≠ AlgHom.id F E) {n : ℕ} (H H' : Matrix (Fin n) (Fin n) E)
    (hH : (H.map σ)ᵀ = H) (hH' : (H'.map σ)ᵀ = H') (hdet : H.det ≠ 0) (hdet' : H'.det ≠ 0) :
    (∃ P : Matrix (Fin n) (Fin n) E, IsUnit P.det ∧ (P.map σ)ᵀ * H * P = H') ↔
      (∀ v : HeightOneSpectrum (𝓞 F),
        ∃ P : Matrix (Fin n) (Fin n) (E ⊗[F] v.adicCompletion F), IsUnit P.det ∧
          (P.map (Algebra.TensorProduct.map σ (AlgHom.id F (v.adicCompletion F))))ᵀ *
              H.map (algebraMap E (E ⊗[F] v.adicCompletion F)) * P =
            H'.map (algebraMap E (E ⊗[F] v.adicCompletion F))) ∧
      (∀ w : InfinitePlace F,
        ∃ P : Matrix (Fin n) (Fin n) (E ⊗[F] w.Completion), IsUnit P.det ∧
          (P.map (Algebra.TensorProduct.map σ (AlgHom.id F w.Completion)))ᵀ *
              H.map (algebraMap E (E ⊗[F] w.Completion)) * P =
            H'.map (algebraMap E (E ⊗[F] w.Completion))) := by
  sorry

/-- **Landherr's theorem, the Hasse principle, for CM extensions** (README 3.1, the form of the
formal proof). The case of `hermitian_congr_iff_forall_place` for a CM extension of number fields
(`F` totally real, `E` totally complex), the setting in which the formal proof that the family
follows has the theorem; it follows from the classical statement. -/
theorem hermitian_congr_iff_forall_place_of_cm {F E : Type*} [Field F] [NumberField F] [Field E]
    [NumberField E] [Algebra F E] [Algebra.IsQuadraticExtension F E]
    [IsTotallyReal F] [IsTotallyComplex E]
    (σ : E →ₐ[F] E) (hσ : σ ≠ AlgHom.id F E) {n : ℕ} (H H' : Matrix (Fin n) (Fin n) E)
    (hH : (H.map σ)ᵀ = H) (hH' : (H'.map σ)ᵀ = H') (hdet : H.det ≠ 0) (hdet' : H'.det ≠ 0) :
    (∃ P : Matrix (Fin n) (Fin n) E, IsUnit P.det ∧ (P.map σ)ᵀ * H * P = H') ↔
      (∀ v : HeightOneSpectrum (𝓞 F),
        ∃ P : Matrix (Fin n) (Fin n) (E ⊗[F] v.adicCompletion F), IsUnit P.det ∧
          (P.map (Algebra.TensorProduct.map σ (AlgHom.id F (v.adicCompletion F))))ᵀ *
              H.map (algebraMap E (E ⊗[F] v.adicCompletion F)) * P =
            H'.map (algebraMap E (E ⊗[F] v.adicCompletion F))) ∧
      (∀ w : InfinitePlace F,
        ∃ P : Matrix (Fin n) (Fin n) (E ⊗[F] w.Completion), IsUnit P.det ∧
          (P.map (Algebra.TensorProduct.map σ (AlgHom.id F w.Completion)))ᵀ *
              H.map (algebraMap E (E ⊗[F] w.Completion)) * P =
            H'.map (algebraMap E (E ⊗[F] w.Completion))) :=
  hermitian_congr_iff_forall_place σ hσ H H' hH hH' hdet hdet'

/-- **Landherr's theorem, existence with prescribed localizations** (README 3.2, in Gram
matrices). Let `E/F` be a quadratic extension of number fields with nontrivial involution `σ`,
`n ≥ 1`, and, at every finite place `v` and every infinite place `w` of `F`, an invertible matrix
`H_v` over `E ⊗_F F_v` with `(σ ⊗ 1)(H_v)^T = H_v`, such that `det H_v` is a norm
`z·(σ ⊗ 1)(z)` for all but finitely many finite `v`. Then the `H_v` are, up to congruence, the
images of one `H ∈ GL_n(E)` with `σ(H)^T = H` if and only if the number of places at which
`det H_v` is not a norm is even: the product formula `∏_v η_v(det H_v) = 1`. -/
theorem exists_hermitian_localizations_iff {F E : Type*} [Field F] [NumberField F] [Field E]
    [NumberField E] [Algebra F E] [Algebra.IsQuadraticExtension F E]
    (σ : E →ₐ[F] E) (hσ : σ ≠ AlgHom.id F E) {n : ℕ} (hn : 1 ≤ n)
    (Hf : ∀ v : HeightOneSpectrum (𝓞 F), Matrix (Fin n) (Fin n) (E ⊗[F] v.adicCompletion F))
    (Hi : ∀ w : InfinitePlace F, Matrix (Fin n) (Fin n) (E ⊗[F] w.Completion))
    (hHf : ∀ v, ((Hf v).map (Algebra.TensorProduct.map σ (AlgHom.id F _)))ᵀ = Hf v ∧
      IsUnit (Hf v).det)
    (hHi : ∀ w, ((Hi w).map (Algebra.TensorProduct.map σ (AlgHom.id F _)))ᵀ = Hi w ∧
      IsUnit (Hi w).det)
    (hfin : {v | ¬ ∃ z, (Hf v).det = z * Algebra.TensorProduct.map σ (AlgHom.id F _) z}.Finite) :
    (∃ H : Matrix (Fin n) (Fin n) E, (H.map σ)ᵀ = H ∧ H.det ≠ 0 ∧
      (∀ v, ∃ P : Matrix (Fin n) (Fin n) (E ⊗[F] v.adicCompletion F), IsUnit P.det ∧
          (P.map (Algebra.TensorProduct.map σ (AlgHom.id F _)))ᵀ *
              H.map (algebraMap E (E ⊗[F] v.adicCompletion F)) * P = Hf v) ∧
      (∀ w, ∃ P : Matrix (Fin n) (Fin n) (E ⊗[F] w.Completion), IsUnit P.det ∧
          (P.map (Algebra.TensorProduct.map σ (AlgHom.id F _)))ᵀ *
              H.map (algebraMap E (E ⊗[F] w.Completion)) * P = Hi w)) ↔
      Even ({v | ¬ ∃ z, (Hf v).det = z * Algebra.TensorProduct.map σ (AlgHom.id F _) z}.ncard +
        {w | ¬ ∃ z, (Hi w).det = z * Algebra.TensorProduct.map σ (AlgHom.id F _) z}.ncard) := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HermitianFormsAndLattices
