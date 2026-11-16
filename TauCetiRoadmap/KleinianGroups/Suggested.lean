import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Distance
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.UpperHalfSpace.Metric
import TauCeti.Geometry.Manifold.Riemannian.Isometry.UpperHalfSpace
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
import TauCeti.MeasureTheory.Group.FundamentalDomain
import TauCeti.Topology.Algebra.GroupAction.FreeLocus
import TauCeti.Topology.Algebra.Matrix.ProjectiveSpecialLinearGroup

/-!
# Kleinian groups and arithmetic volume: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations pin the Moebius action of `PSL(2, ℂ)` on Tau Ceti's upper
half-space model `TauCeti.UpperHalfSpace ℂ`, written `ℍ³`, its measure and distance, the
Kleinian predicate, covolume, the Bianchi groups and their congruence subgroups, the explicit
fundamental domains, the two Bianchi covolumes, and the shape of Thurston's question. Humbert's
general formula is a roadmap-for-a-roadmap in the markdown, not a target, so it has no
declaration here.

Every definition has a real body. The action is the coordinate formula; its group laws are the
theorems `one_smul'` and `mul_smul'`, which the `MulAction` instance cites. The measure and the
distance are Tau Ceti's Riemannian volume and Riemannian distance of the half-space metric. The
Bianchi groups are images of `SL(2, 𝓞 F)` in `PSL(2, ℂ)`, and their congruence subgroups are
images of kernels of reduction. The `Prop`-valued classes that the README asks for as instances
(`ContinuousConstSMul`, `MeasurableConstSMul`, `SMulInvariantMeasure`, second countability of
`PSL(2, ℂ)`) are stated here as theorems, so that no instance has a `sorry` body.

The Dirichlet domains, the homomorphism to `TauCeti.Isom`, the comparison with
`TauCeti.ModelGeometry.hyperbolic`, the Lobachevsky function, the zeta factorizations and the
quotient manifold of layer 5 are specified in the markdown rather than represented here.
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

/-- The Moebius transformation of `A = (a b; c d)` in coordinates:
`(w, t) ↦ (((a w + b) conj (c w + d) + a conj c t²) / J, t / J)`. This is the definition of the
action; its quaternionic description is the theorem `toQuaternion_smul`. -/
noncomputable def mobius (A : SL(2, ℂ)) (p : ℍ³) : ℍ³ :=
  TauCeti.UpperHalfSpace.mk
    (WithLp.toLp 2
      (((A 0 0 * w p + A 0 1) * conj (A 1 0 * w p + A 1 1) +
          A 0 0 * conj (A 1 0) * ((UpperHalfSpace.height p ^ 2 : ℝ) : ℂ)) / (denom A p : ℂ),
        UpperHalfSpace.height p / denom A p))
    (div_pos (UpperHalfSpace.height_pos p) (denom_pos A p))

theorem one_smul' (p : ℍ³) : mobius 1 p = p := by
  sorry

/-- The composition law, proved through `toQuaternion_smul` and associativity in `ℍ[ℝ]` rather
than from the coordinate formula. -/
theorem mul_smul' (A B : SL(2, ℂ)) (p : ℍ³) : mobius (A * B) p = mobius A (mobius B p) := by
  sorry

noncomputable instance : MulAction SL(2, ℂ) ℍ³ where
  smul := mobius
  one_smul := one_smul'
  mul_smul := mul_smul'

/-- The coordinate formula. -/
theorem smul_def (A : SL(2, ℂ)) (p : ℍ³) : A • p = mobius A p :=
  rfl

/-- The point `(w, t)` as the quaternion `re w + (im w) i + t j`. -/
noncomputable def toQuaternion (p : ℍ³) : ℍ[ℝ] :=
  { re := (w p).re, imI := (w p).im, imJ := UpperHalfSpace.height p, imK := 0 }

/-- The complex numbers inside the quaternions, along `1, i`. -/
noncomputable def ofComplex (z : ℂ) : ℍ[ℝ] :=
  { re := z.re, imI := z.im, imJ := 0, imK := 0 }

/-- The quaternionic description `q ↦ (a q + b) (c q + d)⁻¹`, from which the group law
follows. -/
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

/-- The projective action on representatives. -/
theorem mk_smul (A : SL(2, ℂ)) (p : ℍ³) : (QuotientGroup.mk A : PSL(2, ℂ)) • p = A • p :=
  rfl

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

/-- Every element of `PSL(2, ℂ)` acts by an isometry; the README's `toIsom` packages these as a
homomorphism to `TauCeti.Isom`. -/
theorem isometry_smul (g : PSL(2, ℂ)) : Isometry fun p : ℍ³ ↦ g • p := by
  sorry

