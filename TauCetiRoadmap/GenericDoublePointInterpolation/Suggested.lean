import Mathlib

/-!
# GenericDoublePointInterpolation: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline
theorems against the pinned Mathlib and Tau Ceti APIs, using explicit polynomial,
linear-map, matrix and spectrum definitions.

The degree-at-least-five Alexander–Hirschowitz theorem is stated in affine
first-jet form as genericDoublePointRank, including the overfilled range, and
the theorem in every degree, with its exceptional cases excluded, as
alexanderHirschowitzRank.
The finite codimension-three cubic bases are stated on native submodules and
homogeneous polynomials. The differential Horace theorem, plane contact theorem
and general codimension-three cubic recursions are not statable here on the
intended projective-section carriers: the supplier projective
bundle, twisting-section comparison, residual sequence and relative direction
incidence interfaces specified in README.md are not present at the pins.
The quadratic rank formula and the plane, cubic and higher-dimensional quartic
maximal-rank theorems are
also stated on the native affine first-jet matrix. The relative-scheme
toolkit, coefficient metric and intermediate API are specified in README.md.
-/

namespace TauCetiRoadmap.GenericDoublePointInterpolation

universe u

/-! ## Layer 0: Coefficient spaces and fixed homogenization -/

/-- Polynomials in r affine variables of total degree at most d. -/
noncomputable abbrev Bounded (R : Type u) [CommRing R] (r d : ℕ) :=
  MvPolynomial.restrictTotalDegree (Fin r) R d

