import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Distance
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.UpperHalfSpace.Metric
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Action
import TauCeti.Geometry.Manifold.Riemannian.Isometry.UpperHalfSpace
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
import TauCeti.MeasureTheory.Group.FundamentalDomain
import TauCeti.Topology.Algebra.GroupAction.FreeLocus
import TauCeti.Topology.Algebra.Matrix.ProjectiveSpecialLinearGroup

/-!
# Kleinian groups and arithmetic volume: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`, and these declarations are suggested forms, not a checklist. They pin the Möbius
action of `PSL(2, ℂ)` on Tau Ceti's upper half-space model `TauCeti.UpperHalfSpace ℂ`, written
`ℍ³`, its measure and distance, torsion-free Kleinian groups, covolume, Dirichlet domains, the
Bianchi groups and their congruence subgroups, the Bianchi domains, the covolumes, Humbert's
formula, and the statement of Thurston's question.

Every definition has a real body. The `Prop`-valued classes that the README asks for as instances
(`ContinuousConstSMul`, `SMulInvariantMeasure`, second countability of `PSL(2, ℂ)`) are stated
as theorems, so that no instance has a `sorry` body.

Not represented here, because their carriers are not in Tau Ceti: `UpperHalfSpace.congr`, a
Riemannian isometry between two half-space models; the Tamagawa measures and the archimedean
comparison of §4.6 (AdelicAlgebraicGroups); and the quotient manifold of §5.2
(GeometricTopology §7.1).
-/

namespace TauCetiRoadmap.KleinianGroups

open MeasureTheory Matrix MulAction NumberField TauCeti
open scoped MatrixGroups Manifold ComplexConjugate Quaternion

noncomputable section

/-- Hyperbolic `3`-space: Tau Ceti's upper half-space model over `ℂ`, the points `(w, t)` of
`WithLp 2 (ℂ × ℝ)` with `0 < t`. -/
scoped notation "ℍ³" => TauCeti.UpperHalfSpace ℂ

/-! ## Layer 0: the action, the measure, and the distance -/

namespace UpperHalfSpace

/-- The horizontal coordinate `w` of a point `(w, t)`. -/
noncomputable def w (p : ℍ³) : ℂ := (p : WithLp 2 (ℂ × ℝ)).fst

/-- The denominator `J = |c w + d|² + |c|² t²` of the Moebius formula. -/
noncomputable def denom (A : SL(2, ℂ)) (p : ℍ³) : ℝ :=
  Complex.normSq (A 1 0 * w p + A 1 1) + Complex.normSq (A 1 0) * UpperHalfSpace.height p ^ 2

theorem denom_pos (A : SL(2, ℂ)) (p : ℍ³) : 0 < denom A p := by
  by_cases hc : A 1 0 = 0
  · have hd : A 1 1 ≠ 0 := by
      intro hd
      have h := A.det_coe
      rw [det_fin_two, hc, hd] at h
      simp at h
    simpa [denom, hc] using Complex.normSq_pos.2 hd
  · exact add_pos_of_nonneg_of_pos (Complex.normSq_nonneg _)
      (mul_pos (Complex.normSq_pos.2 hc) (pow_pos (UpperHalfSpace.height_pos p) 2))

/-- The Möbius transformation of `A = (a b; c d)` in coordinates:
`(w, t) ↦ (((a w + b) conj (c w + d) + a conj c t²) / J, t / J)`, the formula of
Polylogarithms §2.4 on the carrier `TauCeti.UpperHalfSpace ℂ`. -/
noncomputable def mobius (A : SL(2, ℂ)) (p : ℍ³) : ℍ³ :=
  TauCeti.UpperHalfSpace.mk
    (WithLp.toLp 2
      (((A 0 0 * w p + A 0 1) * conj (A 1 0 * w p + A 1 1) +
          A 0 0 * conj (A 1 0) * ((UpperHalfSpace.height p ^ 2 : ℝ) : ℂ)) / (denom A p : ℂ),
        UpperHalfSpace.height p / denom A p))
    (div_pos (UpperHalfSpace.height_pos p) (denom_pos A p))

theorem one_smul' (p : ℍ³) : mobius 1 p = p := by
  sorry

/-- The composition law, transported from Polylogarithms §2.4. -/
theorem mul_smul' (A B : SL(2, ℂ)) (p : ℍ³) : mobius (A * B) p = mobius A (mobius B p) := by
  sorry

noncomputable instance : MulAction SL(2, ℂ) ℍ³ where
  smul := mobius
  one_smul := one_smul'
  mul_smul := mul_smul'

/-- The point `(w, t)` as the quaternion `re w + (im w) i + t j`. -/
noncomputable def toQuaternion (p : ℍ³) : ℍ[ℝ] :=
  { re := (w p).re, imI := (w p).im, imJ := UpperHalfSpace.height p, imK := 0 }

/-- The complex numbers inside the quaternions, along `1, i`. -/
noncomputable def ofComplex (z : ℂ) : ℍ[ℝ] :=
  { re := z.re, imI := z.im, imJ := 0, imK := 0 }

/-- The quaternionic description `q ↦ (a q + b) (c q + d)⁻¹`. -/
theorem toQuaternion_smul (A : SL(2, ℂ)) (p : ℍ³) :
    toQuaternion (A • p) =
      (ofComplex (A 0 0) * toQuaternion p + ofComplex (A 0 1)) *
        (ofComplex (A 1 0) * toQuaternion p + ofComplex (A 1 1))⁻¹ := by
  sorry

/-- An element of the centre `{±1}` acts trivially, so the action descends to `PSL(2, ℂ)`. -/
theorem smul_eq_of_mem_center {A B : SL(2, ℂ)} (h : A⁻¹ * B ∈ Subgroup.center SL(2, ℂ))
    (p : ℍ³) : A • p = B • p := by
  sorry

noncomputable instance : MulAction PSL(2, ℂ) ℍ³ where
  smul g p := Quotient.liftOn' g (· • p) fun _ _ h ↦
    smul_eq_of_mem_center (QuotientGroup.leftRel_apply.1 h) p
  one_smul := one_smul'
  mul_smul g h p := Quotient.inductionOn₂' g h fun A B ↦ mul_smul' A B p

end UpperHalfSpace

open UpperHalfSpace

instance : SecondCountableTopology ℍ³ :=
  inferInstanceAs (SecondCountableTopology (TauCeti.upperHalfSpaceOpens ℂ))

instance : MeasurableSpace ℍ³ := borel ℍ³

instance : BorelSpace ℍ³ := ⟨rfl⟩

/-- Hyperbolic volume: Tau Ceti's Riemannian volume of the half-space metric, as a
`MeasureSpace` instance so that `volume` names it, as for `UpperHalfPlane` in dimension two. -/
noncomputable instance : MeasureSpace ℍ³ :=
  ⟨riemannianVolume 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³⟩

/-- Hyperbolic distance: Tau Ceti's Riemannian distance of the half-space metric. -/
noncomputable instance : MetricSpace ℍ³ :=
  TauCeti.MetricSpace.ofRiemannianMetric 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³

/-- The volume is Lebesgue measure on the open half-space weighted by `t⁻³`, the analogue of
`UpperHalfPlane.volume_def`. -/
theorem volume_eq_withDensity :
    (volume : Measure ℍ³) =
      ((volume : Measure (ℂ × ℝ)).comap fun p : ℍ³ ↦ (w p, height p)).withDensity
        fun p ↦ ENNReal.ofReal (height p ^ (-3 : ℤ)) := by
  sorry

/-- The closed formula for the distance, the analogue of `UpperHalfPlane.cosh_dist`; the
distance on the right is the Euclidean one of `WithLp 2 (ℂ × ℝ)`. -/
theorem cosh_dist (p q : ℍ³) :
    Real.cosh (dist p q) =
      1 + dist (p : WithLp 2 (ℂ × ℝ)) q ^ 2 / (2 * height p * height q) := by
  sorry

/-- Every element of `PSL(2, ℂ)` acts by an isometry of the distance. -/
theorem isometry_smul (g : PSL(2, ℂ)) : Isometry fun p : ℍ³ ↦ g • p := by
  sorry

/-- The action is an injective homomorphism to the Riemannian isometry group: the `PSL₂(ℂ)`
factor of GeometricTopology §7.1's `Isom(ℍ³) ≅ PSL₂(ℂ) ⋊ ℤ/2`. -/
theorem exists_toIsom :
    ∃ f : PSL(2, ℂ) →* Isom 𝓘(ℝ, WithLp 2 (ℂ × ℝ)) ℍ³,
      Function.Injective f ∧ ∀ (g : PSL(2, ℂ)) (p : ℍ³), f g • p = g • p := by
  sorry

