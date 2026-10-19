import Mathlib

/-!
# HodgeTateAndCanonicalSubgroups: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It fixes the compact-open
level order, distinguishes the weak, strong and geometric canonical-subgroup ranges,
and records the left coordinate action and its automorphy factor. The log-adic carriers and Kummer site come from PrismaticCohomologyPartIV §8.60;
the Kummer-condition aliases are local API compatible with that site. AutomorphicBundles
B3.log.1–3 supplies the smooth proper strict-normal-crossings sites, periods and de Rham
unipotent tensor comparison over finite p-adic fields; Layers 6–7 extend them with
explicit common-range identifications.
Quantitative guards below use rational heights; the geometric statements use real
rank-one valuations with v(p) = 1 and positive levels.
Finite flat point groups, their postcomposition action and the DVR-based `GaloisModel`
interface are supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.24a.
The character maps and finite Tate-module levels use these supplied points; their
geometric interfaces remain README targets.
-/

namespace TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

noncomputable section

universe u v

namespace HodgeTate

/-! ## Layer 2: Compact open level indices

The p-level tower `ShimuraTower.pLevel` is indexed by the compact open subgroups of
G(ℚ_p), ordered by inclusion. The index poset and its cofilteredness are statable at
the pins; the tower, its action and its limit diamond are README targets. A level is a
Mathlib `OpenSubgroup` that is compact, so the order is the one of `OpenSubgroup`.
The complex-point uniformization `ShimuraTower.points_eq_doubleCoset` uses a field
isomorphism σ : C ≅ ℂ satisfying σ ∘ ι = ι_∞ for the distinguished reflex-field
embedding ι_∞ : E → ℂ. Such an isomorphism exists when C has continuum cardinality. -/