/-- Exponent vectors of total weight at most d. -/
abbrev Monomials (r d : ℕ) :=
  {a : Fin r →₀ ℕ // a.sum (fun _ e => e) ≤ d}

/-- Bounded exponent vectors form a finite type, by coordinatewise boundedness. -/
noncomputable instance monomialsFintype (r d : ℕ) : Fintype (Monomials r d) := by
  classical
  have hb : Finite {f : Fin r →₀ ℕ | ∀ j, f j ≤ d} :=
    ((Set.Finite.pi' fun _ => Set.finite_le_nat d).preimage
      DFunLike.coe_injective.injOn).to_subtype
  have : Finite (Monomials r d) := by
    change Finite {a : Fin r →₀ ℕ | a.sum (fun _ e => e) ≤ d}
    rw [Set.finite_coe_iff] at hb ⊢
    exact hb.subset fun a ha j => (eq_or_ne (a j) 0).elim
      (fun h => h.trans_le (Nat.zero_le d)) fun h =>
        (Finset.single_le_sum (fun _ _ => Nat.zero_le _)
          (Finsupp.mem_support_iff.mpr h)).trans ha
  exact Fintype.ofFinite _

/-! ## Layer 1: First-jet algebras and double-point evaluation -/

/-- Rows consist of a support and either a value or a coordinate derivative. -/
abbrev JetRows (n r : ℕ) := Fin n × Option (Fin r)

/-- Algebra evaluation at the scalar point plus the coordinate infinitesimals. -/
noncomputable def jetAlgebra {R : Type u} [CommRing R] {r : ℕ} (P : Fin r → R) :
    MvPolynomial (Fin r) R →ₐ[R] TrivSqZeroExt R (Fin r → R) :=
  MvPolynomial.aeval (fun j => TrivSqZeroExt.inl (P j) +
    TrivSqZeroExt.inr (Pi.single j 1))

/-- The square of the ideal of the union of the supports, including repetitions. -/
noncomputable def doubleIdeal {R : Type u} [CommRing R] {r n : ℕ} (P : Fin n → Fin r → R) :
    Ideal (MvPolynomial (Fin r) R) :=
  (⨅ i, RingHom.ker (MvPolynomial.eval (P i))) ^ 2

/-- The quotient by distinct doubled points is the product of their first-jet algebras. -/
theorem doublePointQuotient {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) (hP : Function.Injective P) :
    ∃ e : (MvPolynomial (Fin r) k ⧸ doubleIdeal P) ≃ₐ[k]
        (Fin n → TrivSqZeroExt k (Fin r → k)),
      ∀ f, e (Ideal.Quotient.mk _ f) = fun i => jetAlgebra (P i) f := by
  sorry

/-- Bounded first jets evaluate the polynomial and its native partial derivatives. -/
noncomputable def firstJetMap {R : Type u} [CommRing R] {r n : ℕ}
    (P : Fin n → Fin r → R) (d : ℕ) :
    Bounded R r d →ₗ[R] (Fin n → Option (Fin r) → R) where
  toFun f i z := match z with
    | none => MvPolynomial.eval (P i) f.val
    | some j => MvPolynomial.eval (P i) (MvPolynomial.pderiv j f.val)
  map_add' f g := by
    funext i z
    cases z <;> simp
  map_smul' a f := by
    funext i z
    cases z <;> simp

/-- The monomial matrix of value and partial-derivative evaluation over a ring. -/
noncomputable def firstJetMatrix {R : Type u} [CommRing R] {r n : ℕ}
    (P : Fin n → Fin r → R) (d : ℕ) :
    Matrix (JetRows n r) (Monomials r d) R :=
  fun z a => match z.2 with
    | none => MvPolynomial.eval (P z.1) (MvPolynomial.monomial a.val 1)
    | some j => MvPolynomial.eval (P z.1)
        (MvPolynomial.pderiv j (MvPolynomial.monomial a.val 1))

/-- A tuple is well poised when every value and first-derivative tuple is attained. -/
def WellPoised {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) (d : ℕ) : Prop :=
  Function.Surjective (firstJetMap P d)

/-! ## Layer 3: Plane and cubic interpolation bases -/

/-- Generic quadrics have the rank determined by the radical of their symmetric
    bilinear form, including the defective counts (BO, Section 3, p.6). -/
theorem quadraticDoublePointRank {k : Type u} [Field k] [CharZero k]
    (r q : ℕ) (hr : 1 ≤ r) :
    ∃ P : Fin q → Fin r → k, Function.Injective P ∧
      (firstJetMatrix P 2).rank =
        Nat.choose (r+2) 2 - Nat.choose (r+2 - min q (r+1)) 2 := by
  sorry

/-- Distinct rational configurations attain all twelve required neighboring ranks. -/
theorem nearExceptionRanks :
    ∀ t ∈ [(2,3,3,9), (2,3,4,10), (3,3,5,20), (4,3,6,30),
      (4,3,8,35), (7,3,15,120), (2,4,4,12), (2,4,6,15),
      (3,4,8,32), (3,4,10,35), (4,4,13,65), (4,4,15,70)],
      ∃ P : Fin t.2.2.1 → Fin t.1 → ℚ,
        Function.Injective P ∧ (firstJetMatrix P t.2.1).rank = t.2.2.2 := by
  sorry

/-- Plane sextics attain both critical ranks at distinct rational supports. -/
theorem sexticPlane :
    ∀ q ∈ [9, 10], ∃ P : Fin q → Fin 2 → ℚ,
      Function.Injective P ∧ (firstJetMatrix P 6).rank = min 28 (3*q) := by
  sorry

/-- General plane double points have maximal rank in every nonexceptional
    degree, realized over every characteristic-zero field (BO, Theorem 2.4). -/
theorem planeDoublePointRank {k : Type u} [Field k] [CharZero k]
    (d q : ℕ) (hquadric : (d, q) ≠ (2, 2)) (hquartic : (d, q) ≠ (4, 5)) :
    ∃ P : Fin q → Fin 2 → k, Function.Injective P ∧
      (firstJetMatrix P d).rank = min (Nat.choose (2+d) d) (3*q) := by
  sorry

/-- Nonzero vectors represent distinct projective points exactly when proportionality
    of any two indexed vectors forces their indices to agree. -/
def ProjectivelyDistinct {k : Type u} [Field k] {r : ℕ} {ι : Type*}
    (P : ι → Fin (r+1) → k) : Prop :=
  (∀ i, P i ≠ 0) ∧ ∀ i j (c : k), P i = c • P j → i = j

/-- In projective dimensions five, six and seven, three codimension-three spaces
    in linear general position admit three singular supports each killing all
    containing cubics (Brambilla–Ottaviani, Proposition 5.2). -/
theorem threeSubspaceCubicBases :
    ∀ r ∈ [5, 6, 7],
      ∃ (L : Fin 3 → Submodule ℚ (Fin (r+1) → ℚ))
        (P : Fin 3 × Fin 3 → Fin (r+1) → ℚ),
        (∀ a, Module.finrank ℚ (L a) = r-2) ∧
        (∀ a b, a ≠ b → L a ⊔ L b = ⊤) ∧
        (⨅ a, L a) = ⊥ ∧ ProjectivelyDistinct P ∧
        (∀ a i, P (a,i) ∈ L a) ∧
        (∀ a b i, a ≠ b → P (a,i) ∉ L b) ∧
        ∀ F : MvPolynomial (Fin (r+1)) ℚ,
          F.IsHomogeneous 3 →
          (∀ a v, v ∈ L a → MvPolynomial.eval v F = 0) →
          (∀ z j, MvPolynomial.eval (P z) (MvPolynomial.pderiv j F) = 0) →
          F = 0 := by
  sorry

/-- In projective dimensions five and seven, two codimension-three spaces with
    r−2 singular supports each and three outside supports kill all containing
    cubics (Brambilla–Ottaviani, Proposition 5.3). -/
theorem twoSubspaceCubicBases :
    ∀ r ∈ [5, 7],
      ∃ (L : Fin 2 → Submodule ℚ (Fin (r+1) → ℚ))
        (P : (Fin 2 × Fin (r-2)) ⊕ Fin 3 → Fin (r+1) → ℚ),
        (∀ a, Module.finrank ℚ (L a) = r-2) ∧
        L 0 ⊔ L 1 = ⊤ ∧ ProjectivelyDistinct P ∧
        (∀ a i, P (.inl (a,i)) ∈ L a) ∧
        (∀ a b i, a ≠ b → P (.inl (a,i)) ∉ L b) ∧
        (∀ i a, P (.inr i) ∉ L a) ∧
        ∀ F : MvPolynomial (Fin (r+1)) ℚ,
          F.IsHomogeneous 3 →
          (∀ a v, v ∈ L a → MvPolynomial.eval v F = 0) →
          (∀ z j, MvPolynomial.eval (P z) (MvPolynomial.pderiv j F) = 0) →
          F = 0 := by
  sorry

/-- The one-space cubic bases have 3 on-space and 6 outside double supports in
    P⁵, with an additional transverse length-two condition, and 7 on-space and
    8 outside supports in P⁷ (Brambilla–Ottaviani, Proposition 5.4). -/
theorem oneSubspaceCubicBases :
    (∃ (L : Submodule ℚ (Fin 6 → ℚ)) (P : Fin 9 → Fin 6 → ℚ)
        (Q w : Fin 6 → ℚ),
      Module.finrank ℚ L = 3 ∧
      ProjectivelyDistinct (Sum.elim P (fun _ : Unit => Q)) ∧
      (∀ i, P i ∈ L ↔ i.val < 3) ∧ Q ∈ L ∧ w ∉ L ∧
      ∀ F : MvPolynomial (Fin 6) ℚ,
        F.IsHomogeneous 3 →
        (∀ v, v ∈ L → MvPolynomial.eval v F = 0) →
        (∀ i j, MvPolynomial.eval (P i) (MvPolynomial.pderiv j F) = 0) →
        MvPolynomial.eval Q F = 0 →
        (∑ j, w j * MvPolynomial.eval Q (MvPolynomial.pderiv j F)) = 0 →
        F = 0) ∧
    (∃ (L : Submodule ℚ (Fin 8 → ℚ)) (P : Fin 15 → Fin 8 → ℚ),
      Module.finrank ℚ L = 5 ∧ ProjectivelyDistinct P ∧
      (∀ i, P i ∈ L ↔ i.val < 7) ∧
      ∀ F : MvPolynomial (Fin 8) ℚ,
        F.IsHomogeneous 3 →
        (∀ v, v ∈ L → MvPolynomial.eval v F = 0) →
        (∀ i j, MvPolynomial.eval (P i) (MvPolynomial.pderiv j F) = 0) →
        F = 0) := by
  sorry

/-- General cubic double points have maximal rank except for seven supports
    in projective four-space (BO, Theorem 5.1). -/
theorem cubicDoublePointRank {k : Type u} [Field k] [CharZero k]
    (r q : ℕ) (hr : 2 ≤ r) (hexception : (r, q) ≠ (4, 7)) :
    ∃ P : Fin q → Fin r → k, Function.Injective P ∧
      (firstJetMatrix P 3).rank = min (Nat.choose (r+3) 3) (q*(r+1)) := by
  sorry

/-- Twenty-one distinct rational supports in affine five-space impose 126 quartic conditions. -/
theorem quarticFive :
    ∃ P : Fin 21 → Fin 5 → ℚ,
      Function.Injective P ∧ (firstJetMatrix P 4).rank = 126 := by
  sorry

/-! ## Layer 4: Differential Horace and generic projective interpolation -/

/-- Over every field, distinct univariate double supports have the Hermite rank. -/
theorem univariateHermiteRank {k : Type u} [Field k] {n : ℕ}
    (P : Fin n → Fin 1 → k) (hP : Function.Injective P) (d : ℕ) :
    (firstJetMatrix P d).rank = min (d+1) (2*n) := by
  sorry

/-- Quartic double points have maximal rank in projective dimension at least
    five, realized over every characteristic-zero field (BO, Section 6, p.19). -/
theorem quarticDoublePointRank {k : Type u} [Field k] [CharZero k]
    (r q : ℕ) (hr : 5 ≤ r) :
    ∃ P : Fin q → Fin r → k, Function.Injective P ∧
      (firstJetMatrix P 4).rank = min (Nat.choose (r+4) 4) (q*(r+1)) := by
  sorry

/-- In degree at least five, some distinct affine configuration has the full
    Alexander–Hirschowitz rank over every characteristic-zero field, for every count. -/
theorem genericDoublePointRank {k : Type u} [Field k] [CharZero k]
    (r d q : ℕ) (hr : 1 ≤ r) (hd : 5 ≤ d) :
    ∃ P : Fin q → Fin r → k, Function.Injective P ∧
      (firstJetMatrix P d).rank = min (Nat.choose (r+d) d) (q*(r+1)) := by
  sorry

/-- Alexander–Hirschowitz theorem in every degree, in affine first-jet form over every
    characteristic-zero field: outside the quadric range 2 ≤ q ≤ r and the four exceptional
    triples, some distinct configuration has the expected rank (BO, Theorem 1.1). -/
theorem alexanderHirschowitzRank {k : Type u} [Field k] [CharZero k]
    (r d q : ℕ) (hr : 1 ≤ r) (hquadric : ¬(d = 2 ∧ 2 ≤ q ∧ q ≤ r))
    (hexception : (r, d, q) ∉ [(2, 4, 5), (3, 4, 9), (4, 3, 7), (4, 4, 14)]) :
    ∃ P : Fin q → Fin r → k, Function.Injective P ∧
      (firstJetMatrix P d).rank = min (Nat.choose (r+d) d) (q*(r+1)) := by
  sorry

/-! ## Layer 5: Affine principal opens and integer coordinates -/

/-- The universal first-jet matrix evaluates at independent point-coordinate variables over ℤ. -/
noncomputable def universalJetMatrix (r n d : ℕ) :
    Matrix (JetRows n r) (Monomials r d) (MvPolynomial (Fin n × Fin r) ℤ) :=
  firstJetMatrix (fun i j => MvPolynomial.X (i,j)) d

/-- A choice of distinct columns defines the determinant with the fixed row ordering. -/
noncomputable abbrev selectedMinor {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) : MvPolynomial (Fin n × Fin r) ℤ :=
  ((universalJetMatrix r n d).submatrix id cols).det

/-- A field-valued tuple determines the prime kernel of its evaluation homomorphism. -/
noncomputable abbrev evaluationPrime {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) : PrimeSpectrum (MvPolynomial (Fin n × Fin r) k) :=
  ⟨RingHom.ker (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)),
    RingHom.ker_isPrime _⟩

/-- A nonzero selected minor admits an integer full-jet witness in the box of side n(r+1)d. -/
theorem integerGridForMinor {k : Type u} [Field k] [CharZero k] {r n : ℕ}
    (d : ℕ) (cols : JetRows n r ↪ Monomials r d) (hΔ : selectedMinor d cols ≠ 0) :
    ∃ P : Fin n → Fin r → ℤ,
      (∀ i j, 0 ≤ P i j ∧ P i j ≤ (n*(r+1)*d : ℕ)) ∧
      MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2) (selectedMinor d cols) ≠ 0 ∧
      Function.Injective P ∧ WellPoised (fun i j => (P i j : k)) d := by
  sorry

