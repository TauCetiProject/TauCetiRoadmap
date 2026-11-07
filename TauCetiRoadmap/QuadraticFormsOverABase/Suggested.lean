import Mathlib
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic

/-!
# Quadratic forms over a base: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, together with the definitions their statements need.
Every definition has a real body; the Checks and the API of each definition stay in the README.

Forms live on the free module `Fin n → R` over an arbitrary commutative ring `R`, and nothing
divides by `2`. A form is read through its upper-triangular coefficient matrix (Mathlib's
`QuadraticMap.toBilin` in the standard basis), and base change maps the coefficients.

Headline theorems stated here:

* README 0.2, `mapCoeffs_apply`, `mapCoeffs_comp` and `mapCoeffs_eq_baseChange`: base change of
  coefficients evaluates as expected, is functorial, and agrees with Mathlib's
  `QuadraticForm.baseChange` when `2` is invertible.
* README 1.1, `two_mul_univHalfDisc`: in odd rank the universal discriminant is twice the
  universal half-discriminant.
* README 1.2, `two_mul_halfDisc` and `halfDisc_eq_of_toQuadraticMap`.
* README 1.3, `halfDisc_mapCoeffs`, `halfDisc_comp` and `halfDisc_smul`.
* README 1.4, `four_dvd_univSignedDisc_sub_sq`, `discr_discAlgebra`.
* README 2.2, `isSmooth_iff_isUnit_halfDisc` and `isSmooth_iff_isUnit_det`.
* README 2.4, `isSmooth_iff_exists_faithfullyFlat` and `exists_etale_isometryEquiv_standard`.
* README 3.1, `exists_hopfIdeal_toIdeal_eq` and `mem_orthogonalGroup_iff_le_ker`.
* README 3.2, `det_sq_eq_one` and `mem_orthogonalGroup_iff_existsUnique`.
* README 3.3, `smooth_orthogonal_iff` and `smooth_specialOrthogonal`.
* README 4.1, `isAzumaya_even_iff`; README 4.2, `center_even_etale`.
* README 5.1, `etale_quadraticAlgebra_iff`; README 5.2, `etale_discAlgebra_iff`;
  README 5.3, `exists_productHom`.
* README 6.1, `X_last_mul_univBinDisc` and `leadingCoeff_mul_binDisc`; README 6.2,
  `binDisc_map` and `binDisc_of_coeff_eq_zero`; README 6.3, `isUnit_binDisc_iff_etale`.

Not stated here: README 3.4, the bijection between isometry classes of smooth forms of rank `n`
and torsor classes under `O(qₙ)`, lacking SchemeAndStackFoundations' `NonabelianH1` (§2.3) and
the torsors of §1.15 at the pins.

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

/-- README 0.2: the base-changed form takes the value `f (Q x)` at the image of `x`. -/
theorem mapCoeffs_apply {S : Type*} [CommRing S] (f : R →+* S) (Q : QuadraticForm R (Fin n → R))
    (x : Fin n → R) : mapCoeffs f Q (f ∘ x) = f (Q x) := by
  sorry

/-- README 0.2: base change of coefficients is compatible with composition of ring maps. -/
theorem mapCoeffs_comp {S T : Type*} [CommRing S] [CommRing T] (f : R →+* S) (g : S →+* T)
    (Q : QuadraticForm R (Fin n → R)) : mapCoeffs g (mapCoeffs f Q) = mapCoeffs (g.comp f) Q := by
  sorry

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

/-- README 1.3: scaling the form by `a` multiplies `δ'` by `aⁿ`. -/
theorem halfDisc_smul (Q : QuadraticForm R (Fin n → R)) (a : R) :
    halfDisc (a • Q) = a ^ n * halfDisc Q := by
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