/-- Compact open subgroups of a topological group, the index of the p-level tower: the
compact members of Mathlib's `OpenSubgroup G`. -/
def CompactOpenSubgroup (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  {K : OpenSubgroup G // IsCompact (K : Set G)}

namespace CompactOpenSubgroup

variable {G : Type u} [Group G] [TopologicalSpace G]

instance : PartialOrder (CompactOpenSubgroup G) :=
  inferInstanceAs (PartialOrder {K : OpenSubgroup G // IsCompact (K : Set G)})

/-- The compact open level poset of README §2.1 is cofiltered. -/
theorem isCofiltered [IsTopologicalGroup G] [T2Space G] [Nonempty (CompactOpenSubgroup G)] :
    CategoryTheory.IsCofiltered (CompactOpenSubgroup G) := by
  sorry

/-- Every subgroup of a finite discrete group occurs among the compact open levels. -/
example [Finite G] [DiscreteTopology G] (H : Subgroup G) :
    ∃ K : CompactOpenSubgroup G, K.1.toSubgroup = H := by
  exact ⟨⟨⟨H, isOpen_discrete _⟩, (Set.toFinite _).isCompact⟩, rfl⟩

/-- The additive real line has no compact open subgroup. -/
example : IsEmpty (CompactOpenSubgroup (Multiplicative ℝ)) := by
  refine ⟨fun K => ?_⟩
  let : PreconnectedSpace (Multiplicative ℝ) := (inferInstance : PreconnectedSpace ℝ)
  have hu := K.1.isClopen.eq_univ ⟨1, K.1.one_mem⟩
  exact noncompact_univ ℝ (show IsCompact (Set.univ : Set ℝ) from hu ▸ K.2)

end CompactOpenSubgroup

/-! ## Layer 3: Canonical-subgroup inequalities

With v(p) = 1, the Hasse height of a point is w = min(v(Ha), 1). The weak and strong
canonical conditions at level n are S_n·w < 1/2 and p^n·w < 1/2, with
S_n = (p^n − 1)/(p − 1); the BHW position range is w < 1/(c_p p^{n−1}) with
c_p = 2 for p ≥ 5 and c_p = 3 for p = 3 (strict, as in Fargues's theorem), and
w ≤ 1/(4·2^{n−1}) for p = 2 (inclusive, the all-prime range). The weak and strong
inequalities are those of CohomologyComparisons §6.2's shared `smallHasseCanonicalSubgroups`
package for cyclotomic-base abelian families, used as `TauCeti.HodgeTate.canonicalSubgroup`
in README §§3.4, 3.6–3.8. Its point criterion is inclusion for complete flat test
algebras and equality for those integrally closed in their localization at p.
The additional pointwise HN subgroup agrees on the overlap by Frobenius-congruent
uniqueness. These numerical guards also retain the wider pointwise ranges of Layers 3
and 4; the degree formula and integral Hodge–Tate estimates are README targets. -/

/-- The truncated Hasse valuation min(v(Ha), 1) (Layer 3). -/
def hasseValuation {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) (Ha : O) : ℝ :=
  min ((v Ha).untopD 1) 1

/-- For p ≥ 2, S_n = 1 + p + ⋯ + p^{n−1} = (p^n − 1)/(p − 1). -/
def canonicalSum (p n : ℕ) : ℚ := ((p : ℚ) ^ n - 1) / ((p : ℚ) - 1)

/-- The weak inequality S_n·w < 1/2 of the shared family subgroup (CohomologyComparisons §6.2). -/
def WeakCanonicalRange (p n : ℕ) (w : ℚ) : Prop := canonicalSum p n * w < 1 / 2

/-- The strong sufficient inequality p^n·w < 1/2 of the same family subgroup. -/
def StrongCanonicalRange (p n : ℕ) (w : ℚ) : Prop := (p : ℚ) ^ n * w < 1 / 2

/-- The BHW constant c_p: 4 for p = 2, 3 for p = 3, 2 for p ≥ 5. -/
def bhwConstant (p : ℕ) : ℕ := if p = 2 then 4 else if p = 3 then 3 else 2

/-- The BHW geometric position range of Layer 4: w ≤ 1/(4·2^{n−1}) for p = 2, and the strict
range w < 1/(c_p p^{n−1}) for p ≥ 3. -/
def BHWPositionRange (p n : ℕ) (w : ℚ) : Prop :=
  if p = 2 then w ≤ 1 / ((bhwConstant p : ℚ) * (p : ℚ) ^ (n - 1))
  else w < 1 / ((bhwConstant p : ℚ) * (p : ℚ) ^ (n - 1))

/-- The strong condition of README §3.4 implies the weak one for nonnegative heights,
since S_n ≤ p^n. -/
theorem weakCanonicalRange_of_strong {p n : ℕ} (hp : 2 ≤ p) {w : ℚ} (hw : 0 ≤ w)
    (h : StrongCanonicalRange p n w) : WeakCanonicalRange p n w := by
  sorry

/-! ## Layer 4: Affine coordinate action and automorphy factor

The Hodge–Tate coordinate z of Layer 4 transforms by the left
fractional-linear action z ↦ (az + b)/(cz + d) on its invertible-denominator domain, and
j(γ, z) = cz + d is the factor of the AIP comparison. For the tower right
translations T, the BHW left action is γ⋅x = T_{γ^∨}(x), with frame αγ^∨;
these algebraic identities use that left action. The algebraic identities are
statable over any field. -/

variable {K : Type u} [Field K]

/-- The factor j(γ, z) = c z + d. -/
def autFactor (γ : GL (Fin 2) K) (z : K) : K :=
  (γ : Matrix (Fin 2) (Fin 2) K) 1 0 * z + (γ : Matrix (Fin 2) (Fin 2) K) 1 1

/-- The fractional-linear action z ↦ (a z + b)/(c z + d). -/
def coordAction (γ : GL (Fin 2) K) (z : K) : K :=
  ((γ : Matrix (Fin 2) (Fin 2) K) 0 0 * z + (γ : Matrix (Fin 2) (Fin 2) K) 0 1) / autFactor γ z

/-- The affine automorphy factor of README §4.4 satisfies
j(γδ, z) = j(γ, δz)·j(δ, z) on its nonzero-denominator domain. -/
theorem autFactor_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0) :
    autFactor (γ * δ) z = autFactor γ (coordAction δ z) * autFactor δ z := by
  sorry

/-- The coordinate action of README §4.4 agrees with Mathlib's action of `GL (Fin 2) K` on
the projective line `OnePoint K` (`OnePoint.smul_some_eq_ite`) where cz + d ≠ 0. -/
theorem coordAction_eq_smul [DecidableEq K] (γ : GL (Fin 2) K) (z : K) (h : autFactor γ z ≠ 0) :
    γ • (z : OnePoint K) = ((coordAction γ z : K) : OnePoint K) := by
  rw [OnePoint.smul_some_eq_ite]
  split_ifs with h'
  · exact absurd h' h
  · rfl

/-- The affine coordinate action of README §4.4 composes as a left action. -/
theorem coordAction_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0)
    (hγδ : autFactor (γ * δ) z ≠ 0) :
    coordAction (γ * δ) z = coordAction γ (coordAction δ z) := by
  sorry

/-- An upper triangular matrix has factor d and coordinate (az+b)/d on its chart. -/
example (γ : GL (Fin 2) K) (a b d z : K)
    (hγ : (γ : Matrix (Fin 2) (Fin 2) K) = !![a, b; 0, d]) (hd : d ≠ 0) :
    autFactor γ z ≠ 0 ∧ coordAction γ z = (a * z + b) / d := by
  simpa [autFactor, coordAction, hγ] using hd

/-- The Weyl element exchanges the finite chart with infinity at its zero denominator. -/
example [DecidableEq K] (γ : GL (Fin 2) K)
    (hγ : (γ : Matrix (Fin 2) (Fin 2) K) = !![0, -1; 1, 0]) :
    (∀ z : K, z ≠ 0 → autFactor γ z ≠ 0 ∧ coordAction γ z = -(1 / z)) ∧
      autFactor γ 0 = 0 ∧ γ • ((0 : K) : OnePoint K) = OnePoint.infty := by
  constructor
  · intro z hz
    simp [autFactor, coordAction, hγ, hz, div_eq_mul_inv]
  · constructor
    · simp [autFactor, hγ]
    · rw [OnePoint.smul_some_eq_ite]
      simp [hγ]

/-! ## Layer 5: AIP congruence exponent

On the Hasse neighbourhood of radius ε the AIP structure group B_m is contained in
𝒪_p^×(1 + p^x Res 𝔾̂_a), where x = m − ε p^m/(p − 1). This is the corrected direction
of BHW (7.1), recorded in 5.8. Membership of cz + d in B_m follows
from the ratio of two lifts in the actual torsor (5.11). The group Γ₀*(p^n) acting
on the infinite-level tower remains profinite for finite n (5.12). -/

/-- x = m − ε p^m/(p − 1). -/
def aipExponent (p m : ℕ) (ε : ℚ) : ℚ := m - ε * (p : ℚ) ^ m / ((p : ℚ) - 1)

end HodgeTate

/-! The definitions and constructions of the README that need group schemes, sheaves of
modules, adic spaces, sites, diamonds or geometric torsors are README targets and are not
declared here:

Layer 0: `TauCeti.HodgeTate.conormal`, `TauCeti.HodgeTate.hodgeTateMap`,
`TauCeti.HodgeTate.pDivisibleHodgeTateMap`, `TauCeti.HodgeTate.farguesDegree`,
`TauCeti.HodgeTate.farguesDivisor`, `TauCeti.HodgeTate.isogenyDivisor`,
`TauCeti.HodgeTate.semiAbelianTorsion`, `TauCeti.HodgeTate.semiAbelianHasse`,
`TauCeti.HodgeTate.harderNarasimhanFiltration`, `TauCeti.HodgeTate.torsionDegree`,
`TauCeti.HodgeTate.coLieComplex`, `TauCeti.HodgeTate.abelianVerschiebung`.
The divisor construction retains rank-one valuation bases. Its additional target
`TauCeti.HodgeTate.farguesDivisor_constantDegree` assumes a normal admissible formal
model locally topologically of finite type over a complete mixed-characteristic DVR:
analytic local constancy of the degree is equivalent to a local equality bD_H = aV(p),
with integers a ≥ 0 and b > 0, detected at special-fibre prime divisors.
Here H is finite locally free commutative of p-power order with perfect rank-zero
co-Lie complex of amplitude [−1,0], regular determinant and étale generic fibre.
Here `TauCeti.HodgeTate.coLieComplex` aliases the co-Lie construction supplied, with
its derived dual, by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.11 and R07.6.6.
README §0.26 supplies the additional finite-flat perfectness, determinants and
abelian-isogeny Hodge triangle. README §0.28 supplies the general-base finite-subgroup
extension of the complete-DVR quotient in that roadmap's R07.1.20a.
Layer 2: `ShimuraTower.pLevel`, `ShimuraTower.points_eq_doubleCoset` (with σ ∘ ι = ι_∞),
`ShimuraTower.translate`, `ShimuraTower.infiniteLevel`,
`TauCeti.HodgeTate.hodgeTateFlagPoint`, `TauCeti.HodgeTate.hodgeTateParabolicReduction`,
`TauCeti.HodgeTate.ExactTensorFiltration`, `TauCeti.HodgeTate.hodgeTateFlagDescent`,
`TauCeti.HodgeTate.openTowerHodgeTateMap` (for neat Hodge-type data with a fixed
symplectic embedding and induced universal abelian family).
The Grassmannian, universal quotient and base change are ModularCurves §0G's shared
finite locally free construction; partial flags are AlgebraicModuliForArithmeticGeometry §1.3's.
Layer 3: `TauCeti.HodgeTate.hasseNeighbourhood`; `TauCeti.HodgeTate.canonicalSubgroup`
is CohomologyComparisons §6.2's shared subgroup on the cyclotomic-base abelian-family
range. The pointwise HN extension, degree formula and integral Hodge–Tate estimates
are the additional targets of README §§3.6–3.9.
Layer 4: `TauCeti.HodgeTate.canonicalLocus`, `TauCeti.HodgeTate.hodgeTateCoordinate`,
`TauCeti.HodgeTate.flagBall`.
Layer 5: `TauCeti.HodgeTate.igusaTorsor`, `TauCeti.HodgeTate.integralDifferentialLattice`,
`TauCeti.HodgeTate.modifiedHodgeBundle`, `TauCeti.HodgeTate.modifiedMinimalModel`,
`TauCeti.HodgeTate.modifiedPlusSheaf`, `TauCeti.HodgeTate.aipTorsor`.
Over the ordinary locus, `TauCeti.HodgeTate.modifiedMinimalModel_ordinary` identifies
the modified and unmodified minimal models at the same full level K(p^n), and their
determinant lattices agree.
Layer 6 imports `TauCeti.LogAdic.LogStructure`, `TauCeti.LogAdic.logification`,
`TauCeti.LogAdic.logPullback`, `TauCeti.LogAdic.IntegralChart` and `TauCeti.LogAdic.KummerEtaleSite`
from PrismaticCohomologyPartIV §8.60. The local aliases
`TauCeti.LogAdic.IsKummer` and `TauCeti.LogAdic.IsKummerEtale` name its underlying
conditions, definitionally compatible with the site objects.
The target `TauCeti.LogAdic.strict_iff_stalk` tests full logified-pullback stalk maps
for arbitrary log structures; the characteristic-stalk test assumes integral log
structures. `TauCeti.LogAdic.FsAdicPullback.saturation` is finite surjective for fine
spaces; for coherent X it factors as a finite surjection onto X^int followed by the
integralization closed immersion. `TauCeti.LogAdic.finite_kummer_descent` uses
surjective Kummer étale covering maps for both base and source descent, and descends
finite Kummer étale objects along Kummer étale covers.
The additional log-adic targets are:
`TauCeti.LogAdic.KummerLocalSystem` (the finite torsion-stalk extension of the
supplied finite-free local systems),
`TauCeti.LogAdic.MonoidAlgebraLog`, `TauCeti.LogAdic.DivisorialLog`,
`TauCeti.LogAdic.FsAdicPullback`, `TauCeti.LogAdic.ContinuousLogDerivation`,
`TauCeti.LogAdic.ContinuousLogDifferentials`, `TauCeti.LogAdic.AnalyticLogDR`,
`TauCeti.LogAdic.RootCover`, `TauCeti.LogAdic.RamificationIndex`,
`TauCeti.LogAdic.ProKummerPresentation`, `TauCeti.LogAdic.CorrectedProKummerCover`,
`TauCeti.LogAdic.ProKummerEtaleSite`,
`TauCeti.LogAdic.ProKummerEtaleSite.horizontal_agreement`, `TauCeti.LogAdic.AllRootTower`,
`TauCeti.LogAdic.LogAffinoidPerfectoid`, `TauCeti.LogAdic.CompletedLogStructure`,
`TauCeti.LogAdic.KummerLisse`, `TauCeti.LogAdic.CompletedKummerLisse`,
`TauCeti.LogAdic.BoundaryMonodromy`.
Layer 7 extends the supplied smooth-pair constructions with
`TauCeti.LogAdic.LogConstantPeriods.horizontal_agreement`,
`TauCeti.LogAdic.StructuralLogPeriodPlus.horizontal_agreement` and
`TauCeti.LogAdic.unipotent_log_tensor.horizontal_agreement`. Its period and
comparison interfaces are `TauCeti.LogAdic.LogConstantPeriods`, `TauCeti.LogAdic.StructuralLogPeriodPlus`,
`TauCeti.LogAdic.StructuralLogPeriod`, `TauCeti.LogAdic.StructuralLogConnection`,
`TauCeti.LogAdic.BdRCoefficientSheaf`, `TauCeti.LogAdic.FilteredLogConnection`,
`TauCeti.LogAdic.LogRH`, `TauCeti.LogAdic.LogHiggs`,
`TauCeti.LogAdic.ArithmeticLogDR` (underived arithmetic pushforward, with no
higher-arithmetic-vanishing assertion),
`TauCeti.LogAdic.CanonicalLogRealizations` (agreement with the supplied canonical coefficients), `TauCeti.LogAdic.TwoDeRhamLattices`,
`TauCeti.LogAdic.LatticeHTFiltration`, `TauCeti.LogAdic.HodgeTateReduction`,
`TauCeti.LogAdic.FiniteLeviComparison` (agreement with the supplied rational Levi comparison). -/

end

end TauCetiRoadmap.HodgeTateAndCanonicalSubgroups