theorem continuousConstSMul : ContinuousConstSMul PSL(2, ℂ) ℍ³ := by
  sorry

/-- Invariance of the volume, the analogue of `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume`. -/
theorem smulInvariantMeasure : SMulInvariantMeasure PSL(2, ℂ) ℍ³ volume := by
  sorry

theorem secondCountableTopology_psl : SecondCountableTopology PSL(2, ℂ) := by
  sorry

/-- The slice `w ∈ ℝ`, carrying the upper half-plane. -/
def ofUpperHalfPlane (z : UpperHalfPlane) : ℍ³ :=
  TauCeti.UpperHalfSpace.mk (WithLp.toLp 2 ((z.re : ℂ), z.im)) z.im_pos

/-- On that slice the distance is Mathlib's `UpperHalfPlane.dist`: this roadmap and
`FuchsianOrbifolds` may not drift apart. -/
theorem dist_ofUpperHalfPlane (z z' : UpperHalfPlane) :
    dist (ofUpperHalfPlane z) (ofUpperHalfPlane z') = dist z z' := by
  sorry

/-! ## Layer 1: discrete groups, fundamental domains and covolume -/

/-- A torsion-free Kleinian group: one acting properly discontinuously and freely, so that the
quotient is a manifold. A *Kleinian group* is a discrete subgroup; this predicate is equivalent
to discrete and torsion free (`isTorsionFreeKleinian_iff_discrete_and_torsionFree`). -/
def IsTorsionFreeKleinian (Γ : Subgroup PSL(2, ℂ)) : Prop :=
  ProperlyDiscontinuousSMul Γ ℍ³ ∧ ∀ p : ℍ³, stabilizer Γ p = ⊥

theorem properlyDiscontinuousSMul_of_discrete (Γ : Subgroup PSL(2, ℂ)) [DiscreteTopology Γ] :
    ProperlyDiscontinuousSMul Γ ℍ³ := by
  sorry

theorem isTorsionFreeKleinian_iff_discrete_and_torsionFree (Γ : Subgroup PSL(2, ℂ)) :
    IsTorsionFreeKleinian Γ ↔ (DiscreteTopology Γ ∧ ∀ g : Γ, g ≠ 1 → ¬ IsOfFinOrder g) := by
  sorry

/-- The fixed-point set of a nontrivial element is empty or a geodesic, hence null. It need not
be countable: `diag(i, -i)` fixes the whole vertical geodesic over `0`. -/
theorem volume_fixedPoints_eq_zero {g : PSL(2, ℂ)} (hg : g ≠ 1) :
    volume {p : ℍ³ | g • p = p} = 0 := by
  sorry

/-- The non-free locus of a countable group is null: the null-set hypothesis of
`exists_isFundamentalDomain_of_properlyDiscontinuousSMul`. -/
theorem volume_compl_freeLocus (Γ : Subgroup PSL(2, ℂ)) [Countable Γ] :
    volume ((freeLocus Γ ℍ³ : Set ℍ³)ᶜ) = 0 := by
  sorry

theorem countable_of_discrete (Γ : Subgroup PSL(2, ℂ)) [DiscreteTopology Γ] : Countable Γ := by
  sorry

/-- A discrete subgroup, torsion allowed, has a measurable fundamental domain. -/
theorem hasFundamentalDomain_of_discrete (Γ : Subgroup PSL(2, ℂ)) [DiscreteTopology Γ] :
    HasFundamentalDomain Γ ℍ³ volume := by
  sorry

/-- Cofiniteness, in the shape of Tau Ceti's Fuchsian `Subgroup.IsCofinite`: discrete, with
finite covolume. Discreteness is a field and not a consequence of the covolume condition,
since a nondiscrete group can have covolume `0`; positivity of the covolume is the theorem
`IsCofinite.covolume_pos` below, not part of the definition. -/
structure IsCofinite (Γ : Subgroup PSL(2, ℂ)) : Prop where
  discreteTopology : DiscreteTopology Γ
  covolume_ne_top : covolume Γ ℍ³ volume ≠ ⊤

/-- A cofinite group has positive covolume, from Tau Ceti's `covolume_pos`. -/
theorem IsCofinite.covolume_pos {Γ : Subgroup PSL(2, ℂ)} (hΓ : IsCofinite Γ) :
    0 < covolume Γ ℍ³ volume := by
  sorry

/-! ## Layer 2: Dirichlet domains -/

/-- The Dirichlet domain of `Γ` centred at `p₀`: the points at least as close to `p₀` as to every
point of its orbit. -/
def dirichletDomain (Γ : Subgroup PSL(2, ℂ)) (p₀ : ℍ³) : Set ℍ³ :=
  {p | ∀ g : Γ, dist p p₀ ≤ dist p ((g : PSL(2, ℂ)) • p₀)}

/-- At a centre with trivial stabilizer, the Dirichlet domain of a discrete group is a
fundamental domain. -/
theorem isFundamentalDomain_dirichletDomain (Γ : Subgroup PSL(2, ℂ)) [DiscreteTopology Γ]
    {p₀ : ℍ³} (hp₀ : p₀ ∈ (freeLocus Γ ℍ³ : Set ℍ³)) :
    IsFundamentalDomain Γ (dirichletDomain Γ p₀) volume := by
  sorry

/-! ## Layer 3: Bianchi groups -/

/-- The Bianchi group `PSL(2, 𝓞 F)`: the image in `PSL(2, ℂ)` of `SL(2, 𝓞 F)` under the
embedding `ι`. The definition makes sense for every number field; the theorems below assume
that `F` is imaginary quadratic. It does not depend on `ι` (`bianchi_comp_algEquiv`). -/
noncomputable def bianchi (F : Type*) [Field F] [NumberField F] (ι : F →+* ℂ) :
    Subgroup PSL(2, ℂ) :=
  ((QuotientGroup.mk' (Subgroup.center SL(2, ℂ))).comp
    (SpecialLinearGroup.map (ι.comp (algebraMap (𝓞 F) F)))).range

/-- The principal congruence subgroup of level `I`: the image in `PSL(2, ℂ)` of the kernel of
reduction `SL(2, 𝓞 F) → SL(2, 𝓞 F ⧸ I)`. This is not the kernel of reduction to Mathlib's
`PSL(2, 𝓞 F ⧸ I)`, which quotients by the full centre; the two differ for `ℤ[i]` at `I = (5)`. -/
noncomputable def bianchiGamma (F : Type*) [Field F] [NumberField F] (ι : F →+* ℂ)
    (I : Ideal (𝓞 F)) : Subgroup PSL(2, ℂ) :=
  (SpecialLinearGroup.map (Ideal.Quotient.mk I)).ker.map
    ((QuotientGroup.mk' (Subgroup.center SL(2, ℂ))).comp
      (SpecialLinearGroup.map (ι.comp (algebraMap (𝓞 F) F))))

/-- The full Bianchi group does not depend on the embedding. -/
theorem bianchi_comp_algEquiv (F : Type*) [Field F] [NumberField F] (ι : F →+* ℂ)
    (σ : F ≃ₐ[ℚ] F) : bianchi F (ι.comp σ.toAlgHom.toRingHom) = bianchi F ι := by
  sorry

/-- A congruence subgroup of fixed level does: changing the embedding transports the level. -/
theorem bianchiGamma_comp_algEquiv (F : Type*) [Field F] [NumberField F] (ι : F →+* ℂ)
    (σ : F ≃ₐ[ℚ] F) (I : Ideal (𝓞 F)) :
    bianchiGamma F (ι.comp σ.toAlgHom.toRingHom) I =
      bianchiGamma F ι (I.map (RingOfIntegers.mapRingEquiv σ.toRingEquiv)) := by
  sorry

/-- Discreteness, the imaginary-quadratic case of AdelicAlgebraicGroups AA.3.4 through the
adapter described in the README. -/
theorem isDiscrete_bianchi (F : Type*) [Field F] [NumberField F] [IsTotallyComplex F]
    (hF : Module.finrank ℚ F = 2) (ι : F →+* ℂ) : DiscreteTopology (bianchi F ι) := by
  sorry

/-- Torsion-freeness of principal congruence subgroups: an element of finite order has trace in
`{-1, 0, 1}`, and trace `≡ 2 mod I` puts `3`, `2` or `1` in `I`. -/
theorem isTorsionFreeKleinian_bianchiGamma (F : Type*) [Field F] [NumberField F]
    [IsTotallyComplex F] (hF : Module.finrank ℚ F = 2) (ι : F →+* ℂ) (I : Ideal (𝓞 F))
    (h2 : (2 : 𝓞 F) ∉ I) (h3 : (3 : 𝓞 F) ∉ I) :
    IsTorsionFreeKleinian (bianchiGamma F ι I) := by
  sorry

/-- `ℚ(i)`, as the fourth cyclotomic field. -/
abbrev GaussianField : Type := CyclotomicField 4 ℚ

/-- `ℚ(ω)`, as the third cyclotomic field. -/
abbrev EisensteinField : Type := CyclotomicField 3 ℚ

/-- Not found by instance search: `CyclotomicField 4 ℚ` carries its algebra structure through a
different path from the one `IsCyclotomicExtension.zeta_spec` asks for, so `gaussianI` does not
elaborate without it. -/
instance : IsCyclotomicExtension {4} ℚ GaussianField :=
  CyclotomicField.isCyclotomicExtension 4 ℚ

/-- Needed by `eisensteinOmega`, for the same reason. -/
instance : IsCyclotomicExtension {3} ℚ EisensteinField :=
  CyclotomicField.isCyclotomicExtension 3 ℚ

/-- The embedding of `ℚ(i)` in `ℂ` used for the named groups. -/
noncomputable def gaussianEmbedding : GaussianField →+* ℂ :=
  (IsAlgClosed.lift : GaussianField →ₐ[ℚ] ℂ).toRingHom

/-- The embedding of `ℚ(ω)` in `ℂ` used for the named groups. -/
noncomputable def eisensteinEmbedding : EisensteinField →+* ℂ :=
  (IsAlgClosed.lift : EisensteinField →ₐ[ℚ] ℂ).toRingHom

/-- `i`, the integral primitive fourth root of unity. -/
noncomputable def gaussianI : 𝓞 GaussianField :=
  (IsCyclotomicExtension.zeta_spec 4 ℚ GaussianField).toInteger

/-- `ω`, the integral primitive cube root of unity. -/
noncomputable def eisensteinOmega : 𝓞 EisensteinField :=
  (IsCyclotomicExtension.zeta_spec 3 ℚ EisensteinField).toInteger

/-- The Gaussian Bianchi group `PSL(2, ℤ[i])`. -/
noncomputable def bianchiGaussian : Subgroup PSL(2, ℂ) :=
  bianchi GaussianField gaussianEmbedding

/-- The Eisenstein Bianchi group `PSL(2, ℤ[ω])`. -/
noncomputable def bianchiEisenstein : Subgroup PSL(2, ℂ) :=
  bianchi EisensteinField eisensteinEmbedding

/-- The congruence subgroup `Γ(2 + i)` of `PSL(2, ℤ[i])`, at an ideal of norm `5`. -/
noncomputable def gammaGaussian : Subgroup PSL(2, ℂ) :=
  bianchiGamma GaussianField gaussianEmbedding (Ideal.span {2 + gaussianI})

/-- The congruence subgroup `Γ(3 + ω)` of `PSL(2, ℤ[ω])`, at an ideal of norm `7`. -/
noncomputable def gammaEisenstein : Subgroup PSL(2, ℂ) :=
  bianchiGamma EisensteinField eisensteinEmbedding (Ideal.span {3 + eisensteinOmega})

/-- `[PSL(2, ℤ[i]) : Γ(2 + i)] = 60`, the order of `PSL(2, 𝔽₅)`: reduction is onto
`SL(2, 𝔽₅)`, of order `120`, and `-1` is not in the kernel. -/
theorem index_gammaGaussian : gammaGaussian.relIndex bianchiGaussian = 60 := by
  sorry

/-- `[PSL(2, ℤ[ω]) : Γ(3 + ω)] = 168`, the order of `PSL(2, 𝔽₇)`. -/
theorem index_gammaEisenstein : gammaEisenstein.relIndex bianchiEisenstein = 168 := by
  sorry

/-! ### 3.5 The Bianchi domains -/

/-- The Bianchi domain of `PSL(2, ℤ[i])`: above the unit sphere, over the half-square
`|x| ≤ 1/2`, `0 ≤ y ≤ 1/2`. -/
def gaussianDomain : Set ℍ³ :=
  {p | |(w p).re| ≤ 1 / 2 ∧ 0 ≤ (w p).im ∧ (w p).im ≤ 1 / 2 ∧
    1 ≤ Complex.normSq (w p) + height p ^ 2}

/-- The Bianchi domain of `PSL(2, ℤ[ω])`: above the unit sphere, over the rhombus
`0 ≤ x ≤ 1/2`, `0 ≤ x + √3 y ≤ 1`. -/
def eisensteinDomain : Set ℍ³ :=
  {p | 0 ≤ (w p).re ∧ (w p).re ≤ 1 / 2 ∧ 0 ≤ (w p).re + √3 * (w p).im ∧
    (w p).re + √3 * (w p).im ≤ 1 ∧ 1 ≤ Complex.normSq (w p) + height p ^ 2}

theorem isFundamentalDomain_gaussianDomain :
    IsFundamentalDomain bianchiGaussian gaussianDomain volume := by
  sorry

theorem isFundamentalDomain_eisensteinDomain :
    IsFundamentalDomain bianchiEisenstein eisensteinDomain volume := by
  sorry

/-! ## Layer 4: covolumes, special values and Humbert's formula -/

/-- Catalan's constant. Mathlib has no name for it — its `catalan` is the Catalan *numbers*
`ℕ → ℕ` — so this roadmap introduces `catalanConstant`; identifying it with
`DirichletCharacter.LFunction` at the character mod `4` and `s = 2` is a target of layer 4. -/
noncomputable def catalanConstant : ℝ := ∑' n : ℕ, (-1) ^ n / ((2 * n + 1 : ℝ) ^ 2)

/-- `L(2, χ₋₃)`, written out for the same reason. -/
noncomputable def lchi3 : ℝ :=
  ∑' n : ℕ, (1 / ((3 * n + 1 : ℝ) ^ 2) - 1 / ((3 * n + 2 : ℝ) ^ 2))

/-- `∫₀^{π/4} log (2 sin u) du = -G/2`, from `Im Li₂(i) = G` (PolylogarithmFunctions). -/
theorem integral_log_two_sin_pi_div_four :
    ∫ u in (0 : ℝ)..Real.pi / 4, Real.log (2 * Real.sin u) = -(catalanConstant / 2) := by
  sorry

/-- `∫₀^{π/3} log (2 sin u) du = -√3 L(2, χ₋₃) / 4`. -/
theorem integral_log_two_sin_pi_div_three :
    ∫ u in (0 : ℝ)..Real.pi / 3, Real.log (2 * Real.sin u) = -(√3 * lchi3 / 4) := by
  sorry

/-- `∫₀^{π/6} log (2 sin u) du = -3√3 L(2, χ₋₃) / 8`. -/
theorem integral_log_two_sin_pi_div_six :
    ∫ u in (0 : ℝ)..Real.pi / 6, Real.log (2 * Real.sin u) = -(3 * √3 * lchi3 / 8) := by
  sorry

/-- `-(2/3) I(π/4)`, with `I(θ) = ∫₀^θ log (2 sin u) du`, by integration over the domain. -/
theorem volume_gaussianDomain : volume gaussianDomain = ENNReal.ofReal (catalanConstant / 3) := by
  sorry

/-- `I(π/6) - 2 I(π/3)`, by integration over the domain. -/
theorem volume_eisensteinDomain :
    volume eisensteinDomain = ENNReal.ofReal (√3 * lchi3 / 8) := by
  sorry

/-- The covolume of `PSL(2, ℤ[i])` is Catalan's constant over three, by integration over
`gaussianDomain`. This is Humbert's formula at `d_F = -4`, proved from the domain, not from the
general formula. -/
theorem covolume_bianchiGaussian :
    (covolume bianchiGaussian ℍ³ volume).toReal = catalanConstant / 3 := by
  sorry

/-- The covolume of `PSL(2, ℤ[ω])` is `√3 · L(2, χ₋₃) / 8`, by integration over
`eisensteinDomain`. This is Humbert's formula at `d_F = -3`. -/
theorem covolume_bianchiEisenstein :
    (covolume bianchiEisenstein ℍ³ volume).toReal = √3 * lchi3 / 8 := by
  sorry

/-- The volume of the manifold `Γ(2 + i) \ ℍ³`: `60` times `catalanConstant / 3`, by the index
law. -/
theorem covolume_gammaGaussian :
    (covolume gammaGaussian ℍ³ volume).toReal = 20 * catalanConstant := by
  sorry

/-- The volume of the manifold `Γ(3 + ω) \ ℍ³`: `168` times `√3 · L(2, χ₋₃) / 8`. -/
theorem covolume_gammaEisenstein :
    (covolume gammaEisenstein ℍ³ volume).toReal = 21 * √3 * lchi3 := by
  sorry

/-- From Tau Ceti's `dedekindZeta_eq_riemannZeta_mul_LFunction` at `s = 2` and `d_F = -4`. -/
theorem zeta_gaussian_two :
    dedekindZeta GaussianField 2 = riemannZeta 2 * (catalanConstant : ℂ) := by
  sorry

/-- From Tau Ceti's `dedekindZeta_eq_riemannZeta_mul_LFunction` at `s = 2` and `d_F = -3`. -/
theorem zeta_eisenstein_two :
    dedekindZeta EisensteinField 2 = riemannZeta 2 * (lchi3 : ℂ) := by
  sorry

/-- **Humbert's formula**, by the Tamagawa number of `SL₂`, with the archimedean constant fixed
by `covolume_bianchiGaussian`. -/
theorem covolume_bianchi (F : Type*) [Field F] [NumberField F] [IsTotallyComplex F]
    (hF : Module.finrank ℚ F = 2) (ι : F →+* ℂ) :
    (covolume (bianchi F ι) ℍ³ volume).toReal =
      |(discr F : ℝ)| ^ ((3 : ℝ) / 2) * (dedekindZeta F 2).re / (4 * Real.pi ^ 2) := by
  sorry

/-! ## Layer 5: the set of volumes, and Thurston's question -/

/-- The volumes of finite-volume hyperbolic `3`-manifolds: `v` is one when some torsion-free
Kleinian cofinite subgroup of `PSL(2, ℂ)` has real covolume `v`. The witness is the group, so
membership carries it, and `0` is excluded by `IsCofinite.covolume_pos`. -/
def hyperbolicVolumes : Set ℝ :=
  {v | ∃ Γ : Subgroup PSL(2, ℂ),
    IsTorsionFreeKleinian Γ ∧ IsCofinite Γ ∧ (covolume Γ ℍ³ volume).toReal = v}

/-- The volume of the manifold `Γ(2 + i) \ ℍ³` is a hyperbolic volume; the Bianchi covolume
`catalanConstant / 3` itself is not, being an orbifold volume below the
minimum volumes of Milley (closed) and Cao–Meyerhoff (cusped). -/
theorem twenty_catalan_mem_hyperbolicVolumes : 20 * catalanConstant ∈ hyperbolicVolumes := by
  sorry

theorem eisenstein_mem_hyperbolicVolumes : 21 * √3 * lchi3 ∈ hyperbolicVolumes := by
  sorry

/-- Closure under the degree of a finite cover, which is what the index law gives: a
finite-index subgroup of a witness is a witness, with the index times the covolume. Closure
under every positive integer is not a target; it would need an index-`n` subgroup of a witness
for every `n`. -/
theorem mul_index_mem_hyperbolicVolumes {Γ Δ : Subgroup PSL(2, ℂ)}
    (hΓ : IsTorsionFreeKleinian Γ) (hΓ' : IsCofinite Γ) (h : Δ ≤ Γ) (hn : Δ.relIndex Γ ≠ 0) :
    (Δ.relIndex Γ : ℝ) * (covolume Γ ℍ³ volume).toReal ∈ hyperbolicVolumes := by
  sorry

/-- Commensurable cofinite groups have rationally related covolumes, by the index law. This is
one source of rational relations between volumes, not the only one: incommensurable manifolds
of equal volume exist. -/
theorem rat_ratio_of_commensurable {Γ Δ : Subgroup PSL(2, ℂ)} (h : Subgroup.Commensurable Γ Δ)
    (hΓ : IsCofinite Γ) (hΔ : IsCofinite Δ) :
    ∃ q : ℚ, 0 < q ∧ (covolume Γ ℍ³ volume).toReal = q * (covolume Δ ℍ³ volume).toReal := by
  sorry

/-- **Thurston's question 23**, a statement and not a theorem: the volumes are not all
rationally related. This roadmap delivers the statement; the mathematics is open. -/
def ThurstonQuestion23 : Prop :=
  ∃ v ∈ hyperbolicVolumes, ∃ w ∈ hyperbolicVolumes, ∀ q : ℚ, v ≠ (q : ℝ) * w

end

end TauCetiRoadmap.KleinianGroups