/-- The points `O(Q)(A)`: the matrices of `GL n A` preserving the base-changed form. -/
def orthogonalGroup (Q : QuadraticForm R (Fin n → R)) (A : Type*) [CommRing A] [Algebra R A] :
    Subgroup (GL (Fin n) A) where
  carrier := {g | ∀ x, mapCoeffs (algebraMap R A) Q ((g : Matrix (Fin n) (Fin n) A) *ᵥ x) =
    mapCoeffs (algebraMap R A) Q x}
  one_mem' := fun x => by simp
  mul_mem' := fun {g h} hg hh x => by
    rw [Units.val_mul, ← Matrix.mulVec_mulVec]
    exact (hg _).trans (hh x)
  inv_mem' := fun {g} hg x => by
    have := hg ((↑g⁻¹ : Matrix (Fin n) (Fin n) A) *ᵥ x)
    rwa [Matrix.mulVec_mulVec, Units.mul_inv, Matrix.one_mulVec, eq_comm] at this

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

/-- README 4.2: in even rank `n ≥ 2`, for a smooth form, the centre of the even Clifford algebra
is a finite étale `R`-algebra, locally free of rank two. -/
theorem center_even_etale (hn : Even n) (h2 : 2 ≤ n) (Q : QuadraticForm R (Fin n → R))
    (hQ : IsSmooth Q) :
    Algebra.Etale R (Subalgebra.center R (CliffordAlgebra.even Q)) ∧
      Module.Finite R (Subalgebra.center R (CliffordAlgebra.even Q)) ∧
      Module.Projective R (Subalgebra.center R (CliffordAlgebra.even Q)) ∧
      ∀ p : PrimeSpectrum R,
        Module.rankAtStalk (R := R) (Subalgebra.center R (CliffordAlgebra.even Q)) p = 2 := by
  sorry

/-! ## Layer 5: quadratic algebras without dividing by two -/

/-- README 5.1: the free quadratic algebra `R[ω]/(ω² - bω - a)` is étale exactly when its
discriminant `b² + 4a` is a unit. -/
theorem etale_quadraticAlgebra_iff (a b : R) :
    Algebra.Etale R (QuadraticAlgebra R a b) ↔ IsUnit (QuadraticAlgebra.discr a b) := by
  sorry

/-- README 5.2: in even rank, the discriminant algebra is étale exactly when the form is
smooth. -/
theorem etale_discAlgebra_iff (hn : Even n) (Q : QuadraticForm R (Fin n → R)) :
    Algebra.Etale R (discAlgebra Q) ↔ IsSmooth Q := by
  sorry

/-- The canonical involution `ω ↦ b - ω` of a free quadratic algebra, as an algebra map. -/
noncomputable def conj (a b : R) : QuadraticAlgebra R a b →ₐ[R] QuadraticAlgebra R a b :=
  { starRingEnd (QuadraticAlgebra R a b) with
    commutes' := fun r => by
      ext <;> simp [QuadraticAlgebra.algebraMap_eq, starRingEnd_apply] }

/-- README 5.3: the product `A₁ * A₂` of two free quadratic algebras maps to `A₁ ⊗ A₂` by
`ω ↦ 2 ω₁ω₂ - b₁ω₂ - b₂ω₁`; when `2, b₁, b₂` generate the unit ideal this map is injective with
image the invariants of `σ₁ ⊗ σ₂`. -/
theorem exists_productHom (a₁ b₁ a₂ b₂ : R) :
    ∃ φ : QuadraticAlgebra R (a₁ * b₂ ^ 2 + a₂ * b₁ ^ 2 + 4 * a₁ * a₂) (-(b₁ * b₂)) →ₐ[R]
        QuadraticAlgebra R a₁ b₁ ⊗[R] QuadraticAlgebra R a₂ b₂,
      φ QuadraticAlgebra.omega =
          2 • (QuadraticAlgebra.omega ⊗ₜ QuadraticAlgebra.omega) -
            b₁ • ((1 : QuadraticAlgebra R a₁ b₁) ⊗ₜ QuadraticAlgebra.omega) -
            b₂ • (QuadraticAlgebra.omega ⊗ₜ (1 : QuadraticAlgebra R a₂ b₂)) ∧
        (Ideal.span {2, b₁, b₂} = ⊤ →
          Function.Injective φ ∧
            Set.range φ = {x | Algebra.TensorProduct.map (conj a₁ b₁) (conj a₂ b₂) x = x}) := by
  sorry

