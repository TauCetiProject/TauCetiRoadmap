import Mathlib
import TauCeti.LinearAlgebra.Matrix.RationalCanonicalFormFinTwo

/-!
# EndoscopicTransferAndUnitaryTraceComparison: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned Mathlib APIs; it is not exhaustive. Reductive groups,
transfer, Hitchin stacks, automorphic representations, Igusa varieties and local towers are
README targets. The finite sums and matrices below state their algebraic comparison identities and fix
normalizations on existing carriers. The special block uses geometric Frobenius of absolute value q⁻¹,
subdiagonal monodromy, and left actions. Endoscopic coefficients retain both denominators.
-/

namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

open scoped BigOperators

/-- The rational GL_n conjugacy milestone of §1.3: semisimple invertible matrices with
equal characteristic polynomials are conjugate. Semisimplicity is that of the induced
polynomial module, so repeated irreducible factors in the characteristic polynomial are allowed. -/
theorem isConj_iff_charpoly_eq_of_isSemisimple
    {ι K : Type*} [Fintype ι] [DecidableEq ι] [Field K]
    (γ γ' : Matrix.GeneralLinearGroup ι K)
    (hγ : Module.End.IsSemisimple (Matrix.toLin' (γ : Matrix ι ι K)))
    (hγ' : Module.End.IsSemisimple (Matrix.toLin' (γ' : Matrix ι ι K))) :
    IsConj γ γ' ↔ (γ : Matrix ι ι K).charpoly = (γ' : Matrix ι ι K).charpoly := by
  sorry

/-! ## Layer 1: stable conjugacy and arithmetic invariants
Section 1.1's NonabelianH1.exact_of_normal requires a Γ-stable normal subgroup H′ of H.
The (H/H′)^Γ-orbits are the fibres of H¹(Γ,H′) → H¹(Γ,H); their quotient is the
neutral fibre of H¹(Γ,H) → H¹(Γ,H/H′). Other nonempty fibres use the twisted sequence
after choosing a cocycle lift.
Section 1.11 compares PadicHodgeTheory §5.5's localTorsorKottwitz with the
abelianized dual-centre description for every finite F/ℚ_p, including p=2.
The real and global extensions belong to §1.11. The shared finite-local theorem uses
ClassFieldTheory's lattice Tate–Nakayama and AdelicAlgebraicGroups §4.1's local H¹ vanishing.
Section 1.8 uses the full embedding-permuting Weil action on the supplied pinned dual.
Section 1.9's InnerTwist.equiv_of_localClass_eq takes equality of localized marked
cohomology classes and returns equivalence of the two InnerTwist objects as in §1.6.
Section 1.17's UnitaryLieCentralizer.isometryTorsor, UnitaryLieCentralizer.inv and
UnitaryLieCentralizer.inv_sameSpace take both Hermitian forms and matching regular
semisimple endomorphisms. The invariant is the class of the torsor of intertwining
geometric isometries, using source and target descent; on a fixed space it lies in the
kernel classifying rational orbits. These reductive and torsor interfaces are README targets.
The global Weil carrier and its structural API are supplied by
GL2AutomorphicRepresentationsAndTransfer §R17.5.0, with the endoscopic conventions of §1.3a.
Section 1.16's EndoscopicDatum.classMap includes the central descent cocycle z_H,
the H-torsor H_z and the lifted z-pair space H_{1,z}, with their conjugation actions.
General twisted matching and stable orbital distributions use these descended carriers.
An empty H_z(F) gives an empty matching set and zero target function and quotient spaces;
ordinary endoscopy and cyclic base change have the compatible trivial descent. -/

/-- The nonarchimedean parity sign from quasi-split and inner derived ranks. Real groups
use symmetric-space half-dimensions instead. The integer exponent retains
its meaning even before imposing the rank inequality of an actual inner form. -/
def kottwitzSign (rankQuasiSplit rankInner : ℕ) : ℤˣ :=
  (-1 : ℤˣ) ^ ((rankQuasiSplit : ℤ) - rankInner)

/-- For GL_r(D), with n=r·deg(D), the rank difference is n-r. -/
theorem kottwitzSign_gl (n r : ℕ) (hr : 1 ≤ r) (hrn : r ≤ n) :
    kottwitzSign (n - 1) (r - 1) = (-1 : ℤˣ) ^ ((n : ℤ) - r) := by
  sorry

/-- A quasi-split form has sign +1, including the rank-zero numerical case. -/
example (r : ℕ) : kottwitzSign r r = 1 := by
  simp [kottwitzSign]

section GLn
variable {ι : Type*} [Fintype ι] [DecidableEq ι] {K : Type*} [Field K]

/-- In GL_n a separable characteristic polynomial determines a rational conjugacy class.
The separability assumption excludes nonsemisimple Jordan blocks. -/
theorem isConj_iff_charpoly_eq_of_separable (γ γ' : Matrix.GeneralLinearGroup ι K)
    (hsep : (γ : Matrix ι ι K).charpoly.Separable) :
    IsConj γ γ' ↔ (γ : Matrix ι ι K).charpoly = (γ' : Matrix ι ι K).charpoly := by
  sorry

/-- The nonsemisimple boundary of §1.3: the identity and a unipotent Jordan block
are not conjugate despite equal characteristic polynomials. -/
theorem identity_not_isConj_unipotent : ¬ IsConj (1 : Matrix.GeneralLinearGroup (Fin 2) ℚ)
    (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 1; 0, 1]
      (by simp [Matrix.det_fin_two_of])) := by
  sorry
end GLn

/-! ## Layer 2: orbital integrals and transfer factors
Section 2.10's eulerPoincare_constantTerm gives zero invariant orbital class for
normalized constant terms along proper real parabolics. Parabolic descent gives
nonelliptic orbital-integral vanishing; the discrete-series character identity is elliptic.
Section 2.6's rational nilpotent germs are locally constant on the regular semisimple locus.
Their square-dilation homogeneity does not imply constancy on a Cartan's regular locus.
Section 2.11 uses functions and the stable orbital quotient on H_{1,z}(F).
At real places its compact-modulo-Z₁ and Harish-Chandra Schwartz central-character
spaces have separate stable orbital quotients. Section 2.14 provides compact-modulo-Z₁
transfer for compactly supported inputs and Schwartz transfer for Schwartz inputs,
with Shelstad’s purely imaginary embedding correction and unitary central character.
K-finiteness is imposed within one of these source spaces and implies no support condition.
Section 2.16's InnerGL.temperedSupport specializes the supplied
harish-chandra-tempered-support of SmoothRepresentationsOfLocalGroups SR.3.3;
InnerGL.temperedInductionIrreducible and InnerGL.standardBasis give the inner-GL consequences.
Section 2.13 constructs the endoscopically induced form B_h from B_g on matching Cartans;
both Fourier transforms and Weil constants use these forms and the common character ψ. -/

section KappaSum
variable {D : Type*} [CommGroup D] [Fintype D]

/-- The character-weighted sum over a finite group of stable-class invariants. -/
def kappaSum (κ : D →* ℂˣ) (O : D → ℂ) : ℂ := ∑ d, (κ d : ℂ) * O d

/-- Rebasing by d₀ gives the inverse character multiplier. -/
theorem kappaSum_rebase (κ : D →* ℂˣ) (O : D → ℂ) (d₀ : D) :
    kappaSum κ (fun d => O (d₀ * d)) = ((κ d₀)⁻¹ : ℂ) * kappaSum κ O := by
  sorry

/-- An order-three class distinguishes the positive character weight from its inverse. -/
example (κ : Multiplicative (ZMod 3) →* ℂˣ) :
    kappaSum κ (fun d => if d = Multiplicative.ofAdd 1 then 1 else 0) =
      (κ (Multiplicative.ofAdd 1) : ℂ) := by
  classical
  simp [kappaSum]
  rfl

/-- With one class and trivial character the sum is evaluation. -/
example (O : Unit → ℂ) : kappaSum (1 : Unit →* ℂˣ) O = O () := by
  simp [kappaSum]
end KappaSum

/-! ## Layer 3: Hitchin geometry and support
Section 3.4's kostantHitchinSection takes a square root D′ of D and gives a section into
[𝔤_D^reg/G], represented by the Kostant torsor E_{D′} and its regular D-valued Higgs field.
Section 3.6's kostantHitchinSection_hitchin sends a to that torsor/Higgs-field pair in M^reg.
The companion matrices below state only the untwisted GL_n formulas.
Section 3.7 uses constructible locally closed strata for geometric indecomposables and
moment-map charts for Higgs objects over bounded strongly generated sheaf charts.
Section 3.10's HitchinPicard.regularTorsor takes a line bundle D′ and D′⊗²≅D;
the arbitrary-D Picard carrier and action need no square root. The same choice is
carried by §3.11's Kostant gluing and §3.11a's HitchinPicard.componentsOfFibre,
together with deg D>2g−2 for the density and component comparison.
Sections 3.11 and 3.16 permit auxiliary level at regular places and retain every local volume.
EtaleDualityAndPerverseSheaves §§5.6, 5.8 supplies pureComplexGeometricSplitting,
decompositionTheorem and relativeHardLefschetzTheorem; §3.15 extends their scheme statements
to the specified smooth separated Deligne–Mumford source.
Section 3.11a supplies uniform finite-jet comparison and H-good, transverse-away-from-v
globalizations over every sufficiently large residue-extension degree.
Section 3.17 gives codim Z ≤ δ_Z for every support and the top ordinary cohomology
conclusion under equality, equivalently the additional hypothesis codim Z ≥ δ_Z.
Section 3.18 is the preliminary H-good comparison; full stabilization is §4.3a. -/

section ChevalleyGL
variable {K : Type*} [Field K] {n : ℕ}

/-- Non-leading characteristic coefficients, ordered from the constant coefficient upward. -/
noncomputable def chevalleyMap (X : Matrix (Fin n) (Fin n) K) : Fin n → K :=
  fun i => X.charpoly.coeff i

/-- The companion matrix: ones on the subdiagonal and minus the coefficients in the last column.
This is a matrix formula, rather than a construction of the general Kostant section. -/
def kostantSectionGL (a : Fin n → K) : Matrix (Fin n) (Fin n) K := fun i j =>
  (if (i : ℕ) = (j : ℕ) + 1 then 1 else 0) - (if (j : ℕ) + 1 = n then a i else 0)

/-- The companion characteristic polynomial has the specified lower coefficients. -/
theorem charpoly_kostantSectionGL (a : Fin n → K) :
    (kostantSectionGL a).charpoly =
      Polynomial.X ^ n + ∑ i : Fin n, Polynomial.C (a i) * Polynomial.X ^ (i : ℕ) := by
  sorry

/-- The companion formula is a section of the GL_n characteristic map. -/
theorem chevalleyMap_kostantSectionGL (a : Fin n → K) :
    chevalleyMap (kostantSectionGL a) = a := by
  sorry

/-- Characteristic coefficients are unchanged by conjugation. -/
theorem chevalleyMap_conj (X : Matrix (Fin n) (Fin n) K)
    (g : Matrix.GeneralLinearGroup (Fin n) K) :
    chevalleyMap ((g : Matrix (Fin n) (Fin n) K) * X *
      ((g⁻¹ : Matrix.GeneralLinearGroup (Fin n) K) : Matrix (Fin n) (Fin n) K)) =
      chevalleyMap X := by
  sorry

/-- The constant-first section agrees with Tau Ceti's quadratic companion, with trace −a₁. -/
example (a : Fin 2 → K) :
    kostantSectionGL a = TauCeti.companionFinTwo (-a 1) (a 0) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [kostantSectionGL, TauCeti.companionFinTwo]

end ChevalleyGL

/-- A finite power sum vanishing at every sufficiently large exponent has zero coefficients
when its bases are distinct and nonzero. Consecutive exponents give a Vandermonde matrix. -/
theorem powerSum_coefficients_eq_zero_of_eventually
    {ι K : Type*} [Fintype ι] [Field K] (α c : ι → K)
    (hα : Function.Injective α) (hα0 : ∀ i, α i ≠ 0)
    (h : ∀ᶠ m : ℕ in Filter.atTop, ∑ i, c i * α i ^ m = 0) :
    ∀ i, c i = 0 := by
  sorry

/-! ## Layer 4: the fundamental lemma and smooth transfer
The reductive and harmonic carriers required for these statements are described in README.md.
Section 4.2 requires j_* and its inverse to identify the cocharacter lattices over ℤ_(p),
in addition to p being prime to the Weyl order, and uses compatible centralizer Haar measures.
Section 4.3 consumes finite jets and every sufficiently large extension degree from §3.11a,
the preliminary H-good comparison of §3.18 and the Frobenius-count descent of §3.16a.
Section 4.3a then deduces full anisotropic stabilization from the local fundamental lemma.
Section 4.9a's NonstandardSmoothTransfer.transfer provides matching for every compactly
supported smooth Lie-algebra test over any finite extension of ℚ_p, using compatible
centralizer measures. NonstandardSmoothTransfer.fourier uses the common additive character,
forms transported on matching Cartans and self-dual additive measures. It gives the
nonstandard Fourier compatibility on stable orbital quotients.
Section 4.10(a) consumes this all-test-function theorem for every descended nonstandard
triple; part (b) separately consumes the good-prime nonstandard lattice unit identity. -/

/-! ## Layer 5: number-field discrete general linear input and normalization
AutomorphicSpectralTheory §4.14a supplies the residual index and representations.
The endoscopic labels use those same objects; the GL intertwiner normalization is a README target. -/

/-! ## Layer 6: stable and twisted unitary trace comparison
Section 6.2 supplies Tamagawa number one for every simply connected semisimple group
over a number field, including type-C derived covers and inner centralizers.
Its proof uses strong induction on dimension for the simply connected derived covers of
proper semisimple centralizers, with central elements treated separately.
Section 6.5 uses this theorem for the absolute Tamagawa formulas. -/

/-- The numerical component count for d=[F⁺:ℚ] and the block sizes.
Its group interpretation requires d>0 and a nonempty list of positive sizes. -/
def unitaryComponentCount (d : ℕ) (blocks : List ℕ) : ℕ :=
  if Even d ∨ ∀ i ∈ blocks, Even i then 2 ^ blocks.length else 2 ^ (blocks.length - 1)

/-- The endoscopic coefficient from Tamagawa numbers and the outer automorphism order.
In its group application τH and outH are nonzero. -/
def endoscopicCoefficient (τG τH : ℚ) (outH : ℕ) : ℚ := τG / τH / outH

/-- The numerical trivial-datum identity of §6.7, with nonzero Tamagawa number. -/
theorem endoscopicCoefficient_self (τ : ℚ) (hτ : τ ≠ 0) : endoscopicCoefficient τ τ 1 = 1 := by
  sorry

/-- The equal-block coefficient identity of §6.7 retains the Tamagawa ratio
alongside the order-two outer automorphism denominator. -/
theorem endoscopicCoefficient_equal_blocks (τG τH : ℚ) :
    endoscopicCoefficient τG τH 2 = τG / (2 * τH) := by
  sorry

/-! ## Layer 7: algebraic isocrystals and rational Igusa geometry
PadicHodgeTheory §5.5 supplies sigmaConjugacy, B(G), the tensor Newton map,
kottwitzInvariant and admissibility on L=ℚ̆_p=Frac W(𝔽̄_p). Section 7.2's
GIsocrystal.classification extends this carrier to tensor isocrystals and automorphisms.
The changes b′=g⁻¹bσ(g) and b′=h b σ(h)⁻¹ agree by h=g⁻¹.
Section 7.4's NewtonMap.representation, KottwitzMap.functorial and AdmissibleClass.mem
compare these supplied maps with the tensor construction and PEL dual sign.
The structured isocrystal and moduli targets are stated in README.md.
Section 7.8 includes m=0: FiniteIgusa at zero is the central leaf, U_p(0)=Γ_b,
and its deck quotient is trivial. IgusaMonoid.levelMap in §7.9 is defined for m≥e₁,
including m=e₁ with target level zero.
Section 7.3's IgusaRational.perfection inverts j_i:Σ_i→gr_i to ρ_i=j_i⁻¹.
For the perfect-to-finite-tower map P, the left action a and right action r satisfy
P ∘ a_{δ⁻¹} = r_δ ∘ P. Rational pullback P* therefore identifies r_δ* with
inverse pullback a_{δ⁻¹}*, compatibly with level transitions and prime-to-p actions.
These Layer 7 carriers and comparisons supply the common downstream Igusa foundations.
Section 7.10a uses TauCeti.EtaleDuality.CohCorr and its rgammac, comp, pushforward, traceMap
and localTerm from EtaleDualityAndPerverseSheaves §§6.1–6.3, with traceAdditivity and
fujiwaraVarshavskyTraceFormula from §§6.4–6.5, for finite Igusa coefficient correspondences.
The Frobenius-twisted trace requires proper first leg, quasi-finite second leg and Weil descent.
Section 8.2's IgusaCorrespondence.ofMonoid puts the quotient/right-action map in c₁
and the finite étale projection in c₂. IgusaCorrespondence.firstProper proves finiteness
using a complementary monoid map with finite central composite; secondQuasiFinite
uses the projection. The coefficient lift c₂!c₁*L→L uses the quasi-isogeny and étale trace,
divided by [U∩gUg⁻¹:V], and acts as 1_UgU/vol(U). Direct pullback for right actions
is a left representation. Further negative Frobenius shifts give (Fⁿ∘c₁,c₂),
with the Weil-composed lift, as required by §7.10a and §8.5. -/

/-! ## Layer 8: Igusa counting and stabilization -/

/-- Across decreasing slope blocks, every eigenvalue valuation in an earlier block is smaller
than every valuation in a later block. This checks only the numerical acceptability inequality. -/
def AcceptableValuations {r : ℕ} (vals : Fin r → Finset ℚ) : Prop :=
  ∀ i j : Fin r, i < j → ∀ x ∈ vals i, ∀ y ∈ vals j, x < y

/-- A shared valuation in two distinct slope blocks prevents strict acceptability. -/
example {r : ℕ} (vals : Fin r → Finset ℚ) (i j : Fin r) (hij : i < j)
    (x : ℚ) (hi : x ∈ vals i) (hj : x ∈ vals j) : ¬ AcceptableValuations vals := by
  intro h
  exact (lt_irrefl x) (h i j hij x hi x hj)

/-! ## Layer 9: raw compact-unitary cohomology
The geometric complex, its graded pieces and its commuting actions are README targets. -/

/-! ## Layer 10: trace parameters and classical comparison
SmoothRepresentationsOfLocalGroups SR.5.2 supplies the shared raw Weil–Deligne fields,
special pairs, operations and Frobenius semisimplification used by §§10.23–10.26.
ArithmeticGaloisRepresentations supplies the arithmetic adapter and local factors;
its §2.6 supplies the special-block decomposition used by ClassicalWDParameter.inverse.
Section 10.8 transports one Haar measure through each norm centralizer identification.
Its lattice sums retain reciprocal volumes of the actual compact open stabilizers;
the norm equivalence identifies these subgroups and their weights.
Section 10.14's CompactUnitaryRaw.globalizeSpeh provides a nonzero cohomological finite part,
an algebraic coefficient, the prescribed local dual up to unramified twist, and an unramified
similitude character using Scholze Theorem 10.2. CompactUnitaryRaw.globalizeDiscreteSeries
uses Theorem 10.7 and §6.27. CompactUnitaryRaw.commonParity gives common parity and the
nonzero signed divisor a with dim W = n*a, before positivity of the divided Euler class. -/

/-- Subdiagonal monodromy of the raw special block: N e_j=e_(j+1). -/
def specialMonodromy (k : ℕ) : Matrix (Fin k) (Fin k) ℚ :=
  fun i j => if (i : ℕ) = (j : ℕ) + 1 then 1 else 0

/-- Geometric Frobenius of the raw special block: e_i has eigenvalue q⁻ⁱ.
The actual Frobenius application requires q>0. -/
def specialFrobenius (q : ℚ) (k : ℕ) : Matrix (Fin k) (Fin k) ℚ :=
  Matrix.diagonal fun i => q⁻¹ ^ (i : ℕ)

/-- The required Weil–Deligne covariance, with geometric absolute value q⁻¹. -/
theorem specialFrobenius_mul_monodromy (q : ℚ) (k : ℕ) :
    specialFrobenius q k * specialMonodromy k =
      q⁻¹ • (specialMonodromy k * specialFrobenius q k) := by
  sorry

/-- The raw special monodromy is nilpotent with exponent equal to the block length. -/
theorem specialMonodromy_pow_length (k : ℕ) : specialMonodromy k ^ k = 0 := by
  sorry

/-- A nonempty block has precisely that nilpotence index. -/
theorem specialMonodromy_pow_ne_zero {k : ℕ} (hk : 0 < k) :
    specialMonodromy k ^ (k - 1) ≠ 0 := by
  sorry

/-- The two-dimensional monodromy fixes its orientation. -/
example : specialMonodromy 2 = !![0, 0; 1, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [specialMonodromy]

/-- A one-dimensional block has no monodromy. -/
example : specialMonodromy 1 = 0 := by
  ext i j
  fin_cases i; fin_cases j; simp [specialMonodromy]

/-- The raw two-dimensional Frobenius is diag(1,q⁻¹). -/
example (q : ℚ) : specialFrobenius q 2 = !![1, 0; 0, q⁻¹] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [specialFrobenius, Matrix.diagonal]

/-! ## Layer 11: local unitary packets and global classification
The bounded and extended packets assume the README contract UnitaryClassificationInputs.
GSp₄ classification instead assumes GSp4ClassificationInputs, including its exterior-square,
tensor and Asai transfers and the completed local compatibilities.
Their packet carriers and weighted stabilization identities are specified in README.md.
Section 11.2 at E=F×F uses the relevant singleton on the actual inner group GL_m(D),
with N=m·deg(D) and discrete parameter block dimensions divisible by deg(D).
The nonarchimedean interface is InnerFormWDParameter in §10.31; KMSW §1.6.3 supplies
the archimedean inner-GL interface. Ordinary pure inner twists specialize to split GL_N.
ExtendedUnitaryPacket.split in §11.3 induces from bounded packets on the relevant
inner Levi and retains the induced module with its positive exponents. -/

/-! ## Layer 12: local towers and their cohomology
The marked relative chart and the actual cohomological realizations are README targets.
Section 12.4 represents integral special O_D-module moduli only at level zero.
Drinfeld.level at m≥1 is the generic-fibre O_D-linear torsion-frame cover at ϖ_E^m;
Drinfeld.forgetLevel restricts those frames for m≥r≥0. Its deck quotient is
O_D×/(1+ϖ_E^m O_D). These higher-dimensional formal groups use no Cartier-divisor
level condition; the one-dimensional Lubin–Tate condition belongs to §12.3.
Section 12.1's TowerUntiltChart.unramifiedComparison identifies the ℚ_p and unramified
specializations of the finite-E rings, annuli, curve and divisor with PadicHodgeTheory §7.5,
commuting with pullback, radius restriction and the stated power of Frobenius.
The ramified coefficients, translated mark, Lie quotient and Tate framing belong to §12.1.
Section 12.16's TowerLocallyAnalytic.orbitMapEquiv identifies the tower analytic vectors
with the generic invariant orbit-map carrier on LocallyAnalyticDistributions' stages.
Evaluation at the identity and the orbit map give inverse topological linear maps,
compatible with radius restriction, right translation and the differentiated Lie action. -/

/-! ## Layer 13: pure automorphic transfer and level comparison
The packet and oldform statements require UnitaryClassificationInputs, and GSp₄
classification requires GSp4ClassificationInputs, as well as the automorphic carriers.
Section 13.9's oldform dimensions and their §15.6 export separately assume that Π_w
is tempered at every finite place w; relevance and UnitaryClassificationInputs do not
supply this hypothesis. The infinity Matsushima factor and the finite special-maximal
zero/one calculation use their respective temperedness inputs.
With the fixed Haar measures of §13.7, each raw transferred trace in the Σ_min oldform
product is divided by vol(K_v). Equivalently it is the trace of the transfer of e_Kv.
The Σ_lr zero/one factors and spherical factors are also idempotent traces. -/

/-! ## Layer 14: rational Igusa spectral comparison
Virtual spectral factorization is separate from degree-wise concentration. -/

/-! ## Layer 15: normalization calculations and coherent outputs -/

/-- A finite sum of signed multiplicities and the four remaining trace factors. -/
def comparisonTrace {ι : Type*} (s : Finset ι)
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) : ℚ :=
  ∑ i ∈ s, multiplicity i * coefficient i * localTrace i * auxiliaryTrace i * sphericalTrace i

/-- The additivity identity of §15.1 preserves all four factors while adding virtual multiplicities. -/
theorem comparisonTrace_addMultiplicity {ι : Type*} (s : Finset ι)
    (m₁ m₂ c l a h : ι → ℚ) :
    comparisonTrace s (m₁ + m₂) c l a h =
      comparisonTrace s m₁ c l a h + comparisonTrace s m₂ c l a h := by
  sorry

/-- The merging identity of §15.1 sums multiplicities in each fibre when the remaining
four factors depend only on its image. Empty fibres contribute zero. -/
theorem comparisonTrace_merge {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq κ]
    (f : ι → κ) (m : ι → ℚ) (c l a h : κ → ℚ) :
    comparisonTrace Finset.univ m (c ∘ f) (l ∘ f) (a ∘ f) (h ∘ f) =
      comparisonTrace Finset.univ (fun j => ∑ i with f i = j, m i) c l a h := by
  sorry

/-- The diagonal-trace comparison of §15.1 identifies the finite sum with the matrix trace. -/
theorem comparisonTrace_eq_trace_diagonal {ι : Type*} [Fintype ι] [DecidableEq ι]
    (multiplicity coefficient localTrace auxiliaryTrace sphericalTrace : ι → ℚ) :
    comparisonTrace Finset.univ multiplicity coefficient localTrace auxiliaryTrace sphericalTrace =
      Matrix.trace (Matrix.diagonal fun i =>
        multiplicity i * coefficient i * localTrace i * auxiliaryTrace i * sphericalTrace i) := by
  sorry

/-- The zero-local-factor identity of §15.1 holds for arbitrary signed multiplicities. -/
theorem comparisonTrace_zeroLocal {ι : Type*} (s : Finset ι) (m c a h : ι → ℚ) :
    comparisonTrace s m c (fun _ => 0) a h = 0 := by
  sorry

/-
Further objects and constructions are specified in README.md:
The full inner-form sign API of §1.13 includes kottwitzSign_quasiSplit,
kottwitzSign_quaternion, kottwitzSign_compact_real, kottwitzSign_product and
kottwitzSign_not_rank_parity. Section 6.7 specifies endoscopicCoefficient_iso and endoscopicCoefficient_self_test
for geometric endoscopic data. The classical-llc-normalization
contract is supplied by SmoothRepresentationsOfLocalGroups §SR.5.2.

NonabelianH1, CrossedModuleCohomology, AbelianizedCohomology, InnerTwist,
IntegralZExtension, IsStronglyRegular, stableCentralizer, StablyConj, EndoscopicDatum and its ZPair/classMap,
kappaOrbitalIntegral, stableOrbitalIntegral, globalStableObstruction, UnitaryLieCentralizer,
AData, ChiData, TransferFactor, TwistedTransferFactor, LieTransferFactor, IsTransfer,
eulerPoincareFunction, CurveBundles, LocalLoopGrassmannian,
ChevalleyQuotient, kostantSection, RegularCentralizer, HitchinStack, HitchinBase,
cameralCover, spectralCurve, HitchinPicard, AffineSpringerFibre, WeakAbelianFibration,
StableEllipticDistribution, BaseChangeGroup, BCLMorphism, zetaLMorphism,
twistedLefschetzFunction, endoscopicInfinityFunction, IsCuspidalGroup, IsCuspidalSubset,
CMQuadraticCharacterExtension, TwistedInvariantDistributions, IgusaPELModel,
GIsocrystal, NewtonMap, KottwitzMap, AdmissibleClass, Jb, DecentRepresentative,
NewtonLevi, CentralLeaf, SlopeFiltration, FiniteIgusa, IgusaMonoid, IgusaCohomology,
IgusaRational, AcceptableElement, AcceptableFunction, IgusaCorrespondence, PIC,
NearEquivalence, FPAV, PadicType, CMIsogenyLift, IgusaTriple, EffectiveLevi, IgusaPFunction,
IgusaGlobalFunction, CompactUnitaryRaw, ClassicalNormalization,
DrinfeldDeformationInstance, NearbyTraceFunction, DieudonneNorm, LanglandsJacquet,
ClassicalWeilParameter, PotentiallyAbelianPair, SegmentWDAdapter, RawSpecialBlock2,
ClassicalWDParameter, InnerFormWDParameter, ExtendedUnitaryPacket, TowerDatum,
TowerUntiltChart, LubinTate, Drinfeld, TowerPeriod, TowerInfinity,
TowerCohomology, TowerSector, BasicTowerFibre, UnitaryWeakBC, TransferableLevel,
IgusaTests, NewtonRed, HiggsSections, RegularCentralizerPicard,
SemisimpleCentralizer, TowerLocallyAnalytic, StandardPair, AdmissibleTrace,
AuxiliaryDivisionPEL, FiniteLengthClass, GLIntertwiner, LocalTorusReciprocity, InnerGL,
Invariants, IsAssociated, IsStableDistribution, NearbyCycles, Newvector, PairFactors,
ParabolicInduction, QuasiEL, SpehType, StrictDieudonne and StrictNearbyCycles. Their geometry and representation categories are needed
before their signatures can be stated in Lean.
-/


end TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison
