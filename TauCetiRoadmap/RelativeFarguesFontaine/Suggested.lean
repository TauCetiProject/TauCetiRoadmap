import Mathlib

/-!
# RelativeFarguesFontaine: representative target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the definitions and statements that
can be typed against the pinned Mathlib; proving every item here does not by itself
complete a layer.

Design choices made explicit here:
* the ramified ghost polynomials and their twisted variant are stated over an arbitrary
  commutative coefficient ring, without constructing a ramified Witt ring;
* the radius and the rank-one twist are recorded through their scalar cores (`periodRadiusValue`,
  `twistMultiplier`, `IsTwistSection`), which fix the conventions `rad ∘ φ = q · rad` and
  `O(n) ↔ π⁻ⁿφ`;
* the linear patching of Layer 6 is algebraic: exact squares, glueing data, glueing pairs and
  pole-bounded lattices are stated over actual rings, localizations and tensor products.

The relative period spaces, the curve, the divisor moduli, the completed divisor rings and the
group-valued modifications have no carriers at the pins; they are README targets only and are
listed in the closing comment.
-/

noncomputable section

open scoped TensorProduct

universe u v

namespace TauCetiRoadmap.RelativeFarguesFontaine

/-! ## Layer 0: coefficients and integral period geometry -/

section Coefficients

variable {O : Type v} [CommRing O]

/-- Evaluation of the ramified ghost polynomial; meaningful in any coefficient algebra. -/
def ramifiedGhost (π : O) (q : ℕ) (A : Type u) [CommRing A] [Algebra O A]
    (n : ℕ) (x : ℕ → A) : A :=
  ∑ i ∈ Finset.range (n + 1), algebraMap O A π ^ i * x i ^ (q ^ (n - i))

/-- The actual finite polynomial, without defining a ramified Witt ring. -/
def ramifiedWittPolynomials (π : O) (q n : ℕ) : MvPolynomial ℕ O :=
  ∑ i ∈ Finset.range (n + 1), MvPolynomial.C (π ^ i) * MvPolynomial.X i ^ (q ^ (n - i))

/-- The ramified Dwork criterion of README §0.2 gives injectivity and the exact ghost image
for a torsion-free algebra with a coefficient-linear Frobenius lift. -/
theorem ramifiedDworkCriterion [IsDomain O] [CharZero O] [IsDiscreteValuationRing O]
    [Finite (IsLocalRing.ResidueField O)] (π : O) (q : ℕ)
    (hπ : IsLocalRing.maximalIdeal O = Ideal.span {π})
    (hq : q = Nat.card (IsLocalRing.ResidueField O))
    (A : Type u) [CommRing A] [Algebra O A]
    (hregular : algebraMap O A π ∈ nonZeroDivisors A) (σ : A →ₐ[O] A)
    (hσ : ∀ a : A, algebraMap O A π ∣ σ a - a ^ q) :
    Function.Injective (fun x : ℕ → A => fun n => ramifiedGhost π q A n x) ∧
      ∀ y : ℕ → A, (∃ x : ℕ → A, ∀ n, ramifiedGhost π q A n x = y n) ↔
        ∀ n, algebraMap O A π ^ (n + 1) ∣ y (n + 1) - σ (y n) := by
  sorry

/-- Polynomial evaluation realizes the ramified ghost formula of README §0.1. -/
theorem ramifiedWittPolynomials_eval (π : O) (q : ℕ) (A : Type u)
    [CommRing A] [Algebra O A] (n : ℕ) (x : ℕ → A) :
    MvPolynomial.eval₂ (algebraMap O A) x (ramifiedWittPolynomials π q n) =
      ramifiedGhost π q A n x := by
  sorry