/-! ## Layer 6: discriminant and resultant of a binary form -/

/-- The universal polynomial `∑ᵢ aᵢ Xⁱ` of formal degree `n` over `ℤ[a₀, …, aₙ]`. -/
noncomputable def univPoly (n : ℕ) : Polynomial (MvPolynomial (Fin (n + 1)) ℤ) :=
  ∑ i : Fin (n + 1), Polynomial.C (X i) * Polynomial.X ^ (i : ℕ)

/-- The universal signed resultant `(-1)^(n(n-1)/2) Res_{n,n-1}(f, f')`. -/
noncomputable def univSignedRes (n : ℕ) : MvPolynomial (Fin (n + 1)) ℤ :=
  (-1) ^ (n * (n - 1) / 2) *
    Polynomial.resultant (univPoly n) (Polynomial.derivative (univPoly n)) n (n - 1)

/-- The universal discriminant of a binary form of degree `n`: the signed resultant divided by
the leading coefficient `aₙ`, monomial by monomial. -/
noncomputable def univBinDisc (n : ℕ) : MvPolynomial (Fin (n + 1)) ℤ :=
  ∑ m ∈ (univSignedRes n).support,
    monomial (m - Finsupp.single (Fin.last n) 1) ((univSignedRes n).coeff m)

/-- The discriminant of a polynomial `f` read as a binary form of degree `n`, that is with
`aᵢ = f.coeff i` for `i ≤ n`. -/
noncomputable def binDisc (f : Polynomial R) (n : ℕ) : R :=
  eval₂ (Int.castRingHom R) (fun i : Fin (n + 1) => f.coeff i) (univBinDisc n)

/-- README 6.1: the signed resultant is divisible by the leading coefficient, with quotient the
universal discriminant. -/
theorem X_last_mul_univBinDisc (hn : 1 ≤ n) :
    X (Fin.last n) * univBinDisc n = univSignedRes n := by
  sorry

/-- README 6.1: `aₙ Disc_n(f) = (-1)^(n(n-1)/2) Res_{n,n-1}(f, f')` over any ring. -/
theorem leadingCoeff_mul_binDisc (hn : 1 ≤ n) (f : Polynomial R) (hf : f.natDegree ≤ n) :
    f.coeff n * binDisc f n =
      (-1) ^ (n * (n - 1) / 2) * Polynomial.resultant f (Polynomial.derivative f) n (n - 1) := by
  sorry

/-- README 6.2: the discriminant commutes with base change. -/
theorem binDisc_map {S : Type*} [CommRing S] (φ : R →+* S) (f : Polynomial R) (n : ℕ) :
    binDisc (f.map φ) n = φ (binDisc f n) := by
  sorry

/-- README 6.2: read in degree `n ≥ 2` with `aₙ = 0`, the discriminant is `a_{n-1}²` times the
discriminant in degree `n - 1`. -/
theorem binDisc_of_coeff_eq_zero (hn : 2 ≤ n) (f : Polynomial R) (hf : f.coeff n = 0) :
    binDisc f n = f.coeff (n - 1) ^ 2 * binDisc f (n - 1) := by
  sorry

/-- README 6.3: a monic polynomial of degree `n ≥ 1` has unit discriminant exactly when
`R[X]/(f)` is étale over `R`. -/
theorem isUnit_binDisc_iff_etale (f : Polynomial R) (hf : f.Monic) (hn : 1 ≤ n)
    (hdeg : f.natDegree = n) : IsUnit (binDisc f n) ↔ Algebra.Etale R (AdjoinRoot f) := by
  sorry

end TauCetiRoadmap.QuadraticFormsOverABase