theorem continuousConstSMul : ContinuousConstSMul PSL(2, ℂ) ℍ³ := by
  sorry

theorem measurableConstSMul : MeasurableConstSMul PSL(2, ℂ) ℍ³ := by
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

/-! ## Layer 1: Kleinian groups and covolume -/

/-- A Kleinian action: free and properly discontinuous, so that the quotient is a manifold.
It is by isometries because every element of `PSL(2, ℂ)` is one (`isometry_smul`), so that
is not a condition. Discreteness and torsion freeness are consequences. -/
def IsKleinian (Γ : Subgroup PSL(2, ℂ)) : Prop :=
  ProperlyDiscontinuousSMul Γ ℍ³ ∧ ∀ p : ℍ³, stabilizer Γ p = ⊥

theorem properlyDiscontinuousSMul_of_discrete (Γ : Subgroup PSL(2, ℂ)) [DiscreteTopology Γ] :
    ProperlyDiscontinuousSMul Γ ℍ³ := by
  sorry

theorem isKleinian_iff_discrete_and_torsionFree (Γ : Subgroup PSL(2, ℂ)) :
    IsKleinian Γ ↔ (DiscreteTopology Γ ∧ ∀ g : Γ, g ≠ 1 → ¬ IsOfFinOrder g) := by
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

/-- The index law, Tau Ceti's `covolume_eq_card_mul_covolume` specialized to `ℍ³` and not a
second proof of it, with that theorem's orientation and hypotheses: the index `[Γ : Δ]` is
`ENat.card (Γ ⧸ Δ.subgroupOf Γ)`, so that infinite index gives `⊤` rather than the
zero-totalized `Subgroup.index`, and `Γ` is countable with a fundamental domain. A discrete
subgroup satisfies both, by `countable_of_discrete` and `hasFundamentalDomain_of_discrete`; a
Bianchi group satisfies both through its explicit domain, without discreteness. -/
theorem covolume_eq_index_mul_covolume {Γ Δ : Subgroup PSL(2, ℂ)} [Countable Γ]
    [HasFundamentalDomain Γ ℍ³ volume] (h : Δ ≤ Γ) :
    covolume Δ ℍ³ volume = ENat.card (Γ ⧸ Δ.subgroupOf Γ) * covolume Γ ℍ³ volume := by
  sorry

/-- Cofiniteness, in the shape of Tau Ceti's Fuchsian `Subgroup.IsCofinite`: discrete, with
finite covolume. Discreteness is a field and not a consequence of the covolume condition,
since a nondiscrete group can have covolume `0`; positivity of the covolume is the theorem
`IsCofinite.covolume_pos` below, not part of the definition. -/
structure IsCofinite (Γ : Subgroup PSL(2, ℂ)) : Prop where
  discreteTopology : DiscreteTopology Γ
  covolume_ne_top : covolume Γ ℍ³ volume ≠ ⊤

/-- The criterion in the shape of `Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`. -/
theorem isCofinite_iff_covolume_ne_top {Γ : Subgroup PSL(2, ℂ)} [DiscreteTopology Γ] :
    IsCofinite Γ ↔ covolume Γ ℍ³ volume ≠ ⊤ :=
  ⟨IsCofinite.covolume_ne_top, fun h ↦ ⟨inferInstance, h⟩⟩

/-- A cofinite group has positive covolume, from Tau Ceti's `covolume_pos`. -/
theorem IsCofinite.covolume_pos {Γ : Subgroup PSL(2, ℂ)} (hΓ : IsCofinite Γ) :
    0 < covolume Γ ℍ³ volume := by
  sorry

/-! ## Layer 3: Bianchi groups

The definitions of layer 3 come before the explicit domains of layer 2, which are stated for
them. -/

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

/-- `ℚ(i)`, as the fourth cyclotomic field. -/
abbrev GaussianField : Type := CyclotomicField 4 ℚ

/-- `ℚ(ω)`, as the third cyclotomic field. -/
abbrev EisensteinField : Type := CyclotomicField 3 ℚ

instance : IsCyclotomicExtension {4} ℚ GaussianField :=
  CyclotomicField.isCyclotomicExtension 4 ℚ

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

/-- `Γ(2 + i)` is torsion free, so its quotient is a manifold. -/
theorem isKleinian_gammaGaussian : IsKleinian gammaGaussian := by
  sorry

/-- `Γ(3 + ω)` is torsion free, so its quotient is a manifold. -/
theorem isKleinian_gammaEisenstein : IsKleinian gammaEisenstein := by
  sorry