/-- At the exact unramified specialization, README §0.1's ghosts are Mathlib's ghosts. -/
theorem ramifiedGhost_p_typical (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
    (x : WittVector p A) (n : ℕ) :
    ramifiedGhost (p : ℤ) p A n x.coeff = WittVector.ghostComponent n x := by
  sorry

/-- Naturality is the coefficient-evaluation milestone, with no ghost-injectivity assumption. -/
theorem ramifiedGhost_natural (π : O) (q : ℕ) (A B : Type u)
    [CommRing A] [Algebra O A] [CommRing B] [Algebra O B]
    (f : A →ₐ[O] B) (n : ℕ) (x : ℕ → A) :
    ramifiedGhost π q B n (f ∘ x) = f (ramifiedGhost π q A n x) := by
  sorry

/-- Coefficientwise congruence modulo π; the ordinary polynomial need not be LT. -/
def WittTwistAdmissible (π : O) (q : ℕ) (Q : Polynomial O) : Prop :=
  ∀ n, π ∣ (Q - Polynomial.X ^ q).coeff n

/-- Iterated polynomial evaluation, the ghost formula for the twisted coordinate system. -/
def twistedGhost (π : O) (_q : ℕ) (A : Type u) [CommRing A] [Algebra O A]
    (Q : Polynomial O) (n : ℕ) (x : ℕ → A) : A :=
  ∑ i ∈ Finset.range (n + 1),
    algebraMap O A π ^ i * (fun a => Q.eval₂ (algebraMap O A) a)^[n - i] (x i)

/-- The ordinary polynomial recovers the untwisted ghost system of README §0.11. -/
theorem twistedGhost_ordinary (π : O) (q : ℕ) (A : Type u) [CommRing A] [Algebra O A]
    (x : ℕ → A) (n : ℕ) :
    twistedGhost π q A (Polynomial.X ^ q) n x = ramifiedGhost π q A n x := by
  sorry

end Coefficients

/-- The ordinary characteristic-`p` disc coordinate has no `p`-th root, as in README §7.6.
The unit-radius restricted-series subring is the ring of the unperfected ratio chart. -/
theorem unperfectedDiscCoordinate_no_pthRoot (p : ℕ) [Fact p.Prime]
    (C : Type u) [NormedField C] [IsUltrametricDist C] [CharP C p]
    (f : PowerSeries.IsRestricted.subring (R := C) 1) :
    (f : PowerSeries C) ^ p ≠ PowerSeries.X := by
  sorry

/-! ## Layer 1: annuli and relative period rings -/

/-- Scalar core of the geometric radius, evaluated at a rank-one valuation.
The geometric domain ensures both values lie strictly between zero and one. -/
def periodRadiusValue (πval teichval : ℝ) : ℝ :=
  Real.log teichval / Real.log πval

/-- The scalar Frobenius scaling law in README §1.2 multiplies the radius by `q`. -/
theorem periodRadiusValue_frobenius (πval teichval : ℝ) (q : ℕ)
    (hπ : 0 < πval) (hπ1 : πval < 1) (ht : 0 < teichval) :
    periodRadiusValue πval (teichval ^ q) = q * periodRadiusValue πval teichval := by
  sorry

/-! ## Layer 2: the relative curve and its diamond
The relative ringed quotient has no carrier at the pins; see README Layer 2. -/

/-! ## Layer 3: effective divisors and ambient completions
The divisor moduli and completed divisor rings have no carriers at the pins; see README Layer 3. -/

/-! ## Layer 4: marked untilts and local de Rham geometry
The completion comparisons need the marked geometric carriers of README Layer 4. -/

/-! ## Layer 5: rank-one twists and section charts -/

section Twist

variable {K : Type u} [Field K]

/-- The descent multiplier is `π^(−n)`, not `π^n`. -/
def twistMultiplier (π : Kˣ) (n : ℤ) : K := (π : K) ^ (-n)

/-- Scalar eigenvector condition for sections of `O(n)`. -/
def IsTwistSection (φ : K →+* K) (π : Kˣ) (n : ℤ) (x : K) : Prop :=
  φ x = (π : K) ^ n * x

/-- The scalar section equation agrees with invariance under the descent multiplier. -/
theorem twist_invariance_iff (φ : K →+* K) (π : Kˣ) (n : ℤ) (x : K) :
    twistMultiplier π n * φ x = x ↔ IsTwistSection φ π n x := by
  sorry

end Twist

/-! ## Layer 6: linear patching and modifications -/

section ExactSquare

variable (R R₁ R₂ R₁₂ : Type u) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R R₁₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]