/-- An integer maximal minor defines a nonempty full-jet open over every characteristic-zero field. -/
theorem genericAffinePrincipalOpen {k : Type u} [Field k] [CharZero k]
    (r n d : ℕ) (hr : 1 ≤ r) (hn : 1 ≤ n) (hd : 5 ≤ d)
    (hsize : n*(r+1) ≤ Nat.choose (r+d) d) :
    ∃ cols : JetRows n r ↪ Monomials r d,
      selectedMinor d cols ≠ 0 ∧
      (∃ P : Fin n → Fin r → k, evaluationPrime P ∈ PrimeSpectrum.basicOpen
        (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols))) ∧
      ∀ P : Fin n → Fin r → k, evaluationPrime P ∈ PrimeSpectrum.basicOpen
        (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols)) →
        Function.Injective P ∧ WellPoised P d := by
  sorry

/-- A nonzero polynomial pullback admits an integer parameter witness with individual degree bounds. -/
theorem parameterPullback {k : Type u} [Field k] [CharZero k]
    {S : Type*} [Fintype S] {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (θ : Fin n × Fin r → MvPolynomial S ℤ)
    (B : S → ℕ) (hΔ : MvPolynomial.aeval θ (selectedMinor d cols) ≠ 0)
    (hB : ∀ s, (MvPolynomial.aeval θ (selectedMinor d cols)).degreeOf s ≤ B s) :
    ∃ u : S → ℤ, (∀ s, 0 ≤ u s ∧ u s ≤ (B s : ℤ)) ∧
      MvPolynomial.eval u (MvPolynomial.aeval θ (selectedMinor d cols)) ≠ 0 ∧
      Function.Injective (fun i : Fin n => fun j : Fin r => MvPolynomial.eval u (θ (i,j))) ∧
      WellPoised (fun i : Fin n => fun j : Fin r => (MvPolynomial.eval u (θ (i,j)) : k)) d := by
  sorry

end TauCetiRoadmap.GenericDoublePointInterpolation