/-! ## Layer 2: the explicit fundamental domains -/

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

/-! ## Layer 4: the two Bianchi covolumes and their special values -/

/-- Catalan's constant. Mathlib has no name for it — its `catalan` is the Catalan *numbers*
`ℕ → ℕ` — so this roadmap introduces `catalanConstant`; identifying it with
`DirichletCharacter.LFunction` at the character mod `4` and `s = 2` is a target of layer 4. -/
noncomputable def catalanConstant : ℝ := ∑' n : ℕ, (-1) ^ n / ((2 * n + 1 : ℝ) ^ 2)

/-- `L(2, χ₋₃)`, written out for the same reason. -/
noncomputable def lchi3 : ℝ :=
  ∑' n : ℕ, (1 / ((3 * n + 1 : ℝ) ^ 2) - 1 / ((3 * n + 2 : ℝ) ^ 2))

/-- The Lobachevsky function `Л(θ) = -∫₀^θ log |2 sin u| du`. -/
noncomputable def lobachevsky (θ : ℝ) : ℝ :=
  -∫ u in (0 : ℝ)..θ, Real.log |2 * Real.sin u|

theorem lobachevsky_pi_div_four : lobachevsky (Real.pi / 4) = catalanConstant / 2 := by
  sorry

theorem lobachevsky_pi_div_three : lobachevsky (Real.pi / 3) = √3 * lchi3 / 4 := by
  sorry

/-- `(2/3) Л(π/4)`, by integration over the domain. -/
theorem volume_gaussianDomain : volume gaussianDomain = ENNReal.ofReal (catalanConstant / 3) := by
  sorry

/-- `2 Л(π/3) - Л(π/6) = Л(π/3) / 2`, by integration over the domain. -/
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

/-! ## Layer 5: the set of volumes, and Thurston's question -/

/-- The volumes of finite-volume hyperbolic `3`-manifolds: `v` is one when some Kleinian
cofinite subgroup of `PSL(2, ℂ)` has real covolume `v`. The witness is the group, so
membership carries it, and `0` is excluded by `IsCofinite.covolume_pos`. -/
def hyperbolicVolumes : Set ℝ :=
  {v | ∃ Γ : Subgroup PSL(2, ℂ),
    IsKleinian Γ ∧ IsCofinite Γ ∧ (covolume Γ ℍ³ volume).toReal = v}

/-- Nonempty, witnessed by `Γ(2 + i)`. -/
theorem hyperbolicVolumes_nonempty : hyperbolicVolumes.Nonempty := by
  sorry

/-- The volume of the manifold `Γ(2 + i) \ ℍ³` is a hyperbolic volume; the Bianchi covolume
`catalanConstant / 3` itself is not, being an orbifold volume below Milley's bound. -/
theorem twenty_catalan_mem_hyperbolicVolumes : 20 * catalanConstant ∈ hyperbolicVolumes := by
  sorry

theorem eisenstein_mem_hyperbolicVolumes : 21 * √3 * lchi3 ∈ hyperbolicVolumes := by
  sorry

/-- Closure under the degree of a finite cover, which is what the index law gives: a
finite-index subgroup of a Kleinian cofinite group is Kleinian and cofinite, with the index
times the covolume. Closure under every positive integer is not claimed; it would need an
index-`n` subgroup of a witness for every `n`. -/
theorem mul_index_mem_hyperbolicVolumes {Γ Δ : Subgroup PSL(2, ℂ)} (hΓ : IsKleinian Γ)
    (hΓ' : IsCofinite Γ) (h : Δ ≤ Γ) (hn : Δ.relIndex Γ ≠ 0) :
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

/-- The finite approximation of layer 5, for a denominator bound `N`: no rational with
denominator below `N` is the ratio of the two manifold volumes. This predicate for every `N`
is `ThurstonQuestion23` itself for this pair, since a rational `q` is excluded by any
`N > q.den`, so the target is the one explicit bound below and nothing quantifies over `N`. -/
def NoSmallRationalRatio (N : ℕ) : Prop :=
  ∀ q : ℚ, q.den < N → 20 * catalanConstant ≠ (q : ℝ) * (21 * √3 * lchi3)

/-- The explicit bound: with `N = 2000` terms of each series and their tail bounds, the ratio
lies strictly between the Farey neighbours `78/121` and `595/923`, so every rational equal to it
has denominator at least `1044`. -/
theorem noSmallRationalRatio_thousand : NoSmallRationalRatio 1000 := by
  sorry

end

end TauCetiRoadmap.KleinianGroups