/-- All three places of the difference sequence must be exact. -/
structure ExactSquare : Prop where
  injective : Function.Injective fun r : R => (algebraMap R R₁ r, algebraMap R R₂ r)
  exact : ∀ (a : R₁) (b : R₂), algebraMap R₁ R₁₂ a = algebraMap R₂ R₁₂ b →
    ∃ r : R, algebraMap R R₁ r = a ∧ algebraMap R R₂ r = b
  surjective : ∀ z : R₁₂, ∃ (a : R₁) (b : R₂), algebraMap R₁ R₁₂ a - algebraMap R₂ R₁₂ b = z

end ExactSquare

section GlueingDatum

variable (R₁ R₂ R₁₂ M₁ M₂ M₁₂ : Type u)
  [CommRing R₁] [CommRing R₂] [CommRing R₁₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]

/-- Actual modules and actual overlap identifications, without topological data. -/
structure GlueingDatum where
  ψ₁ : R₁₂ ⊗[R₁] M₁ ≃ₗ[R₁₂] M₁₂
  ψ₂ : R₁₂ ⊗[R₂] M₂ ≃ₗ[R₁₂] M₁₂

variable {R₁ R₂ R₁₂ M₁ M₂ M₁₂}

/-- Membership in the module of compatible sections, without constructing that module. -/
def GlueingDatum.IsSection (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) (x : M₁ × M₂) : Prop :=
  D.ψ₁ (1 ⊗ₜ x.1) = D.ψ₂ (1 ⊗ₜ x.2)

end GlueingDatum

