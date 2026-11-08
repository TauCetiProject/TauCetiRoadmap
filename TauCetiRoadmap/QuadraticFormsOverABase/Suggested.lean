import Mathlib
import TauCeti.Algebra.AlgebraicGroup.ConstantForm.Basic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.LinearAlgebra.QuadraticForm.OrthogonalGroup.Basic

/-!
# Quadratic forms over a base: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, together with the definitions their statements need.
Every definition has a real body; the Checks and the API of each definition stay in the README.

Forms live on the free module `Fin n → R` over an arbitrary commutative ring `R`, and nothing
divides by `2`. A form is read through its upper-triangular coefficient matrix (Mathlib's
`QuadraticMap.toBilin` in the standard basis), and base change maps the coefficients.

Headline theorems stated here:

* README 0.2, `mapCoeffs_eq_baseChange`: base change of coefficients agrees with Mathlib's
  `QuadraticForm.baseChange` when `2` is invertible.
* README 1.1, `two_mul_univHalfDisc`: in odd rank the universal discriminant is twice the
  universal half-discriminant.
* README 1.2, `two_mul_halfDisc` and `halfDisc_eq_of_toQuadraticMap`.
* README 1.3, `halfDisc_mapCoeffs` and `halfDisc_comp`.
* README 1.4, `four_dvd_univSignedDisc_sub_sq`, `discr_discAlgebra`.
* README 2.2, `isSmooth_iff_isUnit_halfDisc` and `isSmooth_iff_isUnit_det`.
* README 2.4, `isSmooth_iff_exists_faithfullyFlat` and `exists_etale_isometryEquiv_standard`.
* README 3.1, `exists_hopfIdeal_toIdeal_eq`, `mem_orthogonalGroup_iff_le_ker` and
  `mem_constantForm_polarMatrix_iff`, the comparison with Tau Ceti's group scheme preserving the
  polar matrix when `2` is invertible.
* README 3.2, `det_sq_eq_one` and `mem_orthogonalGroup_iff_existsUnique`.
* README 3.3, `smooth_orthogonal_iff` and `smooth_specialOrthogonal`.
* README 4.1, `isAzumaya_even_iff`.
* README 5.1, `etale_discAlgebra_iff`; README 5.2, `exists_productHom`.

Not stated here, for lack of the carrier at the pins:

* README 0.2, `mapCoeffs (algebraMap K L) Q = extendScalars Q L`, lacking
  QuadraticFormInvariantsPartII's `extendScalars` (§0.2).
* README 2.1, smoothness as ordinarity for `n ≥ 1`, lacking LefschetzPencilsAndVanishingCycles'
  ordinary quadratic forms (§2.1).
* README 3.1, the comparison with OrthogonalTamagawaAndLatticeMass' `O(q)` over a perfect field
  of characteristic two, lacking that group (§0.1a).
* README 3.4, the bijection between isometry classes of smooth forms of rank `n` and torsor
  classes under `O(qₙ)`, lacking SchemeAndStackFoundations' `NonabelianH1` (§2.3) and the torsors
  of §1.15.
* README 6.1, `aₙ formDiscr n f = (-1)^(n(n-1)/2) Res_{n,n-1}(f, f')` at formal degree `n`,
  lacking HyperellipticCurves' `formDiscr` (§0.1).

Conventions (README §Conventions): the coefficient matrix of `Q` has `Q(eᵢ)` on the diagonal,
`polar Q eᵢ eⱼ` above it and `0` below; the polar matrix is `(polar Q eᵢ eⱼ)`; an element `g` of
`GL n A` acts on column vectors, and `g ∈ O(Q)(A)` means `Q_A (g x) = Q_A x` for all `x`.
-/

namespace TauCetiRoadmap.QuadraticFormsOverABase

open Matrix MvPolynomial
open scoped TensorProduct

universe u

variable {R : Type u} [CommRing R] {n : ℕ}

/-! ## Layer 0: coordinates and base change without dividing by two -/

