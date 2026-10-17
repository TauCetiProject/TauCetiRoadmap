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
Quantitative guards below use rational heights for exact numerical examples; the
geometric statements use real rank-one valuations with v(p) = 1 and positive levels.
-/

namespace TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

noncomputable section

universe u v

namespace HodgeTate

/-! ## Layer 2: Hodge–Tate exact sequence and torsors

The p-level tower `ShimuraTower.pLevel` is indexed by the compact open subgroups of
G(ℚ_p), ordered by inclusion. The index poset and its cofilteredness are statable at
the pins; the tower, its action and its limit diamond are README targets. A level is a
Mathlib `OpenSubgroup` that is compact, so the order is the one of `OpenSubgroup`. -/

/-- Compact open subgroups of a topological group, the index of the p-level tower: the
compact members of Mathlib's `OpenSubgroup G`. -/
def CompactOpenSubgroup (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  {K : OpenSubgroup G // IsCompact (K : Set G)}

namespace CompactOpenSubgroup

variable {G : Type u} [Group G] [TopologicalSpace G]

instance : PartialOrder (CompactOpenSubgroup G) :=
  inferInstanceAs (PartialOrder {K : OpenSubgroup G // IsCompact (K : Set G)})

/-- The level poset is cofiltered (milestone of Layer 2). -/
theorem isCofiltered [IsTopologicalGroup G] [T2Space G] [Nonempty (CompactOpenSubgroup G)] :
    CategoryTheory.IsCofiltered (CompactOpenSubgroup G) := by
  sorry

example [CompactSpace G] : Nonempty (CompactOpenSubgroup G) :=
  ⟨⟨⊤, by simpa using isCompact_univ⟩⟩

example (H K : CompactOpenSubgroup G) : H ≤ K ↔ (H.1 : Set G) ⊆ K.1 := Iff.rfl

/-- Every subgroup of a finite discrete group occurs among the compact open levels. -/
example [Finite G] [DiscreteTopology G] (H : Subgroup G) :
    ∃ K : CompactOpenSubgroup G, K.1.toSubgroup = H := by
  exact ⟨⟨⟨H, isOpen_discrete _⟩, (Set.toFinite _).isCompact⟩, rfl⟩

/-- The discrete additive integers have only the trivial compact open subgroup. -/
example (K : CompactOpenSubgroup (Multiplicative ℤ)) : K.1.toSubgroup = ⊥ := by
  have : Finite K.1 := Set.finite_coe_iff.mpr K.2.finite_of_discrete
  apply le_antisymm _ bot_le
  intro x hx
  have h := K.1.toSubgroup.subtype.isOfFinOrder (isOfFinOrder_of_finite ⟨x, hx⟩)
  change x = 1
  exact h.eq_one'

/-- The additive real line has no compact open subgroup. -/
example : IsEmpty (CompactOpenSubgroup (Multiplicative ℝ)) := by
  refine ⟨fun K => ?_⟩
  let : PreconnectedSpace (Multiplicative ℝ) := (inferInstance : PreconnectedSpace ℝ)
  have hu := K.1.isClopen.eq_univ ⟨1, K.1.one_mem⟩
  exact noncompact_univ ℝ (show IsCompact (Set.univ : Set ℝ) from hu ▸ K.2)

end CompactOpenSubgroup

/-! ## Layer 3: Canonical subgroups with quantitative bounds

With v(p) = 1, the Hasse height of a point is w = min(v(Ha), 1). The weak and strong
canonical conditions at level n are S_n·w < 1/2 and p^n·w < 1/2, with
S_n = (p^n − 1)/(p − 1); the BHW position range is w < 1/(c_p p^{n−1}) with
c_p = 2 for p ≥ 5 and c_p = 3 for p = 3 (strict, as in Fargues's theorem), and
w ≤ 1/(4·2^{n−1}) for p = 2 (inclusive, the all-prime range). The weak and strong inequalities are those of AutomorphicBundles B3.HT.1's shared
cyclotomic-base abelian-family subgroup, used as `TauCeti.HodgeTate.canonicalSubgroup`
in README §§3.4, 3.6–3.8. Its point criterion is inclusion for complete flat test
algebras and equality for those integrally closed in their localization at p.
The additional pointwise HN subgroup agrees on the overlap by Frobenius-congruent
uniqueness. These numerical guards also retain the wider pointwise ranges of Layers 3
and 4; the degree formula and integral Hodge–Tate estimates are README targets. -/

/-- The truncated Hasse valuation min(v(Ha), 1) (Layer 3). -/
def hasseValuation {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) (Ha : O) : ℝ :=
  min ((v Ha).untopD 1) 1

example {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) :
    hasseValuation v 0 = 1 := by simp [hasseValuation]

example {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) :
    hasseValuation v 1 = 0 := by simp [hasseValuation]

/-- A normalized uniformizer has truncated height one. -/
example {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) (π : O)
    (hπ : v π = 1) : hasseValuation v π = 1 := by
  simp [hasseValuation, hπ]

/-- A height strictly between zero and one is unchanged by truncation. -/
example {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) (Ha : O)
    (hHa : v Ha = ((1 / 3 : ℝ) : WithTop ℝ)) : hasseValuation v Ha = 1 / 3 := by
  norm_num [hasseValuation, hHa]

/-- For p ≥ 2, S_n = 1 + p + ⋯ + p^{n−1} = (p^n − 1)/(p − 1). -/
def canonicalSum (p n : ℕ) : ℚ := ((p : ℚ) ^ n - 1) / ((p : ℚ) - 1)

/-- The weak inequality S_n·w < 1/2 of the shared family subgroup (AutomorphicBundles B3.HT.1). -/
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

example : bhwConstant 2 = 4 ∧ bhwConstant 3 = 3 := ⟨rfl, rfl⟩
example : bhwConstant 7 = 2 := rfl

example : canonicalSum 3 2 = 4 := by norm_num [canonicalSum]
example : canonicalSum 2 0 = 0 := by norm_num [canonicalSum]
example : canonicalSum 5 1 = 1 := by norm_num [canonicalSum]

example : ¬ WeakCanonicalRange 2 2 (1 / 6) := by
  norm_num [WeakCanonicalRange, canonicalSum]

example : StrongCanonicalRange 2 2 (1 / 16) := by
  norm_num [StrongCanonicalRange]

example : WeakCanonicalRange 2 2 (1 / 8) := by
  norm_num [WeakCanonicalRange, canonicalSum]

example : ¬ StrongCanonicalRange 2 2 (1 / 8) := by
  norm_num [StrongCanonicalRange]

example : BHWPositionRange 2 1 (1 / 4) ∧ ¬ BHWPositionRange 2 1 (1 / 3) := by
  norm_num [BHWPositionRange, bhwConstant]

example : BHWPositionRange 3 1 (1 / 4) ∧ ¬ BHWPositionRange 3 1 (1 / 3) := by
  norm_num [BHWPositionRange, bhwConstant]

/-- For p ≥ 3 the endpoint is excluded: at p = 5, n = 1 the bound is 1/2. -/
example : BHWPositionRange 5 1 (1 / 3) ∧ ¬ BHWPositionRange 5 1 (1 / 2) := by
  norm_num [BHWPositionRange, bhwConstant]

/-- The strong condition implies the weak one for nonnegative heights, since S_n ≤ p^n. -/
theorem weakCanonicalRange_of_strong {p n : ℕ} (hp : 2 ≤ p) {w : ℚ} (hw : 0 ≤ w)
    (h : StrongCanonicalRange p n w) : WeakCanonicalRange p n w := by
  sorry

/-- The weak condition does not imply the strong one: at p = 2, n = 2 and w = 1/7 the weak
condition 3/7 < 1/2 holds and the strong condition 4/7 < 1/2 fails. -/
example : WeakCanonicalRange 2 2 (1 / 7) ∧ ¬ StrongCanonicalRange 2 2 (1 / 7) := by
  norm_num [WeakCanonicalRange, StrongCanonicalRange, canonicalSum]

/-! ## Layer 4: Canonical/anticanonical geometry and period estimates

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

/-- The cocycle relation j(γδ, z) = j(γ, δz)·j(δ, z), which makes c z + d a section of the AIP
structure group compatible with composition (Layer 5). -/
theorem autFactor_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0) :
    autFactor (γ * δ) z = autFactor γ (coordAction δ z) * autFactor δ z := by
  sorry

/-- On the invertible-denominator domain `coordAction` is Mathlib's action of `GL (Fin 2) K` on
the projective line `OnePoint K` (`OnePoint.smul_some_eq_ite`); the chart value ∞ is the
excluded point cz + d = 0. -/
theorem coordAction_eq_smul [DecidableEq K] (γ : GL (Fin 2) K) (z : K) (h : autFactor γ z ≠ 0) :
    γ • (z : OnePoint K) = ((coordAction γ z : K) : OnePoint K) := by
  rw [OnePoint.smul_some_eq_ite]
  split_ifs with h'
  · exact absurd h' h
  · rfl

/-- The action is a left action on the invertible-denominator domain. -/
theorem coordAction_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0)
    (hγδ : autFactor (γ * δ) z ≠ 0) :
    coordAction (γ * δ) z = coordAction γ (coordAction δ z) := by
  sorry

/-- The identity has automorphy factor one. -/
example (z : K) : autFactor (1 : GL (Fin 2) K) z = 1 := by
  simp [autFactor]

/-- An upper triangular matrix has factor d and coordinate (az+b)/d on its chart. -/
example (γ : GL (Fin 2) K) (a b d z : K)
    (hγ : (γ : Matrix (Fin 2) (Fin 2) K) = !![a, b; 0, d]) (hd : d ≠ 0) :
    autFactor γ z ≠ 0 ∧ coordAction γ z = (a * z + b) / d := by
  simpa [autFactor, coordAction, hγ] using hd

/-- A diagonal matrix gives the guarded dilation chart. -/
example (γ : GL (Fin 2) K) (a d z : K)
    (hγ : (γ : Matrix (Fin 2) (Fin 2) K) = !![a, 0; 0, d]) (hd : d ≠ 0) :
    autFactor γ z = d ∧ (autFactor γ z ≠ 0 ∧ coordAction γ z = a * z / d) := by
  simp [autFactor, coordAction, hγ, hd]

/-- Two lower unipotents satisfy the scalar cocycle on the nonzero-denominator chart. -/
example (γ δ : GL (Fin 2) K) (c c' z : K)
    (hγ : (γ : Matrix (Fin 2) (Fin 2) K) = !![1, 0; c, 1])
    (hδ : (δ : Matrix (Fin 2) (Fin 2) K) = !![1, 0; c', 1])
    (hz : c' * z + 1 ≠ 0) :
    autFactor (γ * δ) z = (c + c') * z + 1 ∧
      (c + c') * z + 1 = (c * (z / (c' * z + 1)) + 1) * (c' * z + 1) := by
  constructor
  · simp [autFactor, Matrix.mul_apply,
      Fin.sum_univ_two, hγ, hδ]
  · field_simp
    ring

/-- Lower unipotent coordinates compose as a left action on the common chart. -/
example (c c' z : K) (hδ : c' * z + 1 ≠ 0) (hγδ : (c + c') * z + 1 ≠ 0) :
    c * (z / (c' * z + 1)) + 1 ≠ 0 ∧
      z / ((c + c') * z + 1) =
        (z / (c' * z + 1)) / (c * (z / (c' * z + 1)) + 1) := by
  have hden : c * (z / (c' * z + 1)) + 1 = ((c + c') * z + 1) / (c' * z + 1) := by
    apply (eq_div_iff hδ).2
    calc
      (c * (z / (c' * z + 1)) + 1) * (c' * z + 1) = c * z + (c' * z + 1) := by
        rw [add_mul, one_mul, mul_assoc, div_mul_cancel₀ _ hδ]
      _ = (c + c') * z + 1 := by ring
  rw [hden]
  constructor
  · exact div_ne_zero hγδ hδ
  · rw [div_div_div_cancel_right₀ hδ]

/-- Upper and lower unipotents distinguish the order of the matrix action. -/
example :
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 1, 1] ≠
      !![1, 0; 1, 1] * !![1, 1; 0, 1] := by
  intro h
  have h00 := congrArg (fun A : Matrix (Fin 2) (Fin 2) ℚ => A 0 0) h
  norm_num [Matrix.mul_apply, Fin.sum_univ_two] at h00

/-- The odd-prime position estimate has a uniform lower bound at p = 5. -/
example (p : ℚ) (hp : 5 ≤ p) : 27 / 16 ≤ 2 - p / (4 * (p - 1)) := by
  have hd : 0 < 4 * (p - 1) := by linarith
  have hb : p / (4 * (p - 1)) ≤ 5 / 16 := by
    apply (div_le_iff₀ hd).2
    nlinarith
  linarith

/-- The logarithm matrix of a rank-two unipotent Jordan block has square zero. -/
example : (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [pow_two, Matrix.mul_apply, Fin.sum_univ_two]

/-- Translation fixes the factor and adds 3 to the coordinate. -/
example :
    let γ : GL (Fin 2) ℚ := Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 3; 0, 1] (by norm_num)
    autFactor γ 2 = 1 ∧ coordAction γ 2 = 5 := by
  norm_num [autFactor, coordAction, Matrix.GeneralLinearGroup.mkOfDetNeZero,
    Matrix.GeneralLinearGroup.mk', Matrix.unitOfDetInvertible]

/-- The Weyl matrix gives −1/z and factor z; its denominator vanishes at zero. -/
example :
    let γ : GL (Fin 2) ℚ := Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, -1; 1, 0] (by norm_num)
    autFactor γ 2 = 2 ∧ coordAction γ 2 = -(1 / 2) ∧ autFactor γ 0 = 0 := by
  norm_num [autFactor, coordAction, Matrix.GeneralLinearGroup.mkOfDetNeZero,
    Matrix.GeneralLinearGroup.mk', Matrix.unitOfDetInvertible]

/-! ## Layer 5: Igusa trivializations and the modified integral lattice

On the Hasse neighbourhood of radius ε the AIP structure group B_m is contained in
𝒪_p^×(1 + p^x Res 𝔾̂_a), where x = m − ε p^m/(p − 1). This is the corrected direction
of BHW (7.1), recorded in 5.8. Membership of cz + d in B_m follows
from the ratio of two lifts in the actual torsor (5.11). -/

/-- x = m − ε p^m/(p − 1). -/
def aipExponent (p m : ℕ) (ε : ℚ) : ℚ := m - ε * (p : ℚ) ^ m / ((p : ℚ) - 1)

example : aipExponent 3 1 0 = 1 := by norm_num [aipExponent]
example : aipExponent 3 1 (1 / 9) = 5 / 6 := by norm_num [aipExponent]
example : aipExponent 2 1 (1 / 8) = 3 / 4 := by norm_num [aipExponent]

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
Layer 2: `ShimuraTower.pLevel`, `ShimuraTower.translate`, `ShimuraTower.infiniteLevel`,
`TauCeti.HodgeTate.hodgeTateFlagPoint`, `TauCeti.HodgeTate.hodgeTateParabolicReduction`,
`TauCeti.HodgeTate.ExactTensorFiltration`, `TauCeti.HodgeTate.hodgeTateFlagDescent`,
`TauCeti.HodgeTate.openTowerHodgeTateMap` (for neat Hodge-type data with a fixed
symplectic embedding and induced universal abelian family).
Layer 3: `TauCeti.HodgeTate.hasseNeighbourhood`; `TauCeti.HodgeTate.canonicalSubgroup`
is AutomorphicBundles B3.HT.1's shared subgroup on the cyclotomic-base abelian-family
range. The pointwise HN extension, degree formula and integral Hodge–Tate estimates
are the additional targets of README §§3.6–3.9.
Layer 4: `TauCeti.HodgeTate.canonicalLocus`, `TauCeti.HodgeTate.hodgeTateCoordinate`,
`TauCeti.HodgeTate.flagBall`.
Layer 5: `TauCeti.HodgeTate.igusaTorsor`, `TauCeti.HodgeTate.integralDifferentialLattice`,
`TauCeti.HodgeTate.modifiedHodgeBundle`, `TauCeti.HodgeTate.modifiedMinimalModel`,
`TauCeti.HodgeTate.modifiedPlusSheaf`, `TauCeti.HodgeTate.aipTorsor`.
Layer 6 imports `TauCeti.LogAdic.LogStructure`, `TauCeti.LogAdic.logification`,
`TauCeti.LogAdic.logPullback`, `TauCeti.LogAdic.IntegralChart` and `TauCeti.LogAdic.KummerEtaleSite`
from PrismaticCohomologyPartIV §8.60. The local aliases
`TauCeti.LogAdic.IsKummer` and `TauCeti.LogAdic.IsKummerEtale` name its underlying
conditions, definitionally compatible with the site objects.
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