/-- Rank-one overlap datum with the second identification multiplied by a specified unit. -/
def GlueingDatum.unitTransition (R₁ R₂ R₁₂ : Type u)
    [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
    [Algebra R₁ R₁₂] [Algebra R₂ R₁₂] (a : R₁₂ˣ) :
    GlueingDatum R₁ R₂ R₁₂ R₁ R₂ R₁₂ where
  ψ₁ := TensorProduct.AlgebraTensorModule.rid R₁ R₁₂ R₁₂
  ψ₂ := (TensorProduct.AlgebraTensorModule.rid R₂ R₁₂ R₁₂).trans
    (LinearEquiv.smulOfUnit a)

section GlueingPair

variable {R : Type u} [CommRing R]

/-- Quotient bijectivity and power-torsion bijectivity together characterize a glueing pair. -/
structure GlueingPair (R' : Type u) [CommRing R'] [Algebra R R'] (f : R) : Prop where
  quotient_surjective : ∀ n : ℕ, ∀ y : R', ∃ x : R,
    y - algebraMap R R' x ∈ Ideal.span {algebraMap R R' f ^ n}
  quotient_injective : ∀ n : ℕ,
    (Ideal.span {algebraMap R R' f ^ n}).comap (algebraMap R R') = Ideal.span {f ^ n}
  torsion_bijOn : Set.BijOn (algebraMap R R')
    (Submodule.torsion' R R (Submonoid.powers f))
    (Submodule.torsion' R' R' (Submonoid.powers (algebraMap R R' f)))

/-- The power-torsion form of glueability: bijectivity of `M[f^∞] → (R' ⊗ M)[f^∞]`. It agrees with
exactness of the glueing sequence whenever `R → R'` induces isomorphisms modulo every `f ^ n`
(Stacks Lemma 15.92.10); for a glueing pair injectivity already suffices. -/
def Glueable (R' : Type u) [CommRing R'] [Algebra R R'] (f : R)
    (M : Type u) [AddCommGroup M] [Module R M] : Prop :=
  Set.BijOn (fun m : M => (1 : R') ⊗ₜ[R] m)
    (Submodule.torsion' R M (Submonoid.powers f))
    (Submodule.torsion' R' (R' ⊗[R] M) (Submonoid.powers (algebraMap R R' f)))

/-- A regular element gives the non-noetherian completion glueing pair of README §6.4. -/
theorem GlueingPair.of_nonZeroDivisor (f : R) (hf : f ∈ nonZeroDivisors R) :
    GlueingPair (AdicCompletion (Ideal.span {f}) R) f := by
  sorry

/-- Flat modules satisfy the glueability criterion of README §6.4. -/
theorem Glueable.of_flat {R' : Type u} [CommRing R'] [Algebra R R']
    (f : R) (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Flat R M] : Glueable R' f M := by
  sorry

/-- Flatness is detected by the two scalar extensions in README §6.5's glueing pair. -/
theorem beauvilleLaszlo_flat_iff {R' : Type u} [CommRing R'] [Algebra R R']
    {f : R} (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    Module.Flat R M ↔
      Module.Flat R' (R' ⊗[R] M) ∧
        Module.Flat (Localization.Away f) (Localization.Away f ⊗[R] M) := by
  sorry

/-- Finite-projective detection needs a glueing pair, and applies even to an arbitrary module.
Stacks Lemma 15.92.19; glueability is a consequence here rather than an extra hypothesis. -/
theorem beauvilleLaszlo_finiteProjective_iff {R' : Type u} [CommRing R'] [Algebra R R']
    {f : R} (h : GlueingPair R' f) (M : Type u) [AddCommGroup M] [Module R M] :
    (Module.Finite R M ∧ Module.Projective R M) ↔
      ((Module.Finite R' (R' ⊗[R] M) ∧ Module.Projective R' (R' ⊗[R] M)) ∧
        (Module.Finite (Localization.Away f) (Localization.Away f ⊗[R] M) ∧
          Module.Projective (Localization.Away f) (Localization.Away f ⊗[R] M))) := by
  sorry

/-- Algebraic effectivity with an explicit common puncture and transition compatibility. -/
theorem beauvilleLaszlo_effective {R' : Type u} [CommRing R'] [Algebra R R'] {f : R}
    (h : GlueingPair R' f) (L : Type u) [CommRing L] [Algebra R L] [Algebra R' L]
    [Algebra (Localization.Away f) L] [IsScalarTower R R' L]
    [IsScalarTower R (Localization.Away f) L] [IsLocalization.Away (algebraMap R R' f) L]
    (M' M₁ : Type u) [AddCommGroup M'] [Module R' M']
    [Module.Finite R' M'] [Module.Projective R' M']
    [AddCommGroup M₁] [Module (Localization.Away f) M₁]
    [Module.Finite (Localization.Away f) M₁] [Module.Projective (Localization.Away f) M₁]
    (α : L ⊗[R'] M' ≃ₗ[L] L ⊗[Localization.Away f] M₁) :
    ∃ (M : Type u) (_ : AddCommGroup M) (_ : Module R M),
      Module.Finite R M ∧ Module.Projective R M ∧
      ∃ (e' : R' ⊗[R] M ≃ₗ[R'] M')
        (e₁ : Localization.Away f ⊗[R] M ≃ₗ[Localization.Away f] M₁),
        ∀ m : M, α (1 ⊗ₜ[R'] e' (1 ⊗ₜ[R] m)) =
          1 ⊗ₜ[Localization.Away f] e₁ (1 ⊗ₜ[R] m) := by
  sorry

end GlueingPair

section LocalModification

variable {A : Type u} [CommRing A]

/-- Finite projective lattices with a two-sided pole bound, in an actual localization. -/
def localModificationsBoundedBy (ξ : A) (M' : Type u) [AddCommGroup M'] [Module A M']
    (k : ℕ) : Set (Submodule A (Localization.Away ξ ⊗[A] M')) :=
  {M | Module.Finite A M ∧ Module.Projective A M ∧
    (∀ m : M', ξ ^ k • ((1 : Localization.Away ξ) ⊗ₜ[A] m) ∈ M) ∧
    ∀ x ∈ M, ∃ m : M', ξ ^ k • x = (1 : Localization.Away ξ) ⊗ₜ[A] m}

/-- The regular nonunit lattice of README §6.6 has bound one and fails bound zero. -/
theorem localModificationsBoundedBy_regular_nonunit (ξ : A)
    (hξ : ξ ∈ nonZeroDivisors A) (hnu : ¬ IsUnit ξ) :
    (Submodule.span A {(algebraMap A (Localization.Away ξ) ξ) ⊗ₜ[A] (1 : A)} ∈
      localModificationsBoundedBy ξ A 1) ∧
    Submodule.span A {(algebraMap A (Localization.Away ξ) ξ) ⊗ₜ[A] (1 : A)} ∉
      localModificationsBoundedBy ξ A 0 := by
  sorry

end LocalModification

/-! ## Layer 7: group-valued modifications
These need G-bundles on the relative curve, which have no carrier at the pins; see README Layer 7. -/

/-
README-only definitions and constructions (with their APIs and Checks there):
Layer 0: the full ghost API ramifiedGhost_zero, ramifiedGhost_one;
cohenCoefficientLifts; qTwistedWittFunctor,
qTeichmullerLift, lubinTateTeichmullerLift, integralRationalChartRings,
rootExtensionChartModel, wholeAnalyticAinfLocus, wholeAnalyticAinf.
Layer 1: annularGlobalSectionGeneration; radiusFunctionAndRationalAnnuli,
wittSeminormLambdaMu; relativeExtendedRobbaRings and relativePeriodPresheaves compare the
supplied p-typical carriers with the twelve-variant and all-E interfaces;
intervalAdicPairAndBaseProjection, berkovichPeriodDeformation.
Layer 2: globalPeriodSheavesAndEtaleFunctoriality and the diamond presentations of the supplied curve.
Layer 3: divDModuliVSheaf, completedRingsBPlusAndB, additionAndDisjointDivisorLoci,
completedDivisorGeometricStalk, divisorCompletionFiniteProjectives.
Layer 4: classicalPointsOfIntegralPeriodDisc, tiltingMapOfPeriodDisc, div1Moduli
and the marked geometric untilt/de Rham comparisons.
Layer 5: lubinTateDivisorSection compares the supplied period section with integral charts and completions.
The geometric twists, section algebra and partial Proj maps are supplier inputs.
Layer 6: normalizedTailComparison; the geometric no-leg equivalence is supplied;
ExactSquare.zariski_sections_can, ExactSquare.not_exact_double_localization;
GlueingDatum.can_sections_adjunction, GlueingDatum.sections_can_of_flat,
GlueingDatum.baseChange_can, GlueingDatum.sections_ext,
GlueingDatum.sections_zariski_Z, GlueingDatum.sections_identitySquare;
GlueingPair.iff_torsion_bijective, GlueingPair.of_flat,
GlueingPair.quotient_equiv, GlueingPair.spec_surjective, GlueingPair.int_p,
GlueingPair.of_isUnit, GlueingPair.noetherian_compat, GlueingPair.not_stacks_example;
Glueable.iff_torsion, Glueable.not_smooth_germs;
GlueingDatum.sections, GlueingDatum.sectionsCompare, GlueingDatum.can,
GlueingDatum.Hom, Modification,
relativeBPairPeriodComparison, relativeBPairModificationCompatibility and meromorphic bundles
on the complement of a divisor; the unramified relative B-pair rings/equivalence are supplied.
The flat-quasicoherent comparison B_pair_cohomology uses a principal affine Cartier neighbourhood.
Layer 7: torsorTensorDictionary; GModification and GBundleModification, with geometric tensor gluing,
faithful-representation meromorphy and ordinary torsor descent.
The all-E theorem v_descent_and_local_triviality uses the uniformizer-root extension and its
continuous module retractions on the base-cover nerve and coefficient overlaps.
-/

end TauCetiRoadmap.RelativeFarguesFontaine