/-- The upper-triangular coefficient matrix of a form on `Fin n → R`: `Q(eᵢ)` on the diagonal,
`polar Q eᵢ eⱼ` at `(i, j)` for `i < j`, and `0` below the diagonal. -/
noncomputable def coeffMatrix (Q : QuadraticForm R (Fin n → R)) : Matrix (Fin n) (Fin n) R :=
  LinearMap.toMatrix₂' R (Q.toBilin (Pi.basisFun R (Fin n)))

/-- The polar matrix `(polar Q eᵢ eⱼ)` of a form on `Fin n → R`, with `2 Q(eᵢ)` on the
diagonal. -/
noncomputable def polarMatrix (Q : QuadraticForm R (Fin n → R)) : Matrix (Fin n) (Fin n) R :=
  LinearMap.toMatrix₂' R (QuadraticMap.polarBilin Q)

/-- Base change of a form along a ring map `f : R →+* S`, by applying `f` to its coefficient
matrix. No hypothesis on `2` is needed. -/
noncomputable def mapCoeffs {S : Type*} [CommRing S] (f : R →+* S)
    (Q : QuadraticForm R (Fin n → R)) : QuadraticForm S (Fin n → S) :=
  LinearMap.BilinMap.toQuadraticMap (Matrix.toLinearMap₂' S ((coeffMatrix Q).map f))

/-- README 0.2: when `2` is invertible, base change of coefficients is Mathlib's
`QuadraticForm.baseChange`, read through `A ⊗[R] (Fin n → R) ≃ Fin n → A`. -/
theorem mapCoeffs_eq_baseChange [Invertible (2 : R)] (A : Type*) [CommRing A] [Algebra R A]
    (Q : QuadraticForm R (Fin n → R)) :
    mapCoeffs (algebraMap R A) Q =
      (Q.baseChange A).comp
        (TensorProduct.piScalarRight R A A (Fin n)).symm.toLinearMap := by
  sorry

/-! ## Layer 1: the half-discriminant -/

/-- The universal matrix `(Uᵢⱼ)` of `n²` indeterminates over `ℤ`. -/
noncomputable def univMatrix (n : ℕ) : Matrix (Fin n) (Fin n) (MvPolynomial (Fin n × Fin n) ℤ) :=
  Matrix.of fun i j => X (i, j)

/-- The universal discriminant `det (U + Uᵀ)`: the polar matrix of the form with coefficient
matrix `U`. -/
noncomputable def univDisc (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  (univMatrix n + (univMatrix n)ᵀ).det

/-- The universal half-discriminant: the coefficients of `univDisc n` halved. In odd rank they
are all even (README 1.1). -/
noncomputable def univHalfDisc (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  ∑ m ∈ (univDisc n).support, monomial m ((univDisc n).coeff m / 2)

/-- Evaluation of an integral polynomial in the `Uᵢⱼ` at the entries of a matrix over `R`. -/
noncomputable def evalMatrix (M : Matrix (Fin n) (Fin n) R) :
    MvPolynomial (Fin n × Fin n) ℤ →+* R :=
  eval₂Hom (Int.castRingHom R) fun ij => M ij.1 ij.2

/-- The half-discriminant `δ'(Q)` of a form on `Fin n → R`: the universal half-discriminant at
the coefficient matrix of `Q`. It is meaningful in odd rank. -/
noncomputable def halfDisc (Q : QuadraticForm R (Fin n → R)) : R :=
  evalMatrix (coeffMatrix Q) (univHalfDisc n)

/-- README 1.1: in odd rank, `det (U + Uᵀ) = 2 δ'` in `ℤ[U]`. -/
theorem two_mul_univHalfDisc (hn : Odd n) : 2 * univHalfDisc n = univDisc n := by
  sorry

/-- README 1.2: in odd rank, `2 δ'(Q)` is the determinant of the polar matrix. -/
theorem two_mul_halfDisc (hn : Odd n) (Q : QuadraticForm R (Fin n → R)) :
    2 * halfDisc Q = (polarMatrix Q).det := by
  sorry

/-- README 1.2: the half-discriminant does not depend on the bilinear form chosen to represent
`Q`. -/
theorem halfDisc_eq_of_toQuadraticMap (hn : Odd n) (Q : QuadraticForm R (Fin n → R))
    (B : LinearMap.BilinForm R (Fin n → R)) (hB : B.toQuadraticMap = Q) :
    evalMatrix (LinearMap.toMatrix₂' R B) (univHalfDisc n) = halfDisc Q := by
  sorry

/-- README 1.3: the half-discriminant commutes with base change. -/
theorem halfDisc_mapCoeffs {S : Type*} [CommRing S] (f : R →+* S)
    (Q : QuadraticForm R (Fin n → R)) : halfDisc (mapCoeffs f Q) = f (halfDisc Q) := by
  sorry

/-- README 1.3: under a linear change of variables `g`, `δ'` is multiplied by `(det g)²`. -/
theorem halfDisc_comp (hn : Odd n) (Q : QuadraticForm R (Fin n → R))
    (g : Matrix (Fin n) (Fin n) R) :
    halfDisc (Q.comp (Matrix.toLin' g)) = g.det ^ 2 * halfDisc Q := by
  sorry

/-- The universal signed discriminant `(-1)^(n/2) det (U + Uᵀ)`. -/
noncomputable def univSignedDisc (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  (-1) ^ (n / 2) * univDisc n

/-- The universal hafnian: the sum over the perfect matchings `σ` of `Fin n` of the products of
the off-diagonal entries `Uᵢσᵢ + Uσᵢᵢ` of `U + Uᵀ`, one for each edge `i < σ i`. -/
noncomputable def univHafnian (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  ∑ σ ∈ Finset.univ.filter (fun σ : Equiv.Perm (Fin n) => σ * σ = 1 ∧ ∀ i, σ i ≠ i),
    ∏ i ∈ Finset.univ.filter (fun i => i < σ i), (X (i, σ i) + X (σ i, i))

/-- README 1.4: in even rank, `4` divides `(-1)^(n/2) det (U + Uᵀ) - B²`, `B` the hafnian. -/
theorem four_dvd_univSignedDisc_sub_sq (hn : Even n) :
    (4 : MvPolynomial (Fin n × Fin n) ℤ) ∣ univSignedDisc n - univHafnian n ^ 2 := by
  sorry

/-- The universal constant term of the discriminant algebra: the coefficients of
`(-1)^(n/2) det (U + Uᵀ) - B²` divided by `4`. -/
noncomputable def univDiscConst (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  ∑ m ∈ (univSignedDisc n - univHafnian n ^ 2).support,
    monomial m ((univSignedDisc n - univHafnian n ^ 2).coeff m / 4)

/-- The discriminant algebra of a form of even rank: Mathlib's free quadratic algebra
`R[ω]/(ω² - B ω - C)` with `B` the hafnian and `C` the constant term above, both evaluated at the
coefficient matrix of `Q`. -/
abbrev discAlgebra (Q : QuadraticForm R (Fin n → R)) : Type u :=
  QuadraticAlgebra R (evalMatrix (coeffMatrix Q) (univDiscConst n))
    (evalMatrix (coeffMatrix Q) (univHafnian n))

/-- README 1.4: in even rank the discriminant of the discriminant algebra is the signed
discriminant `(-1)^(n/2) det` of the polar matrix. -/
theorem discr_discAlgebra (hn : Even n) (Q : QuadraticForm R (Fin n → R)) :
    QuadraticAlgebra.discr (evalMatrix (coeffMatrix Q) (univDiscConst n))
        (evalMatrix (coeffMatrix Q) (univHafnian n)) =
      (-1) ^ (n / 2) * (polarMatrix Q).det := by
  sorry

/-! ## Layer 2: smooth forms -/

/-- A form is smooth when, at every geometric point `R →+* K`, its radical is zero: no nonzero
vector `x` with `Q x = 0` and `polar Q x = 0`. -/
def IsSmooth (Q : QuadraticForm R (Fin n → R)) : Prop :=
  ∀ (K : Type u) [Field K] [IsAlgClosed K] (f : R →+* K), (mapCoeffs f Q).radical = ⊥

/-- README 2.2: in odd rank, a form is smooth exactly when its half-discriminant is a unit. -/
theorem isSmooth_iff_isUnit_halfDisc (hn : Odd n) (Q : QuadraticForm R (Fin n → R)) :
    IsSmooth Q ↔ IsUnit (halfDisc Q) := by
  sorry

/-- README 2.2: in even rank, a form is smooth exactly when its polar matrix is invertible. -/
theorem isSmooth_iff_isUnit_det (hn : Even n) (Q : QuadraticForm R (Fin n → R)) :
    IsSmooth Q ↔ IsUnit (polarMatrix Q).det := by
  sorry

/-- The standard split form `qₙ`: `x₀x₁ + x₂x₃ + ⋯` over the pairs `(2i, 2i + 1)`, plus `x_{n-1}²`
when `n` is odd. -/
noncomputable def standard (n : ℕ) : QuadraticForm R (Fin n → R) :=
  LinearMap.BilinMap.toQuadraticMap (Matrix.toLinearMap₂' R (Matrix.of fun i j : Fin n =>
    if ((i : ℕ) % 2 = 0 ∧ (j : ℕ) = i + 1) ∨ (n % 2 = 1 ∧ (i : ℕ) = n - 1 ∧ j = i) then
      (1 : R) else 0))

/-- README 2.4: a form is smooth exactly when it becomes isometric to `qₙ` over a faithfully
flat, finitely presented `R`-algebra. -/
theorem isSmooth_iff_exists_faithfullyFlat (Q : QuadraticForm R (Fin n → R)) :
    IsSmooth Q ↔ ∃ (S : Type u) (_ : CommRing S) (_ : Algebra R S),
      Module.FaithfullyFlat R S ∧ Algebra.FinitePresentation R S ∧
        Nonempty ((mapCoeffs (algebraMap R S) Q).IsometryEquiv (standard n)) := by
  sorry

/-- README 2.4: in even rank, or when `2` is a unit, the cover can be taken étale. -/
theorem exists_etale_isometryEquiv_standard (Q : QuadraticForm R (Fin n → R)) (hQ : IsSmooth Q)
    (h : Even n ∨ IsUnit (2 : R)) :
    ∃ (S : Type u) (_ : CommRing S) (_ : Algebra R S),
      Module.FaithfullyFlat R S ∧ Algebra.Etale R S ∧
        Nonempty ((mapCoeffs (algebraMap R S) Q).IsometryEquiv (standard n)) := by
  sorry

/-! ## Layer 3: the orthogonal group scheme -/

/-- The points `O(Q)(A)`: the image in `GL n A` of Tau Ceti's orthogonal group of the
base-changed form `Q_A`, the matrices `g` with `Q_A (g x) = Q_A x` for every `x`. -/
noncomputable def orthogonalGroup (Q : QuadraticForm R (Fin n → R)) (A : Type*) [CommRing A]
    [Algebra R A] : Subgroup (GL (Fin n) A) :=
  (QuadraticMap.orthogonalToGeneralLinear (mapCoeffs (algebraMap R A) Q)).range

/-- The defining relations of `O(Q)` in the coordinate Hopf algebra of `GL n`: the entries of the
coefficient matrix of `Q ∘ X` minus those of `Q`, `X` the generic matrix. -/
noncomputable def orthogonalRelations (Q : QuadraticForm R (Fin n → R)) :
    Set (TauCeti.GeneralLinear.coordinateHopfAlgebra R n) :=
  Set.range fun ij : Fin n × Fin n =>
    coeffMatrix ((mapCoeffs (algebraMap R (TauCeti.GeneralLinear.coordinateHopfAlgebra R n)) Q).comp
        (Matrix.toLin' (TauCeti.GeneralLinear.genericMatrix R n))) ij.1 ij.2 -
      algebraMap R _ (coeffMatrix Q ij.1 ij.2)

/-- The ideal of `O(Q)` in the coordinate Hopf algebra of `GL n`. -/
noncomputable def orthogonalIdeal (Q : QuadraticForm R (Fin n → R)) :
    Ideal (TauCeti.GeneralLinear.coordinateHopfAlgebra R n) :=
  Ideal.span (orthogonalRelations Q)

/-- README 3.1: the ideal of `O(Q)` is a Hopf ideal. -/
theorem exists_hopfIdeal_toIdeal_eq (Q : QuadraticForm R (Fin n → R)) :
    ∃ I : TauCeti.HopfIdeal R (TauCeti.GeneralLinear.coordinateHopfAlgebra R n),
      I.toIdeal = orthogonalIdeal Q := by
  sorry

/-- README 3.1: a point of `GL n` lies in `O(Q)(A)` exactly when it kills the ideal of `O(Q)`,
so `O(Q)` is represented by the quotient. -/
theorem mem_orthogonalGroup_iff_le_ker (Q : QuadraticForm R (Fin n → R)) {A : Type u}
    [CommRing A] [Algebra R A]
    (φ : TauCeti.GeneralLinear.coordinateHopfAlgebra R n →ₐ[R] A) :
    TauCeti.GeneralLinear.pointsMulEquiv n (WithConv.toConv φ) ∈ orthogonalGroup Q A ↔
      orthogonalIdeal Q ≤ RingHom.ker (φ : _ →+* A) := by
  sorry

/-- README 3.1: when `2` is invertible, `g ↦ (gᵀ)⁻¹` identifies `O(Q)(A)` with the points of Tau
Ceti's group scheme preserving the polar matrix `C`, the matrices `h` with `h C hᵀ = C`. -/
theorem mem_constantForm_polarMatrix_iff [Invertible (2 : R)] (Q : QuadraticForm R (Fin n → R))
    {A : Type u} [CommRing A] [Algebra R A] (h : GL (Fin n) A) :
    (TauCeti.GeneralLinear.pointsMulEquiv (R := R) n).symm h ∈
        TauCeti.CommHopfAlgCat.quotientPointsSubgroup
          (TauCeti.GeneralLinear.coordinateHopfAlgebra R n)
          (TauCeti.ConstantForm.definingHopfIdeal R n (polarMatrix Q)) (CommAlgCat.of R A) ↔
      ∃ g ∈ orthogonalGroup Q A,
        (h : Matrix (Fin n) (Fin n) A) * (g : Matrix (Fin n) (Fin n) A)ᵀ = 1 := by
  sorry

/-- README 3.2: for a smooth form, every point of `O(Q)` has `det² = 1`. -/
theorem det_sq_eq_one (Q : QuadraticForm R (Fin n → R)) (hQ : IsSmooth Q) {A : Type*}
    [CommRing A] [Algebra R A] {g : GL (Fin n) A} (hg : g ∈ orthogonalGroup Q A) :
    (g : Matrix (Fin n) (Fin n) A).det ^ 2 = 1 := by
  sorry

/-- README 3.2: in odd rank, for a smooth form, `O(Q) = μ₂ × SO(Q)` on points: every point is
uniquely `ζ h` with `ζ² = 1` and `h` of determinant one. -/
theorem mem_orthogonalGroup_iff_existsUnique (hn : Odd n) (Q : QuadraticForm R (Fin n → R))
    (hQ : IsSmooth Q) {A : Type*} [CommRing A] [Algebra R A] (g : GL (Fin n) A) :
    g ∈ orthogonalGroup Q A ↔
      ∃! p : A × GL (Fin n) A, p.1 ^ 2 = 1 ∧ p.2 ∈ orthogonalGroup Q A ∧
        (p.2 : Matrix (Fin n) (Fin n) A).det = 1 ∧
        (g : Matrix (Fin n) (Fin n) A) = p.1 • (p.2 : Matrix (Fin n) (Fin n) A) := by
  sorry

/-- README 3.3: for a smooth form, `O(Q)` is smooth exactly in even rank or when `2` is a unit. -/
theorem smooth_orthogonal_iff (Q : QuadraticForm R (Fin n → R)) (hQ : IsSmooth Q) :
    Algebra.Smooth R (TauCeti.GeneralLinear.coordinateHopfAlgebra R n ⧸ orthogonalIdeal Q) ↔
      Even n ∨ IsUnit (2 : R) := by
  sorry

/-- README 3.3: in odd rank, for a smooth form, `SO(Q) = ker det` is smooth over any base. -/
theorem smooth_specialOrthogonal (hn : Odd n) (Q : QuadraticForm R (Fin n → R))
    (hQ : IsSmooth Q) :
    Algebra.Smooth R (TauCeti.GeneralLinear.coordinateHopfAlgebra R n ⧸
      (orthogonalIdeal Q ⊔ Ideal.span {(TauCeti.GeneralLinear.genericMatrix R n).det - 1})) := by
  sorry

/-! ## Layer 4: even Clifford algebras -/

/-- README 4.1: in odd rank `n ≥ 3`, the even Clifford algebra is Azumaya exactly when `δ'` is a
unit. -/
theorem isAzumaya_even_iff (hn : Odd n) (h3 : 3 ≤ n) (Q : QuadraticForm R (Fin n → R)) :
    IsAzumaya R (CliffordAlgebra.even Q) ↔ IsUnit (halfDisc Q) := by
  sorry

/-! ## Layer 5: quadratic algebras without dividing by two -/

/-- README 5.1: in even rank, the discriminant algebra is étale exactly when the form is
smooth. -/
theorem etale_discAlgebra_iff (hn : Even n) (Q : QuadraticForm R (Fin n → R)) :
    Algebra.Etale R (discAlgebra Q) ↔ IsSmooth Q := by
  sorry

/-- README 5.2: the product `A₁ * A₂` of two free quadratic algebras maps to `A₁ ⊗ A₂` by
`ω ↦ 2 ω₁ω₂ - b₁ω₂ - b₂ω₁`; when `2, b₁, b₂` generate the unit ideal this map is injective with
image the invariants of `σ₁ ⊗ σ₂`, `σᵢ` Mathlib's `QuadraticAlgebra.starAlgEquiv`. -/
theorem exists_productHom (a₁ b₁ a₂ b₂ : R) :
    ∃ φ : QuadraticAlgebra R (a₁ * b₂ ^ 2 + a₂ * b₁ ^ 2 + 4 * a₁ * a₂) (-(b₁ * b₂)) →ₐ[R]
        QuadraticAlgebra R a₁ b₁ ⊗[R] QuadraticAlgebra R a₂ b₂,
      φ QuadraticAlgebra.omega =
          2 • (QuadraticAlgebra.omega ⊗ₜ QuadraticAlgebra.omega) -
            b₁ • ((1 : QuadraticAlgebra R a₁ b₁) ⊗ₜ QuadraticAlgebra.omega) -
            b₂ • (QuadraticAlgebra.omega ⊗ₜ (1 : QuadraticAlgebra R a₂ b₂)) ∧
        (Ideal.span {2, b₁, b₂} = ⊤ →
          Function.Injective φ ∧
            Set.range φ = {x | Algebra.TensorProduct.map
              (QuadraticAlgebra.starAlgEquiv : QuadraticAlgebra R a₁ b₁ ≃ₐ[R] _).toAlgHom
              (QuadraticAlgebra.starAlgEquiv : QuadraticAlgebra R a₂ b₂ ≃ₐ[R] _).toAlgHom x =
                x}) := by
  sorry

end TauCetiRoadmap.QuadraticFormsOverABase
