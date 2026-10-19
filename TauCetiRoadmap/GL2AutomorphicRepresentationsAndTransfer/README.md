# Roadmap: GL₂ automorphic representations and transfer

**Summary.** This roadmap builds the rank-two local and adelic representation theory that connects classical modular forms to automorphic transfer and residual modularity: last-row level and conductor comparisons using supplied newvectors, Whittaker functions and local factors, the classical and Hilbert weight comparisons, quaternionic Jacquet–Langlands, cyclic and solvable base change, non-normal cubic transfer, solvable Artin automorphy, and the characteristic-two modularity theorems. It extends [ModularForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md) to local/adelic GL₂, newvectors, Whittaker models, Jacquet–Langlands, base change, induction and Artin/residual modularity.

The definitive specification is this README. [`Suggested.lean`](Suggested.lean) records suggested
forms of light definitions and milestones over the pinned library carriers; it is not an exhaustive
checklist. These prototypes include admitted proof obligations and admitted constructor and theorem
signatures. Definitions whose construction needs local types, automorphic classes, Whittaker models
or modular cohomology are targets here, with their intended inputs and outputs, API and Checks.

## Scope and ownership

This roadmap owns the GL₂ comparisons in layers R16.1–R16.6 and R17.1–R17.6 below. It builds the
arithmetic character prescription, the specific rank-two trace comparisons, the strong local transfer
identifications, solvable Artin automorphy and residual modularity, and local conductor comparisons
for the supplied classical attachments. It uses existing matrix groups, representation modules, fixed submodules, newforms,
symmetric powers, coefficient twists, idele classes and quaternion algebras.

ModularForms, Layers 0–4, 7, 8, 8G and 8W, owns classical Hecke operators, old/new spaces,
nebentypus, bad-prime eigenproperties, coefficient fields and classical L-functions.
SmoothRepresentationsOfLocalGroups, SR.0–SR.4, owns smooth categories, induction, Whittaker
functionals, types, the Bernstein centre and Satake. AdelicAlgebraicGroups, AA.0–AA.3, owns adelic
points, Haar products, arithmetic quotient measures and anisotropic compactness.
AutomorphicLFunctionsAndLocalFactors representation prerequisites own GLₙ archimedean
modules, globalizations and restricted tensors. AutomorphicSpectralTheory §§0.48–0.50 supplies
the general reductive-group extensions of these constructions.
ArithmeticLocallySymmetricSpaces ALS.F.6 owns automorphic forms and cuspidal classes.
AutomorphicFormsOnReductiveGroups §§7.2–7.3 owns the classical/adelic dictionary, its
inverse, raising and Casimir normalizations, and Hecke and diamond comparisons.
R16.1/finite-level-comparison adapts that dictionary to the matrix and level conventions here;
R16.4/cohomological-rationality compares the supplied finite-part rational models with classical
Hecke fields, and R16.6 compares the supplied primitive correspondence with local newvectors
and conductors. AutomorphicLFunctionsAndLocalFactors, AL.0–AL.4, owns
local Fourier analysis, vector-space and distribution refinements, local factors,
Rankin–Selberg analysis and the general converse theorems. ArithmeticGaloisRepresentations
§2.7 **Global inputs** owns the common scalar adelic Schwartz–Bruhat, Fourier and Poisson theory.
Its `local-constant-gauss-sum`, `standard-test-function-evaluations`,
`hecke-zeta-integral-comparison` and `root-number-product-formula` supply arithmetic
character constants, standard-function Hecke comparisons and the finite-sum root-number identity.
AutomorphicSpectralTheory's `unitary-hecke-functional-equation` supplies the scalar Hecke
functional equation for every unitary idele-class character.
AutomorphicLFunctionsAndLocalFactors AL.1 `rank-one-local-functional-equation` supplies
local zeta integrals, their functional equation and the comparison with those character constants.
AutomorphicLFunctionsAndLocalFactors AL.1 `hecke-l-functional-equation`
supplies the same character equation as the rank-one case of Godement–Jacquet.
AutomorphicSpectralTheory, Layers 0, 2, 4 and 6, owns spectral decomposition, truncation,
trace-class bounds and the generic trace formula. R16.0/local-langlands owns the finite-place
parameter construction. LocalGaloisDeformationRings §2.26.1 owns nonarchimedean
division-algebra Jacquet–Langlands; R17.1/local-quaternionic-comparison consumes its
degree-two specialization and packages the quaternionic parameters and split comparisons.
R17.1/real-quaternionic-comparison owns the real comparison, and
R17.2/quaternionic-orbital-matching owns the matching test functions.
AutomorphicSpectralTheory §§7.0a–7.0c and §7.1 owns the canonical cyclic twisted objects,
local matching, normalized characters, trace comparison, weak cyclic/isobaric base change,
descent, fibres and tower operations, including rank two and specified norm twists.
R17.2 compares its explicit GL₂ ledger and local conventions with those supplied objects;
R17.4 upgrades the same base-change outputs to all-place Weil–Deligne compatibility.
R17.4/metaplectic-adjoint-input owns the theta-integral input
needed for the adjoint lift. R17.4/whittaker-type-adjoint-converse owns the
Whittaker-type-module converse and constituent argument, including the nongeneric boundary.
QuaternionicModularForms §§1.3, 2.1–2.2 and 3.1 owns classical coefficient conventions,
the definite quaternionic form-space functor and its opposite-Hecke action;
R17.3/definite-hilbert-exports owns their comparison with Pan’s spaces and JL spectrum.

ArithmeticGaloisRepresentations, Layers 1–5 and §§7.1–7.2, 7.6, owns continuous representations, lattices,
Weil–Deligne objects, Artin/Swan conductors, finite-image classification, recognition and Galois
powers/adjoints. AlgebraicModularFormsAndSerreWeights, R15.1–R15.6, owns geometric forms,
Hasse invariants, integral Hecke theory, eigenvalue lifting and the classical rank-two
cohomological summand and Galois attachments of R15.5A.1–R15.5A.3. The geometry exports give specified automorphic representations, coefficient modules and split-place
Hecke actions. A geometric realization, an extension with prescribed completions, and a compatible
system are explicit inputs wherever used. The transfer interfaces construct their indicated
restrictions and descents from those data.

## Conventions

Reuse Mathlib `Matrix.GeneralLinearGroup (Fin 2) R`, determinant/scalars/maps, `Matrix.ProjGenLinGroup`, `Representation.invariants` and Haar measure; build adelic quotient measure. `HeckeRing.GL2.Newform` gives newspace, nebentypus, good eigenvalues and a₁=1; ModularForms Layer 4 gives bad eigenproperties. `eq_of_forall_notMem_eigenvalue_eq` fixes level/character; adelic strong multiplicity one compares classes. Hilbert coefficients use `TauCeti.symPowerRep` and Mathlib finite tensors.

`TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` gives algebraic lifting; arithmetic vanishing/continuity is separate. `TauCeti.simple_indFDRep_ofLinearCharacter_iff` requires finite groups and algebraically closed characteristic-zero coefficients; `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` requires a field with a nonzero a satisfying a²≠1.

At finite places O,p,ϖ,q are valuation ring, maximal ideal, uniformizer and residue size; ν(ϖ)=q⁻¹. Upper-Borel induction uses `δ_B^(1/2)`, with `δ_B(diag(a,d))=|a/d|`. K₀(pⁿ) constrains the lower-left entry; K₁(pⁿ) fixes the last row; both equal GL₂(O) at n=0. Right translation gives K₀-character ω(d); transport Casselman's top-left convention by π∨≅π⊗ω⁻¹det. Fix ψ of conductor O and W(1)=1. SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals gives the functional space `Hom_U(V,ψ)` and proves it has dimension one for irreducible infinite-dimensional V. One-dimensional classes have no Whittaker model.

Reciprocity sends ϖ to geometric Φ, `ν_W(Φ)=q⁻¹`. `rec` matches normalized induction; `recᵀ(π)=rec(π)⊗ν_W^(-1/2)` multiplies rank-two Frobenius by √q and preserves N. Factors use `(ker N)^I`; arithmetic-Frobenius eigenvalues must be inverted with the cohomological dual specified. For unitary Satake α,β, T₁=√q(α+β); weight-k roots are `q^((k−1)/2)α` and `q^((k−1)/2)β`. For a classical arithmetic Artin representation ρ, `rec(π_v)≅(ρ|W_Fv)^∨`; the geometric eigenvalues of rec π are the arithmetic eigenvalues of ρ. The centre corresponds to (detρ)⁻¹ under geometric reciprocity, while the classical nebentypus is detρ. Rationality uses `π_alg=π_unitary⊗|det|^(-(k−2)/2)`.

Use full O(2) modules `D_k`, k≥2, with positive-determinant weights ±k; weight one's limit has parameter 1⊕sgn. At complex places `|z|_ℂ=|z|²` (gamma conventions: R16.3). Fix the additive character by trace to ℚ, self-dual measures and additive quotient mass one. Conductor: |Disc(F)|²N(𝔣π). Over ℚ, t=s+(k−1)/2 converts s↔1−s to t↔k−t.

Fix quaternion split-place identifications. Cuspidal JL excludes norm characters; local division characters match Steinberg twists. Use automorphic isomorphism classes. Residual data: coefficient place, residue embedding, lattice, semisimplification. In characteristic two determinant oddness is vacuous and involutions need not be semisimple. Compatible families share a coefficient field and good-place polynomials.

Namespaces: R16.1–R17.2 `TauCeti.GL2Blueprint`; R17.3–R17.6 and arithmetic character lemmas `TauCeti.GL2Transfer`.

## Exact supplier contracts

### From Mathlib

At Mathlib `6b7abb3`, the matrix carrier is `Matrix.GeneralLinearGroup (Fin 2) R`
(`Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs`), with `scalar`, `det`, `map` and `toLin`.
`Matrix.ProjGenLinGroup` and `Matrix.ProjGenLinGroup.mk`
(`Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective`) provide projectivization.
`Representation`, `Representation.comp`, `Representation.invariants`, `Representation.ind` and
`Representation.IsIrreducible` provide algebraic actions, restriction, fixed submodules, induction
and irreducibility. In particular, restriction of a supplied finite type is `Representation.comp`;
there is no second definition of restriction in this roadmap. Smoothness and compact-open
admissibility are stated explicitly when using these carriers.

`IsNonarchimedeanLocalField`, `Valuation.integer (ValuativeRel.valuation F)` and
`IsLocalRing.maximalIdeal` on that valuation ring, with notation from
`Mathlib.Topology.Algebra.Valued.ValuativeRel` fix the
local field, valuation ring and ideal notation. `Ideal`, its powers, `Submonoid.units`, subgroup
maps and `Nat.find` give the congruence subgroups and the least nonzero fixed level.
`MeasureTheory.Measure.haarMeasure` and `haarMeasure_self` in
`Mathlib.MeasureTheory.Measure.Haar.Basic` give local Haar normalization, while the quotient and
restricted Haar products below use AdelicAlgebraicGroups.

`IdeleClassGroup`, `IdeleClassGroup.ofAdicCompletion` and `IdeleClassGroup.ofCompletion` in
`Mathlib.NumberTheory.NumberField.AdeleRing` give the character domain and its full finite
and infinite local maps. `MonoidHom.domRestrict_surjective` in
`Mathlib.GroupTheory.FiniteAbelian.Duality` extends subgroup characters with algebraically closed
coefficients through a finite quotient. `NumberField.Units.mem_torsion` in
`Mathlib.NumberTheory.NumberField.Units.Basic` detects torsion by archimedean absolute values.
These do not assert the arithmetic congruence or full-local prescription theorem.

`Matrix.det_smul` in `Mathlib.LinearAlgebra.Matrix.Determinant.Basic` gives the scalar
determinant identity (uA has determinant u²det A at rank two); this is a supplier, not a new
normalization lemma. `Complex.Gammaℝ_def`, `Complex.Gammaℂ_def` and `Complex.Gammaℝ_mul_Gammaℝ_add_one` in
`Mathlib.Analysis.SpecialFunctions.Gamma.Deligne` fix the gamma factors. `AddCircle` and its
quotient map provide the spectral periodization and the additive Q/Z carrier.
`Matrix.charpoly`, `rootsOfUnity`, `Localization.AtPrime`, `HeightOneSpectrum` and
`Field.absoluteGaloisGroup` supply the algebraic and arithmetic carriers of the lifting
milestones; Brauer-character construction and arithmetic lifting are targets here.

### From Tau Ceti

At Tau Ceti `a91d3aa`, import the following APIs rather than reproducing them.

- `TauCeti.NumberTheory.ModularForms.Newforms.Newform`: `HeckeRing.GL2.Newform`, its
  `toCuspForm`, `χ`, `dirichletLift`, and `qExpansion_coeff_one`. The newform is normalized,
  lies in the existing newspace, and is an eigenform away from its level. The complete bad-prime
  theory is supplied by ModularForms Layer 4.
- `TauCeti.NumberTheory.ModularForms.Newforms.StrongMultiplicityOne`:
  `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` compares newforms at a fixed level,
  weight and nebentypus outside a finite set. It does not compare adelic classes at arbitrary levels.
- `TauCeti.NumberTheory.ModularForms.LFunction.Basic`: `CuspForm.LSeries_qExpansion_coeff_eq`
  gives the convergent-domain width-one Mellin comparison for positive weight and the stated
  right-half-plane hypothesis. Analytic extension and transfer use their named targets below.
- `TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower`: `TauCeti.symPowerRep` supplies
  the symmetric powers of the standard matrix action.
  `TauCeti.RepresentationTheory.CharacterTwist`: `Representation.charTwist` supplies determinant
  twists on the same module. The Hilbert weight factors specialize these APIs; they do not define
  a new symmetric-power or twisting construction.
- `TauCeti.RepresentationTheory.Induction.Mackey.LinearCharacter`:
  `TauCeti.simple_indFDRep_ofLinearCharacter_iff` is the finite-group Mackey criterion for a
  linear character of a normal subgroup over algebraically closed characteristic-zero coefficients.
  The quadratic restriction target also covers infinite groups and characteristic two.
- `TauCeti.RepresentationTheory.ProjectiveRepresentation.SchurMultiplier`:
  `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` gives algebraic lifting
  when the factor-set class vanishes. The arithmetic vanishing, continuity and finite image
  are additional targets, not consequences of algebraic lifting alone.
- `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Solvable`:
  `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` assumes a field with a nonzero a
  satisfying a²≠1. It must not be applied to F₂ or F₃.
- `TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus`:
  `TauCeti.GlobalNumberFields.Modulus`, `Modulus.support`, `IsCongrOne` and
  `congruenceSubgroup` give the existing modulus and multiplicative congruence predicates.
  `TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Basic`:
  `TauCeti.GlobalNumberFields.HeckeCharacter` is the continuous character of Mathlib's idele
  class group, with no additional carrier.
- `TauCeti.Algebra.Quaternion.Split`: `TauCeti.QuaternionAlgebra.oneEquivMatrix` identifies
  `QuaternionAlgebra K 1 0 1` with 2×2 matrices. Global realization with prescribed nonsplit
  places and comparison of two quaternion algebras use the contracts below.

### From roadmaps

ReductiveGroupsPartII, RG2.0 and RG2.4, supplies rational point topologies, integral points,
Iwasawa/Cartan coordinates and the local modulus. AdelicAlgebraicGroups, AA.0
`restricted-haar-product`, §§1.1–1.2 affine and adelic points, §1.5 compact open levels, §§2.2–2.3
quotient measures and §3.4 compact anisotropic quotients, supplies their adelic and measure
counterparts. R16.1 constructs central-character L² from these quotient measures. SmoothRepresentationsOfLocalGroups, SR.2.3 `whittaker-functionals` and
its GL₂ multiplicity-one statement, supplies the nonzero Whittaker functional and uniqueness for
irreducible infinite-dimensional GL₂ representations. SR.0 supplies the smooth fixed-character
category; SR.3a.1 compact representations and SR.3.2 cuspidal splitting supply the projectivity
argument. SR.1 and SR.4 supply Hecke carriers, Bernstein centre and spherical parameters.

AutomorphicLFunctionsAndLocalFactors, Representation prerequisites
`archimedean-smooth-representations`, `archimedean-gln-parameters` and
`restricted-tensor-realizations`, supply archimedean categories, normalized induction, Weil
parameters, Casselman–Wallach globalizations, Flath factorization and algebraic/Hilbert tensor
realizations for GLₙ. AutomorphicSpectralTheory §§0.48–0.50 (`real_representation_foundations`,
`smooth_frechet_globalization`, `restricted_tensor_factorization`) extends these constructions
to general reductive groups. ArithmeticLocallySymmetricSpaces ALS.F.6
`LocallySymmetric.AutomorphicForm`, `.cuspForm` and `.cuspidalRepresentation` supplies the
function spaces and their admissible constituents; ALS.F.7 supplies relative Lie cohomology.
AutomorphicFormsOnReductiveGroups §§7.2–7.3 supplies adelization and its inverse over ℚ,
including the lowering criterion for every k≥1, the raising and Casimir formulas, the unitary
scalar normalization, the actual cuspidal newform occurrence and the good-prime Hecke and
diamond actions. R16.1/finite-level-comparison transports these maps to the matrix realization
and levels here; its general-number-field restriction uses the supplied double-coset spaces.
AL/finite-part-rationality supplies the regular-algebraic finite-part rational model and
coefficient conjugates; R16.4/cohomological-rationality constructs their GL₂ Hecke-field comparison.
R16.6 specializes the supplied primitive dictionary to the AL.2 newvector tensor and compares
its exact conductor and local factors, including the weight-one limit.
Isobaric GL₂ means a cusp class or
the Langlands quotient attached to two Hecke characters; the GL₃ isobaric carrier used in transfer
is assembled from cuspidal blocks by normalized induction. Use AL.3's isobaric uniqueness.

ArithmeticGaloisRepresentations §2.7 **Global inputs** supplies the scalar adelic
Schwartz–Bruhat space and tensor API, self-dual Fourier transform and Poisson summation.
Its [local-constant-gauss-sum](../ArithmeticGaloisRepresentations/README.md#local-constant-gauss-sum)
supplies the arithmetic character constants as finite sums;
[standard-test-function-evaluations](../ArithmeticGaloisRepresentations/README.md#standard-test-function-evaluations)
supplies the local standard integrals;
[hecke-zeta-integral-comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison)
compares their global tensor integral with the Hecke completion on algebraic norm twists,
inheriting continuation and reflection from LFunctions Layers 5–6;
[root-number-product-formula](../ArithmeticGaloisRepresentations/README.md#root-number-product-formula)
compares Hecke's Gauss-sum root number with the product of local constants as a finite-sum identity.
AutomorphicSpectralTheory's
[unitary-hecke-functional-equation](../AutomorphicSpectralTheory/README.md#unitary-hecke-functional-equation)
supplies scalar Hecke continuation and the functional equation for every unitary idele-class
character, with quasi-characters obtained by norm twists, and identifies the equation's constant
with that Gauss-sum root number.
AutomorphicLFunctionsAndLocalFactors AL.1
[rank-one-local-functional-equation](../AutomorphicLFunctionsAndLocalFactors/README.md#rank-one-local-functional-equation)
supplies local zeta integrals, continuation and the functional equation, identifying its epsilon
factor with ArithmeticGaloisRepresentations §2.7's `tateLocalConstant`.
AutomorphicLFunctionsAndLocalFactors AL.1
[hecke-l-functional-equation](../AutomorphicLFunctionsAndLocalFactors/README.md#hecke-l-functional-equation)
supplies the scalar continuation and reflected equation for all unitary Hecke characters
through the rank-one case of Godement–Jacquet.
AutomorphicLFunctionsAndLocalFactors, AL.0 `local-schwartz-bruhat-space` and its
vector-space Fourier/Poisson refinements, AL.1 `canonical-archimedean-factor` and
distribution refinements, AL.2 standard factors and `archimedean-standard-epsilon`,
and AL.4 `local-parameter-comparison` fix the local and GLₙ factor conventions.
AL.2 [GL₂ newvectors](../AutomorphicLFunctionsAndLocalFactors/README.md#gl2-newvectors)
supplies the local K₀/K₁ subgroups, their integral embeddings, compact/open and
lower-right quotient properties, the integral-scalar fixed-space comparison, the least
last-row level, minimal fixed lines, Whittaker normalization and essential spherical-twist
tests used in R16.1–R16.6. Its targets “Existence of a nonzero newvector level”, “The
newvector conductor exponent”, “Casselman’s newvector theorem” and “The normalized
Whittaker newvector” use these same groups.
AL.3 `gln-fourier-expansion`, `global-whittaker-factorization`, `global-multiplicity-one`,
`strong-multiplicity-one`, `isobaric-strong-multiplicity-one`, `rs-global-poles`,
`rs-boundary-nonvanishing`, `rs-global-functional-equation`,
`rs-local-convergence` and `rs-local-factor` are consumed with the hypotheses stated below.
AL.3 `gln-converse-full-rank` at n=2 needs every GL₁ quasicharacter twist. Its
`gln-converse-reduced-rank` at n=3 supplies the GL₃ input; an omitted finite set gives only an
outside-set match. The highly ramified family for generic candidates is obtained by the
R17.4 fill-and-twist deduction. The adjoint application with possibly nongeneric local quotients instead uses
R17.4/whittaker-type-adjoint-converse; genericity is a conclusion of its constituent argument.

AutomorphicSpectralTheory, §3.6a `rs-vertical-strip-bounds`, §6.9 orbital integrals and
Layers 0, 2, 4, 6, supplies Rankin–Selberg strip bounds, trace class,
Eisenstein/intertwining analytic extension, spectral completeness, truncation, compact trace formula
and Euler–Poincaré functions. The finite-place LLC and its factor comparison are constructed
in R16.0/local-langlands. LocalGaloisDeformationRings §2.26.1 supplies
`DivisionAlgebraTypes.jacquetLanglands` for central division algebras of degree d over
nonarchimedean local fields with characteristic-zero splitting coefficients. At d=2,
consume its bijection between irreducible smooth D× classes and essentially square-integrable
GL₂(F) classes, directed here from D× to GL₂(F), with matching elliptic character sign
`(−1)^(d−1) = −1`. Its character characterization supplies central-character equality,
contragredients and smooth `χ ∘ Nrd` versus `χ ∘ det` twists. The inverse on these
classes is supplied; its zero extension outside the discrete-series domain gives no
irreducible D× preimage. R17.1 packages this specialization with the GL₂ parameters
and constructs the split and real comparisons; R17.2/quaternionic-orbital-matching
constructs its matching functions. AutomorphicSpectralTheory §§7.0a–7.0c supplies cyclic twisted
objects, local matching and the trace distribution; §7.1 supplies weak cyclic/isobaric
base change, descent, fibres and towers. R17.2/cyclic-local-matching identifies the rank-two
normalizations, and R17.2 compares its six-term ledger and correction terms with that distribution.

ArithmeticGaloisRepresentations, §2.4 (arithmetic Weil–Deligne adapter), Layer 3
(Artin/Swan conductors, with the Weil–Deligne correction in §3.3), Layers 1, 4, 5 and §§7.1–7.2, 7.6 supplies arithmetic
parameters, lattices, classification, recognition and adjoints. Its arithmetic Frobenius convention
is compared with the geometric convention here through the stated dual and twist.
AlgebraicModularFormsAndSerreWeights, R15.1–R15.3, R15.5
`deligne-serre-eigenvalue-lifting-lemma` and `reduction-to-weight-at-least-two-and-to-a-true-eigenform`,
R15.5A.1–R15.5A.3 classical cohomology and Galois attachments,
and R15.6 `residual-modularity-witness`, supplies the geometric residual-form interface.

[QuaternionicModularForms](https://github.com/WilliamCoram/TauCetiRoadmap/blob/fe4c14dbe4381c62726cce20430bb84799a5a2e0/TauCetiRoadmap/QuaternionicModularForms/README.md),
§1.3 (classical coefficient dictionary), §2.1 (abstract forms and stabilizer-invariant
evaluation), §2.2 (classical definite forms) and §3.1 (opposite-Hecke action), supplies the
canonical finite-level form-space and operator interfaces used in R17.3/definite-hilbert-exports.
Consume these classical targets independently of its split-p analytic-weight theory.
R17.3 supplies the division-p algebraic coefficient adapter, level colimit, Pan comparison,
norm-character decomposition and JL spectrum. These are target-level supplier contracts.

GlobalNumberFields, Layers 2, 7–10, supplies moduli, ray subgroups, finite ray quotients and
characters. ClassFieldTheory, Layers 7, 9–11, supplies reciprocity, local Weil groups and the global
Brauer sequence; R17.5/global-weil-group constructs the global Weil carrier. ClassFieldTheory Layer 10 `eq_zero_of_localInv_eq_zero` is the injectivity needed to compare
quaternion classes. GlobalQuadraticForms, §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair`, supplies
prescribed Hilbert signs; QuadraticFormInvariants, Layer 2, supplies quaternion splitting and
RepresentationTheory/SemisimpleAlgebras, Layer 6, supplies the unique division representative.
The actual quaternion algebra isomorphism and exchanged-place comparison are R17.1 targets.
ProfiniteCohomology, Layer 10, supplies continuous cochains and connecting maps.
ArithmeticGaloisRepresentations §7.6 supplies idelic torsion-character extension, finite-kernel
lifting obstruction and Tate vanishing with trivial discrete Q/Z coefficients. NumberFieldArithmetic, Layer 5, LocalFieldsRamification, Layer 1,
and Chebotarev, Layer 10, supply completions/valuations, Hensel lifting and inert primes.

AlgebraicModularFormsAndSerreWeights R15.5A.1 supplies the classical primitive rank-two
parabolic summand, its coefficient de Rham realization, Hodge sequence and Hecke projector;
R15.5A.2–R15.5A.3 supplies the higher-weight λ-adic and weight-one Artin attachments.
R17.6.1 identifies the supplied primitive summand with its adelic Hom in the tower.
EtaleCohomologyFoundations §§0.6, 0.8, 0.11 and F.0–F.6 supplies scheme constructible
cohomology, compact support, traces and duality; ClassicalAdicEtaleCohomology Layers 8–9
supplies the adic coefficient operations used in R17.6.3a–R17.6.3b.
ComplexComparisonPartII §§C6.3–C6.6 supplies equivariant finite- and adic-coefficient
Artin comparison. LefschetzPencilsAndVanishingCycles LPV.0 and LPV.2 supplies nearby
cycles, variation and Picard–Lefschetz, retaining the monodromy map. R17.6.3a–R17.6.4
constructs the proper-curve correspondence trace, contracting local terms and ramified
conductor comparison.

Related integral GL₂ level conventions are described in the
[FLT local-level discussion](https://leanprover-community.github.io/archive/stream/416277-FLT/topic/Rolling.20update.html).
Its tame scalar-residue condition differs from the last-row K₁ condition here; the common
matrix-unit and coefficient-map vocabulary is used throughout.

## How to read the build

R16.1 fixes matrix, measure, finite-level and character comparisons. Construct R16.2.1's
analytic classification from SR induction, Jacquet and Whittaker theory without LLC. Use AL.2's
local integral/factor prefix through standard-local-l-factor, then its GL₂ newvector targets;
use AL.3's local Rankin–Selberg factor prefix before R16.0/local-langlands. R16.3 computes
explicit parameters on that correspondence. R16.4–R16.6 constructs the Hecke-field comparison
and the classical/Hilbert dictionary from the named automorphic suppliers.
R17.1 consumes LocalGaloisDeformationRings §2.26.1 at degree two and constructs the
quaternionic parameter, split and real comparisons; R17.2–R17.3 constructs the matching
test functions and global transfer.

After R16.1 construct R17.5/global-weil-group. Within R17.4 first consume
AutomorphicSpectralTheory §7.1 weak prime-cyclic transfer, descent, cuspidality and fibres;
compare its rank-two normalizations and split-place components without extraordinary WD compatibility. Construct
quadratic induction, the metaplectic adjoint input, the Whittaker-type adjoint converse and
constituent argument, the outside-S GL₂ converse, weak cubic transfer and GL₃ applications next. In R17.5 build finite primitive globalization and
strong solvable Artin theorem using these weak transfers. Then prove R17.4/local-compatibility,
including extraordinary components, and strengthen prime-cyclic and solvable transfer to all-place
WD restriction. The cubic all-place comparison then identifies the weak output with the full-parameter converse construction;
the weak phase specifies no ramified local Langlands components. R17.6 compares the supplied classical parabolic summand with the adelic tower and constructs
the correspondence trace inputs before conductor comparison, and determinant-untwist before solvable-dihedral.
Katz coprime-level descent precedes unramified-katz. The layer numbers group mathematics; this
order determines which inputs are available to each proof.

## Layer R16.0: Finite-place parameters

<a id="r16-0-local-langlands"></a>

### R16.0.1 The finite-place local Langlands interface

For every finite extension `F/ℚ_p` and n=2, construct the bijection between irreducible admissible
smooth complex GL₂(F) classes and Frobenius-semisimple rank-two Weil–Deligne parameters on
ArithmeticGaloisRepresentations §2.4’s carrier. Normalize upper-Borel induction by `δ_B^(1/2)`
and reciprocity by geometric Frobenius. The correspondence matches determinants, contragredients,
and character twists. Retain four separate interfaces:

- For `rec π = (r_π,N_π)`, the inertial type is the isomorphism class of `r_π|I_F`.
- ArithmeticGaloisRepresentations Layer 3 defines `Sw(r_π)` and `a(r_π)` from the
  ramification groups. Its §3.3 gives
  `a(r_π,N_π) = a(r_π) + dim V^{I_F} − dim (ker N_π)^{I_F}`.
- The nilpotent monodromy operator satisfies `r_π(w)N_πr_π(w)⁻¹ = ν_W(w)N_π`.
- For generic π, the automorphic conductor `c(π)` is the least last-row fixed level,
  supplied by AutomorphicLFunctionsAndLocalFactors AL.2 GL₂ newvectors.

Prove `c(π) = a(rec π)` on generic classes and, separately, compatibility of all
character-twisted standard L/ε-factors with the self-dual measure. R16.3.5 records
the ε-exponent formula as a comparison theorem with the independently defined conductors.
The correspondence includes one-dimensional nongeneric quotients and primitive dyadic supercuspidals. Construct
its inverse; Henniart's twisted-factor characterization remains the uniqueness theorem.
R16.2–R16.3 gives the explicit conductor comparisons on this interface.

The semisimple Weil parameter and statements of semisimple local-global compatibility do
not require ε-compatibility as an input. Downstream,
AutomorphicGaloisRepresentationsPartII's `semisimpleParameter`, constructed from its
geometric spectral action over its specified coefficient fields with `ℓ≠p`, provides an
ε-independent semisimple parameter. For a continuous `ℓ`-adic `ρ_v`, the comparison
`WD(ρ_v)^ss ≅ r_π^ss` uses only the semisimple Weil parts, with the chosen
characteristic-zero coefficient identification and normalization. This statement does not
determine monodromy. Identifying monodromy and proving the character-twisted factor
comparison are explicit obligations for the full Weil–Deligne correspondence and full
local-global compatibility.

For n=3 construct the local parameter classes needed by the adjoint and cubic inductions,
using the GL₃ correspondence: sums of Weil characters, induced rank-three Weil parameters,
and Ad of rank-two parameters, with their Langlands quotients. Prove standard and GL₂×GL₃
pair-factor compatibility for these parameters, including induction’s lambda constants and
monodromy. AL.4/local-parameter-comparison consumes this actual compatibility; it is not its
supplier. At infinity use AL’s archimedean-gln-parameters. Inner-form rank-two parameters are
assigned by R17.1/local-quaternionic-comparison using the degree-two correspondence
supplied by LocalGaloisDeformationRings §2.26.1.

API: parameter and inverse commute with isomorphism, dual and twist; unramified normalized
induction gives its Satake parameter; standard and pair factors equal the WD factors.

**Checks.** The unramified generic principal series has its two nonzero Satake roots;
Steinberg has trivial inertial type but rank-one N, conductor one and a degree-one L-factor;
its semisimple Weil part with N set to zero instead has conductor zero, so the semisimple
comparison alone does not determine the conductor. A primitive dyadic supercuspidal has
N=0, Artin conductor three and Swan conductor one in the R16.3.3 example, and an irreducible
Weil parameter that is not induced from a quadratic character.

*Needs:* SmoothRepresentationsOfLocalGroups SR.0–SR.4; ClassFieldTheory Layer 9 (local Weil
carrier); ArithmeticGaloisRepresentations §§2.4–2.7 (WD objects and factors) and Layer 3
(ramification conductors and §3.3's WD correction);
AutomorphicLFunctionsAndLocalFactors AL.1/rank-one-local-functional-equation,
AL.2/standard-local-l-factor and AL.3's local
integral/factor prefix (rs-local-integrals, rs-local-convergence, rs-local-factor and
rs-local-functional-equation), before newvector test applications. Twisted-factor uniqueness
is proved here from the cited local converse arguments. The inner-form parameter assignment
uses LocalGaloisDeformationRings §2.26.1 through R17.1/local-quaternionic-comparison.

*Source:* [bh06], §25.2, pp.157–159, §27, pp.170–176, §33.1, pp.212–213, §§44.3–44.6, pp.269–273,
and §50.3, pp.312–313; [henniart83], Theorem 2.10, pp.20–21, Proposition 3.2, p.30;
[henniart02], Theorem 1.5, p.590 and §2, pp.592–596, for pair-factor characterization;
[deligne73], §8.12, p.572, for the WD conductor; [fargues-scholze], Definition IX.0.4
and Theorem IX.0.5, pp.319–320, for the semisimple construction and its compatibilities.

## Layer R16.1: Local and adelic groups

AutomorphicLFunctionsAndLocalFactors AL.2 [GL₂ newvectors](../AutomorphicLFunctionsAndLocalFactors/README.md#gl2-newvectors)
owns the lower-left and last-row congruence subgroups, their coefficient embeddings in
GL₂(Fᵥ), compactness, openness, level-zero identities and subgroup relations. Use its
K₀(pⁿ)={g∈GL₂(O):g₂₁∈pⁿ} and
K₁(pⁿ)={g∈GL₂(O):g₂₁∈pⁿ, g₂₂−1∈pⁿ} directly in every local and adelic comparison below.
The lower-right quotient and integral-scalar decomposition are supplied by that same section.

<a id="r16-1-local-adelic-compact-comparison"></a>

### R16.1.3 GL₂ local and adelic compact subgroups

For a number field F, identify the supplied reductive-group points GL₂(Fᵥ) with
matrix units, taking GL₂(Oᵥ), O(2) and U(2) as the standard compact subgroups at finite,
real and complex places. Under AdelicAlgebraicGroups AA.1's restricted-product
identification, compare the following finite-level subgroup with its matrix description:
for a finite set S of finite places, depths nᵥ≥0 and a choice of the supplied K₀ or K₁ at
each v∈S, take that subgroup at v and GL₂(Oᵥ) outside S. It consists exactly of matrices whose components lie in GL₂(Oᵥ) at every finite place
and satisfy the chosen local entry conditions at S. Its compactness
and openness follow from the supplied local properties and AA.1.5. Compare extension by
identity at a single place and inclusion under increasing depths with the corresponding
restricted-product maps. The product with O(2) and U(2) at infinity is the full adelic
compact subgroup for this level. Use the product-level and local-embedding interfaces of
AdelicAlgebraicGroups AA.1.5; AA.5.2 gives their rational principal-level specialization.
There is one local-to-adelic Hecke element `heckeGen v`, the extension by identity of
`diag(ϖ_v,1)`. Its double coset is independent of the uniformizer. At a maximal compact place compare its
`q_v+1` right cosets with the coset-system and invariant-space action of
AutomorphicFormsOnReductiveGroups §0.5. All finite-level Hecke comparisons use this element
and the supplied K₀/K₁, rather than a second choice of generators or congruence groups.
The invariant-space Hecke interface follows the design used by the Imperial College London FLT project.

**Checks.**
- With S empty, or every nᵥ=0, the finite subgroup is ∏ᵥ GL₂(Oᵥ).
- At a single place of depth one, extending the upper unipotent (1 1;0 1) by identity
  gives a member for either choice; extending the lower unipotent (1 0;1 1) does not.
- The upper-unipotent member at a K₁ place is not the identity modulo pᵥ, distinguishing
  this level from principal congruence; diag(u,1) also belongs for every integral unit u.
  If u−1∉pᵥ, scalar u belongs at a K₀ place but not at a K₁ place; this scalar distinction
  has no witness in residue field F₂, where K₀(pᵥ)=K₁(pᵥ).
- Away from the level, the coset of `heckeGen v` has `q_v+1` right cosets; at residue size two there are three.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors (the local K₀/K₁ subgroup
package); Mathlib `Matrix.GeneralLinearGroup`; AdelicAlgebraicGroups §§1.1–1.2 and §1.5;
ReductiveGroupsPartII RG2.0; AutomorphicSpectralTheory §§0.48–0.49; AutomorphicFormsOnReductiveGroups §0.5; AdelicAlgebraicGroups AA.5.2.

*Source:* [jl70], §2 p. 12, compact-subgroup convention; AdelicAlgebraicGroups AA.1.5
for the restricted-product topology, specialized to these supplied local levels.

<a id="r16-1-iwasawa-cartan"></a>

### R16.1.4 Rank-two Iwasawa and Cartan coordinates

Specialize RG2.4 at finite places and AutomorphicSpectralTheory §§0.48–0.49 at infinity: `GL₂(Fv)=B(Fv)K_v`. At a finite place every double coset `K_v g K_v` has a unique representative diag(ϖᵃ,ϖᵇ) with a≥b integers. With upper triangular B and normalized induction, δB(diag(a,d))=|a/d|v. At infinity use positive singular values and O(2)/U(2).

*Needs:* R16.1/local-adelic-compact-comparison; ReductiveGroupsPartII RG2.4; Mathlib `Matrix.GeneralLinearGroup.det`; AutomorphicSpectralTheory §§0.48–0.49.

*Source:* [jl70], §3 formula (3.1) and following compact realization, p. 46.

<a id="r16-1-haar-quotient-comparison"></a>

### R16.1.5 Haar and central-character quotient comparison

Fix local measures `dg_v` on GL₂(Fv), vol(GL₂(Ov))=1 at finite places outside a specified finite set; form AdelicAlgebraicGroups AA.0’s restricted Haar product. GL₂ is unimodular. For a continuous unitary idele-class character ω use AdelicAlgebraicGroups §§2.2–2.3 quotient measure and construct the central-character L² space on `Z(𝔸)GL₂(F)\GL₂(𝔸)`: f(zγg)=ω(z)f(g), with finite integral of |f|². The matrix and generic reductive realizations identify isometrically and equivariantly for right translation. Measures on elliptic centralizers are fixed separately, not inferred from `dg_v`.

The intended carrier `CentralCharacterL2(F, ω, dg, dz)` is the Hilbert space of measurable
sections of the Hermitian line bundle on `Z(𝔸)GL₂(F)\GL₂(𝔸)` associated to the character
zγ↦ω(z), modulo equality almost everywhere, with ∫|f|² finite. The unitary character is
trivial on F×, making that character well-defined on the closed subgroup Z(𝔸)GL₂(F).
The norm uses the supplied quotient measure, so changing a measurable trivialization does not
change it. Build completeness and the inner product, continuous unitary right translation,
change-of-Haar normalization, and the identification with equivariant functions. This carrier
specializes the quotient construction; it does not introduce a second quotient measure.
The API `centralCharacterL2_inner`, `centralCharacterL2_complete`,
`centralCharacterL2_rightTranslation`, `centralCharacterL2_trivial` and
`centralCharacterL2_measureScale` includes the conjugate-first inner product, completeness,
unitary translation, trivial-character identification and scaling of squared norm by a positive
measure scalar.

**Checks.** For ω=1 it is the scalar L² space on the quotient. For ω(z)=−1 a nonzero constant
representative fails equivariance, whereas its absolute square still descends. Scaling the
quotient Haar measure by two doubles the squared norm, while right translation preserves it.
A nonunitary ω does not define this Hermitian norm on the central quotient.

*Needs:* R16.1/local-adelic-compact-comparison; AdelicAlgebraicGroups AA.0/restricted-haar-product; AdelicAlgebraicGroups §§2.2–2.3; Mathlib `MeasureTheory.Measure.haarMeasure`; Mathlib `MeasureTheory.Measure.haarMeasure_self`.

*Source:* [jl70], §10 pp. 168–169 and §16 pp. 264–267, fixed central character and quotient measures.

<a id="r16-1-finite-level-comparison"></a>

### R16.1.6 Finite-level automorphic functions

For a number field F and compact open Kf, take the Kf-fixed subspace of
ArithmeticLocallySymmetricSpaces ALS.F.6 automorphic forms with chosen central character,
finite K∞ types and finite-codimension infinitesimal-character ideal. Specialize
AdelicAlgebraicGroups §§3.4 and 4.4's double-coset spaces to GL₂. For representatives tᵢ,
restriction `f↦(g∞↦f(tᵢg∞))` identifies this space with the direct sum on
`Γᵢ\GL₂(F∞)`, where `Γᵢ=GL₂(F)∩tᵢKf tᵢ⁻¹`. The summands carry the transported
central-character, growth and differential conditions. This adapter identifies inverse
reconstruction, finite Hecke actions and archimedean differentiation on the supplied spaces.

Over ℚ, N>0, k≥1 and `χ(−1)=(−1)^k`, use
AutomorphicFormsOnReductiveGroups §7.2's adelization and inverse on the χ-character
subspace at K₀(N). Identify these with the preceding restriction maps and the Γ₁(N)
χ-subspace. The conclusion is the same holomorphic form precisely for the supplied right
SO(2)-weight k and lowering equation, and the same cuspidality condition. The unitary
central character is `χ⁻¹` on finite units and trivial on positive real scalars; the
negative-determinant component supplies the conjugate weight. Transport the supplier's
raising, Casimir and slash-scalar conventions and §7.3's Hecke and diamond actions through
this identification. The maps and operator formulas are those of the supplier.

**Checks.** Level one over ℚ has a single finite double coset. At a split finite prime the
transported right double-coset action is the supplier's classical Hecke comparison. Weight
one retains the lowering condition in the full-O(2) limit without a `Sym^(−1)` coefficient.
At weight two the supplied Casimir scalar is zero; for a level character value i, right
translation acts by −i and the classical diamond by i, detecting the inverse convention.

*Needs:* R16.1/haar-quotient-comparison; AutomorphicFormsOnReductiveGroups §§7.2–7.3; AdelicAlgebraicGroups §§3.4 and 4.4; ArithmeticLocallySymmetricSpaces ALS.F.6; ArithmeticGaloisRepresentations §2.7 (Global inputs: scalar adelic Schwartz–Bruhat space); SmoothRepresentationsOfLocalGroups SR.1.

*Source:* [jl70], §10, Definition 10.2 and cusp-form definition, pp.169–170; §5, Theorem 5.11, pp.85–86; [getz15], §6.4 Lemma 6.19 and Remark 6.20, p.33, and §6.5, pp.33–34. Operator and scalar conventions are those of AutomorphicFormsOnReductiveGroups §§7.2–7.3.

<a id="r16-1-chevalley-congruence"></a>

### R16.1.7 Congruences detecting finite-index subgroups of S-units

For a number field M, finitely generated subgroup E⊂M×, integer n>0 and finite set T of finite places, there is a modulus m with empty infinite part and support disjoint from T such that E∩congruenceSubgroup(m)⊂Eⁿ. Consequently, for every finite-index H⊂E one can require this intersection to lie in H: use n=exponent(E/H). These are `chevalley_power_congruence` and `chevalley_finiteIndex_congruence` on GlobalNumberFields' existing `Modulus` and `IsCongrOne`. The subsidiary `fg_of_units_outside_finset` proves finite generation of a subgroup whose elements are units outside one finite set S. Identify E with a subgroup of HeightsAndUnits §4.2’s finite-S unit group using the unit-outside-S hypothesis, then apply `Set.unit_fg` and finite generation of subgroups of finitely generated abelian groups.

Proof: The saturation E₀={y∈M×: yᵃ∈E for some a>0} lies in a finitely generated S-unit group. Hence E₀/E is a finite torsion group. If u kills this quotient, an nu-th root in M of x∈E has its u-th power in E. It therefore suffices to detect powers in M, with exponent nu.

Reduce r to prime powers pᵉ and combine their moduli. For p=2 with i∉M, work first in M(i) with exponent `2^(e+k)`, where 2ᵏ is its largest 2-power root-of-unity order. If `y^(2^(e+k))∈M`, the least f with `y^(2^f)∈M` satisfies f≤k: quadratic conjugation gives a primitive `2^f`-th root as σ(y)/y. Thus `y^(2^k)∈M` gives the required root. This enlargement handles the dyadic exception.

For odd p, or i∈M, descend pᵉ-th roots from `M(μ_{pᵉ})` one cyclotomic step at a time. The initial degree divides p−1, so the norm and Bézout give descent. In a degree-p step `M(μ_{pʰ})⊂M(μ_{pʰ⁺¹})`, write `σ(y)/y=ζ_{pᵉ}ᶠ` and σ(ζ)=ζᵍ. Since g≡1 mod pʰ and σᵖ(y)=y, pᵉ divides `f(1+g+⋯+g^(p−1))`. That sum is p modulo p²; for p=2 the hypothesis i∈M ensures h≥2. Hence `σ(y)/y∈μ_p`. Multiply y by a power of `ζ_{pʰ⁺¹}` to make it invariant without changing `y^(pᵉ)`.

Over the cyclotomic field containing `μ_{pᵉ}`, the generator-root extension L is abelian of p-power degree. Choose a prime inert in each degree-p subextension, avoiding r, generator supports, ramification and rational primes below T. Their rational primes give a modulus. Congruence to 1 gives a local pᵉ-th root by Hensel. Here all roots have the same global root field, because `μ_{pᵉ}` is in the base. A nontrivial root field contains a degree-p subextension, contradicting the chosen inert prime. Cyclotomic descent and the dyadic enlargement return the root to M.

*Needs:* GlobalNumberFields Layer 7 (`Modulus`, `IsCongrOne`); Mathlib `NumberField.Units` and finitely generated abelian-group subgroups; NumberFieldArithmetic Layer 5 (valuations); Chebotarev Layer 10; LocalFieldsRamification Layer 1 (Hensel). HeightsAndUnits §4.2 `Set.unit_fg` supplies S-unit finite generation; the arbitrary-subgroup adapter and cyclotomic deductions are owned here.

*Source:* [chevalley51], Theorem 1 p.36, primary proof §§1–5 pp.36–39.

**Checks.** Exponent one permits the unit modulus. For E=⟨2⟩⊂ℚ× and n=2, congruence modulo 3 detects exactly the even powers, while T={2} is avoided. For n=3, modulo 7 detects the powers divisible by three; imposing a modulus supported at 2 would fail the avoidance condition.

<a id="r16-1-full-local-character-prescription"></a>

### R16.1.8 Finite Hecke characters with prescribed full local components

For any number field M, finite set S of finite places and continuous finite-image `χ_v:M_v×→ℂ×`, there exists a continuous finite-image `Ψ:C_M→ℂ×` restricting to `χ_v` on every **full** `M_v×` and trivial on every `M_w×` at infinity. Auxiliary finite ramification and growth of character order are allowed. `finite_hecke_full_local_prescription` uses Mathlib's `IdeleClassGroup` and `IdeleClassGroup.ofAdicCompletion`/`ofCompletion`; Tau Ceti's `HeckeCharacter` abbreviates the same carrier.

For the finite-quotient step, `finite_character_extension_iff` has the following exact contract:
G is a topological abelian group, H,N are subgroups, N is open of finite index, and χ:H→ℂ×
is a homomorphism. A continuous extension Ψ:G→ℂ× agreeing on H, killing N and having finite
image of exponent dividing exponent(G/N) exists if and only if χ kills H∩N. This is a group
statement with N supplied; it does not assert an arithmetic congruence subgroup exists.
**Checks.** Trivial χ extends trivially even when G is infinite; a subgroup character of a finite
discrete abelian G extends by taking N trivial; a nontrivial χ value on H∩N rules out extension.

Proof: In the S-units E let `H=ker∏χ_v`. Chevalley gives m away S with E-congruences contained in H. Put `B=M_∞××∏_S M_v××∏_{v∉S}U_v(m)`. Then `θ=∏χ_v` kills B∩M×, exactly these S-unit congruences. Descend θ to D=image B in `C_M` and set N=image kerθ. The idele-class quotient is open, so N is open. Depths killed by `χ_v` at S, together with m, give a ray subgroup inside N; its finite quotient bounds `[C_M:N]`. Apply `finite_character_extension_iff` to D,N. Pullback agrees on all of B, including uniformizers and infinity, and has finite image. No prescribed character order is retained.

For one local quasi-character α, its restriction to compact units has finite image: continuity and the no-small-subgroups property of ℂ× kill an open unit subgroup. Choose s with `q^{−s}=α(ϖ)`, write `α=ν|·|^s` with ν finite-image, extend ν by the theorem and multiply by the global norm character. Simultaneous quasi-character prescription needs compatible norm exponents and is not inferred from this one-place consequence. Multiplying a supplied infinity-type character by Ψ preserves its infinity components, as required below.

**Checks.** The uniformizer, auxiliary-ramification and order-growth examples in R17.5/tunnell-primitive-globalization distinguish the full local domain, auxiliary ramification and order growth.

*Needs:* R16.1/chevalley-congruence; GlobalNumberFields Layers 7 and 9 (idele ray subgroup and finite ray quotient); Mathlib `MonoidHom.domRestrict_surjective`; `finite_character_extension_iff`.

*Source:* [cht08], Lemma 4.1.1 and proof, p. 116; [chevalley51], Theorem 1, pp. 36–40. Finite image follows from the explicit ray quotient argument above.


### Examples

Over ℚ, take level supported at 5 and depth one. The upper unipotent (1,1;0,1),
extended by identity at the other finite places, belongs to either supplied level; the
lower unipotent (1,0;1,1) does not. The diagonal (2,1) at 5 belongs to the last-row
level and is not the identity modulo 5. At depth zero both local factors are GL₂(ℤ₅).

### Dependencies

AutomorphicFormsOnReductiveGroups §§7.2–7.3; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; ReductiveGroupsPartII RG2.0/RG2.4; ArithmeticGaloisRepresentations §2.7 (Global inputs); AdelicAlgebraicGroups AA.0–AA.3; ArithmeticLocallySymmetricSpaces ALS.F.6; AutomorphicSpectralTheory §§0.48–0.50; GlobalNumberFields Layers 2 and 7–10; Chebotarev Layer 10.

## Layer R16.2: Local representations and newvectors

<a id="r16-2-local-classification"></a>

### R16.2.1 Explicit nonarchimedean classification

Over any nonarchimedean characteristic-zero local field F, with ν=|·|F and complex coefficients, normalized induction `I(χ₁,χ₂)=Ind_B^G(χ₁⊗χ₂)` is irreducible iff χ₁χ₂⁻¹≠ν,ν⁻¹. Its central character is χ₁χ₂. If χ₁=χν¹ᐟ², χ₂=χν⁻¹ᐟ², it has the essentially Steinberg subrepresentation St⊗χdet and one-dimensional quotient χdet; reversing the order reverses the sub/quotient. Every irreducible admissible representation is a character of determinant, irreducible principal series, essentially Steinberg, or supercuspidal. Infinite-dimensional irreducibles are generic; one-dimensional characters are not. These are analytic calculations in the SmoothRepresentationsOfLocalGroups SR.2 induction/Jacquet and SR.2.3 Whittaker carriers, including residue characteristic two; they precede LLC.

Smooth, irreducible, admissible complex representations; χᵢ smooth quasicharacters.

The `ℚ_p` function models `localPrincipalSeriesSpace` and `localPrincipalSeriesRep` specialize
SR.2 normalized smooth induction on Mathlib `Representation`: functions on `GL₂(ℚ_p)` with
upper-Borel covariance `δ_B^(1/2)χ₁χ₂` and an open subgroup of right invariance.
`localNormCharacter` and `localNormCharacter_eval` give `|·|^t` with the normalized p-adic norm;
`localPrincipalSeriesRep_eval` identifies the action as f(x)↦f(xg).
`localSteinbergConstants` is the constant line in `I(ν^(−1/2),ν^(1/2))`;
`localSteinbergTwist` is its quotient representation with the determinant twist, and
`localSteinbergTwist_quotient` identifies that quotient action. These use the same smooth
induction and subquotient constructions, rather than a finite-group principal series.
The characterizing milestones `localPrincipalSeries_irreducible_iff`,
`localPrincipalSeries_central` and `localSteinbergTwist_irreducible` state the
irreducibility criterion, product central character and irreducibility of the
Steinberg quotient. The irreducibility statements take smooth inducing characters.
`localPrincipalSeries_unramified_conductor` and
`localSteinbergTwist_unramified_conductor` identify the least fixed levels in the
unramified models. `localSteinbergTwist_ramified_conductor` identifies that level
as 2a for a character of any positive conductor a, with triviality on `1+p^a`
and nontriviality on `1+p^(a−1)` as hypotheses.

**Checks.** The unramified generic induced function model has conductor zero; its
flag-function quotient for an unramified character has conductor one; a character trivial on
`1+p^a` but nontrivial on `1+p^(a−1)`, a≥2, gives Steinberg-twist conductor 2a.
Each Check includes existence of a nonzero last-row fixed vector in the actual function or
quotient model, followed by the stated least level; a zero model fails the existence assertion.

*Needs:* R16.1/iwasawa-cartan; SmoothRepresentationsOfLocalGroups SR.2; SmoothRepresentationsOfLocalGroups SR.3; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals. The conductor Checks consume AL.2/GL₂ newvectors after the analytic classification.

*Source:* [casselman73], p. 305, principal/special classification; [bh06], §9.10,
exact sequence (9.10.3), p. 68, and §9.11, irreducibility criterion and classification,
p. 69. The least-level comparisons use [casselman73], Theorem 1, p. 302 and the
epsilon remark, p. 307, through AL.2/GL₂ newvectors.

AutomorphicLFunctionsAndLocalFactors AL.2 [GL₂ newvectors](../AutomorphicLFunctionsAndLocalFactors/README.md#gl2-newvectors)
supplies existence of a nonzero last-row fixed level, its least conductor exponent,
Casselman’s dimension formula and minimal K₀-character line, value-one Whittaker normalization,
and the essential-vector restriction and GL₂×GL₁ spherical-twist test. Use those supplied
subgroups directly; R16.1/local-adelic-compact-comparison identifies their finite-adelic products.

<a id="r16-2-spherical-whittaker-values"></a>

### R16.2.6 The spherical Whittaker values

Define `sphericalValues (α β : ℂ) (m : ℕ) : ℂ` by `Σ_{i=0}^m α^iβ^{m−i}`. For an unramified generic principal series with unitary-normalized Satake parameters α=χ₁(ϖ), β=χ₂(ϖ), define h₀=1, h₁=α+β and hₘ₊₂=(α+β)hₘ₊₁−αβhₘ. The normalized spherical Whittaker function has `W(diag(ϖᵐ,1))=q^{-m/2}hₘ` for m≥0 and zero for m<0. This polynomial recurrence includes α=β; the expression `(α^{m+1}−β^{m+1})/(α−β)` is used only when α≠β.

Prove spherical Whittaker uniqueness in the following intrinsic form. For ψ of conductor O,
a function with left ψ-unipotent covariance, right GL₂(O)-invariance, specified central
character ω and the spherical `heckeGen v` eigenvalue is determined by W(1).
Iwasawa coordinates reduce it to diagonal values; covariance forces the negative values
to vanish and the Hecke recurrence determines the nonnegative ones. Denote this target
`sphericalWhittaker_unique`. In the generic unramified representation the normalized
function exists and W(1)=1. A zero initial value gives the zero function.
For `H(Y)=Σ_{m≥0}h_m Y^m`, prove `sphericalValues_generatingFunction` as the formal
identity `(1 − (α+β)Y + αβY²)H(Y)=1`; analytically the series equals the reciprocal
polynomial when `|αY|<1` and `|βY|<1`.

Prove the following API.
- `sphericalValues_zero`: h₀(α,β)=1.
- `sphericalValues_recurrence`: hₘ₊₂=(α+β)hₘ₊₁−αβhₘ.
- `sphericalValues_swap`: hₘ(α,β)=hₘ(β,α).
- `sphericalValues_equal`: hₘ(α,α)=(m+1)αᵐ.

**Checks.**
- h₁=α+β.
- h₂=α²+αβ+β².
- h₂(1,1)=3, not an undefined quotient.
- At α=β=1 the generating function is `(1−Y)⁻²`; the coefficient of Y² is three.
- The zero initial value produces zero everywhere; a determinant character has no nonzero
  ψ-Whittaker function and cannot supply the normalized generic case.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; SmoothRepresentationsOfLocalGroups SR.4; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals.

*Source:* [jl70], §3, Proposition 3.5 and proof, pp. 52–54; Iwasawa coordinates and the same Hecke recurrence give the function-level uniqueness. Expand the two unramified Euler factors in the normalized Mellin transform L(s,χ₁)L(s,χ₂), with W(1)=1; coefficient comparison gives the values and recurrence.

<a id="r16-2-iwahori-oldforms"></a>

### R16.2.7 The characteristic-zero Iwahori oldforms

Let π be complex, irreducible, smooth, admissible, infinite-dimensional and spherical over a characteristic-zero nonarchimedean local field F. Write K=GL₂(O), I=K₀(p). Then dim πᴷ=1 and dim πᴵ=2. With vol(I)=1, U=[I diag(ϖ,1) I] and spherical eigenvalue λ=√q(α+β), every nonzero spherical v is cyclic for U on πᴵ. Its polynomial is X²−λX+qαβ, including α=β.

**Fixed-space comparison.** AL.2/GL₂ newvectors supplies compactness and openness for the admissibility inputs and identifies the K₀ and K₁ fixed submodules at every level when integral scalar units act trivially. Its scalar decomposition uses the lower-right unit at positive level and scalar 1 at zero. In an irreducible spherical representation, these scalars fix a nonzero spherical vector and hence its GL₂(F)-span. If an integral scalar acts by a≠1 and K₁ has a nonzero fixed vector, K₀ has none; this tests the scalar-action hypothesis.

Choose residue representatives A⊂O; set gₐ=(ϖ a;0 1). Then U=∑ₐπ(gₐ), with |A|=q. Set s=diag(1,ϖ), c=ω(ϖ)=αβ. On πᴷ, the spherical double coset acts as T=U+π(s). From Tv=λv and π(ϖI₂)=c, the basis (v,π(s)v) gives Uv=λv−π(s)v and Uπ(s)v=qc v. Thus πᴵ=span(v,Uv), Uv is not proportional to v, and U²−λU+qc=0 on πᴵ. `iwahoriOldforms` uses these matrices and Mathlib invariant submodules. In the suggested signatures, K and I are supplied subgroups with explicit membership equalities to the images of GL₂(O) and the lower-left level-one subgroup; the concrete-model conductor Checks likewise take the supplied last-row family with its membership equality.

**Checks.** For (2 1;−1 0), U−1 is nonzero and square-zero, testing repeated roots. The matrix (5 6;−1 0) satisfies X²−5X+6, and fails X²−5X+3. For unramified χdet on ℂ both invariant spaces are the whole line, of dimension one, even when χ≠1 (`iwahoriDeterminantCharacter`). Thus “not trivial” cannot replace infinite dimensionality.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; R16.2/spherical-whittaker-values; SmoothRepresentationsOfLocalGroups SR.1; SmoothRepresentationsOfLocalGroups SR.4; Mathlib `Representation.invariants`.

*Source:* [cg20], §1.3, pp. 805–806; [casselman73], Corollary to the Proof, p. 306.

<a id="r16-2-supercuspidal-kirillov"></a>

### R16.2.8 The supercuspidal Kirillov comparison

For irreducible supercuspidal π with central character ω and nontrivial ψ, restricting the imported Whittaker function W to diag(x,1), x∈F×, identifies its Kirillov realization with `C_c^∞(F×,ℂ)`. For b=(a u;0 d), the action is (π(b)f)(x)=ω(d)ψ(xu/d)f(xa/d). The Weyl action is the imported local functional equation; it is not a freely chosen transform. For the DLB variant, F=ℚp, ω=1 and π is defined over a finite extension L/ℚp. Put `L∞=colim_n(L⊗_{ℚp}ℚp(μ_{pⁿ}))` and `Γ=Gal(ℚp(μ_{p∞})/ℚp)`, acting on the second factor. Give the smooth mirabolic realization on compactly supported locally constant functions φ:ℚp×→L∞ with `φ(ax)=σ_a(φ(x))` for a∈ℤp×, where `σ_a` is the cyclotomic action. After scalar extension to L∞ this is the ordinary Kirillov model for a compatible p-power-root additive character. Coefficient descent is additional to complex multiplicity one; This comparison concerns smooth representations and their coefficient descent.

Smooth characteristic-zero supercuspidal; additive-character and central-character choices visible.

*Needs:* R16.2/local-classification; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals; AutomorphicLFunctionsAndLocalFactors AL.0/local-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors AL.2.

*Source:* [casselman73], p. 302, equation (1.2). [dlb17], §7.5, Remark 7.10, p. 39; §11.2, proof of Theorem 11.7, p. 62, for the L∞/Γ smooth comparison.

<a id="r16-2-henniart-unicity"></a>

### R16.2.9 Henniart’s unicity of supercuspidal types

A supercuspidal inertial class s of GL₂(F) has a unique irreducible GL₂(O)-type σ, occurring once in every unramified twist π⊗χdet. If σ occurs in an irreducible admissible π′, then π′≅π⊗χdet for unramified χ. Import types/inertial equivalence from SmoothRepresentationsOfLocalGroups SR.3/R16.0/local-langlands; arbitrary nonminimal K-constituents need not be unique.

Characteristic-zero algebraically closed coefficients; nonarchimedean F, including dyadic fields.

*Needs:* R16.2/local-classification; SmoothRepresentationsOfLocalGroups SR.3; R16.0/local-langlands.

*Source:* [bm02], Appendix A.1.4–A.1.5(1), pp. 75–76; A.3.

<a id="r16-2-supercuspidal-projective"></a>

### R16.2.10 Supercuspidals in a fixed central-character category

A supercuspidal complex representation of GL₂(F) with fixed smooth central character ω is projective in the abelian category of smooth representations on which the center acts by ω. The DLB application is F=ℚp, ω=1, and characteristic-zero L coefficients with the required scalar extension. The category fixes ω and has characteristic-zero coefficients.

On SmoothRepresentationsOfLocalGroups SR.0's fixed-ω category of complex smooth representations of G=GL₂(F), π is irreducible admissible and supercuspidal: every matrix coefficient with a functional in the smooth dual has compact support modulo the scalar centre. For any equivariant surjection q:σ→τ and intertwiner f:π→τ, construct an intertwiner h:π→σ with qh=f. The other representations need not be admissible or irreducible. In particular every surjection onto π splits. SmoothRepresentationsOfLocalGroups SR.3.2's supercuspidal decomposition and coefficient projector give the lift; fixing ω makes the characteristic-zero block semisimple by restricting unramified twists to those with trivial square on the centre. The L-coefficient comparison needs scalar descent. This imposes no normed or locally analytic topology.

*Needs:* R16.2/henniart-unicity; SmoothRepresentationsOfLocalGroups
SmoothRepresentationsOfLocalGroups SR.0 (smooth category), SmoothRepresentationsOfLocalGroups SR.3a.1 (compact representations) and
SmoothRepresentationsOfLocalGroups SR.3.2 (cuspidal splitting). This target specializes their complex smooth
representation theory to the fixed-character GL₂ category.

*Source:* [dlb17], p. 64, footnote 52, for the fixed-character projectivity
application. [bz76], Theorem 3.21, pp. 34–35, for the coefficient
characterization; Theorem 2.44, p. 28, and Proposition 3.28, pp. 36–37,
for the decomposition used by the supercuspidal block argument.

<a id="r16-2-cdt-vexing-type"></a>

### R16.2.11 The Conrad–Diamond–Taylor vexing type

Construct `cdtVexingType` on the actual finite quotient and character data below, with its coefficient lattice; its inputs include CDT’s set S and membership of x in S; its output is the representation of the specified `U_x/V_x`. Let x≠ℓ be a vexing prime: x≡−1 mod ℓ, residual local rank-two representation irreducible but its inertia restriction reducible; its conductor `c_x=2n`. For the unramified quadratic extension E/ℚ_x with nontrivial automorphism σ, take a smooth character θ with `a(θ/θ^σ)=a(θ)=n≥1`, where a is the conductor exponent on E×. Thus θ is regular (`θ≠θ^σ`) and no norm-character twist lowers its conductor. Both selector branches take this conductor equality as an explicit input, in addition to the vexing-prime conditions. Construct Θ(θ), a finite-group representation of GL₂(ℤ/xⁿℤ), and choose a stable O-lattice for a characteristic-zero coefficient field containing its values. For x∈T(ρ)∖S, take `U_x=GL₂(ℤ_x)`, `V_x=U(xⁿ)`, and `σ_x=Θ(θ)`. For x∈T(ρ)∩S, take `U_x=U₀(x)`, `V_x=U(xⁿ)`, and `σ_x=Θ(θ)|U_x/V_x`. The U₀ branch carries x∈S as a hypothesis; retain the full compact representation separately. The larger GL₂ quotient representation Wσx in CG18 restricts to the U₀ selector in that branch.

x and ℓ distinct primes; `a(θ/θ^σ)=a(θ)=n≥1`; coefficient field contains values; choose an invariant lattice.

Prove the following API.
- Restriction of Θ(θ) uses the supplied `Representation.comp`; identify the resulting selector with the chosen full-compact or U₀ branch of CDT §5.1.
- Prove that the chosen O-lattice is stable and scalar extension recovers Θ(θ).
- Prove that an unramified twist leaves the compact type and its selector unchanged.

**Checks.**
- With x∉S the selector is the full Θ(θ); with x∈S its domain is U₀(x)/U(xⁿ). The lattice tensored with the coefficient field is isomorphic to the corresponding type.
- A local representation with inertial characters not `θ,θ^Frob` has no occurrence of the full Θ(θ) type.
- π and π⊗ξdet for unramified ξ have equal Θ(θ) occurrence multiplicity.
- At x=5, ℓ=3, let θ₀ be inflated from a character of exact order eight on 𝔽₂₅×, with θ₀(5)=1, and let λ:ℚ₅×→μ₅ have conductor exponent two. For `θ=θ₀(λ∘N_{E/ℚ₅})`, `a(θ)=2` but `θ/θ^σ=θ₀^(−4)` has conductor exponent one. It is regular and its residual induction satisfies the vexing-prime conditions, but it is excluded by the selector’s conductor hypothesis.

*Needs:* R16.2/henniart-unicity; R16.0/local-langlands; EtaleCohomologyFoundations §F.4.0, Stable lattices (`exists_stable_lattice_iff`, realized in ArithmeticGaloisRepresentations §1.6): embed the finite characteristic-zero type in a p-adic coefficient field, apply the compact-closure criterion, and descend the finite orbit span to the specified coefficient DVR.

*Source:* [cdt99], §§3.1–3.2 (the character and conductor hypotheses), Lemma 3.2.1 and §5.1 p. 18 (the two selectors); [cg18], §3.9.2 construction Wσx.

<a id="r16-2-iwahori-center"></a>

### R16.2.12 The GL₂ Iwahori center

For the upper Iwahori I and a characteristic-zero coefficient ring in which q and q+1 are invertible, normalize vol(I)=1 and `eK=1_K/vol(K)`. Put `U₀=1_{I diag(ϖ,ϖ) I}` and `U₁=1_{I diag(ϖ,1) I}`. The center of H(G,I) is the Laurent polynomial algebra in `U₀^{±1}` and z₁=U₁+qU₀U₁⁻¹. Multiplication by eK identifies it with the spherical algebra H(G,K), sending U₀ to T₀ and z₁ to T₁, with normalized spherical identity eK. Coefficient extensions used in BCGP invert p and the required idempotent denominators. The rank-independent Bernstein center and its parahoric comparison are imported from SmoothRepresentationsOfLocalGroups SR.4; the target here is the rank-two calculation.

q is a unit; eK requires the I-index q+1 to be a unit; U₁ has its usual invertibility in the affine Hecke algebra.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; SmoothRepresentationsOfLocalGroups SR.1; SmoothRepresentationsOfLocalGroups SR.4.

*Source:* [bcgp21], Lemma 2.4.15, pp. 178–179; HKP §4.6 (4.6.1); [hkp10], §2.3 Lemma 2.3.1; §4.6 equation (4.6.1).

<a id="r16-2-archimedean-classification"></a>

### R16.2.13 The explicit archimedean GL₂ cases

Specialize AL’s archimedean-gln-parameters and AutomorphicSpectralTheory §§0.48–0.49’s Casselman–Wallach globalizations. Over ℝ write `χᵢ=sgn^{εᵢ}|·|^{sᵢ}`, εᵢ∈{0,1}, and order Re(s₁−s₂)≥0. Normalized induction is reducible exactly when r=s₁−s₂ is a nonzero integer with r−(ε₁−ε₂) odd. For r>0 its submodule is `D_{r+1}⊗|det|^{(s₁+s₂)/2}` and its Langlands quotient has dimension r; reversing the order reverses the exact sequence. At r=0 with opposite parities, induction is the irreducible full-O(2) weight-one limit, although its positive-determinant restriction splits. The raising/lowering coefficients r+1±n locate the breaks; reflection exchanges the two tails. For m≥1, `Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t})` gives `D_{m+1}⊗|det|^t`. For m=0 the parameter splits.

Over ℂ order the real norm exponents likewise. Induction is reducible exactly when `χ₁χ₂⁻¹=z^p z̄^q` with p,q positive integers, or both negative integers. In the positive case the quotient has dimension pq; the infinite-dimensional submodule has SU(2)-types n≥p+q, n≡p+q mod2. Both constituents are Langlands quotients for suitable character pairs. There is no discrete series modulo centre. Construct the GL₂ unitary classification in these carriers: real unitary principal series, complementary series `χ|·|^t,χ|·|^(−t)` for unitary χ and 0<t<1/2, unitary discrete-series twists and determinant characters; over ℂ, unitary principal series, the same norm complementary range and unitary determinant characters. The complementary characters have equal angular/sign parts. Prove this by invariant Hermitian forms on the explicit K-type models; ordering alone does not imply unitarity.

**Checks.** Real ratio |·| gives the one-dimensional quotient and D₂ submodule; ratio sgn gives the irreducible weight-one limit; complex ratio z z̄ gives a one-dimensional quotient, whereas z z̄⁻¹ is irreducible.

*Needs:* AutomorphicLFunctionsAndLocalFactors/archimedean-gln-parameters; AutomorphicSpectralTheory §§0.48–0.49; RepresentationTheory/CompactGroups (K-type Hermitian forms).

*Source:* [jl70-ubc], §5 Lemmas 5.6–10 and Theorem 5.11, pp.83–87; §6 Lemma 6.1 and Theorem 6.2, pp.111–113 (UBC retypeset pagination).


### Examples

At conductor c, the first three fixed dimensions are 1,2,3; below c they vanish. At c=0 the Weyl matrix is integral but leaves K₀(p), and a scalar with nonidentity residue lies in K₀(p) but not K₁(p). Such a scalar need not exist over residue field F₂. The repeated-root Iwahori matrix (2,1;−1,0) has nonzero square-zero U−1.

### Dependencies

R16.1; SmoothRepresentationsOfLocalGroups SR.0–SR.4; R16.0/local-langlands; ArithmeticGaloisRepresentations Layer 1.

## Layer R16.3: Local parameters and factors

<a id="r16-3-principal-series-parameter"></a>

### R16.3.1 Principal-series parameters and factors

For F/ℚp finite, with `Art_F:F×≃W_Fᵃᵇ` the topological Weil-group reciprocity isomorphism normalized by `Art_F(ϖ)=Φ` geometric and ν(ϖ)=q⁻¹, `rec(I(χ₁,χ₂))=(χ₁∘Art_F⁻¹)⊕(χ₂∘Art_F⁻¹)`, N=0, for an irreducible normalized principal series. Thus `det rec=ωπ∘Art_F⁻¹` and L(s,π)=L(s,χ₁)L(s,χ₂). A ramified character contributes 1. At the reducible ratio `ν^{±1}`, this is the parameter of the one-dimensional Langlands quotient; the generic Steinberg constituent instead has nonzero N as below. The statement uses Frobenius-semisimple Weil–Deligne parameters, not semisimplification that discards N.

Characteristic-zero nonarchimedean F; `χ₁χ₂⁻¹≠ν^{±1}` in the principal-series assertion. `Art_F⁻¹` is evaluated on the topological Weil abelianization supplied by CFT Layer9, not on the absolute Galois abelianization of Layer7.

*Needs:* R16.2/local-classification; R16.0/local-langlands; ArithmeticGaloisRepresentations §2.4; ClassFieldTheory Layer 7; AutomorphicLFunctionsAndLocalFactors AL.1; AutomorphicLFunctionsAndLocalFactors AL.2; ClassFieldTheory Layer 9.

*Source:* [nt26], §1.2 p. 8, ArtK and recK.

<a id="r16-3-steinberg-monodromy"></a>

### R16.3.2 Steinberg monodromy and its factors

For π=St⊗χdet, choose a basis e₁,e₂ of the existing rank-two parameter with Ne₂=e₁, Ne₁=0 and r(Φ)=diag(αq⁻¹ᐟ²,αq¹ᐟ²), α=χ(ϖ). For general w the diagonal characters are `χ_Wν_W^{1/2},χ_Wν_W^{−1/2}`, so `r(w)Nr(w)⁻¹=ν_W(w)N`. This gives `det r=χ_W²`, L(s,π)=L(s+1/2,χ), and a(π)=1 when χ is unramified, 2a(χ) otherwise. In particular the invariant kernel of N, not all inertia invariants of r, defines L. An unramified twist preserves N and the conductor.

Geometric Frobenius convention; choose the positive real square root of q for unitary normalization.

*Needs:* R16.3/principal-series-parameter; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; R16.0/local-langlands; ArithmeticGaloisRepresentations §2.4; ArithmeticGaloisRepresentations §3.3; AutomorphicLFunctionsAndLocalFactors AL.2.

*Source:* [casselman73], p. 307 epsilon remark and special-representation calculation.

<a id="r16-3-supercuspidal-parameter"></a>

### R16.3.3 Supercuspidal parameters including wild cases

rec identifies supercuspidal GL₂(F) representations with irreducible two-dimensional Weil representations, with N=0; determinants, character twists, conductors and L/epsilon factors agree with the existing parameter conventions. Such a parameter has no inertia-fixed vector, hence its standard L-factor is 1. A quadratic induction gives a dihedral example when `θ≠θ^σ`, but this is not an exhaustive description at dyadic places: primitive wild parameters remain in the R16.0/local-langlands carrier and use the full Swan conductor.

*Needs:* R16.2/supercuspidal-kirillov; R16.0/local-langlands; ArithmeticGaloisRepresentations §2.4; ArithmeticGaloisRepresentations §3.3; AutomorphicLFunctionsAndLocalFactors AL.2. The quaternionic transfer Check uses LocalGaloisDeformationRings §2.26.1 through R17.1/local-quaternionic-comparison and R17.2/quaternionic-orbital-matching.

*Source:* [nt26], §2 after Definition 2.4, p. 11.

The R16.0/local-langlands correspondence must include the fully local dyadic existence and bijectivity arguments of [bh06], Theorem 50.3 pp.309–313 and Theorem 52.1 pp.316–323. Minimal primitive parameters become imprimitive over a tame cubic extension; descend their stratum and type character, compare cubed ε-factors, and remove the cube ambiguity using the independently computed 2-power root-of-unity bound. For octahedral bijectivity, compare type-character depth and low-level twisted ε-ratios over the normal closure, then use the norm map on the relevant unit graded piece. The finite orbit counts give surjectivity from injectivity. This imports local LLC; compatibility of tame lifting with Weil restriction is a separate statement ([bh06], §52.9 p.324).

*Primitive dyadic test.* Take F=ℚ₂, the chain order A=((ℤ₂,ℤ₂),(2ℤ₂,ℤ₂)), its radical P, and α=((0,−1/2),(1,0)). Then α²=−1/2 and (A,1,α) is a ramified simple stratum. Choose an additive character ψ₁ nontrivial on ℤ₂ and trivial on 2ℤ₂. On `U¹_A=1+P` put `ψ_α(1+x)=ψ₁(tr(αx))`. Set E=F[α] and `J=E×U¹_A`. Extend `ψ_α|U¹_E` to a finite-order character φ of E× and define `Λ(eu)=φ(e)ψ_α(u)`; the intertwining group is J, so `π=c-Ind_J^{GL₂(F)}Λ` is irreducible supercuspidal. This uses SmoothRepresentationsOfLocalGroups SR.2's compact induction, not finite-group induction. Its normalized level is 1/2. The explicit local-constant computation gives exponent 1 for ψ₁; replacing ψ₁(x) by ψ₁(2x), which has the roadmap's conductor ℤ₂, adds 2. Thus a(π)=3, `a(rec π)=3`, N=0 and Swan(rec π)=3−2=1. All ramification breaks of this irreducible parameter coincide, so its positive upper break is 1/2.

Every ramified quadratic extension of ℚ₂ has different exponent at least 2. The ordinary-case criterion would require 1≥3d, where d is that exponent minus 1; this is impossible. Hence rec π is primitive, despite the quadratic field E used to construct its compact type. The type field is not a field inducing its Weil parameter. After R17.1, transfer π to the local quaternion division algebra by R17.1/local-quaternionic-comparison. A normalized supercuspidal matrix coefficient and its R17.2/quaternionic-orbital-matching matching test have trace 1 on π and its quaternionic partner, with the elliptic orbital sign −1. Test a=3 and Swan=1; test L(s,π)=1 with N=0; test failure of every quadratic-induction parameter description. These tests reject both the tame-dihedral shortcut and replacing wild conductor by Steinberg monodromy.

*Proof inputs.* [bh06], §15.1 intertwining theorem p.105; §15.3 p.106; §15.6 Proposition 1 pp.108–109; §25.2 pp.157–159; §24.3 pp.149–150; §44.3 pp.269–270 and §44.4–6 pp.270–273. The quadratic different bound is LocalFieldsRamification Layer 1; Artin/Swan and equal-break statements are ArithmeticGaloisRepresentations §§3.1–3.6. R16.0/local-langlands constructs the full LLC; the matrix-coefficient transfer Check uses R17.1 and R17.2/quaternionic-orbital-matching after they are built.

<a id="r16-3-tate-unitary-normalization"></a>

### R16.3.4 The Tate and unitary normalization bridge

For rank two `recᵀ_F(π)=rec_F(π⊗ν^{-1/2})=rec_F(π)⊗ν_W^{-1/2}`. This multiplies geometric Frobenius by √q and determinant by `ν_W^{-1}`, preserves N and conductor, and shifts `L(s,recᵀπ)=L(s−1/2,rec π)`, likewise epsilon with fixed ψ/measures. Thus `det recᵀπ=ωπν_W^{-1}`. Arithmetic Frobenius inversion affects the whole WD datum, including its N relation, and differs from this half-twist.

*Needs:* R16.3/principal-series-parameter; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.0/local-langlands; ArithmeticGaloisRepresentations §2.4; AutomorphicLFunctionsAndLocalFactors AL.2.

*Source:* [nt26], §1.2 p. 8, normalization identity.

<a id="r16-3-conductor-epsilon-comparison"></a>

### R16.3.5 Conductor, twists and additive-character change

Let `F/ℚ_p` be finite and π a generic irreducible admissible smooth complex representation
of GL₂(F). Its inertial type is `r_π|I_F`, its monodromy is `N_π`, its Artin/Swan conductors
come from ArithmeticGaloisRepresentations Layer 3, and its automorphic conductor `c(π)`
is the least n with nonzero last-row `K₁(pⁿ)` invariants. These definitions are independent
of epsilon factors. Prove the conductor comparison `c(π) = a(r_π,N_π)`, where
`a(r_π,N_π) = a(r_π) + dim V^{I_F} − dim (ker N_π)^{I_F}`; the value is unchanged for recᵀ.

Separately, with ψ of conductor O and self-dual additive measure, prove
`ε(s,π,ψ) = ε(1/2,π,ψ) q^{−c(π)(s−1/2)}` using the normalized
AutomorphicLFunctionsAndLocalFactors AL.2 epsilon factors. For `ψ_a(x)=ψ(ax)`,
`ε(s,π,ψ_a)=ωπ(a)|a|^{2s−1}ε(s,π,ψ)`; the measure is changed to the corresponding
self-dual one. An unramified twist by `ν^t` replaces s by s+t and leaves the inertial type,
monodromy and conductor unchanged. For a ramified χ, use the full tensor-parameter
conductor; `c(π⊗χdet)` is not generally `c(π)+2a(χ)`.

For sufficiently ramified χ, prove the stability formula
`ε(s,π⊗χdet,ψ)=ω_π(c_χ) ε(s,χ,ψ)²` and vanishing of the twisted L-factors
of `π⊗χdet` and its contragredient. Here c_χ is chosen with valuation `a(χ)+n(ψ)` and
`χ(1+x)=ψ(x/c_χ)` on deep units; the conductor threshold depends on π and ψ.
This is the explicit local constant used in R17.4/outside-s-gl2-converse, and the
rank-one constants come from AutomorphicLFunctionsAndLocalFactors AL.1 and
ArithmeticGaloisRepresentations §2.7. No formula for arbitrary low-conductor twists
is inferred from this stability statement.

**Checks.**

- An unramified generic principal series has trivial inertial type, N=0 and `c=a=0`.
- Unramified Steinberg has the same trivial inertial type but rank-one N and `c=a=1`;
  deleting N changes a to zero. Its epsilon exponent is one for ψ of conductor O.
- For `St⊗χdet` with `a(χ)>0`, both inertia-invariant spaces in the monodromy correction
  vanish, and `c=a=2a(χ)`. Substituting `dim ker N` for `dim (ker N)^{I_F}` gives the wrong value.
- The primitive dyadic example of R16.3.3 has N=0, Swan conductor one and `c=a=3`;
  changing ψ alters the epsilon factor while leaving both conductors and the inertial type fixed.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.3/tate-unitary-normalization; ArithmeticGaloisRepresentations Layer 3, especially §3.3; AutomorphicLFunctionsAndLocalFactors AL.1/rank-one-local-functional-equation; AutomorphicLFunctionsAndLocalFactors AL.2.

*Source:* [casselman73], p. 307 remark following the Corollary to the Proof;
[deligne73], §8.12, p.572, conductor and local-constant formulas. For highly ramified stability use [cogdell-fields], Lecture 6 §5, pp.50–51.

<a id="r16-3-archimedean-factor-comparison"></a>

### R16.3.6 The archimedean GL₂ factors

Use `Γℝ(s)=π^{−s/2}Γ(s/2)`, `Γℂ(s)=2(2π)^{−s}Γ(s)`. For a real character `sign^ε|·|^u` the factor is Γℝ(s+u+ε). For `Ind_{ℂ×}^{Wℝ}((z/|z|)^m|z|^{2t})`, m≥1, it is Γℂ(s+t+m/2); thus `L(s,D_k)=Γℂ(s+(k−1)/2)`. At m=0 its split parameter gives Γℝ(s+t)Γℝ(s+t+1)=Γℂ(s+t). A complex character `(z/|z|)^m|z|^{2t}` gives Γℂ(s+t+|m|/2); rank-two factors multiply. For ψℝ(x)=exp(2πix), real-character epsilon is `i^ε` and induced epsilon is `i^{m+1}`. For ψℂ=ψℝ∘Trℂ/ℝ, complex angular weight m gives `i^{|m|}`, by AutomorphicLFunctionsAndLocalFactors AL.2/archimedean-standard-epsilon. Norm twists leave these constants unchanged. Checks: Γℂ(1)=π⁻¹, Γℝ(1)Γℝ(2)=Γℂ(1), and Γℂ(2)=(2π²)⁻¹ test the factor two and exponent; D₂ has epsilon −1; angular weights ±1 both give i; weight zero gives 1, including the complex norm twist.

Archimedean local reciprocity, absolute value |z|ℂ=|z|², gamma and additive-character conventions fixed.

*Needs:* R16.2/archimedean-classification; AutomorphicLFunctionsAndLocalFactors/archimedean-gln-parameters; AutomorphicLFunctionsAndLocalFactors AL.1; AutomorphicLFunctionsAndLocalFactors AL.2.

*Source:* [jl70], §5 pp. 96–97, explicit character L/epsilon formulas and induced-real factor.

<a id="r16-3-tamely-dihedral"></a>

### R16.3.7 Tamely dihedral representations of prime order

Define `tamelyDihedral (F, ℓ)` as the subset of irreducible admissible GL₂(F) classes with the following parameter. For odd prime ℓ with q≡−1 mod ℓ, an irreducible admissible π is tamely dihedral of order ℓ precisely when `rec π=(Ind_{W_{F′}}^{W_F}θ,0)`, where F′/F is unramified quadratic and θ|I has exact order ℓ. Use the imported induced Weil representation and class of π; no second automorphic or WD carrier is defined. Induction is from `W_{F′}` to `W_F`. Since ℓ is prime to the residue characteristic, the inertia character is tame.

ℓ odd prime, q residue cardinality and q≡−1 mod ℓ; θ continuous with open kernel on inertia.

Prove the following API.
- `tamelyDihedral_parameter`: Membership is equivalent to the stated induced parameter with exact inertia order ℓ and N=0.
- `tamelyDihedral_unramified_twist`: An unramified determinant twist preserves tamely-dihedral order ℓ.
- `tamelyDihedral_conjugate`: Replacing θ by `θ^σ` gives the same induced parameter.

**Checks.**
- At q=2, ℓ=3, an inertia character of order three satisfies `θ^q=θ^{-1}≠θ`.
- ℓ=2 fails oddness and `θ^{-1}=θ` for order-two inertia, so this irreducibility argument fails.
- An unramified θ has inertia order one and is not tamely dihedral of order ℓ>2.

*Needs:* R16.3/supercuspidal-parameter; R16.0/local-langlands; ArithmeticGaloisRepresentations §2.4; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

*Source:* [nt26], Definition 2.4 and following paragraph, p. 11.

<a id="r16-3-tamely-dihedral-supercuspidal"></a>

### R16.3.8 The tamely dihedral supercuspidality consequence

Every tamely dihedral π of odd prime order ℓ is supercuspidal. Its parameter is irreducible, has N=0 and Swan conductor zero; since inertia has no fixed vector, a(rec π)=2 and L(s,π)=1. The exact-order argument works also at residue characteristic two, because ℓ is odd and prime to q.

The complete hypotheses of tamelyDihedral, including q≡−1 mod ℓ.

*Needs:* R16.3/tamely-dihedral; R16.3/supercuspidal-parameter; ArithmeticGaloisRepresentations §3.3; R16.0/local-langlands.

*Source:* [nt26], §2, paragraph after Definition 2.4, p. 11.

<a id="r16-3-cdt-inertia-multiplicity"></a>

### R16.3.9 The CDT inertial comparison and multiplicity one

For a smooth character θ of the unramified quadratic E/ℚ_x with `a(θ/θ^σ)=a(θ)=n≥1`, write Θ(θ) for its full GL₂(ℤ/xⁿℤ) type and K=GL₂(ℤ_x). For infinite-dimensional irreducible admissible Π of GL₂(ℚx), `Hom_K(Θ(θ),Π^{U(xⁿ)})≠0` iff `rec Π|I≅θ∘η_{x²} ⊕ θ∘Frob∘η_{x²}` in CDT’s reciprocity convention. In that case `Π^{U(xⁿ)}≅Θ(θ)` and the type multiplicity is one. Translate the Artin convention to R16.3. This comparison concerns the full K-type; its U₀(x) restriction used as a vexing selector can identify more than one finite-character twist. The special case in CDT’s surrounding discussion is translated with N retained, not as an N=0 parameter.

x≠ℓ; `a(θ/θ^σ)=a(θ)=n≥1` and coefficient field containing its values; principal congruence U(xⁿ), full compact type. Use CFT Layer9 Weil reciprocity for ℚx and its unramified quadratic extension; Layer7 supplies the compatible absolute/finite-quotient map, not an inverse on all of `G_Fᵃᵇ`.

**Checks.**
- A regular tame θ has `a(θ/θ^σ)=a(θ)=1`; the comparison recovers the depth-zero cuspidal representation of GL₂(𝔽_x).
- For the x=5, ℓ=3 norm twist in R16.2.11, let Π₀ be the depth-zero supercuspidal for θ₀ and `Π=Π₀⊗(λ∘det)`. Applying the even-n construction at n=2 and untwisting gives the inflation of `Ind_{𝔽₂₅×}^{GL₂(𝔽₅)}θ₀`. Its Hom into `Π₀^{U(5)}` vanishes: the finite cuspidal character sum is `(16−20+4)/24=0`. Thus the inertial match alone does not imply occurrence without the conductor equality.
- An unramified determinant twist preserves both inertia and Θ(θ) multiplicity one under the stated conductor hypothesis.

*Needs:* R16.2/cdt-vexing-type; R16.2/henniart-unicity; R16.3/supercuspidal-parameter; R16.0/local-langlands; ArithmeticGaloisRepresentations §2.4; ClassFieldTheory Layer 7; ClassFieldTheory Layer 9.

*Source:* [cdt99], §§3.1–3.2 and Lemma 4.2.4(3), pp. 17–18.


### Examples

For a Steinberg twist at q=4 and α=1, geometric Frobenius is diag(1/2,2) and N=(0,1;0,0); RNR⁻¹=N/4. Deleting N changes the Euler factor. The primitive Q₂ example has Artin conductor 3, Swan conductor 1 and N=0, and is not quadratic induction. For D₂ the archimedean epsilon is −1.

### Dependencies

R16.2; ClassFieldTheory Layers 7 and 9; ArithmeticGaloisRepresentations Layers 2–3; AutomorphicLFunctionsAndLocalFactors AL.1–AL.2; AutomorphicSpectralTheory §§0.48–0.49; R16.0/local-langlands.

## Layer R16.4: Global cuspidal representations

<a id="r16-4-cuspidal-tensor-factorization"></a>

### R16.4.1 The cuspidal restricted tensor factorization

For unitary central character ω trivial on F×, the smooth K∞-finite cuspidal spectrum in AdelicAlgebraicGroups AA.2’s L² space is AutomorphicSpectralTheory AS.4’s algebraic Hilbert-direct-sum decomposition with finite multiplicities. Every irreducible constituent has the AutomorphicLFunctionsAndLocalFactors/restricted-tensor-realizations factorization ⊗′vπv, with spherical distinguished vectors at almost all finite v, on the ArithmeticLocallySymmetricSpaces ALS.F.6 cusp carrier. Identify this algebraic factorization with the corresponding smooth vectors of its Hilbert completion and with the Whittaker tensor model. Multiplicity one is supplied by AL.3 and transported to this Whittaker realization below. Nonunitary cuspidal representations are handled after a specified norm twist.

F number field; central character unitary for L²; admissible local factors and ArithmeticLocallySymmetricSpaces ALS.F.6 distinguished-vector data.

*Needs:* R16.1/finite-level-comparison; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; AutomorphicLFunctionsAndLocalFactors/restricted-tensor-realizations; AutomorphicSpectralTheory AS.4; R16.1/haar-quotient-comparison (central-character L²); AutomorphicLFunctionsAndLocalFactors AL.3/global-whittaker-factorization.

*Source:* [jl70], §11 product formula (11.1.2), p. 183.

<a id="r16-4-global-whittaker-expansion"></a>

### R16.4.2 The global GL₂ Whittaker expansion

Fix nontrivial `ψ:F\𝔸→ℂ×` and additive Haar mass `vol(F\𝔸)=1`. For a smooth K∞-finite cuspidal φ, `Wφ(g)=∫_{F\𝔸}φ(n(x)g)ψ(−x)dx` and `φ(g)=Σ_{a∈F×}Wφ(diag(a,1)g)`, with the convergence appropriate to smooth cusp forms, locally uniform after the stated differentiability/growth estimates. The coefficient map is injective and equivariant. Specialize AutomorphicLFunctionsAndLocalFactors AL.3’s general GLn Fourier–Whittaker expansion; the GL₂ unipotent has a single additive coordinate. This declaration is in R16.4, before both multiplicity and the integral comparison.

Cuspidality supplies zero constant term; smooth automorphic form with imported growth estimates; global ψ and compatible self-dual local measures.

*Needs:* R16.4/cuspidal-tensor-factorization; ArithmeticGaloisRepresentations §2.7 (Global inputs: scalar adelic Schwartz–Bruhat space); AutomorphicLFunctionsAndLocalFactors AL.3/gln-fourier-expansion; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals.

*Source:* [jl70], Proposition 11.1.1 proof, pp. 182–183.

<a id="r16-4-global-multiplicity-one"></a>

### R16.4.3 The GL₂ Whittaker multiplicity comparison

Consume AutomorphicLFunctionsAndLocalFactors AL.3/global-multiplicity-one at n=2: every irreducible cuspidal automorphic GL₂(𝔸F) representation occurs with multiplicity one in the smooth cuspidal spectrum with its central character. The Whittaker coefficient identifies its realization with the restricted tensor product of the local Whittaker models, uniquely once ψ and almost-all spherical normalizations are fixed. Equivalently, two equivariant embeddings of the same irreducible representation into the cusp space are scalar multiples.

Number field F; characteristic-zero automorphic forms; unitary twist when working inside L².

*Needs:* R16.4/global-whittaker-expansion; R16.4/cuspidal-tensor-factorization; SmoothRepresentationsOfLocalGroups SR.2.3/whittaker-functionals; AutomorphicSpectralTheory AS.4; AutomorphicLFunctionsAndLocalFactors AL.3/global-multiplicity-one.

*Source:* [jl70], Proposition 11.1.1, p. 183; [cogdell-fields], Lecture 4 §3, Theorem 4.2 and proof, pp.33–34.

<a id="r16-4-strong-multiplicity-one"></a>

### R16.4.4 Hecke-data comparison for strong multiplicity one

Use the ring-map component of AutomorphicFormsOnReductiveGroups
[§5.8](../AutomorphicFormsOnReductiveGroups/README.md#58-residual-and-torsion-hecke-eigenclasses)’s eigensystems,
with its §7.3 Hecke normalization. For finite S, specialize that generic ring-map interface
to Mathlib’s polynomial presentation
`𝕋^S = MvPolynomial ({v ∉ S} × Fin 2) 𝒪`. An eigensystem with values in a commutative
𝒪-algebra R is an algebra map `𝕋^S → R`; write its two coordinates `t_v,s_v`.
The polynomial is `X² − t_v X + q_v s_v`. The presentation is not the faithful Hecke
image in any particular realization. Coefficient maps are composition of algebra maps
and the eigen-ideal is the kernel, using the supplier’s generic Hecke-ring interface.
This specialization introduces no parallel eigensystem carrier. Here agreement off a finite set means
that, after restriction to a common complement and coefficient ring, BOTH coordinates agree.

Construct the following adapters on this supplied ring-map interface.

- `ofNewform`: for a normalized newform of weight k≥1, use its arithmetic roots from
  `HeckeRing.GL2.Newform.satakeParameters`: `t_p=a_p`, `p s_p=χ(p)p^{k−1}` for p∤N.
  Thus `s_p=χ(p)p^{k−2}` for k≥2, and `s_p=χ(p)/p` for k=1.
- `ofGaloisRep`: for a continuous rank-two representation r unramified off S, use
  `t_v=tr r(Φ_v)`, `s_v=q_v⁻¹ det r(Φ_v)`, with geometric Φ. A classical arithmetic
  Artin representation ρ is compared through `ofGaloisRep(ρ^∨)`, as in R17.5.5.
- `ofCharacterPair`: given two Hecke quasicharacters with unramified roots x_v,y_v in the specified
  normalization, use `(t_v,q_v s_v)=(x_v+y_v,x_v y_v)`.
- `ofQuadraticInduction`: for K/F quadratic and a character ψ unramified at the places in
  question, split v gives `(t_v,q_v s_v)=(ψ(Φ_w)+ψ(Φ_w′),ψ(Φ_w)ψ(Φ_w′))`;
  inert v gives `(0,−ψ(Φ_w))`, since `Φ_w=Φ_v²`. These are geometric character values;
  an arithmetic inducing character is dualized before this adapter.

Division by q_v requires q_v invertible in R, or a specified divisible determinant with
its chosen quotient. In particular weight-one Artin data may require localization of the
integral coefficient ring. The integral pair `(t_v,e_v)`, with `e_v=q_v s_v`, remains
available without inversion. No square roots of q_v enter these arithmetic constructors.
Over ℂ, scaling the two roots by z_v changes `(t_v,s_v)` to `(z_v t_v,z_v² s_v)`.
Name the classical-to-unitary conversion `arithmeticToUnitary`: for weight k take
`z_v=q_v^{−(k−1)/2}`. For an arbitrary unitary automorphic class π write `unitaryEigensystem π`
for the data of the roots of rec π, namely `(α_v+β_v,q_v⁻¹α_vβ_v)`; the raw spherical
operator has eigenvalue `√q_v(α_v+β_v)`, and its scalar coset has eigenvalue
`α_vβ_v=q_v s_v`. State every cofinite comparison in R17.4 and R17.5 as agreement
of these shared eigensystems, after the indicated normalization, in both coordinates.

Consume AutomorphicLFunctionsAndLocalFactors AL.3/strong-multiplicity-one at n=2:
cuspidal π,π′ with agreeing unitary eigensystems off a finite set are globally isomorphic,
including every omitted finite and infinite component. Unramified Satake classification
identifies this hypothesis with local isomorphism. For isobaric classes use AL.3's
isobaric version. Density-one agreement is not the cofinite hypothesis.

**Checks.**
- At fixed weight and nebentypus, equality of good newform coefficients gives both coordinates.
- Root pairs `(1,−1)` and `(2,−2)` have trace zero but determinants −1 and −4, so trace alone fails.
- At an inert quadratic place the determinant is `−ψ(Φ_w)`; the missing minus sign changes the central character.
- Weight one with χ(p)=1 has `s_p=1/p`; an integral coefficient claim for this coordinate is false.
- For the trivial rank-two Artin representation, geometric data are `(2,q_v⁻¹)`; the raw
  spherical operator of its unitary parameter has eigenvalue `2√q_v`.

*Needs:* AutomorphicFormsOnReductiveGroups §§5.8 and 7.3; R16.4/global-multiplicity-one;
AutomorphicLFunctionsAndLocalFactors AL.3/strong-multiplicity-one and /isobaric-strong-multiplicity-one;
Tau Ceti `HeckeRing.GL2.Newform.satakeParameters_eq_pair_iff` and
`HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`;
ArithmeticGaloisRepresentations §§2.1–2.2 (places and Frobenius) and Layer 5 (recognition).
AlgebraicModularFormsAndSerreWeights R15.6 owns the residual `ArisesFrom` witness;
these characteristic-zero adapters do not replace it.

*Source:* [cogdell-fields], Theorem 9.3 and proof, pp.74–75; [casselman73], §2 Theorem 2,
pp.307–308; the pinned newform Satake sum/product theorem above. The character adapters
are the trace and determinant of a direct sum and of the two-coset induced action.

<a id="r16-4-cohomological-rationality"></a>

### R16.4.5 Cohomological rationality and coefficient fields

For regular algebraic cuspidal GL₂ representations, consume AutomorphicLFunctionsAndLocalFactors,
Representation prerequisites/finite-part-rationality at n=2: the number field Q(π), its
finite-part model and coefficient conjugates in C-algebraic normalization. Construct their GL₂
Hecke-field comparison. For a holomorphic newform f of weight k≥2 over ℚ, use
`π_alg=π_f⊗|det|^{−(k−2)/2}`, where `π_f` is unitary: the unnormalized spherical T₁ eigenvalue
is `a_p` and T₀ eigenvalue is `χ(p)p^{k−2}`. Prove that `Q(π_alg)` is the field generated by the
normalized newform coefficients and compatible nebentypus values, and transport the supplied
semilinear conjugation through this identification. Raw unitary Satake roots do not define this
field. Neither periods nor an integral lattice are canonical. An étale realization of a supplied
rational model is additional data for the transfer interfaces.

Regular algebraic cuspidal π with the supplied finite-part rational model. Use the algebraic determinant twist just displayed in the holomorphic comparison; regular algebraicity is not inferred from arbitrary unitary normalization.

*Needs:* AutomorphicLFunctionsAndLocalFactors/finite-part-rationality; R16.4/strong-multiplicity-one; ArithmeticLocallySymmetricSpaces ALS.F.7 and ALS.5b.4–5b.5 (automorphic comparison and cuspidal cohomology); ModularForms Layer 8; ModularForms Layer 8G.

The API identifies the supplied model's Hecke field in the algebraic normalization and commutes
with scalar extension and semilinear conjugation.

**Checks.** Weight two has no extra algebraic norm twist; at weight three raw unitary roots include the norm normalization and do not define the coefficient field; a one-dimensional rationality-field eigenspace does not select a canonical period or integral lattice.

*Source:* [nt26], §1.2 pp. 8–9, regular algebraic weights and conjugation; [clozel90], Theorem 3.13, for the finite-part rational model; [nt26], §5, Theorem 5.1, restates that result.

<a id="r16-4-non-cm-self-twists"></a>

### R16.4.6 The non-CM self-twist condition

On the existing cuspidal GL₂ isomorphism classes, define `nonCM` by trivial stabilizer under the supplied character action: non-CM means that π⊗χdet≅π implies χ=1 for every Hecke character χ of `F×\𝔸×`. This is the self-twist formulation used by NT; it defines a subset of the ArithmeticLocallySymmetricSpaces ALS.F.6 carrier rather than a second automorphic representation. Central characters imply any self-twist has χ²=1. Any specified nontrivial quadratic stabilizer excludes the class. R17.4’s automorphic-induction comparison consumes this self-twist definition; no automorphic-induction theorem is required to define it.

Cuspidal GL₂ class and the imported determinant-twist action; all Hecke characters, not only unramified ones.

Prove the following API.
- `nonCM_iff`: π is non-CM iff every character fixing its isomorphism class is trivial.
- `nonCM_twist`: Twisting π by any Hecke character preserves non-CM.
- `nonCM_self_twist_square`: Every self-twist χ of a rank-two π satisfies χ²=1 by comparison of central characters.

**Checks.**
- For the multiplication action of a group on itself every stabilizer is trivial.
- For the order-three cyclic group acting trivially on a singleton, its point is outside `nonCM`; a nontrivial stabilizer need not be quadratic for a general action.
- A class fixed by a specified nonidentity quadratic character is not non-CM.

*Needs:* R16.4/cuspidal-tensor-factorization; ArithmeticLocallySymmetricSpaces ALS.F.6; AutomorphicLFunctionsAndLocalFactors AL.3.

*Source:* [nt26], Lemma 2.1 introductory hypothesis, p. 9.


### Examples

A freely translated group element has trivial stabilizer, whereas a class fixed by a specified nonidentity quadratic character fails non-CM. At weight two the algebraic normalization removes no extra determinant twist; at weight three it twists the unitary class by `|det|^(−1/2)`. Strong multiplicity compares both good trace and determinant.

### Dependencies

R16.1–R16.3; ArithmeticLocallySymmetricSpaces ALS.F.6–F.7; ArithmeticGaloisRepresentations §2.7 (Global inputs); R16.4/cohomological-rationality; AutomorphicLFunctionsAndLocalFactors AL.3; AutomorphicSpectralTheory Layer 4; ModularForms Layers 8 and 8G.

## Layer R16.5: Whittaker integrals and analytic recognition

<a id="r16-5-whittaker-integral-comparison"></a>

### R16.5.1 The GL₂ Whittaker Mellin comparison

For factorizable cusp φ and Wφ=⊗vWv, the integral `∫_{F×\𝔸×}φ(diag(a,1))χ(a)|a|^{s−1/2}d×a` unfolds to `∫_{𝔸×}Wφ(diag(a,1))χ(a)|a|^{s−1/2}d×a` and factors into the AutomorphicLFunctionsAndLocalFactors AL.2 local Whittaker zeta integrals in a common right half-plane. At unramified places with normalized spherical Wv the factor is L(s,πv⊗χv); at ramified places a imported test vector realizes the L-factor, rather than every newvector doing so for every ramified twist. Compare this integral with AutomorphicLFunctionsAndLocalFactors AL.2’s Godement–Jacquet standard factor and AutomorphicLFunctionsAndLocalFactors AL.3’s GL₂×GL₁ Rankin–Selberg integral, using their shared LLC normalization.

Cuspidal φ, Hecke character χ; factorizable measures with standard unit volume at almost all finite places; absolute convergence first.

*Needs:* R16.4/global-whittaker-expansion; R16.2/spherical-whittaker-values; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; ArithmeticGaloisRepresentations §2.7 (Global inputs: scalar adelic Schwartz–Bruhat space); AutomorphicLFunctionsAndLocalFactors AL.1; AutomorphicLFunctionsAndLocalFactors AL.2; AutomorphicLFunctionsAndLocalFactors AL.3.

*Source:* [jl70], Theorem11.1 p.180; formula (11.1.2) and its Euler product, pp.183–184; Lemma11.1.3 p.184.

<a id="r16-5-full-gl2-converse"></a>

### R16.5.2 The GL₂ normalization comparison for the supplied converse theorem

Let Π=⊗′vΠv be an irreducible admissible generic GL₂(𝔸F) tensor, with central character trivial on F×, spherical almost everywhere and the JL uniform exponent bound at the unramified principal-series places so its standard and dual Euler products converge absolutely in a right half-plane. At infinity use genuine irreducible admissible Harish–Chandra modules and their Casselman–Wallach globalizations. Suppose for EVERY Hecke quasicharacter χ, the completed L(s,Π⊗χdet) and L(s,Π̃⊗χ⁻¹det) extend to entire functions, are bounded in every vertical strip outside the standard excluded neighborhoods (here there are no poles), and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ,ψ)L(1−s,Π̃⊗χ⁻¹). Transport the Whittaker and Mellin normalizations to AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-full-rank at n=2, which supplies cuspidal automorphy. Finite-order, unramified-only or one fixed-conductor twists are not substituted for this family. One-dimensional local constituents are excluded by genericity/infinite-dimensionality.

Number field F; uniform bound |χᵢ,v(ϖv)| between `qv^{−r}` and `qv^r` for a common r at principal-series unramified places; all local constituents infinite-dimensional/generic; full archimedean and analytic conditions above.

*Needs:* R16.5/whittaker-integral-comparison; R16.2/archimedean-classification; AutomorphicLFunctionsAndLocalFactors AL.1; AutomorphicLFunctionsAndLocalFactors AL.2; AutomorphicLFunctionsAndLocalFactors AL.3; AutomorphicSpectralTheory §§0.48–0.49; ArithmeticLocallySymmetricSpaces ALS.F.6; AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-full-rank.

*Source:* [jl70], Theorem 11.3, p. 186; [converse], §2 pp. 5–6; §3 Theorem 3.1, p. 6, n=2.

<a id="r16-5-classical-l-function-comparison"></a>

### R16.5.3 Classical and unitary L-function normalization

For a normalized primitive holomorphic newform f of weight k≥2, let πf be the R16.1/finite-level-comparison unitary adelization. With `Lf(s)=Σ_{n≥1}a_n n^{−s}`, L(s,πf)=Lf(s+(k−1)/2), including the bad-prime factors supplied by ModularForms Layer 4. Its infinite factor is Γℂ(s+(k−1)/2). The factor 2 in Γℂ distinguishes this completion from the common classical `(2π)^{−s}Γ(s)Lf(s)`; record the scalar and the conductor power rather than asserting equality of differently normalized completed functions. At width one the pinned CuspForm L-series theorem supplies the convergent-domain Mellin comparison; the global analytic extension is imported.

f in the existing Γ₁(N) normalized newform carrier, nebentypus compatible with weight; R16.1/finite-level-comparison unitary normalization.

*Needs:* R16.5/whittaker-integral-comparison; R16.3/archimedean-factor-comparison; R16.1/finite-level-comparison; ModularForms Layer 4; Tau Ceti `CuspForm.LSeries_qExpansion_coeff_eq`; ModularForms Layer 7.

*Source:* [jl70], §11, Theorem 11.1 p. 180; §5, standard factors p. 97. Apply the R16.1/finite-level-comparison holomorphic normalization.

<a id="r16-5-global-epsilon-normalization"></a>

### R16.5.4 Global functional equation and conductor normalization

For the standard global additive character obtained from the trace F/ℚ and compatible self-dual local measures, put A(π)=|Disc(F)|²·N(𝔣π) in rank two. In the unitary variable, `Λ(s,π)=A(π)^{s/2}L_f(s,π)L_∞(s,π)`. Its functional equation is Λ(s,π)=ε(1/2,π)Λ(1−s,π̃), with ε(1/2,π) the product of the local root numbers in AutomorphicLFunctionsAndLocalFactors AL.1/AutomorphicLFunctionsAndLocalFactors AL.3’s convention. For a weight-k form over ℚ and t=s+(k−1)/2, the exchange is t↔k−t. Changing local `ψ_v` by a global a∈F× multiplies each local epsilon by `ω_v(a)|a|_v^{2s−1}`; their product is one by central-character automorphy and the product formula. The discriminant square is the rank-two conductor contribution; for F=ℚ it is one.

Use AutomorphicLFunctionsAndLocalFactors AL.3 global completion, the trace-normalized global ψ and self-dual measures; finite conductor from conductorEpsilon.

*Needs:* R16.3/conductor-epsilon-comparison; R16.5/classical-l-function-comparison; AutomorphicLFunctionsAndLocalFactors AL.1; AutomorphicLFunctionsAndLocalFactors AL.3.

*Source:* [jl70], Theorem 11.1, p. 180.


### Examples

At weight k=2 the unitary variable s becomes t=s+1/2, so s↦1−s becomes t↦2−t. For F=Q the discriminant factor is one. The gamma identity Γℝ(s)Γℝ(s+1)=Γℂ(s) retains the factor 2 in the complex completion.

### Dependencies

R16.2–R16.4; AutomorphicLFunctionsAndLocalFactors AL.0–AL.3; ArithmeticGaloisRepresentations §2.7 (Global inputs); AutomorphicSpectralTheory §§0.48–0.50; ArithmeticLocallySymmetricSpaces ALS.F.6; R16.1/finite-level-comparison; ModularForms Layers 4 and 7.

## Layer R16.6: Classical and Hilbert weights

<a id="r16-6-primitive-classical-bijection"></a>

### R16.6.1 Primitive newforms and holomorphic cuspidal classes

For N>0, k≥2 and `χ(−1)=(−1)^k`, specialize the primitive correspondence of
AutomorphicFormsOnReductiveGroups §§7.2–7.3 to the existing normalized Γ₁(N) newform
carrier and the matrix realization of R16.1/finite-level-comparison. Its output is a cusp
`GL₂(𝔸_ℚ)` class of conductor N, the supplied central character attached to χ, and
unitary infinite component `D_k`. Compare the occurrence supplied there with AL.2's finite
newvector tensor and the holomorphic lowest-weight line in its positive-determinant piece;
full O(2) retains both signs. For a fixed additive character, the tensor normalized by its
first Fourier coefficient recovers the supplied newform, and the supplier's inverse recovers
the original class. Thus this adapter identifies the local conductor product with N and
the supplied primitive vector with the normalized Whittaker tensor. It uses ModularForms
Layer 4's bad-prime eigenproperties as well as the pinned newform carrier.

The specialization provides the following API.
- `primitiveBijection_conductor`: The product of the local conductor ideals is exactly N.
- `primitiveBijection_weight_character`: `π∞=D_k` and the central character is the idele-class character attached to χ.
- `primitiveBijection_hecke`: For p∤N, `α_p+β_p=a_p p^{−(k−1)/2}` and `α_pβ_p=χ(p)`.
- `primitiveBijection_normalized`: The recovered holomorphic newform has first q-coefficient one.
- `primitiveBijection_inverse`: The two maps are inverse on primitive forms and compatible automorphic classes.

**Checks.**
- At k=2 the infinite component is D₂ and the good trace is `a_p/√p`.
- A primitive form of level M properly dividing N is not primitive of conductor N after the oldform inclusion.
- For a normalized eigenform with a₁=1, multiplying by a scalar c≠1 changes a₁ to c and fails normalization. Every nonzero c yields the same primitive class after renormalization; c=0 is excluded from the eigenform carrier.

*Needs:* AutomorphicFormsOnReductiveGroups §§7.2–7.3; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; R16.2/archimedean-classification; R16.4/global-multiplicity-one; R16.4/strong-multiplicity-one; R16.1/finite-level-comparison; ModularForms Layer 4; Tau Ceti `HeckeRing.GL2.Newform`; Tau Ceti `HeckeRing.GL2.Newform.qExpansion_coeff_one`.

*Source:* [jl70], §11, Proposition 11.1.1 p. 183; §5, Theorem 5.11 pp. 85–86. Specialize AutomorphicFormsOnReductiveGroups §§7.2–7.3 via R16.1/finite-level-comparison.

<a id="r16-6-classical-hecke-and-level"></a>

### R16.6.2 The complete level and Hecke dictionary

For the R16.6/primitive-classical-bijection adapter, specialize AutomorphicFormsOnReductiveGroups §7.3 at p∤N, with vol(GL₂(ℤ_p))=1. The supplied good-prime Hecke comparison gives the unitary Satake polynomial `X²−a_p p^{−(k−1)/2}X+χ(p)`, while the arithmetic Hecke polynomial is `X²−a_pX+χ(p)p^{k−1}`. The primitive level is `∏p p^{c(πp)}`. At a ramified p the local standard factor has degree zero, one or two according to `(ker N)^I` in rec πp, and its coefficients match the ModularForms Layer 4 primitive `U_p` factor after the same variable shift; do not impose a degree-two good-prime polynomial there. The finite-unit central character is `χ^{-1}` in the R16.1/finite-level-comparison right-equivariance convention, whereas its value on a good local uniformizer is χ(p) after global rational invariance.

Write `n=v_p(N)` and `c=v_p(cond χ)`. ModularForms Layer 4 gives `a_p≠0` precisely when n=max(1,c). For n=c≥1, the local class is principal series with one unramified character α and `a_p=p^((k−1)/2)α(ϖ)`; for n=1,c=0 it is an unramified Steinberg twist µ, with `a_p=p^((k−2)/2)µ(ϖ)` and `a_p²=χ^(p)(p)p^(k−2)`, where `χ^(p)` is the character away from p. In all other ramified cases `L_p=1` and `a_p=0`. Thus the classical ramified factor is `(1−a_pp^(−t))⁻¹` in the first two cases, with t=s+(k−1)/2. Test the one-ramified-character case, the Steinberg square relation, and a supercuspidal with `a_p=0`. These specialize the existing bad-prime theorem rather than define new Hecke operators. The algebraic adapter `classicalHeckeLevel` takes complex scalars α, β, z, a_p and χ(p) with `z(α+β)=a_p` and `αβ=χ(p)` and gives the scaled trace a_p and determinant `χ(p)z²`. At a good prime set `z=p^((k−1)/2)` using the supplier's trace identity.

**Checks.** At k=2 the scaled trace is a_p and the determinant is `χ(p)p`. A one-ramified-character principal series has the stated linear factor. An unramified Steinberg twist satisfies the displayed square relation, while a supercuspidal has `a_p=0` and trivial standard factor.

*Needs:* AutomorphicFormsOnReductiveGroups §§7.2–7.3; R16.6/primitive-classical-bijection; R16.3/principal-series-parameter; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.5/classical-l-function-comparison; ModularForms Layer 4; R16.1/finite-level-comparison.

*Source:* AutomorphicFormsOnReductiveGroups §7.3 for the good-prime normalization; [casselman73], §3 start, p. 308; §1 local conductor theorem for the ramified comparison.

<a id="r16-6-hilbert-algebraic-weights"></a>

### R16.6.3 Hilbert cohomological algebraic weights

Define `HilbertWeightSpace`, `hilbertWeightFactor` and `hilbertWeightRepresentation` by the tensor carrier, twisted symmetric-power factor and product action below. For any coefficient field K and finite index set ι, the tensor, scalar, dual and dimension formulas below use the existing symmetric-power carriers; when kᵢ≥2 their dimensions are ∏ᵢ(kᵢ−1), and extension to any field L/K commutes with the action. For totally real F, embeddings Σ=Hom(F,ℝ), integers `k_τ≥2` and `m_τ` with `k_τ+2m_τ=w` independent of τ, define the local algebraic representation `V_τ=Sym^{k_τ−2}(standard₂)⊗det^{m_τ}`, using TauCeti.symPowerRep and the existing determinant character, and `V=⊗_{τ∈Σ}V_τ` on `(Res_{F/ℚ}GL₂)_ℂ`. Its scalar action at τ is `z^{k_τ−2+2m_τ}=z^{w−2}`; its dimension is `∏τ(k_τ−1)`. The dual V∨ is used when the cohomological/local-system convention requires it; the choice is stated in the R16.4/cohomological-rationality comparison rather than silently interchanged. Parallel parity of `k_τ` follows from the existence of the integer `m_τ`.

Prove the following API.
- `hilbertWeightRepresentation_scalar`: A scalar at τ acts by `z^{k_τ−2+2m_τ}`; for cohomological weight this is `z^{w−2}`.
- `hilbertWeightRepresentation_pure`: A common weight `k_τ+2m_τ=w` gives scalar exponent `w−2` at every embedding.
- `hilbertWeightRepresentation_dimension`: `dim V=∏τ(k_τ−1)`.
- `hilbertWeightRepresentation_dual`: Dualizing inverts the scalar central character and agrees with the R16.4/cohomological-rationality local-system convention.
- `hilbertWeightRepresentation_base_change`: Extension of characteristic-zero coefficients commutes with the tensor construction.

**Checks.**
- For one embedding, k=2,m=0 gives the trivial one-dimensional representation.
- For one embedding, k=3,m=1 gives standard₂⊗det, dimension two and scalar exponent three.
- Weights (2,3) cannot satisfy `k_τ+2m_τ=w` for integer `m_τ` and one common w.
- At one embedding, (k,m)=(2,−1) has scalar character z⁻², testing negative determinant powers.
- At two embeddings, k=(2,4), m=(1,0) has dimension three and common weight w=4;
  scalar values z₁,z₂ act by z₁²z₂².
- For the empty embedding index, the tensor is a one-dimensional trivial representation.

*Needs:* Tau Ceti `TauCeti.symPowerRep`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `Representation`; R16.4/cohomological-rationality; AutomorphicSpectralTheory §§0.48–0.49.

*Source:* [nt26], §1.2 regular algebraic highest-weight convention, p. 8.

<a id="r16-6-weight-k-parameter-conversion"></a>

### R16.6.4 The weight-k arithmetic parameter conversion

At p∤N set `(A_p,B_p)=p^((k−1)/2)(α_p,β_p)`; their sum is `a_p` and product `χ(p)p^(k−1)`. The geometric-Artin Hecke parameter is `rec(π_p)⊗ν_W^(−(k−1)/2)=recᵀ(π_p)⊗ν_W^(−(k−2)/2)`. The classical arithmetic attachment has the inverse pair at geometric Frobenius; its dual has `(A_p,B_p)` there. Match nebentypus reciprocity and dual conventions before identifying this with a Galois construction. AlgebraicModularFormsAndSerreWeights R15.5A.2 supplies the classical attachment; R17.6 constructs its ramified comparison. General Hilbert attachments keep their owner.

Classical arithmetic Frobenius convention stated; `χ_cyc(arithmetic Frob_p)=p`; unitary R16.1/finite-level-comparison πf, integer k≥2.

*Needs:* R16.3/tate-unitary-normalization; R16.6/classical-hecke-and-level; R16.6/hilbert-algebraic-weights; ArithmeticGaloisRepresentations §2.4; AlgebraicModularFormsAndSerreWeights R15.5A.2/classical-higher-weight-attachment.

*Source:* [nt26], §1.2 recᵀ and Hodge–Tate conventions, p. 8.

<a id="r16-6-geometry-and-galois-exports"></a>

### R16.6.5 Newvector and multiplicity exports

Export the exact local conductor dimensions, normalized Whittaker line, primitive classical comparison, coefficient field and Hilbert algebraic representation as representation-theoretic inputs for a supplied automorphic cohomological or Galois realization. Each application records its central character, archimedean dual convention, local compact subgroup, Hecke normalization and coefficient lattice. The finite-part multiplicity remains one for a fixed compatible infinite type; no new claim of integral multiplicity one, torsion-freeness or Galois existence is made by this export.

Consumer coefficient field, local level and infinite type fixed; geometric statements imported from their owners.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; R16.4/global-multiplicity-one; R16.4/cohomological-rationality; R16.6/primitive-classical-bijection; R16.6/hilbert-algebraic-weights; R16.6/weight-k-parameter-conversion.

*Source:* [cdn20], §5.2.1 pp. 347–348, archimedean weight two.

<a id="r16-6-weight-one-classical-comparison"></a>

### R16.6.6 Primitive weight-one comparison

For N>0 and χ(−1)=−1, let φ be a nonzero adelic cusp form in the supplied canonical
cusp space, with the level/central-character transformation of R16.1/finite-level-comparison,
SO(2)-type one, and simultaneous good Hecke and diamond eigenvalues. Assume its classical
descent `f(z)=y^{−1/2}φ(g_z)` is holomorphic on ℍ, for the determinant-one section g_z.
The elementary criterion `weightOne_holomorphicDescent` gives a classical cuspidal
eigenform in `S₁(Γ₁(N),χ)` with the same good eigensystem; normalize its first coefficient
when passing to the primitive newform at its exact conductor. The finite newvector condition
is required to conclude that this conductor is N. Conversely classical cusp forms give these
holomorphic adelic vectors. This criterion uses the function-level dictionary before the
classification or globalization of D₁(0).

For N>0 and odd nebentypus χ, the existing primitive normalized weight-one cusp forms at conductor N correspond to cuspidal GL₂(𝔸ℚ) classes of exact conductor N and central character `ω_χ` whose unitary infinite component is the full-O(2) limit D₁(0). Its positive-determinant restriction has holomorphic and antiholomorphic limits of lowest weights ±1. Its real Weil parameter is 1⊕sgn, not an irreducible induction from ℂ×; its standard infinite factor is Γℝ(s)Γℝ(s+1)=Γℂ(s). Specialize AutomorphicFormsOnReductiveGroups §§7.2–7.3 at k=1 through R16.1/finite-level-comparison, then compare its primitive occurrence with the finite newvector normalization and global multiplicity. This comparison does not give a regular algebraic Hilbert coefficient `Sym^{−1}` or a weight-one Galois construction. The Casimir is −1/4 at k=1 in the convention Δ=(H²+2XY+2YX)/4.

N>0; χ(−1)=−1; existing primitive newform carrier with k=1 and exact conductor; chosen AutomorphicSpectralTheory §§0.48–0.49 limit globalization and R16.1/finite-level-comparison dictionary.

*Needs:* AutomorphicFormsOnReductiveGroups §§7.2–7.3; R16.2/archimedean-classification; R16.4/global-multiplicity-one; R16.1/finite-level-comparison; AutomorphicSpectralTheory §§0.48–0.49; AutomorphicLFunctionsAndLocalFactors AL.1; ModularForms Layer 4; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors.

**Checks.**
- A weight-one classical cusp eigenform returns its own q-expansion after normalized descent.
- SO(2)-type one alone permits nonholomorphic vectors and does not imply the criterion.
- An old vector at a multiple of the primitive level does not have that larger conductor.
- At k=1 no negative symmetric-power coefficient is introduced; the parameter is `1⊕sgn`.

*Source:* [getz15], §6.4 Lemma 6.19 and Remark 6.20, pp.32–33, for descent;
§6.5, pp.33–34, for the limit module, with the Casimir normalization of R16.2.13.


### Examples

For one embedding, (k,m)=(2,0) gives the trivial line and (3,1) gives the two-dimensional standard representation with scalar exponent three. Weights (2,3) have incompatible parity for one common w. At weight one the real parameter is 1⊕sgn and the full O(2) representation remains irreducible.

### Dependencies

R16.2–R16.5; AutomorphicFormsOnReductiveGroups §§7.2–7.3; ModularForms Layers 3–4; AutomorphicSpectralTheory §§0.48–0.49; R16.4/cohomological-rationality; R16.1/finite-level-comparison; ArithmeticGaloisRepresentations Layer 2.

## Layer R17.1: Quaternionic local transfer

<a id="r17-1-local-quaternionic-comparison"></a>

### R17.1.1 Quaternionic local Jacquet–Langlands

For a finite extension `F/ℚ_p` and quaternion division algebra D/F on the
QuadraticFormInvariants Layer 2 carrier `QuaternionAlgebra F a 0 b`, consume
LocalGaloisDeformationRings §2.26.1's `DivisionAlgebraTypes.jacquetLanglands` at d=2
with complex coefficients. Its source and target are the set of isomorphism classes of
irreducible admissible smooth complex representations of D× and the set of essentially
square-integrable irreducible admissible smooth complex GL₂(F) classes. Use the supplied
bijection in the direction `ρ ↦ JL_D(ρ)` from D× to GL₂(F), with its supplied inverse
on these classes. This specialization is the localQuaternionic interface.

For matching regular elliptic `x ∈ D×` and `g ∈ GL₂(F)` with the same reduced
characteristic polynomial, the supplied character identity specializes to
`Θ_{JL_D(ρ)}(g) = −Θ_ρ(x)`, since `(-1)^(2-1) = -1`. Its character characterization
gives `ω_{JL_D(ρ)} = ω_ρ`, contragredient compatibility, and
`JL_D(ρ ⊗ (χ ∘ Nrd)) = JL_D(ρ) ⊗ (χ ∘ det)` for every smooth complex character
χ of F×; both central characters become `ω_ρ χ²`. Equal reduced norm and determinant
on matching elements preserve the twisted character identity, so uniqueness identifies
these twists. These are consequences of the supplied correspondence.

Package this specialization with R16.0/local-langlands by assigning to ρ the parameter
of `JL_D(ρ)`. At a split place D=M₂(F), construct the comparison using the chosen
algebra isomorphism; its character sign is +1. R17.1/real-quaternionic-comparison gives
the real comparison. An irreducible principal series has no division-algebra preimage;
the supplier's zero extension of the inverse does not produce an irreducible D× class.

**Checks.**

- The trivial D× representation transfers to St; its character is +1 on D× and the
  Steinberg character is −1 on matching elliptic GL₂ elements.
- For any smooth χ, `χ ∘ Nrd` transfers to `St ⊗ (χ ∘ det)`, with central character χ².
- An irreducible principal series has no division preimage, including under the
  supplier's zero-extended inverse.
- At a split quaternion algebra the chosen matrix identification has sign +1,
  whereas a matched division elliptic class has sign −1.

*Needs:* LocalGaloisDeformationRings §2.26.1; R16.3/steinberg-monodromy; R16.3/supercuspidal-parameter; R16.0/local-langlands; QuadraticFormInvariants Layer 2; QuadraticFormInvariants Layer 6D.

*Source:* [jl70], Theorem 15.1 and following orthogonality discussion, pp. 249–250;
[bh06], §§56.1–56.2, p.334, identities (56.1.4) and (56.2.1), and §56.9, p.337,
character identity (56.9.3). The nonarchimedean correspondence is supplied by
LocalGaloisDeformationRings §2.26.1.

<a id="r17-1-norm-character-steinberg"></a>

### R17.1.2 Norm characters and Steinberg twists

Under localQuaternionic, χ∘Nrd on D× transfers to St⊗χdet. Its central character is χ², its WD parameter is steinbergParameter with N≠0, and its standard conductor is 1 for unramified χ or 2a(χ) for ramified χ. The corresponding local L/epsilon factors are exactly those of that parameter; the one-dimensional D× dimension does not make the GL₂ WD parameter monodromy-free. The trivial D× representation is the unramified St case, used by the definite-quaternion applications.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.1/local-quaternionic-comparison; R16.3/steinberg-monodromy; R16.3/conductor-epsilon-comparison; R16.0/local-langlands; QuadraticFormInvariants Layer 2.

*Source:* [jl70], §15 special/norm-character correspondence; §16 p. 269.

<a id="r17-1-real-quaternionic-comparison"></a>

### R17.1.3 The real quaternionic coefficient comparison

For Hamilton D, the algebraic representation `Sym^{k−2}⊗det^m`, k≥2, m integer, transfers to `D_k⊗|det|^{(k−2+2m)/2}`. Both have scalar exponent k−2+2m and `sign^k` on ℝ×. On SU(2) its character at `diag(e^{iθ},e^{-iθ})`, sinθ≠0, is sin((k−1)θ)/sinθ, dimension k−1. Summing the two `D_k` weight tails on the matched elliptic class gives its negative; this checks JL's sign −1 with the same norm twist. Tests: k=2 gives the trivial quaternion type and D₂; k=3 gives dimension two and character 2cosθ; k=1 is excluded since `Sym^{-1}` is undefined. Unitary `D_k` itself need not be algebraic.

Real place, k≥2 and m integer; AutomorphicSpectralTheory §§0.48–0.49 supplies the full O(2) representation and archimedean LLC.

*Needs:* R17.1/local-quaternionic-comparison; R16.2/archimedean-classification; R16.3/archimedean-factor-comparison; R16.6/hilbert-algebraic-weights; AutomorphicSpectralTheory §§0.48–0.49; QuadraticFormInvariants Layer 2.

*Source:* [cdn20], §5.2.1 pp.347–348; [jl70-ubc], §5 Lemmas 5.6 and 5.10 pp.83–86, §6 Lemma 6.1 pp.111–112 for the weight and SU(2) character calculations.

<a id="r17-1-wild-dyadic-transfer"></a>

### R17.1.4 Wild and dyadic quaternionic compatibility

For every essentially square-integrable GL₂(F) parameter, including primitive wild rank-two Weil representations at dyadic places, the R16.0/local-langlands quaternionic preimage has the same central character and LLC parameter as GL₂, with the same standard factors and Artin conductor in R16.3’s convention. For a supercuspidal it has N=0; for a special representation it has rank-one N. Dihedral/tamely-dihedral examples are checks within this statement, not a replacement for primitive wild cases. No naive level exponent of a chosen order in D is equated to the GL₂ conductor without a separate comparison.

R16.0/local-langlands canonical inner-form correspondence at every finite extension of ℚp; characteristic zero.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.1/local-quaternionic-comparison; R16.3/supercuspidal-parameter; R16.3/steinberg-monodromy; R16.3/tate-unitary-normalization; R16.3/tamely-dihedral-supercuspidal; R16.0/local-langlands; ArithmeticGaloisRepresentations §3.3.

*Source:* [bh06], §56.1, p. 334, and §§56.3–56.8, pp. 335–336; combine with R16.3’s parameter/factor comparison. Renormalize the division epsilon constant by the sign in R17.3/local-factors. [cdn23] §4.1.2 concerns the global quaternion application over `ℚ_p` with p>2.

<a id="r17-1-swapped-quaternion-invariants"></a>

### R17.1.5 Swapped quaternion invariants in arithmetic applications

Define `RamifiedExactlyAt D S` for a quaternion algebra D over a number field F and a
finite set S of all places: `v∈S` iff every nonzero element of `D⊗_F F_v` is invertible.
Prove `ramifiedExactlyAt_iff_nonsplit`: this is equivalent to
`v∈S ↔ ¬ Nonempty (D⊗_F F_v ≃ₐ[F_v] M₂(F_v))` at every place.
These are the two equivalent local division tests; over complex completions neither holds.
Use `definiteRamifiedExactlyAt D q` over ℚ for support `{q,∞}`, and
`indefiniteRamifiedExactlyAt D q q′` for support `{q,q′}` with q≠q′ finite.
The general predicate also applies to arbitrary real ramification sets over totally real F;
the rational abbreviations introduce no new notion of quaternion algebra or order.

**Ramification realization.** For a number field F, finite sets `S_f,S_∞` of finite/infinite places are the nonsplit places of a quaternion algebra iff `S_∞` is real and `|S_f|+|S_∞|` is even. Produce a,b∈F× and QuaternionAlgebra F a 0 b: weak approximation makes b a uniformizer at `S_f` and negative at `S_∞`; GlobalQuadraticForms §4.4's `exists_hilbertSymbol_eq_neg_one_iff_pair` prescribes `(a,b)_v=−1` precisely on S. QuadraticFormInvariants Layer 2's splitting criterion gives the local algebras. The product formula proves necessity, including real signs.

Two quaternion algebras are F-isomorphic iff their splitting predicates agree at every finite and infinite place. Their local Brauer invariants are 0 or 1/2; ClassFieldTheory Layer 10's `eq_zero_of_localInv_eq_zero` kills the difference of their global classes. RepresentationTheory/SemisimpleAlgebras Layer 6's unique division representative and degree then give an algebra isomorphism: a degree-two algebra is M₂(F) or its quaternion division representative. Choose split identifications separately. Interfaces: `existsQuaternionRamification_iff`, `quaternionAlgEquivOfLocalSplitting`, using actual completions and `Nonempty (D_v ≃ₐ[F_v] M₂(F_v))`. Tests: empty support gives M₂(F); {p,∞} over Q is realized; a singleton finite support with split infinity is impossible. Source: [prr23], §1.5.1, Theorem 1.33 and consequences, pp.42–43.

For totally real F of even degree, D₀ ramifies at all real places and splits at finite places. Swap τ₀ with v₀|p: D ramifies at v₀ and all real places except τ₀, preserving even size. Local algebras agree elsewhere; at changed places use normCharacterSteinberg/realQuaternionic or the specified square-integrable type. Auxiliary primes, small levels and spectra use R17.3/definite-hilbert-exports on supplied levels. Tests: a real quadratic field gives two real places for D₀ and {v₀,τ} for D; adding v₀ alone gives an impossible odd set; F=Q has no all-real D₀.

**Checks.**
- `M₂(F_v)` contains a nonzero singular matrix, so the division and nonsplit tests both fail.
- Hamilton quaternions at the real place satisfy both tests; a complex completion is split.
- Over ℚ the support `{q,∞}` is definite and `{q,q′}` for distinct finite primes is indefinite;
  the latter splits at infinity. Taking q=q′ would give a forbidden singleton support.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.1/local-quaternionic-comparison; R17.1/norm-character-steinberg; R17.1/real-quaternionic-comparison; GlobalQuadraticForms §4.4; QuadraticFormInvariants Layers 2, 5–6D; ClassFieldTheory Layer 10; RepresentationTheory/SemisimpleAlgebras Layer 6.

*Source:* [cdn23], §4.1.2 and equation (4.6), pp.38–39; [prr23], §1.5.1, Theorem 1.33, pp.42–43, and the degree-two split/division dichotomy.


### Examples

The trivial division-algebra character transfers to Steinberg with N≠0. At a real place the trivial quaternionic coefficient transfers to D₂. Over Q, support {p,∞} has even size and is realizable; {p} with split infinity is not. Exchanging one ramified and one split place preserves parity.

### Dependencies

LocalGaloisDeformationRings §2.26.1; R16.3 and R16.6; R16.0/local-langlands; R17.1/local-quaternionic-comparison; QuadraticFormInvariants Layer 2; GlobalQuadraticForms §4.4; ClassFieldTheory Layer 10; RepresentationTheory/SemisimpleAlgebras Layer 6.

## Layer R17.2: Test functions and trace comparisons

<a id="r17-2-steinberg-projector-difference"></a>

### R17.2.1 The Steinberg projector difference

Construct `steinbergProjectorDifference` in the supplied compact-mod-centre Hecke space, with the idempotents, support and trace values below. At a nonarchimedean place, for unitary χ and ω=χ², work in SmoothRepresentationsOfLocalGroups SR.1’s compact-mod-center, ω⁻¹-equivariant Hecke space with AdelicAlgebraicGroups AA.2 quotient measure. Put K=GL₂(O), I=K₀(p), and H=⟨Z,I,w⟩ where w=(0 1;ϖ 0). Let `ξ(a)=(−1)^{v_F(a)}χ(a)`. Set `e_K^χ(g)=χ(det g)⁻¹/vol(Z\ZK)` on ZK and zero elsewhere, `e_H^ξ(g)=ξ(det g)⁻¹/vol(Z\H)` on H and zero elsewhere, and `ζχ=e_H^ξ−e_K^χ`. Then trace(St⊗χdet)(ζχ)=1, every other unitary infinite-dimensional irreducible with central character ω has trace zero, and trace(χdet)(ζχ)=−1; the other determinant characters with central character ω have trace zero. The construction is compact modulo Z, not necessarily compact in G. It is a trace projector, not an assertion that its operator is zero on every induced representation.

χ unitary; nonarchimedean F; fixed central quotient measure, matching ω⁻¹ equivariance; exact extended-Iwahori H and ξ above.

Prove the following API.
- `steinbergProjectorDifference_eval`: `ζχ(g)=e_H^ξ(g)−e_K^χ(g)` with the stated support and quotient volumes.
- `steinbergProjectorDifference_central`: ζχ(zg)=ω(z)⁻¹ζχ(g).
- `steinbergProjectorDifference_steinberg`: The corresponding Steinberg trace is one and all other unitary infinite-dimensional traces are zero.
- `steinbergProjectorDifference_character`: The corresponding determinant-character trace is minus one.
- `steinbergProjectorDifference_twist`: Replacing χ by χη multiplies ζχ(g) by η(det g)⁻¹ with the compatible central character.

**Checks.**
- For χ=1, the St trace is 1 and the trivial GL₂-character trace is −1.
- An irreducible unitary unramified principal series has trace zero, even though its Iwahori fixed space has dimension two.
- At g outside H∪ZK, ζχ(g)=0.
- A determinant-character twist multiplies both local idempotents by the same inverse character.

*Needs:* LocalGaloisDeformationRings §2.26.1; AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors; R16.2/iwahori-center; R17.1/norm-character-steinberg; R16.1/haar-quotient-comparison; SmoothRepresentationsOfLocalGroups SR.1; AdelicAlgebraicGroups AA.2.

*Source:* [jl70], §16 pp. 268–269, properties (i)–(iv) and ζ″−ζ′.

<a id="r17-2-quaternionic-orbital-matching"></a>

### R17.2.2 Quaternionic orbital integrals and the sign

For matching regular elliptic d∈D× and g∈GL₂(F) with the same reduced polynomial, identify their centralizer torus and choose the same torus measure; specify each ambient quotient Haar measure. Construct test functions `f_D,f_G` with `O_g(f_G)=−O_d(f_D)` and `O_g(f_G)=0` at split regular semisimple g. With the matching rank-two character identity `Θ_GL₂=−Θ_D` this gives `trace JL(ρ)(f_G)=trace ρ(f_D)`. For a chosen D× matrix coefficient the transferred `f_G` is the JL §16 elliptic character function; in the norm-character case use steinbergProjectorDifference. Compare formal degrees and the identity orbital term using the actual quotient-volume ratio; do not infer equality of formal degrees under unrelated ambient measures.

Fixed unitary central character; compact modulo center functions; regular elliptic correspondence and common centralizer measure. The API gives existence of matching functions modulo the regular-orbital kernel, compatibility with central twists and the corresponding trace identity.

**Checks.** The norm-character test uses the Steinberg projector difference; a split regular semisimple GL₂ class has orbital integral zero for a division transfer; scaling the torus measure rescales both corresponding orbital integrals equally, while changing only an ambient measure does not preserve a formal-degree identity.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.1/local-quaternionic-comparison; R17.2/steinberg-projector-difference; R16.1/haar-quotient-comparison; R16.0/local-langlands; AutomorphicSpectralTheory §6.9 (orbital-integral carrier).

*Source:* [jl70], §16 character orthogonality and regular-elliptic orbital-integral identity, pp.269–270.

<a id="r17-2-cyclic-local-matching"></a>

### R17.2.3 Rank-two adapter for supplied cyclic matching

Use the n=2 objects and matching relation of AutomorphicSpectralTheory §§7.0a–7.0b for a prime-degree cyclic local extension E/F of characteristic-zero nonarchimedean fields, or the split local algebra at a global place. Identify its upper-Borel induction, additive character `ψ_F∘Tr_{E/F}`, Whittaker functional and central quotient conventions with R16.2–R16.3 and R16.1/haar-quotient-comparison. The adapter identifies the quotient measures and normalized twisted characters, so matching in this roadmap means exactly that supplied relation, including vanishing on regular nonnorm classes. Central characters satisfy `ω_E=ω_F∘N_{E/F}`; tests have inverse central equivariance. At infinity use the supplied invariant character images with the R16.2 archimedean models.

Discharge the finite-place tempered-support hypothesis of AutomorphicSpectralTheory §7.0b at rank two from R16.2's analytic classification: a tempered irreducible is a unitary principal series or a square-integrable unitary Steinberg twist or supercuspidal. Its inducing support is unique up to permutation, by the Jacquet-module calculation in the principal-series case and cuspidal support in the discrete cases. Compare the supplied quotient-normalized operator with the R16.2 models for determinant characters and Steinberg; on generic classes Whittaker uniqueness identifies the operators. Use individual Shintani identities only in the classes allowed by §7.0b, with both irreducibility hypotheses when using products.

The spherical adapter identifies the supplied Satake substitution with R17.4/unramified-base-change on conjugacy classes. For a completely split algebra it identifies product norm and convolution, with residue degree one at each place. Composite cyclic steps use the supplied tower operations.

**Checks.**
- The split degree-one adapter gives the identity matching relation and operator.
- At an unramified quadratic place diag(2,3) becomes diag(4,9), with trace 13 and determinant 36; a regular class with odd determinant valuation is a nonnorm.
- Multiplying a normalized generic σ-operator by a nontrivial ℓ-th root of unity changes its twisted trace and fails Whittaker normalization.
- If η is the quadratic norm character and `ν=|·|_F`, the irreducible ν×η lifts to the quotient `|det|_E^(1/2)` of a reducible standard module; no individual Shintani identity is asserted for this pair.

*Needs:* AutomorphicSpectralTheory §§7.0a–7.0b; R16.2/local-classification; R16.2/archimedean-classification; R16.3/principal-series-parameter; R16.3/tate-unitary-normalization; R16.1/haar-quotient-comparison; SmoothRepresentationsOfLocalGroups SR.2–SR.4.

*Source:* [ac89], Chapter 1 §3 Proposition 3.1 pp.20–22, §4 p.32 and §6 pp.55–62; [bh06], §17.4–§17.5 pp.117–119; AutomorphicSpectralTheory §7.0b, constituent-identity domain and its reducible-lift example.

<a id="r17-2-continuous-residual-ledger"></a>

### R17.2.4 The continuous and residual spectral ledger

Fix a unitary central character and Tamagawa measures. Retain the cuspidal spectrum, residual determinant characters χdet with χ²=ω, and normalized induced families I(μ,ωμ⁻¹). The ordinary GL₂ trace formula has the elliptic sum, the self-associate intertwining term −¼∑tr(MI(f)), the global normalizing-factor integral (4π)⁻¹∫(m′/m)tr I(f), the singular constant and logarithmic unipotent terms, and the local derivative integral `(2π)⁻¹∫∑_v B_v(f_v,η_v)∏_{w≠v}tr I(f_w,η_w)`. Here `B_v` is half the trace of `R_v⁻¹R_v′I(f_v)` minus the Fourier transform of the split logarithmic orbital term. These are the six terms of [langlands80] §10. Express the n=2 ordinary distribution supplied by AutomorphicSpectralTheory Layer 6 in these coordinates; express the full truncated cyclic distribution of its §7.0c in the twisted coordinates below. Its invariant t-discrete distribution is obtained only after the continuous-term cancellations and the central norm-character averaging of R17.2/specialized-trace-comparison.

For prime-cyclic E/F of degree d, the supplied twisted formula has the corresponding elliptic, singular, global-normalizing and local-derivative terms. Its self-associate term is `−¼∑_{η^σ=η̃}tr(I(φ)σM)`. Besides d copies of the twisted discrete spectrum, include ½∑τ(η) over `η^σ=η̃≠η`, with τ(σ)=σM; this exceptional induced summand occurs only for d=2. `M(η^σ)M(η)=1` verifies the extension, and pairing η with η̃ explains the half weight. At η=η̃ the scalar M=−1 follows from the opposite residues of the two zeta factors and the identity local normalized operators. On a quaternion division algebra retain norm characters χNrd: the Steinberg projector difference has trace −1 on χdet, so this correction cannot be discarded.

The API includes Label every term and its measure; change local factors while retaining central character; identify the quadratic exceptional summand; restrict to strongly cuspidal test functions only after recording the induced operator identity.

**Checks.** For d odd the exceptional τ summand is zero; d=2 retains `η^σ=η̃≠η` with weight ½; a Steinberg projector has determinant-character trace −1 rather than zero.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.2/steinberg-projector-difference and local matching; AutomorphicSpectralTheory AS.2, AutomorphicSpectralTheory AS.4, AutomorphicSpectralTheory AS.6 and §§7.0a–7.0c for the ordinary and twisted distributions, intertwining operators and truncation; AdelicAlgebraicGroups AA.2 for measures. The explicit rank-two coordinate comparison belongs here.

*Source:* [langlands80], §10, (10.1)–(10.7), pp.112–115; (10.28)–(10.35), pp.126–128; §11, pp.129–131.

<a id="r17-2-strong-cuspidal-vanishing"></a>

### R17.2.5 Vanishing with a strongly cuspidal local factor

If a finite local factor `f_v` satisfies `∫_{N(Fv)}f_v(xny)dn=0` for every x,y∈GL₂(Fv), then its operator on every representation parabolically induced from the proper Borel is zero. Consequently the induced continuous terms and their intertwining-derivative contributions vanish for the factorizable global test function; the same operator identity kills any residual determinant character arising as a subquotient of such an induction. A supercuspidal matrix coefficient compact modulo center supplies this condition. The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted for this all-x,y condition.

Compact-mod-center smooth test function, suitable integrability and fixed unitary central character; strong cuspidal constant-term condition for all x,y.

*Needs:* R16.2/supercuspidal-kirillov; R17.2/continuous-residual-ledger; SmoothRepresentationsOfLocalGroups SR.2; SmoothRepresentationsOfLocalGroups SR.3; AutomorphicSpectralTheory AS.6.

*Source:* [jl70], §16 equation (16.1.7), p.277; preceding Steinberg averaged constant term, p.269.

<a id="r17-2-specialized-trace-comparison"></a>

### R17.2.6 Quaternionic comparison and the cyclic ledger interface

For matching factorizable functions, prove the ordinary/quaternion trace identity with the preceding ledger. For prime-cyclic transfer, specialize the full truncated distributions supplied by AutomorphicSpectralTheory §7.0c to n=2 and express them in the six-term coordinates of R17.2/continuous-residual-ledger. Identify each term after transport by R17.2/cyclic-local-matching, including quotient measures, central norm index d, Weyl factors and normalized σ-operators. After the singular and derivative cancellations below, group by infinitesimal spectral parameter to recover the supplied invariant t-discrete comparison, retaining its proper-Levi Weyl-intertwiner terms. Compute the conversion from its norm-character averaging and split-central scaling to Langlands’s identity tr R(φ)R(σ)=tr r(f): R contains d copies of the twisted discrete spectrum and the quadratic exceptional summand, while r excludes the one-dimensional and induced continuous constituents of [langlands80] §11. For a cuspidal output with d distinct descents the supplied transferred character is their average with coefficient 1/d; the conversion must account for this coefficient and the quadratic exceptional term, as well as the d copies in R. This is a comparison of distributions on all matching tests, including finite variations at bad places. All cyclic consumers use the supplied distributions and transfer map.

*Cyclic coordinate comparison.* AutomorphicSpectralTheory §7.0c and AS.6 truncation, cyclic Hasse norms, centralizer volumes and index d match elliptic/scalar terms. Pair (10.4) with d(10.31). Norm-fibre Hecke L-products give `∑m′/m=d·m_E′/m_E`, cancelling (10.3) with d(10.28). Section 9's A₃=−θ′ and θ′(c,0,φ)=dθ′(Nc,0,f), including archimedean corrections, cancel (10.5) with d(10.32). Exceptional τ, M=−1 and d self-associate preimages cancel (10.2) with d(10.30). The B-discrepancy (11.1) vanishes at good spherical places; separate it at bad places below.

*Joint absolute bounds.* Fix other factors and the spherical unit at a good split v. Lift compact-mod-centre tests using a central cutoff on GL₂(A)¹, then project to the prescribed character of Z(F)\Z(A)¹. Put `Δ=1−Ω+2Ω_K`. Its inverse powers bound blocks by powers of `(1+t²+λ_π²+λ_τ²)⁻¹`. [flm11] §5.1–2 separates `M⁻¹M′=(n′/n)Id+∑_u N_u⁻¹N_u′`: polynomial weighted L¹ growth for the scalar; bounded finite-level rational degree, polynomial archimedean degree/dimension and unitary variation bounds for local matrices. Choose the resolvent power beyond these and the discrete counting exponent. Block trace norms are jointly summable/integrable before cancellation; central projection preserves this. [mw26] Theorem 11.1 applies the same estimates to `Res_{E/F}GL₂` with σ, a unitary twisted operator and conjugated level. Keep the quadratic self-associate term at spectral dimension zero.

For B₁, [langlands80] §9 pp.98–99,111 gives compact logarithmic orbital functions with measure-valued derivatives of orders 2,3,2 on the real, complex and nonsplit real twisted quotients. Fourier–Mellin decay exceeds their dual dimensions 1,2,1. Other archimedean Abel transforms are smooth/compact; finite-place transforms have bounded conductor. S-units and ray classes describe global character parameters by finitely many lattices times the real norm direction. Disjoint fixed-radius tubes compare their sum/integral, including σ-invariant subsets, with the integrable product decay.

Hence ∑|cᵢ|<∞ and ∫|d(it)|dt<∞ in (11.6)–(11.7). The algebraic measure milestones `spectralCircle_fibre_countable` and `spectralCircle_density_singleton` also state that the real quotient fibres are countable for every real period T, and for T>0 and any nonnegative measurable density d (without an L¹ assumption), its pushforward has zero singleton mass. The L¹ assumption supplies finite total variation for the spectral comparison. Push d to the circle of period `2π/|log|ϖ_v||` and its Weyl quotient. Countable point fibres give no atoms and variation ≤||d||₁; no supremum bound is needed. Retain complementary parameters in the compact unitary Satake set. The Weyl-invariant Laurent algebra is self-adjoint and separates orbits, extending equality to finite measures. Separate atoms from the continuous measure, then each original coefficient from a finite set after bounding its tail (§11 p.138). Bad-place factors can vary arbitrarily.

**Quaternion proof.** Apply AutomorphicSpectralTheory AS.6 and [jl70] §16's eight-term expansion. Put supercuspidal coefficients or Steinberg projectors at all ramified places. Equation (16.1.7) at at least two places kills split, singular, continuous and derivative terms. Elliptic matching leaves a scalar difference; separation and Lemma 16.1.2 would turn it into an away-place regular trace, forcing a noncompact group compact. Thus trace equality and the volume/formal-degree identity. Then subtract equal norm-character traces: each Steinberg factor gives −1, with product 1. Character independence gives cuspidal transfer; AutomorphicSpectralTheory supplies convergence, and R17.2 supplies the local matching functions.

The API includes Joint bounds before summing derivatives; atom-free L¹ periodization (`spectralCircle_fibre_countable`, `spectralCircle_density_singleton`); finite changes of local factors; quadratic exceptional correction; strongly cuspidal and Steinberg/norm-character specializations.

**Checks.** Identity extension gives the ordinary formula; a cuspidal output with d distinct descents retains the supplied coefficient 1/d under the ledger conversion; deleting quadratic τ leaves (10.30) unmatched; retain the Steinberg/norm-character correction. Finite harmonic cutoffs do not give an absolute bound. The unbounded |t|⁻¹/² density on (0,1) has atom-free periodization. A constant map gives an atom.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.2 local matching, continuous-residual-ledger and strong-cuspidal-vanishing; AutomorphicSpectralTheory AS.6 and §§7.0a–7.0c for the canonical ordinary and cyclic distributions and spectral isolation; AdelicAlgebraicGroups AA.2–3; ClassFieldTheory cyclic norm theorem and reciprocity; R16.4 multiplicity one. The rank-two singular and derivative cancellations and their comparison with the supplied distribution are owned by this target.

*Source:* [langlands80], §9 pp.97–111, §10 pp.112–128, Theorem 11.1 pp.130–138; [jl70], §16 pp.262–278, Theorem 16.1 pp.269–270; [flm11], Theorem 3 and Proposition 1 pp.183–184, §5.1–2 pp.187–191; [mw26], Theorem 11.1 pp.14–16, Theorem 13.1 pp.17–18 (v2).


### Examples

The Steinberg projector has trace +1 on Steinberg and −1 on its determinant-character exception. In a quadratic trace comparison the exceptional induced summand has weight 1/2. Periodization of the L¹ density `|t|^(−1/2)` on (0,1) has zero singleton mass, including both reflection-fixed classes; a point mass retains an atom.

### Dependencies

LocalGaloisDeformationRings §2.26.1; R16.1–R16.4; R17.1; AutomorphicSpectralTheory Layers 0, 2, 4 and 6 and §§7.0a–7.0c; AdelicAlgebraicGroups AA.2–AA.3; R17.2/quaternionic-orbital-matching and R17.2/cyclic-local-matching; ClassFieldTheory Layers 11–13.

## Layer R17.3: Global Jacquet–Langlands

<a id="r17-3-global-jl"></a>

### R17.3.1 Global Jacquet–Langlands correspondence

For a number field F, quaternion algebra D with ramification set S, fixed split-place identifications and unitary Hecke character ω, let `DS_D(ω)` be the irreducible classes in the fixed-ω discrete L² spectrum modulo centre. For nonsplit D this quotient is compact; for split D the discrete spectrum consists of cusp classes and χdet with χ²=ω. There is a bijection `JL_D` from the non-one-dimensional members onto cusp GL₂ classes of centre ω square-integrable modulo centre at every v∈S. Components agree at split places and use R17.1 at ramified places: finite Steinberg/supercuspidal classes and real `D_k`, k≥2, with quaternionic partner of dimension k−1. The split-D map is the identity. Extend to nonunitary centres by real norm twists. The domain excludes both norm characters and split Eisenstein constituents.

Prove the following API.
- `globalJL_local`: For every place v, `local(GL₂,JL_D π′,v)` equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v.
- `globalJL_central`: The central character of `JL_D` π′ is the central character of π′.
- `globalJL_inverse`: The inverse of `JL_D` recovers every non-one-dimensional discrete series π′ of `D×(A_F)`. `JL_D` of the inverse recovers every cuspidal π with `π_v` square-integrable at all v ∈ S.
- `globalJL_twist`: For a unitary Hecke character χ of F, `JL_D(π′⊗χ∘Nrd)` = `JL_D(π′)⊗χ∘det`; the central character becomes ωχ². For a non-unitary χ this holds after the twist reduction to unitary central character.
- `globalJL_split`: For D=M₂(F), using the identity identifications, `JL_D` is the identity equivalence on cuspidal classes.

**Checks.**
- For D=M₂(Q), `JL_D` fixes every cuspidal isomorphism class.
- For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with `π_p=St⊗χ_p`, `local(JL_D inverse π,p)=χ_p∘Nrd` under R17.1; local characters are not discarded.
- For every D-compatible cuspidal π, JL_D(`JL_D inverse π`)=π, and the split-place components of its inverse equal `π_v`.
- For D = M₂(Q) and unitary Hecke characters μ, ν of Q, the irreducible automorphic representation π(μ,ν) induced from μ⊗ν is not one-dimensional and does not factor through det. It is not in the domain of `JL_D`, because it does not occur in `L²_disc(GL₂(Q)A^×\GL₂(A), μν)`.

*Needs:* LocalGaloisDeformationRings §2.26.1; R16.1; R16.4; R17.1; R17.2; R16.2; ArithmeticLocallySymmetricSpaces ALS.F.6; AutomorphicSpectralTheory `§0.50/restricted_tensor_factorization`; ArithmeticLocallySymmetricSpaces ALS.F.6/cuspidalRepresentation.

*Source:* [br10], §1.5, definition of discrete series, p. 5; §18.1, Theorem 18.1(a), p. 44; also Theorem 1.4(a), p. 6; [jl70-global], §14, Theorem 14.4, p. 247; §16, Theorem 16.1, p. 261; §16, paragraph after Theorem 16.1, p. 261.

<a id="r17-3-norm-exception"></a>

### R17.3.2 The reduced-norm character exception

For nonsplit D/F and a Hecke character χ, χNrd is excluded from cuspidal JL. Classical local transfer gives St⊗χdet at finite ramified places, D₂⊗χdet at real ramified places, and χdet at split places. This tensor is noncuspidal and JL70 says it is not an automorphic subrepresentation. Badulescu–Renard's extended discrete-spectrum map instead pairs unitary χNrd with the residual class χdet. Its local |LJ| maps both χdet and St⊗χdet to χNrd; this extension is not injective and differs from classical JL outside square-integrable classes.

Use fixed split-place identifications and the R17.1 classical local correspondence.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R16.2; R17.1; R16.4.

*Source:* [jl70-global], §14, paragraph after Theorem 14.4, p. 247; [br10], §15, Proposition 15.3(a), p. 39, with Theorem 18.1(a), p. 44.

<a id="r17-3-split-hecke"></a>

### R17.3.3 Split-place Hecke compatibility

For `π=JL_Dπ′`, the fixed split-place identifications identify local representations, every `K_v`-invariant module and its Hecke action. At spherical v the common `T_v=[K diag(ϖ,1)K]` and `S_v=[K diag(ϖ,ϖ)K]` eigenvalues give `1−T_vX+q_vS_vX²`, equivalently the reciprocal polynomial `X²−T_vX+q_vS_v`. This does not identify integral global modules or multiplicities at different levels, and division places have no such spherical vector.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R16.2.

*Source:* [cdn23], §4.1.3, p. 39; §4.1.4, p. 41; §4.1.2, p. 39.

<a id="r17-3-local-factors"></a>

### R17.3.4 Local factors of quaternionic transfer

For `π=JL_D(π′)`, compatible ψ and self-dual measures, every local character twist has equal standard and dual L-factors and equal normalized ε-factors on `π_v` and `π′_v`. At split places use the fixed identification; at ramified places use JL70's division factors. The division zeta functional equation has the extra sign −1. If its raw constant is called ε instead, the local constants differ by −1 at each ramified place; the global product is `(−1)^|S|=1`. Thus completed twisted L-functions, global ε-factors and functional equations agree.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R16.3; R17.1; R16.5.

*Source:* [jl70-global], §14, before Theorem 14.4, p. 247; §14, proof of Theorem 14.2, p. 241.

<a id="r17-3-strong-multiplicity-one"></a>

### R17.3.5 Quaternionic strong multiplicity one

Let π′ and σ′ be discrete series of `D×(A_F)`: irreducible subrepresentations of `L²(D×(F)A_F^×\D×(A_F), ω)` for a unitary ω. For nonsplit D these are, up to a twist by `|Nrd|^s`, all irreducible automorphic representations. Assume they are not one-dimensional. If `π′_v ≅ σ′_v` for all finite v outside a finite set, then `π′ ≅ σ′`. In particular their components away from a finite set of places determine the components in that set, for example at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R16.4.

*Source:* [br10], §1.5, Theorem 1.4(c), p. 6; §18.1, Theorem 18.1(b), second sentence, p. 44; [cdn20-global], §5.2.1, proof of Proposition 5.2, p. 45.

<a id="r17-3-multiplicity-one"></a>

### R17.3.6 Multiplicity one in the non-norm spectrum

For a fixed unitary central character ω, every non-one-dimensional discrete series π′ of `D×(A_F)` occurs with multiplicity exactly one in `L²_disc(D×(F)A_F^×\D×(A_F), ω)`. Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R17.2; R16.4.

*Source:* [br10], §1.5, Theorem 1.4(b), p. 6; §18.1, Theorem 18.1(b), first sentence, p. 44.

<a id="r17-3-coefficient-conjugation"></a>

### R17.3.7 Coefficient conjugation of global transfer

For totally real F, quaternion D and cohomological `π=JL_Dπ′`, assume R16.4's rationality comparison supplies a cusp `π^σ` with finite part `σπ_f` and permuted real weights for every σ∈Aut(ℂ). It remains D-compatible: σ preserves finite square-integrability and the real components stay discrete series. Inverse JL gives `π′^σ` with finite part `σπ′_f`. At split finite places σ commutes with the identification and hence Hecke actions. Thus `Q(π_f)=Q(π′_f)`. Equality of rationality fields alone does not construct models over that field.

At real ramified places π′ has the matching algebraic type. Use the arithmetic pair `a_v=t_v, b_v=q_v s_v`.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/split-hecke; R17.3/strong-multiplicity-one; R16.4; R17.3/global-jl; R17.1; R16.4/cohomological-rationality; R16.4/cohomological-rationality.

*Source:* [pan26-global], §5.5.5, p. 75.

<a id="r17-3-rational-models"></a>

### R17.3.8 Rational-model comparison under transfer

Let `(π′, π)` be the cohomological JL pair of coefficient-conjugation, and `L ⊂ C` a field containing `Q(π_f) = Q(π′_f)`. A p-adic coefficient field such as CDN20's is used through a fixed isomorphism `C ≅ Q̄_p`. (i) If `π′_f` and `π_f` have L-models, then at every finite `v ∉ S` the fixed identification gives an L-linear isomorphism of the L-models of `π′_v` and `π_v`, hence of their `K_v`-invariants with Hecke actions; the arithmetic Hecke eigensystems agree in L and after every extension of L. The models are absolutely irreducible, so isomorphism over C descends to L. (ii) Equality of the fields of rationality does not by itself give an L-model of `π′_f`: a Schur/descent obstruction at places of S may force a finite extension of L. Consumers therefore fix L large enough. CDN20 §5.2.1 requires the Shimura-curve representation to be defined over its coefficient field L and allows a finite extension of L (footnote 21).

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/coefficient-conjugation; R16.4; R17.3/split-hecke; R16.4/cohomological-rationality; R16.4/cohomological-rationality.

*Source:* [cdn20-global], §5.2.1, p. 44; §5.2.1, footnote 21, p. 44.

<a id="r17-3-definite-infinity"></a>

<a id="r17-3-definite-hilbert-exports"></a>

### R17.3.9 Definite quaternionic weights and cuspidal transfer

For totally real F and D ramified at every real place, algebraic real types of a non-norm π′ transfer to the matching discrete series, `Sym^{k−2}↔D_k`. In Pan's ℚ algebra ramified at {p,∞}, `A_{(k,0)}` uses `W^{(k,0)}`, dual to the algebraic `D_p×` type of highest weight (0,−k). For k≥1 its `T_S` spectrum is indexed by cusp π with that infinity infinitesimal character, `(π^∞)^{K^p}≠0` and `π_p` special or supercuspidal, hence lies in `σ_{k+2,1}^{K^p}` on `M_{k+2}(K^p)·t`; t carries the cyclotomic action. For k=0 split `A_{(0,0)}=A^c⊕A^1`: `A^1` factors through Nrd and has spectrum `σ_0`, while `A^c` gives `σ_{2,1}`. Consume the canonical classical finite-level spaces and Hecke actions of QuaternionicModularForms §§1.3, 2.1–2.2 and 3.1.

**The classical coefficient and Hecke adapter to Pan’s spaces.** For D/ℚ ramified at
{p,∞}, fix a splitting of `D_p` over a finite p-adic coefficient field and extend scalars
to `C_p`. Let τ be the algebraic left action on `W^{(k,0)}`, the dual of the type of highest
weight (0,−k). Supply QuaternionicModularForms §2.1 with the right coefficient action
`w|u=τ(u_p)⁻¹w`. Compare this action, by the dual/opposite-action dictionary, with §1.3’s
classical symmetric-power coefficients and determinant normalization. This is an algebraic
coefficient adapter at the division place; no splitting `D_p≅M₂(ℚ_p)` or split-p analytic
weight theorem is an input. For `U=K^p U_p` the supplied transformation law is exactly
`f(γgu)=τ(u_p)⁻¹f(g)`. Prove that the filtered colimit over shrinking compact open `U_p`,
using §2.1’s level inclusions, is Pan’s `A_{(k,0)}^{K^p}`. Its `D_p×` action is
(h·f)(g)=τ(h)f(gh); prove smoothness of this corrected action. Compare central actions
explicitly: a scalar `z_p` acts on coefficients by `z_p^k`, so the level law uses `z_p^{-k}`;
if `f(gz)=ω_raw(z)f(g)`, the corrected central action is `z_p^kω_raw(z)`.
Carry this relation when specifying a fixed automorphic central character.
The colimit and the comparison commute with coefficient extension and tame level change.

Use Pan’s main involution to fix the away-p split identifications and `K^p`. Compare
QuaternionicModularForms §3.1’s action of the opposite Hecke ring with Pan’s left
operators through the double-coset inversion anti-involution. On functions the supplied
slash by δ is `τ(δ_p)⁻¹f(gδ⁻¹)`, the corrected left action of δ⁻¹. Prove the corresponding
finite-sum identities and transport eigencharacters. With these split identifications,
inversion sends the good coset `T_ℓ` to `S_ℓ⁻¹T_ℓ` and `S_ℓ` to `S_ℓ⁻¹`; to obtain Pan’s
`T_ℓ,S_ℓ` use the inverse cosets in the opposite action. Include §1.3’s determinant
rescaling when passing from normalized to algebraic coefficients. Thus the resulting
`T_S=ℤ_p[T_ℓ,S_ℓ:ℓ∉S]` action has Pan’s normalization, including its cyclotomic factor t.
A coefficient-field embedding and the finite tensor weight comparison identify the
classical spaces with their complex automorphic realization before applying JL.

**Checks.** At k=0 the coefficient action is trivial and the level colimit contains the
constant norm character, which contributes to `σ_0` rather than the cuspidal `σ_{2,1}`.
At k≥1 the scalar action and dual highest weight recover the k+2 weight and the factor t
in Pan’s spectrum. At a good split prime, verify both `T_ℓ` and the central `S_ℓ` against
the inverse-coset formulas; test two noncommuting normalizing singleton cosets to detect
order reversal. At the division place p the algebraic coefficient construction and level
colimit remain defined without a split-p analytic chart.

*Needs:* LocalGaloisDeformationRings §2.26.1; QuaternionicModularForms §1.3 (classical coefficient dictionary), §2.1 (abstract forms and evaluation), §2.2 (classical definite forms), §3.1 (opposite-Hecke action); R17.3/global-jl; R17.3/split-hecke; R17.1; R16.6.

*Source:* [pan26-global], §5.4.1, pp.68–69 (main involution); §5.4.10 and Definition 5.4.11(1)–(3), p.71 (coefficients, level union and norm quotient); §5.5.5, pp.75–76 (Hecke normalization and spectrum). The right-action and inverse-coset identities above give the comparison with QuaternionicModularForms §§1.3, 2.1–2.2 and 3.1.

<a id="r17-3-indefinite-parity"></a>

### R17.3.10 Indefinite transfer and the parity input

For totally real F of degree d, a quaternion B split at one real place has d−1 ramified real places. Its finite ramification has the parity of d−1 by ClassFieldTheory14. CDN20 §5.2.1 prescribes B̌ split at ∞₀, compact modulo centre elsewhere at infinity and ramified at 𝔭; it imposes no degree condition on F. Remaining finite ramification must satisfy parity. For such B and cusp π square-integrable at every ramified place, `JL_B^{-1}(π)` supplies the Shimura-curve automorphic representation, with unchanged components/Hecke data at split finite places. The output is the quaternionic automorphic representation and its split-place Hecke action; a Shimura-curve cohomological realization is a supplied input to any geometric use.

Allow d=1. B is given, and π is square-integrable at every ramified place, including every ramified real place.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R17.3/split-hecke; ClassFieldTheory Layer 14; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

*Source:* [cdn20-global], §5.2.1, p. 43.

<a id="r17-3-invariant-exchange"></a>

### R17.3.11 Transfer after exchanging two quaternion invariants

In CDN23 §4.1 take p>2, an even-degree totally real E with p completely split, 𝔭|p and ∞₀. D⁰ ramifies at all real places; D exchanges its invariants at {𝔭,∞₀}. Identify the algebras away from these places by (4.6). A cusp π discrete series at every real place and 𝔭 transfers to both, with identical away-place Hecke actions. At 𝔭 the D⁰ component is `π_𝔭` and the D component its division partner; at ∞₀ the D⁰ algebraic type matches `π_{∞₀}`. Transport CDN23's tame level, hyperspecial away w₁ and upper-unipotent modulo `ϖ_{w₁}` at w₁. The supplied auxiliary w₁ has N(w₁) prime to 2Np, N(w₁)≢1 mod p, and residual Frobenius eigenvalue ratio outside `{1,N(w₁)^{±1}}`; N is the product of effective finite stabilizer orders. Choosing w₁ and the globalized E remains separate from transfer.

Fix the maximal-order identifications `(O_{D⁰})_v≅M₂(O_{E_v})` and the away-{𝔭,∞₀} algebra isomorphism (4.6). The auxiliary place and the globalized field are supplied data.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R17.3/split-hecke; ClassFieldTheory Layer 14; R17.1; GlobalQuadraticForms §4.4 (`exists_hilbertSymbol_eq_neg_one_iff_pair`); QuadraticFormInvariants Layer 2.

*Source:* [cdn23], §4.1.1, Proposition 4.5, p. 37; §4.1.2, p. 38; §4.1.2, equation (4.6), p. 38; §4.1.2, p. 38.

<a id="r17-3-supercuspidal-globalization"></a>

### R17.3.12 Quaternionic globalization of a supercuspidal type

In CDN20 §5.2.1 fix `F₀/ℚ_p`, a coefficient field `L/ℚ_p`, `C≅Q̄_p`, and supercuspidal τ=LL(M) with centre trivial on ϖ. Let E be totally real with `E_𝔭≅F₀`. B̌ ramifies at 𝔭 and every real place except ∞₀; B exchanges invariants at {𝔭,∞₀}. Construct an automorphic Π̌ with `Π̌_𝔭=JL(τ)`, trivial types at compact real places, and weight-two holomorphic discrete series at ∞₀. Permit the central-character adjustment of footnote 21: twist τ by ηdet and its division partner by ηNrd, and replace L by a finite extension. Global JL then gives Π on B with `Π_𝔭=τ` and `Π_f^𝔭=Π̌_f^𝔭`. The latter determines `Π̌_𝔭` by strong multiplicity one.

Proof: Extend `ω_τ` by full-local-character-prescription to finite Ψ, trivial at infinity. AdelicAlgebraicGroups AA.3 gives compactness modulo centre for B̌×. A normalized JL(τ) matrix coefficient at 𝔭 has trace one on that class and kills norm characters, since dim JL(τ)>1. Average at compact real places. At ∞₀ balance the split centre and use (sl₂,O(2)). Its tangent representation has weights ±2; D₂ contains that O(2)-type once and has no weight zero. Thus relative cochains vanish in degrees 0,2 and have dimension one in degree 1. The negative AutomorphicSpectralTheory AS.6 Euler–Poincaré function has D₂ trace +1 and identity value its positive formal degree. One-dimensional exceptions are killed at 𝔭. Using (gl₂,O(2)) without balancing would instead give zero Euler characteristic.

On AdelicAlgebraicGroups AA.2's compact central quotient C of mass one, `P_Ψ=∫_C` Ψ(z)⁻¹R(z)dz projects onto the Ψ-isotypic space by character orthogonality. AutomorphicSpectralTheory AS.6 gives trace-class T=R(f) and ‖R(z)T‖₁=‖T‖₁. Trace-norm continuity and AutomorphicSpectralTheory AS.0's bounded trace justify `tr(P_ΨT)=∫_C` Ψ(z)⁻¹tr(R(z)T)dz. Apply this to the compact trace formula with the same centralizer measures.

Fix supports modulo centre and compact idempotents elsewhere; shrink an auxiliary split-place level. The rational central invariant Δ=(trd²−4Nrd)/Nrd is bounded on fixed supports and uniformly small at the shrinking place. The product formula forces Δ=0. A repeated characteristic root in a characteristic-zero division algebra forces γ scalar. Only the identity class remains, with positive volume times formal degrees and inverse auxiliary volume. Hence the spectral trace contains the prescribed Π̌ and no norm character.

Cohomological JL and R16.4/cohomological-rationality rationality give an actual number-field model after finite extension. Combine its p-adic completion with L, obtaining the allowed coefficient extension. Strong multiplicity one determines the missing 𝔭 component from `Π̌_f^𝔭`.

*Needs:* LocalGaloisDeformationRings §2.26.1; R17.3/global-jl; R17.3/strong-multiplicity-one; R17.3/rational-models; R16.1/full-local-character-prescription; AdelicAlgebraicGroups AA.2; AdelicAlgebraicGroups §3.4 (compact anisotropic quotient); AutomorphicSpectralTheory §0.9 (complex trace); AutomorphicSpectralTheory §6.17 (compact trace formula); AutomorphicSpectralTheory §6.19 (real Euler–Poincaré functions); ArithmeticLocallySymmetricSpaces ALS.F.7; AutomorphicLFunctionsAndLocalFactors/archimedean-gln-parameters; R16.4/cohomological-rationality.

*Source:* [cdn20-global], §5.2.1 pp.43–44, footnote 21; [getz15], §6.5 p.34 for the O(2)-types (AutomorphicSpectralTheory §§0.48–0.49 supplies corrected operators); [clozel86], §3.2 Lemmas 4–5 pp.271–272, Lemma 9 p.274, §4.3 Theorem 1B pp.279–280. The fixed-centre division-algebra argument removes unipotent terms; it does not enlarge Clozel's semisimple theorem.


### Examples

For split D, JL fixes every cusp class and excludes an Eisenstein principal series from the discrete domain. With division ramification {p,∞}, a compatible weight-two Steinberg cusp has a local norm-character partner at p. Two local signs −1 multiply to +1, while a rationality-field equality does not by itself remove the Schur obstruction.

### Dependencies

LocalGaloisDeformationRings §2.26.1; R16.1–R16.6; R17.1–R17.2; ArithmeticLocallySymmetricSpaces ALS.F.6–F.7; R16.4/cohomological-rationality; GlobalQuadraticForms §4.4; QuaternionicModularForms §§1.3, 2.1–2.2, 3.1 for classical form spaces and Hecke actions; R17.3/definite-hilbert-exports for their coefficient and spectral comparisons.

## Layer R17.4: Cyclic, solvable and cubic base change

Every good-place comparison in this layer means agreement off a finite set of the
R16.4.4 shared eigensystems in both coordinates. Automorphic classes use
`unitaryEigensystem`; classical and Galois inputs use the specified root scaling before
comparison. Full local compatibility is a further property of the same global output.

<a id="r17-4-unramified-base-change"></a>

### R17.4.1 Unramified base-change Satake rule

Use the existing arithmetic Satake conjugacy class `A_v∈GL₂(C)` at an unramified finite v. For an unramified local extension `E_w/F_v` of residue degree f≥1, define its base-change representative to be `A_v^f`; the conjugacy class is independent of the chosen representative. This matrix-power fixture represents the n=2 Satake substitution supplied by AutomorphicSpectralTheory §7.0b and §7.1, via R17.2/cyclic-local-matching; it introduces no new Satake carrier or transfer map. Its determinant is `det(A_v)^f` and its local Euler polynomial is `det(1−A_v^f X)`. For a split global place each local degree is one. The formal degree-zero extension of the matrix-power function is the identity matrix and is not a degree-zero field extension.

Define `satakePowerSum (s e : R) : ℕ → R` over any commutative ring by
`p₀=2`, `p₁=s`, `p_{n+2}=s p_{n+1}−e p_n`. Prove `trace_pow_eq_satakePowerSum`:
`tr(Aⁿ)=p_n(tr A,det A)` for every 2×2 matrix A, without invertibility or
characteristic-zero hypotheses. Cayley–Hamilton gives the recurrence. The API
`satakePowerSum_zero`, `satakePowerSum_one`, `satakePowerSum_recurrence`,
`satakePowerSum_map`, `satakePowerSum_roots` and `satakePowerSum_tower` gives the
initial values, defining recurrence, coefficient maps,
`p_n(α+β,αβ)=αⁿ+βⁿ`, and `p_g(p_f(s,e),e^f)=p_{fg}(s,e)`.
On diagonal complex matrices this agrees with AutomorphicSpectralTheory's
`satake_power_sum`; it extends that diagonal statement to arbitrary coefficient rings
without choosing roots or a Satake representative.

Define `formalBaseChange` on the shared eigensystems by residue degrees f=f(w/v)≥1:
`t_w=p_f(t_v,q_v s_v)`, `s_w=s_v^f`.
Then `q_w s_w=(q_v s_v)^f` because `q_w=q_v^f`. This formula needs no division
in the coefficient ring. Prove coefficient-map, norm-twist and tower compatibility and
agreement invariance under enlarging the exceptional set. Using the places and Frobenius
interface of ArithmeticGaloisRepresentations §§2.1–2.2, prove the restriction identity
`Φ_w ↦ Φ_v^f` modulo inertia here: the residue-field action `x ↦ x^{q_w}` is the
f-th power of `x ↦ x^{q_v}`, and invert both for geometric Frobenius. For unramified r
this proves `ofGaloisRep(r|G_E)=formalBaseChange(ofGaloisRep r)` off the
common finite set. The arithmetic-dual convention is unchanged by restriction.

Prove the following API.
- `unramifiedBaseChange_one`: The degree-one rule fixes A.
- `unramifiedBaseChange_tower`: Applying residue degrees f and then g gives `A^{fg}`.
- `unramifiedBaseChange_conjugate`: For P∈GL₂(K), the rule sends P A `P^{-1}` to P `A^f` `P^{-1}`.
- `unramifiedBaseChange_det`: The determinant of the output is `det(A)^f`.
- `unramifiedBaseChange_map`: Every coefficient ring map commutes with the power rule.

**Checks.**
- Degree one returns every A∈GL₂(K).
- The identity matrix stays the identity for every f, including the formal f=0 case.
- For A=diag(2,3)∈GL₂(Q), degree two gives the matrix diag(4,9), trace 13 and determinant 36.
- For that A, degree two is different from degree one.
- Residue degrees two then three give diag(64,729), agreeing with degree six.
- With q=5, `(t,s)=(5,6/5)` has degree-two output `(13,36/25)`;
  the determinant is 36 and the new residue size is 25. Using 36 as the new S-coordinate
  would confuse the determinant with its normalized Hecke coordinate.
- In characteristic two, p₀=0 and `p₂=s²`; the recurrence still computes matrix traces,
  including the repeated-root and nonsemisimple cases.

*Needs:* AutomorphicSpectralTheory §7.0b and §7.1 (`satake_power_sum`); Mathlib `Matrix.GeneralLinearGroup`, `Matrix.charpoly_fin_two` and Cayley–Hamilton; R16.3; R16.4/strong-multiplicity-one; ArithmeticGaloisRepresentations §§2.1–2.2.

*Source:* [ac89], Chapter 3 §1, formula (1.1) and Definition 1.1, p.199; [langlands80], §2, local lifting criterion (i), p.9. The polynomial recurrence follows by taking traces in the rank-two Cayley–Hamilton identity; its companion matrix gives the root-free tower identity.

<a id="r17-4-cyclic-base-change"></a>

### R17.4.2 Rank-two interfaces for canonical prime-cyclic base change

For number fields E/F cyclic of prime degree ℓ, write `BC_{E/F}` for the n=2 specialization of AutomorphicSpectralTheory §7.1, on cuspidal classes and two-character isobaric sums with their specified norm twists. Use its weak output, centre, twists and Galois action unchanged. Good-place Satake powers agree with `unramifiedBaseChange` through R17.2/cyclic-local-matching. There is one weak map; the all-place upgrade in R17.4/local-compatibility proves a further property of this same output.

Compare the supplied local Langlands-quotient construction with R16.2's ordered GL₂ models. The supplied normalized character identities and spectral isolation give the local comparison at split places, where the operator is cyclic permutation of tensor factors; no extraordinary WD identification is used. For any isobaric GL₂ output obtained from the explicit R17.2 ledger with the same good-place powers, isobaric strong multiplicity one identifies it with this canonical BC output. R17.2/specialized-trace-comparison identifies the normalized trace interfaces, rather than deducing their equality from multiplicity one alone.

The GL₂ adapter API consists of:
- `cyclicBaseChange_local`: After R17.4/local-compatibility, the canonical output at w|v has the restricted normalized WD parameter, retaining N; its split-place identity is available in the weak phase.
- `cyclicBaseChange_coefficients`: With the R16.4 rational/cohomological input and algebraic normalization, coefficient conjugation commutes with the canonical BC, by conjugating good-place Hecke data and applying isobaric strong multiplicity one.

**Checks.**
- At a completely split v the weak output has component `π_v` and Satake representative `A_v`.
- At an inert unramified quadratic place diag(2,3) becomes diag(4,9); any weak output with these good-place data is the canonical isobaric class.
- A quadratic `θ⊞θ^σ` output with `θ≠θ^σ` remains the same noncuspidal class through the normalization comparison and all-place upgrade.
- The weak output and the normalization comparisons are available before the Artin construction, without R17.4/local-compatibility.

*Needs:* AutomorphicSpectralTheory §§7.0a–7.0c and §7.1; R17.2/cyclic-local-matching; R17.2/specialized-trace-comparison; R17.4/unramified-base-change; R16.2; R16.4; AutomorphicLFunctionsAndLocalFactors AL.3/isobaric-strong-multiplicity-one. Only the all-place clause of `cyclicBaseChange_local` uses R17.4/local-compatibility.

*Source:* [langlands80], §2 global properties (A),(B), p.14, §8 split places p.93, §11 Lemma 11.3 and Proposition 11.4 pp.140–145; [ac89], Chapter 3 Theorem 4.2 pp.202–203 and Theorem 5.1 pp.212–213.

<a id="r17-4-local-compatibility"></a>

### R17.4.3 All-place compatibility of cyclic base change

For the canonical weak prime-cyclic BC pair supplied by AutomorphicSpectralTheory §7.1, after the R17.5 Artin construction, and every w|v, identify `rec(BC(π)_w)` with `rec(π_v)|W_{E_w}`, retaining N; the same identity holds for recᵀ since local norms restrict compatibly. Principal series restrict both characters; Steinberg twists retain N≠0; a restricted supercuspidal parameter can become reducible. Real-to-complex transfer restricts the real Weil parameter. The global character identity supplies a local Shintani lift; proving that its parameter is the restriction is a further local comparison. Langlands treats reducible, special, dihedral and tetrahedral cases. Include the extraordinary dyadic case in every prime degree. R16.3's existence of local LLC alone does not prove this comparison, and [bh06] §52.9 p.324 explicitly distinguishes tame lifting from Weil restriction.

Use Frobenius-semisimple Weil–Deligne parameters and the R16.3 geometric reciprocity and Tate normalization. `E_w/F_v` is trivial or cyclic of degree ℓ, at every finite and infinite place.

*Needs:* R17.4/cyclic-base-change (weak phase); R16.3; R17.5/tunnell-primitive-globalization (finite primitive branch); R17.5/tetrahedral-artin; R17.5/octahedral-artin; AutomorphicLFunctionsAndLocalFactors AL.3/isobaric-strong-multiplicity-one; ClassFieldTheory Layer 11 (the reducible character branch).

*Source:* [ac89], Chapter 3, Definition 1.2 and Theorem 5.1, pp. 199, 212–213; [langlands80], §2, local result (e), p. 10; §7, Lemma 7.6, p. 68; §11, Lemma 11.8, p. 151; [carayol86], §§12.2.2–12.2.3, pp. 457–458. Globalize the finite primitive parameter after removing a norm twist, apply strong Artin to the arithmetic dual of that globalization, and compare weak base change with the all-place Artin class of the restricted finite representation by isobaric strong multiplicity one, then restore the twist. If the finite restriction is reducible, construct its two-character isobaric class by reciprocity. This argument treats every prime degree, including degree two. Checks: split extensions fix the component; Steinberg retains N; a primitive dyadic parameter restricted through a prime step uses the finite globalization argument, including degree two.

<a id="r17-4-cyclic-descent"></a>

### R17.4.4 Supplied prime-cyclic descent

Consume AutomorphicSpectralTheory §7.1's invariant cuspidal descent and isobaric extension at n=2, using the canonical weak BC of R17.4/cyclic-base-change. A descent is a preimage under that map. The norm-kernel character group is identified by ClassFieldTheory Layer 11. No Galois representation or all-place WD comparison is required for this supplied automorphic descent.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/cyclic-base-change; ClassFieldTheory Layer 11.

*Source:* [ac89], Chapter 3 Theorem 4.2(d)–(f), pp.202–203; [langlands80], §11 Lemma 11.6(b), p.151.

<a id="r17-4-cuspidality"></a>

### R17.4.5 Supplied cuspidality criterion at rank two

Specialize AutomorphicSpectralTheory §7.1's self-twist criterion: for cuspidal GL₂ input, a noncuspidal prime-cyclic output forces ℓ=2 and is a pair of distinct conjugate Hecke characters. For ℓ>2 the output is cuspidal, since the exceptional block rank 2/ℓ must be integral. Use the supplier's norm-twist extension for nonunitary cuspidal input. R17.4/quadratic-induction identifies the quadratic exceptional input with automorphic induction after this weak phase.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/cyclic-base-change.

*Source:* [ac89], Chapter 3 Theorem 4.2(a)–(b), p.202; [langlands80], §11 Lemmas 11.3 and 11.7, pp.140–141,151.

<a id="r17-4-cyclic-descent-fibers"></a>

### R17.4.6 Supplied cuspidal fibres

Use AutomorphicSpectralTheory §7.1's fibre theorem with its rank-two self-twist criterion. A cuspidal output has ℓ distinct cuspidal descents related by norm-kernel twists. A quadratic output `θ⊞θ^σ` with distinct characters has a unique cuspidal descent, fixed by the quadratic norm-kernel twist. Distinctness of ℓ descents applies only to a cuspidal output.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/cuspidality; R17.4/cyclic-descent.

*Source:* [ac89], Chapter 3 Theorem 4.2(d)–(e), pp.202–203; [langlands80], §11 Lemma 11.6, pp.150–151.

<a id="r17-4-isobaric-fibers"></a>

### R17.4.7 Supplied constituent-wise isobaric fibres

Use AutomorphicSpectralTheory §7.1's constituent-wise fibre relation, including multiplicities and specified norm twists. For χ₁⊞χ₂ over F this is equality of the unordered pairs of norm-pulled-back characters; each character may acquire its own norm-kernel twist. An invariant pair exchanged by σ has its quadratic cuspidal descent from R17.4/cyclic-descent-fibers. These are the supplied fibres of the canonical map, with no common-twist assertion for an arbitrary isobaric input.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/cyclic-descent-fibers; ClassFieldTheory Layer 11.

*Source:* [ac89], Chapter 3 Theorem 4.2(c),(e),(f), pp.202–203; [langlands80], §2 property (C), p.14, §11 verification of (A)–(G), p.151.

<a id="r17-4-solvable-base-change"></a>

### R17.4.8 All-place adapter for a solvable normal tower

Let E/F be finite Galois with solvable group. Use AutomorphicSpectralTheory §7.1's canonical isobaric tower operation on GL₂ classes, with compatible embeddings and places; the intermediate fields need not be normal over F. After R17.4/local-compatibility, prove `solvableBaseChange_local`: its local WD parameter is restriction along the total local extension, retaining N. Apply the prime-step theorem successively to the same supplied output. The empty tower, norm-twist compatibility and composition are the supplier's operations. A non-normal cubic extension uses R17.4/nonnormal-cubic-base-change instead.

**Checks.**
- The empty tower fixes the WD parameter and the canonical isobaric class.
- Through two different quadratic subfields of a biquadratic extension, the supplied outputs agree and the upgraded parameters are the same restriction.
- At successive unramified residue degrees two and three, diag(2,3) becomes diag(64,729).
- A first-step quadratic self-twist may destroy cuspidality; the upgrade retains the resulting isobaric output.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/local-compatibility; R17.4/unramified-base-change; R17.4/cuspidality.

*Source:* [ac89], Chapter 3 Theorem 5.1 pp.212–213 and §7 proof of Theorem 7.3 p.222; [langlands80], §3 Lemma 3.1 p.15.

<a id="r17-4-tower-independence"></a>

### R17.4.9 Canonical identification of solvable tower outputs

Use AutomorphicSpectralTheory §7.1's tower outputs. For two prime-cyclic towers with the same solvable Galois endpoints, R17.4/unramified-base-change identifies both good-place Satake classes with `A_v^f`. The supplier's isobaric strong multiplicity-one interface identifies their global classes before the Artin construction. R17.4/solvable-base-change subsequently describes their local parameters; tower independence requires only good-place data.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/unramified-base-change; AutomorphicLFunctionsAndLocalFactors AL.3/isobaric-strong-multiplicity-one.

*Source:* [ac89], Chapter 3 §7 proof of Theorem 7.3 p.222; [langlands80], §3 Lemma 3.1 p.15.

<a id="r17-4-solvable-descent"></a>

### R17.4.10 Supplied tower descent with character choices

Consume AutomorphicSpectralTheory §7.1's iterated descent and fibre operations for a specified prime-cyclic tower `F=F₀⊂⋯⊂F_r=E`. A descent chain must have each intermediate class invariant for the next downward step; invariance of the top class alone is insufficient. Carry the supplied cuspidal twist choices and constituent-wise isobaric choices, with any prescribed central-character constraint, throughout that chain. R17.6/compatible-descent adds the comparison with supplied Galois attachments and the common twist index. The automorphic chain itself uses only the canonical weak maps.

*Needs:* AutomorphicSpectralTheory §7.1; R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/isobaric-fibers.

*Source:* [ac89], Chapter 3 Theorem 3.1 p.201 and Theorem 4.2(d)–(f), pp.202–203; [langlands80], §2 properties (A),(B), p.14.

<a id="r17-4-prescribed-local-base-change"></a>

### R17.4.11 Base change with prescribed local splitting

Let E/F be a supplied solvable normal extension with specified embeddings of completions and complete splitting at a finite set T. Then `BC_{E/F}(π)_w≅π_v` at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The extension and these local conditions are hypotheses of this interface.

*Needs:* R17.4/solvable-base-change; R17.4/local-compatibility; R17.4/cuspidality.

*Source:* [carayol86], §12.3.2, p. 459; §12.3.1, pp. 458–459; [langlands80], §8, split places, p. 93.

<a id="r17-4-highly-ramified-converse"></a>

### R17.4.12 Completing the excluded places in the GL₃ converse argument

Let T be a finite set of finite places of a number field F. Give irreducible admissible generic local GL₃ representations `Π_v` for every v∉T, including generic archimedean modules with their smooth moderate-growth globalizations, with trivial central character, spherical almost everywhere, and convergent partial Euler products in a right half-plane. Use AutomorphicLFunctionsAndLocalFactors AL.2–3's factors and duals, including all archimedean factors. Suppose that, for every Hecke quasicharacter χ whose unit restriction at each v∈T has conductor above a fixed threshold, `L^T(s,Π⊗χ)` and `L^T(s,Π̃⊗χ⁻¹)` are entire, bounded in finite vertical strips, and satisfy

`L^T(s,Π⊗χ)=ε^T(s,Π⊗χ)·∏_{v∈T}ε(s,χ_v,ψ_v)³·L^T(1−s,Π̃⊗χ⁻¹)`.

Then an automorphic GL₃ representation matches Π outside T. Cuspidality and the missing local components require the adjoint-lift argument; they are not consequences of this partial converse alone.

Proof: At each v∈T choose a finite-order local character of conductor above the threshold. Full-local-character-prescription gives a global finite-order χ₀ with these components. Complete Π at T by the irreducible normalized principal series I(1,1,1), and put Ξ=Π⊗χ₀. This is an admissible restricted tensor representation with idele-class central character χ₀³. For every χ unramified at T, χ₀χ is still sufficiently ramified there. The three local L-factors of `Ξ_v⊗χ_v` and its dual are 1, while `ε(s,Ξ_v⊗χ_v,ψ_v)=ε(s,χ₀,vχ_v,ψ_v)³`. Thus the displayed partial equation is exactly the full equation for Ξ⊗χ, with dual entireness and strip bounds unchanged. Apply AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-reduced-rank with n=3 and S=T, then untwist by χ₀. For T empty use that same converse theorem directly. This proves the required highly ramified variant from its distinct unramified twisting contract, rather than treating the two families as interchangeable.

The filled tensor Ξ is generic at every place: the outside-T constituents are generic,
I(1,1,1) at T is irreducible generic, and character twisting preserves genericity.
**Checks.** T=∅ uses the generic full input; for nonempty T the output gives only an outside-T
match; a determinant character outside T remains nongeneric after filling and twisting and
violates the hypotheses.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-reduced-rank; AutomorphicLFunctionsAndLocalFactors AL.2 principal-series multiplicativity; AutomorphicLFunctionsAndLocalFactors/archimedean-smooth-representations and /restricted-tensor-realizations; ArithmeticLocallySymmetricSpaces ALS.F.6 twisting; R16.1/full-local-character-prescription; LocalFieldsRamification Layer 1 unit quotients.

*Source:* [gj78], §9.1–2 pp.531–534; [jpss79], Theorem 13.7 pp.243–245 for the unramified-family converse. The filling-and-twisting reduction above supplies the change of twisting family. Tests: T=∅ returns the full GL₃ recognition theorem; for nonempty T the output is only an outside-T match; filling by an unramified scalar parameter without χ₀ leaves nontrivial Euler factors at T and fails the displayed functional equation.

<a id="r17-4-outside-s-gl2-converse"></a>

### R17.4.12a The outside-S GL₂ converse

For a number field F and finite S of finite places, give the shared complex eigensystem
`(t_v,s_v)` off S in the unitary root normalization of R16.4.4, with nonzero determinant
`e_v=q_v s_v` and root ratio different from `q_v` and `q_v⁻¹`.
Supply generic archimedean parameters from AutomorphicLFunctionsAndLocalFactors's
`archimedean-gln-parameters`, and a unitary Hecke central character ω with
`ω_v(ϖ_v)=e_v` off S and matching archimedean determinants. Assume the usual uniform
unramified exponent bound, so standard and dual Euler products converge in a right half-plane.
Choose at each v∈S an auxiliary irreducible principal series B_v with determinant ω_v,
and fix a finite-order unit character η_v beyond its stability conductor threshold.
For every unitary Hecke character χ with `χ_v|O_v×=η_v`, assume entireness and
finite-strip boundedness of both completed partial products, including the specified
archimedean factors, and the equation

`Λ^S(s,D⊗χ)=ε^S(s,D⊗χ,ψ) ∏_{v∈S}[ω_v(c_χ) ε(s,χ_v,ψ_v)²] Λ^S(1−s,D^∨⊗χ⁻¹)`.

Here c_χ has valuation `a(χ_v)+n(ψ_v)` and satisfies
`χ_v(1+x)=ψ_v(x/c_χ)` on the requisite deep units. The thresholds ensure stability
for the chosen B_v, whose central character is ω_v. The displayed factors, and the conductor and root
number they specify, are fixed by R16.3.5 and ArithmeticGaloisRepresentations §2.7;
no arbitrary functional-equation scalar is quantified. The outside-S constants include the
known unramified-parameter twist constants and the supplied archimedean constants.
The dual has the reciprocal characters and the same explicit conductor normalization.

Construct an automorphic isobaric GL₂ class agreeing with D off a finite set and with the
specified infinity type. If D does not agree off a finite set with `ofCharacterPair`
of any two Hecke quasicharacters, the output is cuspidal. Name the cuspidal conclusion
`outsideSConverse`. The non-Eisenstein hypothesis is necessary; entireness of only this
restricted twisting family does not exclude a two-character output.

Prove the ramification-restricted converse at rank two here: Cogdell's Theorem 3.2
applies at n=2, whereas AL.3's reduced-rank theorem requires n≥3. Its conductor/newvector
argument only uses the spherical data off S and generic archimedean modules. To reduce the
fixed-ramification family to its unramified-at-S family, fill at S by the chosen B_v, choose a finite-order χ₀ with unit restrictions
η_v using R16.1/full-local-character-prescription, and twist by χ₀. Stability makes the
filled local L-factors one and gives exactly the displayed epsilon constants for all
χ₀χ′ with χ′ unramified at S. The ramification-restricted converse gives an outside-S
match, including infinity, and untwisting returns the stated output. The fill is an
auxiliary principal series, not a prescribed local Langlands value at a bad place.
Isobaric classification and the character-pair exclusion give the cuspidal clause.

**Checks.**
- S empty recovers the full rank-two converse with all quasicharacters by norm shifts.
- For nonempty S, `ofCharacterPair(1,1)` has entire highly ramified twists but is not
  cuspidal; it violates the character-pair exclusion.
- Roots with ratio q_v or q_v⁻¹ fail the generic spherical hypothesis.
- Choosing a low-conductor η_v leaves possible Euler factors at S and invalidates the
  displayed filling argument; equality of omitted local components is no conclusion.

*Needs:* R16.1/full-local-character-prescription; R16.2/local-classification;
R16.3/conductor-epsilon-comparison; R16.4/strong-multiplicity-one;
AutomorphicFormsOnReductiveGroups §§5.8 and 7.3;
AutomorphicLFunctionsAndLocalFactors AL.2/GL₂ newvectors, /archimedean-gln-parameters,
AL.3/gln-fourier-expansion and /isobaric-strong-multiplicity-one;
ArithmeticLocallySymmetricSpaces ALS.F.6;
ArithmeticGaloisRepresentations §2.7 (`local-constant-gauss-sum`, `root-number-product-formula`).

*Source:* [converse], §3 Theorem 3.2 and its conductor argument, pp.8–9, at n=2;
[jl70], §11 Theorem 11.3, p.186, for the full converse;
[cogdell-fields], Lecture 6 §5, pp.50–51, for highly ramified stability.
The fixed-unit-character version is the filling-and-twisting deduction above.

<a id="r17-4-metaplectic-adjoint-input"></a>

### R17.4.13a The metaplectic integral for the adjoint lift

For a number field F, trace additive character ψ and self-dual Haar measures, construct the
local and adelic metaplectic extension of SL₂ by the unit circle acting in the Weil representation
on Schwartz functions. Construct the compatible rational and unipotent splittings and the theta
sum of the Weil translates. Define genuine sections and their Eisenstein series with the exact
central transformation laws of [gj78] §5.2, so the product in its main integral descends to the
quotient. For unitary cusp π and a Hecke character sufficiently ramified at the fixed finite
bad set, unfold the main integral into local Whittaker integrals. Prove continuation, functional
equation and finite-vertical-strip boundedness, with the quotient factor
L(s,(π⊗χ)×π̃)/L(s,χ), and its contragredient partner, entire in the sufficiently ramified family.
This supplies the analytic input to R17.4/whittaker-type-adjoint-converse, including
its possibly reducible local Whittaker-type modules.

API: theta is invariant under the chosen rational splitting; unfolding and local factorization
respect ψ and its self-dual measure; the ramification threshold is specified before quantifying χ.

**Checks.** A rational SL₂ element leaves theta unchanged by Poisson summation; the two opposite
genuine central weights cancel in the integrand; at a spherical good place the quotient has
roots α/β,1,β/α, whereas the pole exclusions at bad places require the prescribed ramification.

*Needs:* ArithmeticGaloisRepresentations §2.7 (Global inputs: scalar adelic Schwartz–Bruhat
space, Fourier inversion and Poisson); AutomorphicLFunctionsAndLocalFactors AL.0
(local and vector-space Fourier/Poisson refinements for the Weil representation),
AL.1 (local Tate factors and distribution refinements), AL.2–AL.3 (Whittaker and pair integrals);
ArithmeticLocallySymmetricSpaces ALS.F.6 (cusp forms); R16.1/haar-quotient-comparison.

*Source:* [gj78], §§5.1–5.6, pp.495–506 (extension, theta, sections and unfolding),
§6, pp.507–514, §§7–8, pp.515–530, Theorem 8.1 stated p.496 and proved in §8.

<a id="r17-4-whittaker-type-adjoint-converse"></a>

### R17.4.13b Whittaker-type converse and adjoint constituents

**The Whittaker-type-module bridge for the adjoint lift.** Let π be a unitary cuspidal
GL₂ representation over a number field with no nontrivial Hecke-character self-twist.
For each place v let `Π_v` be the Langlands quotient with parameter `Ad(rec π_v)`, using
R16.0/local-langlands and the archimedean parameter supplier. Its centre is trivial;
it is spherical almost everywhere, with uniformly bounded real Satake exponents and
Euler convergence in a right half-plane. No genericity or unitarity of `Π_v` is a premise.
Construct the attached modules `ξ_v` of [gj78] §9.1: use `Π_v` itself in the unitary generic
range, and the attached normalized induced Whittaker-type module otherwise. In particular,
for `π_v=I(χν^t,χν^{-t})`, 0<t<1/2, the spherical quotient has parameter
`ν^{2t}⊕1⊕ν^{-2t}`; retain the full attached induction at t=1/4. At infinity construct
the Whittaker function spaces and their moderate-growth estimates as in §4, including
the dual transform `W(g)↦W(w·{}^tg⁻¹)`.

Prove that these module zeta integrals have the adjoint quotient’s prescribed standard
L- and ε-factors, and prove their twisted dual functional equations. This includes the
reducible boundary: the factors belong to the attached module, and replacing it by its
generic constituent requires a separate comparison. Let S be the finite set of finite
places where `π_v` is not a character twist of a spherical representation. At v∈S prove
`Π_v` is tempered generic from R16.2’s unitary classification and the local parameter
comparison. Take T=S when S is nonempty, and otherwise take T to be a singleton
auxiliary finite place. Use R17.4/metaplectic-adjoint-input’s entire, strip-bounded
sufficiently ramified twists and R16.1’s character prescription. Prove the §9.2 extension of the GL₃ converse argument:
these data realize `⊗′_{v∉T}ξ_v` in slowly increasing automorphic functions under the
outside-T Hecke algebra. Establish its constant-term alternatives: a cuspidal realization,
induction from a GL₂ cusp and a character (for either maximal parabolic), or induction
from three characters. The conclusion at this stage concerns the attached modules and
common constituents; it does not assert that an arbitrary nongeneric quotient is cuspidal.

For this adjoint input prove the §9.6–9.7 constituent and pole argument excluding both
noncuspidal alternatives. Compare the twisted L-factors of common constituents, retaining
the finite correction factors at reducible places and showing that they do not cancel
the poles used in the argument. Use the GL₂ pair pole criterion, scalar and GL₂ boundary
nonvanishing, and absence of a nontrivial self-twist, with norm shifts for nonunitary
inducing characters. The cuspidal realization makes `ξ_v` semisimple and unitary generic;
the attached-module quotient property then forces `ξ_v=Π_v` outside T. When the initial
bad set is empty choose an auxiliary finite place for T and vary it. Separate the
remaining places by character prescription and highly ramified stability. At S the
candidates are already tempered generic; at the auxiliary place vary T to establish
genericity. Apply the local GL₃ converse between generic representations to recover
every missing component.
Conclude that `⊗′Π_v` is cuspidal automorphic and that complementary exponents t≥1/4
cannot occur in π. This bound is an output of the argument. For input with a nontrivial
self-twist use quadratic induction and [gj78] §3.7’s isobaric decomposition instead.

The matrix comparison `adjointSatakeDiagonal_normCharacter` gives exponents
2t,0,−2t for opposite norm characters at every real t; its t=1/4 specialization
records the attached induction's boundary exponents.

**Checks.** At a finite place `π_v=I(ν^{1/4},ν^{-1/4})` is irreducible unitary generic,
but its adjoint spherical quotient is nongeneric; `ξ_v=I(ν^{1/2},1,ν^{-1/2})` is reducible.
For any local character χ its prescribed L-factor is
L(s+1/2,χ)L(s,χ)L(s−1/2,χ), whereas the generic constituent
`I_{(2,1)}(St₂,1)` twisted by χ has L-factor L(s+1/2,χ)L(s,χ). At χ=1 the
extra factor is nontrivial. This prevents
substitution of that constituent in the converse input. In the tempered spherical case
`ξ_v=Π_v` is irreducible generic and gives the usual three Satake roots. For a quadratic
self-twist the output is isobaric and noncuspidal, so the no-self-twist hypothesis is
necessary for the cuspidal conclusion.

*Needs:* R16.0/local-langlands; R16.1/full-local-character-prescription; R16.3; R17.4/metaplectic-adjoint-input; R17.4/quadratic-induction; AutomorphicLFunctionsAndLocalFactors/archimedean-gln-parameters and /restricted-tensor-realizations; AutomorphicLFunctionsAndLocalFactors AL.3/gln-fourier-expansion, rs-global-poles, rs-boundary-nonvanishing; ArithmeticGaloisRepresentations §2.7 (`local-constant-gauss-sum`, `standard-test-function-evaluations`, `hecke-zeta-integral-comparison` and `root-number-product-formula`: arithmetic character constants, standard-function Hecke comparisons and the finite-sum root-number identity); AutomorphicSpectralTheory/unitary-hecke-functional-equation (the scalar Hecke functional equation for every unitary character, extended by norm twists); ArithmeticLocallySymmetricSpaces ALS.F.6. The Whittaker-type extension of the converse and its constant-term analysis are targets here, beyond AL.3’s irreducible generic converse contract.

*Source:* [gj78], §3.4, pp.489–490; §4, Lemmas 4.1.5 and 4.1.8 and Proposition 4.1.9, pp.492–495; §§9.1–9.2, pp.531–534; §§9.5–9.8, pp.536–541; Theorem 9.3(3)–(4), p.534; §3.7, p.491 and Remark 9.9, p.541.

<a id="r17-4-adjoint-lift"></a>

### R17.4.13 The Gelbart–Jacquet adjoint lift

For unitary cusp π, `Ad(π)=Sym²π⊗ω_π⁻¹` is self-dual isobaric automorphic GL₃ with centre1. At every place its twisted L-factor is `L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v)`, with matching ε; LLC pair-factor compatibility identifies the adjoint parameter. Good eigenvalues are α/β,1,β/α, and character twisting preserves the lift. It is cuspidal iff π has no nontrivial self-twist. Otherwise `π=AI_{E/F}θ` for quadratic E and `Adπ=η_{E/F}⊞AI(θ/θ^σ)`, interpreting the induction isobarically when invariant. ArithmeticGaloisRepresentations §§7.1–7.2 owns the Galois/WD adjoint.

For the no-self-twist case, apply R17.4/whittaker-type-adjoint-converse to the attached
modules; its constituent argument proves cuspidality and local genericity before any
irreducible generic converse is used. The self-twist case uses quadratic induction.
Identify the local adjoint parameter through GL₂ pair-factor compatibility and, after
genericity is established, the GL₃ local converse theorem (R16.3, R16.0/local-langlands).
This input also covers extraordinary components; GJ78 alone does not prove that comparison.

Prove the following API.
- `adjointLift_local`: Each local component of Ad(π) is the Gelbart–Jacquet local lift of `π_v`; under the GL₂ LLC its parameter is the adjoint of the local parameter of π.
- `adjointLift_unramified`: Satake eigenvalues (α,β) become (α/β,1,β/α).
- `adjointLift_twist`: Ad(π⊗χ)=Ad(π) for every Hecke character χ.
- `adjointLift_central`: The central character of Ad(π) is trivial.

**Checks.**
- The diagonal formula `adjointSatakeDiagonal (α β : K) : Matrix (Fin 3) (Fin 3) K` is diag(α/β,1,β/α). Its scalar, determinant and twist formulas use α≠0 and β≠0; `adjointSatakeDiagonal_twist` also assumes u≠0. `adjointSatakeDiagonal_det` gives determinant one for nonzero roots. The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
- Scalar Satake input diag(a,a), a≠0, gives the identity class.
- Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
- For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting `ω^{-1}` gives the wrong lift.

*Needs:* R16.3; AutomorphicLFunctionsAndLocalFactors AL.3; ArithmeticLocallySymmetricSpaces ALS.F.6; ArithmeticGaloisRepresentations §§7.1–7.2; R17.4/metaplectic-adjoint-input; R16.0/local-langlands; ArithmeticLocallySymmetricSpaces ALS.F.6/cuspidalRepresentation; R17.4/whittaker-type-adjoint-converse; R17.4/quadratic-induction.

*Source:* [gj78], Introduction, p. 472; §3.1, Definition 3.1.3 and the remark after it, p. 485; §3.6, p. 491; §9, Theorem 9.3, p. 534; Remark 9.9, p. 541; with §3.7, p. 491; §5 lead-in, Theorem 8.1, p. 496; proof in §§5–8.

<a id="r17-4-cubic-character-induction"></a>

### R17.4.14 Cyclic cubic induction of a character

For cyclic cubic E/F and unitary Hecke character θ, there is an isobaric automorphic GL₃ representation `AI_{E/F}(θ)` whose local parameter at every place is `Ind_{W_{E_w}}^{W_{F_v}}(θ_w)` (the direct sum over w|v at a split place), in the sense of equal GL₁-twisted L- and ε-factors, and whose standard L-function is `L_E(s,θ)`. It is cuspidal if and only if `θ,θ^σ,θ^{σ²}` are pairwise distinct, i.e. `θ≠θ^σ`. If `θ=χ∘N_{E/F}`, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three case supplies the tetrahedral proof; general `GL_n` induction retains its owner.

Reduce quasicharacters to JPSS’s unitary case by norm twists. In the invariant case class field theory supplies χ with θ=χ∘N and the order-three norm-kernel character η.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3; ArithmeticLocallySymmetricSpaces ALS.F.6; GlobalNumberFields Layer 9; ClassFieldTheory Layer 11; ArithmeticGaloisRepresentations §2.7 (`local-constant-gauss-sum`, `standard-test-function-evaluations`, `hecke-zeta-integral-comparison` and `root-number-product-formula`: arithmetic character constants, standard-function Hecke comparisons and the finite-sum root-number identity); AutomorphicSpectralTheory/unitary-hecke-functional-equation (the scalar Hecke functional equation for every unitary character, extended by norm twists); R16.0/local-langlands; ArithmeticLocallySymmetricSpaces ALS.F.6/cuspidalRepresentation; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`; AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-reduced-rank.

*Source:* [jpss79], Automorphic forms on GL(3) II, §14.2, Theorem (14.2), pp. 253–254; §14.2, remark on monomial representations after the proof, p. 255; [ac89], Chapter 3 §6, Definition 6.1 and Theorem 6.2, p. 215; Chapter 3 §6, Lemmas 6.3–6.4 and Corollary 6.5, pp. 217–218; [langlands80], §3(i), p. 17.

<a id="r17-4-gl3-recognition"></a>

### R17.4.15 GL₃ analytic recognition for the Artin bridge

For an irreducible admissible generic restricted tensor GL₃ representation Π over a number field, idele-class centre and right-half-plane Euler convergence, AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-reduced-rank at n=3 gives cuspidal automorphy if every GL₁ twist and its dual are entire, bounded in finite vertical strips and satisfy their completed functional equation. Restricting the twisting family to characters unramified at finite S gives agreement outside S with an automorphic class. For the different highly ramified family use the preceding filling-and-twisting target. AutomorphicLFunctionsAndLocalFactors AL.3/rs-global-poles identifies two unitary cuspidal GL₃ classes with equal almost-everywhere Rankin–Selberg factors against the first dual: its self-pair has a pole at 1, and the mixed pair does so only for equal classes. The target is to apply these supplied converse and pole inputs in the adjoint/tetrahedral argument; R16.5 separately uses the n=2 full-rank converse.

Require absolute convergence of the Euler product in some right half-plane. S contains finite places only.

*Needs:* R17.4/highly-ramified-converse; AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-reduced-rank; AutomorphicLFunctionsAndLocalFactors AL.3/rs-global-poles; AutomorphicLFunctionsAndLocalFactors AL.3/rs-boundary-nonvanishing; R17.4/adjoint-lift; R17.4/cubic-character-induction; AutomorphicLFunctionsAndLocalFactors AL.2/jacquet-shalika-satake-bound; AutomorphicLFunctionsAndLocalFactors AL.3/rs-local-convergence; AutomorphicLFunctionsAndLocalFactors AL.3/rs-local-factor.

*Source:* [converse], §3, sentence before Theorem 3.3 and Theorem 3.3, p. 9; §3, applications (iv)–(v), p. 10; [gj78], Introduction, p. 473; §9.2, pp. 532–534; [langlands80], §3(i), p. 18, with (3.1)–(3.2); [cogdell-fields], Lecture 9 §7, Theorem 9.3 proof, pp.74–75.

<a id="r17-4-quadratic-induction"></a>
<a id="r17-5-quadratic-induction"></a>

### R17.4.16 Quadratic automorphic induction

Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction `AI_{K/F}(θ)` is an isobaric GL₂ automorphic representation with local parameter `Ind_{W_{K_w}}^{W_{F_v}}(θ_w)`, interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when `θ≠θ^σ`. Its central character is `η_{K/F}·θ|_{A_F×}`, and `L_F(s,AI θ)=L_K(s,θ)`. Its quadratic base change is `θ⊞θ^σ`. It commutes with twisting by χ of F using `θ·(χ∘N_{K/F})`; if θ=χ∘N, it is χ⊞χη, not cuspidal. Import finite-group induction and Mackey formulas.

Prove the following API.
- `quadraticInduction_local`: Local LLC of AI θ is local induction of θ, with a direct sum at a split place.
- `quadraticInduction_central`: `ω(AI θ)=η_{K/F}·θ|_{A_F×}`.
- `quadraticInduction_baseChange`: `BC_{K/F}(AI θ)=θ⊞θ^σ`.
- `quadraticInduction_twist`: AI(θ·χ∘N)=AI(θ)⊗χ.
- `quadraticInduction_cuspidal`: AI θ is cuspidal if and only if `θ≠θ^σ`.

**Checks.**
- θ=χ∘N has output χ⊞χη and is not cuspidal.
- At v split as w,w′ the local parameter is `θ_w⊕θ_w′`.
- For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
- When `θ≠θ^σ`, replacing AI θ by two F-characters contradicts cuspidality.

*Needs:* R17.4/cyclic-base-change; R16.3; GlobalNumberFields Layer 9; ClassFieldTheory Layer 11; R16.5; ArithmeticGaloisRepresentations §2.7 (`local-constant-gauss-sum`, `standard-test-function-evaluations`, `hecke-zeta-integral-comparison` and `root-number-product-formula`: arithmetic character constants, standard-function Hecke comparisons and the finite-sum root-number identity); AutomorphicSpectralTheory/unitary-hecke-functional-equation (the scalar Hecke functional equation for every unitary character, extended by norm twists); Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

*Source:* [jl70-global], §12, Proposition 12.1, p. 206; §12, paragraph before Proposition 12.1, p. 206; [ac89], Chapter 3 §6, Theorem 6.2, p. 215; Lemmas 6.3–6.4 and Corollary 6.5, pp. 217–218.

<a id="r17-4-nonnormal-cubic-base-change"></a>

### R17.4.17 Non-normal cubic base change

Let K/F be a non-Galois cubic extension of number fields, L its S₃ normal closure and E/F its quadratic resolvent. Let ξ be either order-three Hecke character of E cutting out L/E and put `σ₀=AI_{E/F}(ξ)`. Construct isobaric automorphic `BC_{K/F}(π)` for each cusp GL₂ class π, with `rec(BC π)_w=Res_{W_{K_w}} rec(π_v)` at every w|v (full Frobenius-semisimple WD restriction at finite places). It is cuspidal unless π=σ₀⊗ν for a Hecke quasicharacter ν of F. In that exception it is `(ν∘N_{K/F})⊞(ν∘N_{K/F})η_{L/K}`, with `η_{L/K}` the quadratic character of K. For an isobaric input μ⊞ν use (μ∘N)⊞(ν∘N). Use unitary normalization and extend by norm twists.

Construct `cubicBaseChange_weak` first: without specifying local Langlands components
at bad places, obtain an isobaric automorphic class whose unitary eigensystem agrees off
a finite set with `formalBaseChange(unitaryEigensystem π)`. Away from the stated
σ₀-twist exception it is cuspidal. Use the outside-S converse with S containing the
ramification of π and K/F and the bad places of the monomial integral. Its twisted
partial products are the GL₂×GL₃ Rankin–Selberg products below; choose the fixed unit
characters at S sufficiently ramified for their stability formulas. The exceptional
isobaric pair is explicit. Exclude other character-pair outputs by the same pole argument
and quadratic-induction criterion. The converse also preserves the specified
archimedean parameters. This weak construction and its normalization, twist, centre and
uniqueness comparisons use no bad-place local Langlands identification.

Prove the following API.
- `cubicBaseChange_local`: Full WD restriction, including N, and its character-twisted L/ε-factors.
- `cubicBaseChange_unramified`: Satake class `A_v^{f(w/v)}` at unramified w|v.
- `cubicBaseChange_twist`: BC(π⊗χ)=BC(π)⊗(χ∘N).
- `cubicBaseChange_central`: `ω_{BC π}=ω_π∘N`.
- `cubicBaseChange_unique`: Isobaric uniqueness from good Satake powers.
- `cubicBaseChange_exception`: Non-cuspidality iff π=σ₀⊗ν.

**Checks.** The weak phase supplies both Hecke coordinates and infinity without prescribing bad components. Split places give A,A,A. For A=diag(2,3), splitting type (1,2) gives diag(2,3),diag(4,9), while residue degree three gives diag(8,27); Uniform cubing fails type (1,2). Std(S₃)|C₂=1⊕sgn tests the exception and its quadratic centre. Steinberg keeps N≠0; deleting it changes L.
For a cubic étale local algebra, `λ(K_v/F_v,ψ_v)²=(d_K,−1)_v`, where d_K is the
local discriminant square class. Over ℝ the value is −1 for `ℝ×ℂ` and +1 for `ℝ³`;
these signs cannot be discarded locally even though their global product is one.

**Cubic monomial input.** For a unitary Hecke character θ of K, construct `AI^3_{K/F}(θ)` with local parameter `⊕_{w|v}Ind_{W_{K_w}}^{W_{F_v}}θ_w`. If `Ind_{W_K}^{W_F}θ` is irreducible, JPSS Theorem14.2 gives a cusp with all local GL₁-twisted factors. The scalar Hecke completion verifies its hypothesis: θ·(χ∘N) cannot be a norm power. JPSS's p.255 classification says a reducible induction has a character summand μ and a monomial rank-two summand. Frobenius reciprocity forces θ=μ∘N, and the permutation decomposition Ind1=1⊕Std(S₃) identifies the output as μ⊞(μ⊗σ₀). Thus irreducibility is equivalent to not being a norm pullback. Henniart's rank-three uniqueness identifies JPSS's finite components with R16.0/local-langlands's LLC; infinity is JPSS's Langlands component.

Its API is `nonnormalCubicInduction_local`, `_standard` `(Λ_F(s,AI^3 θ)=Λ_K(s,θ))`, `_twist` and `_norm` (the displayed reducible output). Tests: θ=1 gives 1⊞σ₀, not a cusp; θ=μ∘N gives μ⊞μσ₀; a non-norm θ gives a cusp. For θ=1, inert Frobenius gives the three cube roots; a transposition gives 1,1,−1, distinguishing the non-normal and cyclic branches.

**All-place comparison.** Form `Π=⊗′_w LLC_{K_w}(Res rec π_v)`, using R16.0/local-langlands at finite places and AutomorphicSpectralTheory §§0.48–0.49 at infinity. For unitary π they are generic: restriction preserves temperedness, Steinberg N and complementary exponents in (−1/2,1/2). They are spherical almost everywhere with centre `ω_π∘N` and right-half-plane Euler convergence from rank-two bounds and residue-degree powers.

For unitary θ, WD tensor-induction and R16.0/local-langlands/AutomorphicLFunctionsAndLocalFactors AL.4 pair compatibility identify `Λ_K(s,Π⊗θ)` with `Λ_F(s,π×AI^3 θ)`, also for the duals. At v, `ε(s,π_v×AI^3 θ_v,ψ_v)=λ(K⊗F_v/F_v,ψ_v)^2∏_{w|v}ε(s,Π_w⊗θ_w,ψ_v∘Tr)`. Keep this factor locally; its global product is1. Apply dimension-zero induction and the global product formula to Ind1, comparing `ζ_K` with `ζ_F`. Deligne's WD invariant-kernel formula extends the local comparison to N≠0.

If `AI^3` θ is cuspidal, AutomorphicLFunctionsAndLocalFactors AL.3's unequal-rank theorem gives entireness and the functional equation; AutomorphicSpectralTheory §3.6a supplies the strip bounds. In the norm case use Λ(s,π⊗μ)Λ(s,π×μσ₀); the first is entire and the second has no poles unless π is a norm twist of σ₀. AutomorphicSpectralTheory §3.6a/rs-vertical-strip-bounds controls both factors. Norm shifts treat every quasicharacter θ. Outside the exception all twists and duals are nice. Apply AutomorphicLFunctionsAndLocalFactors AL.3/gln-converse-full-rank at n=2 with no omitted places: it gives a cusp with every prescribed component. For π=σ₀⊗ν, restrict Std(S₃) to Gal(L/K)≅C₂ and construct the displayed two-character isobaric output directly. Isobaric strong multiplicity one gives uniqueness; restriction gives twist and centre. This all-place construction fixes every bad component before applying the full converse. Its good eigensystem agrees with `cubicBaseChange_weak`, so isobaric strong multiplicity one identifies the two outputs and proves `cubicBaseChange_local` for that same weak output.

Subsidiary norm-phase calculation (`pureCubicMatrix`, `pureCubicNorm`, `pureCubicQuadratic`, `pureCubicNorm_formula`, `pureCubicQuadratic_formula`, `pureCubicPhase_positive`, `pureCubicPhase_negative`): For K=ℚ[t]/(t³−2), multiplication by a+bt+ct² in (1,t,t²) has matrix M=(a,2c,2b;b,a,2c;c,b,a). Define N=det M and Q=((tr M)²−tr(M²))/2. API: N=a³+2b³+4c³−6abc; Q=3a²−6bc; N(C+a,b,c)−3(C+a)=−2C+CQ(a,b,c)+N(a,b,c) for C=±1. Gram determinant: −27=disc(t³−2)/4. Checks: M(0,1,0)³=2I and M(1,0,0)=I; the (3,2) entry of M(a,b,c) is b, not 2b; N(0,1,0)=2, N(0,0,1)=4, N(1,1,1)=1; Q(1,1,1)=−3, Q(0,1,0)=0, Q(1,0,0)=3. Over ℚ₂ the discriminant has square class −3; its unit residue 5 has no square root modulo 8. The discriminant need not be square; the critical quadratic terms are opposite. Stationary phase is separate.


*Needs:* R17.4/outside-s-gl2-converse for `cubicBaseChange_weak`; R17.5/global-weil-group for global induction and Frobenius reciprocity in the cubic monomial input; R16.2/local-classification; R16.3–4; R16.5/full-gl2-converse; R17.4/quadratic-induction; R16.0/local-langlands; AutomorphicLFunctionsAndLocalFactors/archimedean-gln-parameters; ArithmeticLocallySymmetricSpaces ALS.F.6; ArithmeticGaloisRepresentations §2.7 (`local-constant-gauss-sum`, `standard-test-function-evaluations`, `hecke-zeta-integral-comparison` and `root-number-product-formula`: arithmetic character constants, standard-function Hecke comparisons and the finite-sum root-number identity); AutomorphicSpectralTheory/unitary-hecke-functional-equation (the scalar Hecke functional equation for every unitary character, extended by norm twists); AutomorphicLFunctionsAndLocalFactors AL.3/rs-global-poles, rs-global-functional-equation, gln-converse-full-rank, isobaric-strong-multiplicity-one; AutomorphicLFunctionsAndLocalFactors AL.4/local-parameter-comparison; AutomorphicSpectralTheory §3.6a/rs-vertical-strip-bounds; ArithmeticGaloisRepresentations §§2.4–2.7; ClassFieldTheory Layers9,11. Use these parameter/factor carriers for tensor-induction and the lambda comparison.

*Source:* [jpss79], Theorem14.2 pp.253–254 and monomial remark p.255; [henniart83], Theorem2.10 pp.20–21, Proposition3.2 p.30, §3.5 pp.33–34; [henniart02], Theorem1.5 p.590 and §2 pp.592–596; [deligne73], Proposition3.8 pp.530–531, Theorem4.1 p.535, (5.6.2) p.549, §5.11 p.551, §8.12 p.572; [converse], Theorem3.1 p.6 and Theorem3.3 p.9, application(iv) p.10; [cogdell-fields], Lecture9 §§3–6 pp.71–74. The construction is a deduction from these inputs. [mr00], Theorems1,6 pp.172,195 gives a different weak trace route; §4 pp.185–186 supplies the norm-phase calculation. [carayol86], §12.2.1–3 pp.457–458 states the conductor-comparison interface.


### Examples

For A=diag(2,3), residue degree two gives diag(4,9) with trace 13 and determinant 36. In a cubic splitting type (1,2), the outputs are A and A² rather than A³ at both places. The standard S₃ representation restricted to a transposition is 1⊕sgn, fixing the noncuspidal exception. In Q[t]/(t³−2), multiplication by t cubes to 2I and has norm 2.

### Dependencies

R16.1–R16.5; R17.2; GlobalNumberFields Layers 8–9; ArithmeticGaloisRepresentations §2.7 (Global inputs); ClassFieldTheory Layers 9 and 11; AutomorphicLFunctionsAndLocalFactors AL.1–AL.4; AutomorphicSpectralTheory §§0.48–0.50; ArithmeticLocallySymmetricSpaces ALS.F.6; R16.0/local-langlands.

## Layer R17.5: Automorphic induction and solvable Artin representations

All weak matching, descent selection and good-place comparisons in this layer mean
cofinite agreement of `unitaryEigensystem π` with `ofGaloisRep(ρ^∨)` in both T and S
coordinates of R16.4.4, over common coefficient embeddings. Thus they compare trace
and determinant, with the geometric/arithmetic dual convention retained. The outputs
here also carry the separately stated infinity comparison before R17.5.5 is applied.
ModularityAndLanglandsExtensions §1.2 is a downstream consumer of this weak-to-strong
upgrade; its weak Artin predicate does not supply an input to this layer.

<a id="r17-5-global-weil-group"></a>

### R17.5.0 The global Weil group and character comparison

For a number field F with a chosen algebraic closure, construct relative Weil extensions
`1→C_L→W_{L/F}→Gal(L/F)→1` for finite Galois L/F, representing the class-formation
fundamental class. Construct their compatible transition maps and the global Weil group `W_F`
with its inverse-limit topology and dense map to `G_F`. Chosen places give continuous local
Weil maps into `W_F`, well-defined up to conjugacy. Identify the topological abelianization with
`C_F` and continuous complex quasicharacters with Hecke quasicharacters; local restriction is
pullback along the existing local idele-class maps with geometric reciprocity.

API: inflation identifies continuous finite-image `G_F` representations with continuous
finite-image `W_F` representations; local restriction, scalar twisting, norm pullback and finite
field restriction commute with these comparisons. For arithmetic Artin inputs dualize as in
the conventions before comparing with rec. This supplies the carrier used by Tunnell globalization.

**Checks.** The trivial character restricts trivially everywhere; a norm quasicharacter has its
specified uniformizer value and need not have finite image; a finite-order Hecke character
factors through `G_F` while its geometric and arithmetic Frobenius values are inverses.

*Needs:* GlobalNumberFields Layers 1 and 9 (idele classes and topology); ClassFieldTheory
Layers 1–2, 7 and 9–11 (local Weil groups, fundamental classes and global reciprocity);
AutomorphicLFunctionsAndLocalFactors/archimedean-gln-parameters (real and complex Weil groups);
ProfiniteCohomology Layer 10 (extension classes and transition maps).

*Source:* [artin-tate], Chapter XV, construction of relative Weil extensions from the fundamental
class, compatibility under field restriction and inverse-limit construction; [tate-global], §11.6, pp.200–201, diagrams (14)–(15),
for relative extensions, the fundamental class and idelic reciprocity compatibility. These are the extension,
abelianization and local-map statements used here.

<a id="r17-5-dihedral-artin"></a>

### R17.5.1 Dihedral Artin automorphy

Let `ρ:G_F→GL₂(C)` be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of `G_K` with `ρ≅Ind_{G_K}^{G_F} θ`. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ⁻¹) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is `(ρ|_{W_{F_v}})^∨` at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.

Include projective V₄ (n=2). The inducing character is not invariant under the nontrivial automorphism.

*Needs:* R17.4/quadratic-induction; ArithmeticGaloisRepresentations Layer 4; ClassFieldTheory Layer 11; R16.4.

*Source:* [jl70-global], §12, Proposition 12.1, p. 206; [langlands80], Introduction, p. 4.

<a id="r17-5-finite-hecke-extension"></a>

ArithmeticGaloisRepresentations §7.6, “Idelic torsion-character extension”, “Finite-kernel
lifting obstruction” and “Projective lifting”, supplies the finite-order extension criterion
and `H²_cont(G_F,Q/Z)=0` for trivial discrete coefficients, including real-place corrections.
Use those theorems on the GlobalNumberFields character carrier. R17.5/finite-projective-lift
constructs the finite-image complex rank-two specialization `finite_projective_lift` and its real oddness consequences.

<a id="r17-5-finite-projective-lift"></a>

### R17.5.4 Continuous finite-image arithmetic projective lifting

For a number field F and continuous finite-image `r:G_F→PGL₂(ℂ)`, construct a continuous finite-image linear lift with identified projectivization. SL₂ representatives give a μ₂ factor set; ArithmeticGaloisRepresentations §7.6 kills its class in `H²(G_F,μ_M)` for some even M. A continuous finite-valued correcting cochain gives a homomorphism with image in `μ_M` times the finite SL₂ preimage. Two such lifts differ by a continuous finite-order scalar character. If r(c) is a nontrivial involution at a real place, every lift has eigenvalues ±1 and is odd; scalar projective r(c) cannot lift oddly. Prescribed determinant or residual reduction is not asserted.

*Needs:* ArithmeticGaloisRepresentations §7.6/Projective lifting; RepresentationTheory/InductionRestriction Layer 7; Tau Ceti `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`; Mathlib `Matrix.ProjGenLinGroup`; Mathlib `Matrix.ProjGenLinGroup.mk`; ArithmeticGaloisRepresentations Layer 1.

*Source:* [patrikis], §2.1, Proposition 2.1.4, p. 19; proof of Proposition 2.1.4, p. 19; Remark 2.1.5, p. 19.

<a id="r17-5-artin-all-place-upgrade"></a>

### R17.5.5 From weak Artin matching to every finite place

Let `ρ:G_F→GL₂(ℂ)` be continuous, irreducible and finite-image, and π a unitary cuspidal GL₂ representation. Assume `unitaryEigensystem π` and `ofGaloisRep(ρ^∨)` agree off a finite set in both coordinates, and its archimedean parameters agree with `ρ^∨`. Then `rec(π_v)≅(ρ|W_Fv)^∨` at every finite place, with all twisted L- and ε-factors and conductor exponents equal. The archimedean hypothesis is essential to the following isolation argument.

Proof: Let `π_v^ρ` be the generic tempered local representation of `ρ^∨|W_Fv` (N=0), using R16.0/local-langlands. Under geometric reciprocity the central character of π corresponds to (detρ)⁻¹; its uniformizer value is detρ at arithmetic Frobenius: their quotient agrees with 1 almost everywhere, hence is 1 by the GL₁ Hecke pole criterion. Brauer induction (RepresentationTheory/InductionRestriction Layer 6) writes ρ as an integral combination of induced finite-order characters. ArithmeticGaloisRepresentations §2.7 (`local-constant-gauss-sum`, `standard-test-function-evaluations`, `hecke-zeta-integral-comparison` and `root-number-product-formula`) supplies the arithmetic character constants, standard-function Hecke comparisons and finite-sum root-number identity. AutomorphicSpectralTheory/unitary-hecke-functional-equation supplies the scalar Hecke equation for every unitary character, extended by norm twists. ArithmeticGaloisRepresentations §2.7 **Global inputs** supplies their Brauer assembly into the completed meromorphic functional equation for every global character twist of ρ, with the product of local epsilon factors. Artin entireness is not used. Transport all character twists through the dual bridge: the geometric datum compared with `π_v⊗χ_v` is `ρ^∨|W_Fv⊗χ_v`. Its factors are the classical arithmetic Artin factors of ρ with the reciprocal scalar twist. Compare the resulting functional equation with the cuspidal equation of π.

Fix a bad finite place v and any unitary local `χ_v`. Prescribe `χ_v` there and sufficiently ramified characters at the other bad finite places. The full-local prescription and its one-place quasi-character variant produce a global χ; extra ramification at good places causes no difficulty because matching parameters give matching factors for every twist. At the other bad places, GL₂ stability gives identical γ-factors for `π_w` and `π_w^ρ`, since their central characters agree, and their twisted L-factors are 1. For supercuspidals stability follows by the finite type Gauss sum; for principal series and special representations it follows from the rank-one stability and product formulas supplied by AutomorphicLFunctionsAndLocalFactors AL.1 and ArithmeticGaloisRepresentations §2.7. Cancellation of the good, archimedean and other bad factors isolates `γ(s,π_v⊗χ_v,ψ_v)=γ(s,π_v^ρ⊗χ_v,ψ_v)`.

Recover each L-factor from this identity. For a unitary generic GL₂ representation every pole of its local L-function has real part <1/2; poles of the dual factor at 1−s have real part >1/2. Thus they cannot cancel in γ=εL(1−s,dual)/L(s), and the zeros in the left half-plane determine the polynomial with constant term 1. Equality of γ gives equality of L and then ε. Nonunitary character twists follow by translating s. Rank-two factor recognition now identifies the representations: principal-series factors recover the unordered inducing characters and distinguish special representations; for supercuspidals the twisted ε Gauss sums recover the type character on minimal elements by finite Fourier inversion, then the inducing type and compact induction. This is the GL₂ argument of Bushnell–Henniart §27, including wild dyadic types.

**Checks.** Twist Std(S₃) for x³−2 by the cubic character modulo 7 with χ(3)=ζ₃. At p=31 the roots 4,7,20 show split Frobenius, so arithmetic eigenvalues are ζ₃,ζ₃ and geometric eigenvalues of ρ are ζ₃⁻¹,ζ₃⁻¹; rec π uses `ρ^∨`. Matching almost everywhere without matching infinity does not allow archimedean cancellation. A ramified auxiliary global character is harmless at a good place only after comparing the whole local parameter. L=1 does not distinguish two supercuspidals; twisted ε-factors and type recognition do.

*Needs:* R17.5/global-weil-group; R16.1/full-local-character-prescription; R16.3; R16.0/local-langlands; R16.2/archimedean-classification (unitary GL₂ classification); AutomorphicLFunctionsAndLocalFactors AL.1 (Hecke pole criterion and normalization refinements), AutomorphicLFunctionsAndLocalFactors AL.2 (local/global functional equations); ArithmeticGaloisRepresentations §§2.4–2.7 (local parameters and inductive local constants), §2.7 (`local-constant-gauss-sum`, `standard-test-function-evaluations`, `hecke-zeta-integral-comparison` and `root-number-product-formula`: arithmetic character constants, standard-function Hecke comparisons and the finite-sum root-number identity; Global inputs: completed finite-image Artin equation); AutomorphicSpectralTheory/unitary-hecke-functional-equation (the scalar Hecke equation for every unitary character, extended by norm twists); Tau Ceti roadmap RepresentationTheory/InductionRestriction Layer 6.

*Source:* [jl70], Theorem 12.2 and Lemma 12.5, pp. 208–213; [bh06], §23.8 pp. 146–147, §25.7 p. 162, §26.1 p. 162, §27.1–8 pp. 170–176. The cancellation and unitary pole separation are the derivation used here; the cited theorem does not remove the archimedean hypothesis.

<a id="r17-5-tetrahedral-artin"></a>

### R17.5.6 Tetrahedral Artin automorphy

For continuous finite-image irreducible `ρ:G_F→GL₂(ℂ)` with projective image A₄, construct its unique all-place cusp π with `rec(π_v)≅(ρ|W_Fv)^∨`. Over the cyclic cubic field E fixed by V₄, `ρ_E` is dihedral. Use the weak cyclic descent and fibers to descend its Galois-invariant automorphic class; determinant matching selects one cubic-twist descent `π_ps`. It has no self-twist. The Rankin–Selberg pole criterion identifies its cuspidal adjoint with cyclic induction of the V₄ character θ, since Ad ρ=Ind θ. At inert good places the remaining cube ambiguity would give order six in A₄, so `π_ps` matches ρ almost everywhere. All archimedean places split in E, giving the infinity hypothesis of artin-all-place-upgrade. That target proves equality everywhere. R17.4 supplies the GL₃ converse and pole inputs.

*Needs:* R17.5/artin-all-place-upgrade; R17.5/dihedral-artin; R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/adjoint-lift; R17.4/cubic-character-induction; R17.4/gl3-recognition; ArithmeticGaloisRepresentations Layer 4; R16.5; R16.4; R16.3.

*Source:* [langlands80], §3(i), Theorem 3.3, p. 19; §3(i), pp. 16–17; §3(i), p. 18; §3(i), p. 19; §3 opening, p. 15.

<a id="r17-5-octahedral-artin"></a>

### R17.5.7 Octahedral Artin automorphy

For continuous finite-image irreducible `ρ:G_F→GL₂(ℂ)` with projective image S₄, Tunnell constructs a unique cusp π whose good Satake roots are the arithmetic-Frobenius roots of ρ, equivalently the geometric roots of `ρ^∨`. Let E/F be its A₄ quadratic field, K/F the Sylow-two cubic field and M=EK. Tetrahedral automorphy and weak quadratic descent give `π₁,π₂=π₁⊗ω_{E/F}`, with the same centre. Exactly one has `BC_K(π_i)=π(ρ_K)`: both outputs are distinct quadratic descents of `π(ρ_M)`, because `ρ_M` is irreducible, and one is the monomial class `π(ρ_K)`. A local cubic degree 1 or 3 then identifies good Satake classes; the alternative would yield order six in S₄. Use only `cubicBaseChange_weak` here, comparing both coordinates by `formalBaseChange`; then apply R17.5/artin-all-place-upgrade for all finite places. Infinity matches by the independently proved split and ordinary archimedean cyclic comparison; at real-to-complex places ρ(c) has eigenvalues ±1, since its projective image is a transposition. The real parameter of π restricts to 1⊕1 and has determinant sgn, hence is 1⊕sgn. The cubic input here is the weak converse transfer, with its JPSS monomial analytic input. Langlands's earlier restricted octahedral theorems do not replace Tunnell's theorem.

The finite-group comparison uses `trace_eq_of_square_cube`. For complex invertible 2×2
matrices A,B with the same determinant, equality of the traces of their squares and cubes
implies equality of their traces provided the projective order of A is not six.
Indeed p₂ gives `s′=±s`; the negative alternative in p₃ forces `s=0` or `s²=3e`.
The former already gives equal traces; the latter gives projective order six.
For finite-group representations apply this elementwise to the quadratic and cubic
Frobenius powers, allowing conjugates. Power-degree one already gives equality;
otherwise the degrees are two and three. The projective S₄ image excludes order six.
Consequently two rank-two representations of a finite group with equal determinants,
equal square and cube traces at every element, and no projective order six in the first
representation have the same character. Conjugation does not change any hypothesis.
This finite-group target is independent of a choice of Frobenius representative.

**Checks.**
- With a common determinant and trace agreement on a set whose conjugates and powers
  cover a finite group, the power-sum recurrence transports both trace and determinant
  to every element; no sign choice may be made separately at different powers.
- For the order-48 section `gl2F3_section`, projectivization is
  `PGL₂(𝔽₃)≅S₄`, with element orders 1,2,3,4. Quadratic residue degrees 1,2 and
  cubic residue degrees 1,3 therefore determine the required good-place pair.
- The exclusion is necessary: A=diag(exp(iπ/6),exp(−iπ/6)) and B=−A have determinant
  one, the same square and cube traces, and opposite nonzero traces; A has projective order six.


*Needs:* R17.5/artin-all-place-upgrade; R17.5/tetrahedral-artin; R17.5/dihedral-artin; R17.4/cyclic-descent-fibers; R17.4/nonnormal-cubic-base-change (`cubicBaseChange_weak` only); R16.5; ArithmeticGaloisRepresentations Layer 4; R17.4/cyclic-descent; R17.4/cuspidality; R16.4; R16.3.

*Source:* [tunnell81], p.173, definition of π(ρ); Lemma and proof, p.174; Theorem and proof, pp.174–175; [langlands80], §3(ii), p.19. The finite-group comparison follows from p₂ and p₃ as above; [ddt], Theorem 3.14(a), gives the order-48 section used in its rational Check.

<a id="r17-5-solvable-artin"></a>

### R17.5.8 Langlands–Tunnell strong Artin theorem

For a number field F and continuous finite-image irreducible `ρ:G_F→GL₂(C)` with solvable projective image, construct the unique cusp π with `rec(π_v)≅(ρ|W_Fv)^∨` at every place, equivalently equality of all character-twisted local L- and ε-factors. The finite projective classification leaves dihedral, A₄ and S₄; cyclic image is reducible. Linear and projective solvability coincide because the scalar kernel is abelian. Quadratic induction treats the dihedral case; the tetrahedral/octahedral constructions and artin-all-place-upgrade treat the others. Total oddness over totally real F gives holomorphic parallel weight one, though automorphy itself requires no oddness.

*Needs:* R17.5/artin-all-place-upgrade; R17.5/dihedral-artin; R17.5/tetrahedral-artin; R17.5/octahedral-artin; R16.5; R16.6; ArithmeticGaloisRepresentations Layer 4; R16.3; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

*Source:* [rt83], §4, proof of Proposition 4.3, p. 41; §4, p. 40; [langlands80], §3 opening, p. 15; [tunnell81], p. 173, first paragraph.

<a id="r17-5-q-weight-one"></a>

### R17.5.9 Odd Artin representations and classical weight one

For solvable-artin over ℚ with detρ(c)=−1, the R16.6 dictionary gives a normalized cusp weight-one newform f of exact Artin conductor, nebentypus detρ and L(s,f)=L(s,ρ). At good arithmetic Frobenius its polynomial is `X²−a_ℓX+detρ(Frob_ℓ)`. The Weil–Langlands theorem requires all twisted Artin L-functions entire, here supplied by cuspidality. Coefficients lie in a number field; reduction specifies λ|p, residue embedding and stable lattice. This is not the cohomological weight≥2 attachment.

*Needs:* R17.5/solvable-artin; R16.2; R16.6; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§3.1–3.6; ArithmeticGaloisRepresentations Layer 5; R16.1/finite-level-comparison; ModularForms Layer 4.

*Source:* [ds74], §4(c), Théorème 4.10 (Weil–Langlands), p. 516; with Remarques 4.4–4.5 and Théorème 4.6, pp. 514–515; [langlands80], §3, octahedral case before Theorem 3.4, p.20; [rt97], §2, proof of the Theorem (case D<0), p. 307.

<a id="r17-5-tr-weight-one"></a>

### R17.5.10 Totally odd Artin representations and Hilbert weight one

For totally real F and solvable-artin ρ with `detρ(c_v)=−1` at every real place, π is holomorphic parallel-weight-one cusp. Each real component is Rogawski–Tunnell's unitary induction π(1,sgn), with parameter 1⊕sgn and a limit of discrete series. Conductor and classical local factors equal those of ρ; `rec(π_v)≅(ρ|W_Fv)^∨` and geometric reciprocity sends the centre to (detρ)⁻¹. This supplies residual-modularity input and constructs no weight-one cohomological attachment or Shimura geometry.

*Needs:* R17.5/solvable-artin; R16.6; ArithmeticGaloisRepresentations Layer 1.

*Source:* [rt83], §1, definitions (ii) of π₁ and of 'holomorphic of weight k', p. 4; Introduction, p. 1.

<a id="r17-5-brauer-character"></a>

### R17.5.11 Prime-regular characters and reduction comparison

For a finite group Γ, algebraically closed field k of characteristic p, and m prime to p divisible by every p-regular element order, fix a multiplicative identification `τ:μ_m(k)≃μ_m(ℂ)`. For `r:Γ→GL_n(k)`, `brauerCharacter` is the sum, with algebraic multiplicities, of the τ-lifts of the eigenvalues of r(g), defined only for p-regular g. The intended signature is `brauerCharacter (p m : ℕ) (τ : μ_m(k) ≃* μ_m(ℂ))`
`(n : ℕ) (r : Γ →* GL_n(k)) : {g : Γ | gcd(orderOf(g), p) = 1} → ℂ`, with p prime,
m>0, gcd(m,p)=1 and the divisibility hypothesis just stated. Since `X^m−1` has distinct roots, these eigenvalues lie in `μ_m(k)`. This construction is independent of their ordering; extending m and extending τ compatibly preserves it. It is not a lift of the modular trace.

The API includes `brauerCharacter_spectrum` evaluates from a split characteristic polynomial; `brauerCharacter_one` gives n; `brauerCharacter_conjugate` proves conjugacy invariance. Additivity on exact sequences follows by writing matrices in a submodule-adapted basis. For a splitting modular system (E,R,k₀), reduction identifies prime-to-p roots uniquely by Hensel lifting. A Γ-stable full R-lattice in an E-representation then has Brauer character equal to its ordinary character on p-regular elements. Two k-representations have the same Brauer character precisely when they have the same composition factors with multiplicity. In particular, equality with the character of a simple module makes the whole reduction isomorphic to that simple module.

**Checks.** A one-dimensional prime-to-p root lifts to τ(a); eigenvalues a,a² with τ(a) a primitive cube root give −1, including in characteristic two; the rank-p identity has character p≠0 in ℂ, although its modular trace is zero.

Proof: Prove root lifting and the lattice comparison by the characteristic polynomial of each p-regular element. Prove character recognition by pairing simple Brauer characters with projective covers: the pairing is the dimension of Hom, so the two character families are dual and simple Brauer characters are independent. Additivity then identifies multiplicities. Projective covers are those of finite-dimensional group algebras; their existence uses the nilpotent Jacobson radical and lifting primitive idempotents. This supplies modular character recognition here, beyond RepresentationTheory's ordinary-character theory.

*Needs:* Mathlib `Representation`, `Matrix.charpoly`, `rootsOfUnity`, finite-dimensional group algebras and composition series; RepresentationTheory/InductionRestriction Layers 3–4 for ordinary induction; LocalFieldsRamification Layer 1 for prime-to-p Hensel lifting. Modular characters and their projective pairing are owned here.

*Source:* [webb16], §10.1, Lemma 10.1.1 p. 170 and Proposition 10.1.3(5)–(6) pp. 170–171; §10.2, Theorem 10.2.2 p. 176 and Corollary 10.2.3(3) p. 177.

<a id="r17-5-solvable-integral-lift"></a>

### R17.5.12 Fong–Swan lifting with a stable lattice

For any prime p, finite solvable Γ, algebraically closed k of characteristic p and irreducible `r:Γ→GL_n(k)`, there exist a number field E, a prime λ of E above p, `R=(𝓞_E)_λ`, a residue embedding f:R→k with kernel the maximal ideal, a homomorphism `ρ:Γ→GL_n(R)`, and `P∈GL_n(k)` such that r(g)=P·f(ρ(g))·P⁻¹ for every g. This is `solvable_finite_image_integral_lift`. Neither coprimality of |Γ| with p nor rank two is required. The conclusion supplies the actual residual module.

Proof: Descend the simple residual module to a finite splitting field. Choose a number-field splitting system with that residue field enlarged if necessary: cyclotomic fields supply ordinary splitting and the required finite residue extension. Fong–Swan gives an irreducible ordinary character χ lifting its Brauer character φ. Realize χ over E and take the R-span of the Γ-translates of a basis. This is a finite, torsion-free full stable lattice; the DVR structure makes it free of rank χ(1)=n. The preceding reduction comparison and character recognition make its reduction isomorphic to r, yielding P.

For Fong–Swan use Isaacs5.4's group-order induction. Brauer Clifford decomposition lifts a nontrivial normal-subgroup orbit over its proper inertia group and then induces. The invariant branch uses the normal p-group quotient extension with prime-to-p degree/determinantal order (4.2, with4.1) and the prime-to-p quotient's unique Brauer constituent (3.1); Galois-conjugate comparison gives p-rationality. Section6 completes the p-solvable lift. These modular Clifford/extension lemmas are subsidiary targets here; characteristic-p Maschke or an unspecified projective lift does not supply them.

The API includes The integral rank equals the residual rank; reduction gives an isomorphism of Γ-modules; extending coefficients preserves that comparison. Tests: A prime-to-p rank-one root lifts by Hensel; the rank-two simple S₃ module in characteristic two lifts despite 2 dividing |S₃|; changing the residual basis changes P, so entrywise equality is not required.

*Needs:* R17.5/brauer-character; ordinary character realization in RepresentationTheory/InductionRestriction Layer 6; Mathlib `Group.IsSolvable`, `HeightOneSpectrum`, `Localization.AtPrime`; GlobalNumberFields Layer 7; NumberFieldArithmetic Layer 5. The modular Clifford and p-solvable character-lifting lemmas are owned here.

*Source:* [isaacs74], Theorem 1.2 p. 171, Theorem 5.4 pp. 179–180 and proof in §6 pp. 180–181; Theorem 3.1 pp. 174–175, Lemma 4.1 and Theorem 4.2 pp. 175–177, Lemma 5.1 pp. 178–179. [webb16], §9.2, Theorem 9.2.6 p. 143; §9.4, Lemma 9.4.6 p. 152 and Corollary 9.4.7 p. 153; reduction comparison as above.

<a id="r17-5-odd-residual-lift"></a>

### R17.5.13 Solvable residual lifting in odd characteristic

For totally real F, prime p>2 and continuous absolutely irreducible totally odd `r̄:G_F→GL₂(F̄_p)` with solvable image, a totally odd continuous finite-image lift over a number field exists with λ|p and a stable lattice reducing semisimply to r̄ under a residue embedding. Factor r̄ through its finite solvable image Γ. Apply solvable-integral-lift and inflate ρ along `G_F→Γ`. The open kernel gives continuity and the finite image gives an algebraic coefficient realization. Embed E into ℂ. Reduction conjugacy preserves determinants; at each real involution the oddness API forces determinant −1 because p>2. Absolute irreducibility follows from the simple reduction. No projective lifting or prescribed conductor is needed.

For the integral matrix Checks define `mixedSignInvolution : GL₂(ℤ)` with diagonal (1,−1)
and the same inverse. Its API gives square one, determinant −1 and the stated reduction
comparison. **Checks.** It squares to the identity; its determinant is −1 over ℤ and at 3;
it is not the scalar −I, whose determinant is +1.

**Oddness API.** For a domain R, a field k with 2≠0, a ring map f:R→k and A∈GL₂(R), `involution_det_eq_neg_one_of_reduction` proves A²=1 and det(map f A)=−1 imply det A=−1. `involution_odd_of_reduction` applies to ρ(c), c²=1. `involution_det_eq_neg_one_of_residual_conjugacy` allows B=P(map f A)P⁻¹ and det B=−1; `involution_odd_of_residual_conjugacy` uses a common P. Determinant survives semisimplification.

**Checks.** Over ℤ, in any basis: diag(1,−1) is odd at 3; scalar −I is even; at 2 the identity has integral determinant +1 and residual determinant −1.

*Needs:* R17.5/solvable-integral-lift; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 5; Mathlib `Matrix.GeneralLinearGroup.map_det`.

*Source:* [bcgp21], Proposition 10.1.3, proof, solvable case, p. 474.

<a id="r17-5-residual-lt-application"></a>

### R17.5.14 Solvable residual modularity over totally real fields

For odd-residual-lift's F,p,r̄, apply Langlands–Tunnell to its finite totally odd lift. The resulting parallel-weight-one Hilbert cusp form has chosen residual attachment r̄. BCGP10.1.3 uses this over a totally real quadratic E with p=3 or5; 10.2.6 uses it through10.1.3(1). Ordinary weight-two lifts, auxiliary extensions and GSp₄ transfer are separate inputs. No minimal conductor or ordinary local condition is asserted.

*Needs:* R17.5/odd-residual-lift; R17.5/tr-weight-one; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 5; R17.5/solvable-artin.

*Source:* [bcgp21], Proposition 10.1.3, proof, solvable case, p. 474; Theorem 10.2.6, proof, p. 481.

<a id="r17-5-tunnell-primitive-globalization"></a>

### R17.5.15 Tunnell's globalisation of a local two-dimensional Weil representation (Tunnell 1978, Theorem 1.3)

Let `K/Q_p` be finite and `σ:W_K→GL₂(ℂ)` continuous. Tunnell's Theorem 1.3 gives a number field F, a place v with `F_v≅K`, and continuous `ρ:W_F→GL₂(ℂ)` with `ρ_v≅σ`. Reducible, induced, A₄ and S₄ projective types can be preserved. For K=ℚ₂ and S₄ type one may take F=ℚ and det ρ(c)=−1. In the primitive case (A₄ or S₄, necessarily p=2), the proof constructs ρ=ρ₀⊗χ̃ with `ρ₀:G_F→GL₂(ℂ)` of finite image, the same projective type, and χ̃ a Hecke quasi-character; in the S₄ case ρ₀ is odd at every real place. If primitive σ has finite image, Carayol's application requires finite-image ρ on `G_F`. This needs finite-order χ̃ prescribing the scalar discrepancy on **all** `F_v×`. Roots of unity alone determine neither the uniformizer value nor the principal-unit character. To obtain rec π=σ from this Weil globalization, apply strong Artin to the arithmetic dual of ρ₀ and twist π by χ̃ through geometric reciprocity. The quasi-character form therefore suffices for automorphy. Tunnell also treats positive-characteristic local and global fields; only characteristic zero is in scope here.

Irreducibility is unnecessary for existence. Restriction uses a chosen place above v; its isomorphism class is independent of that choice. Primitive types force p=2.

*Needs:* R17.5/global-weil-group; R17.5/finite-projective-lift; R16.3; ArithmeticGaloisRepresentations Layer 4; ClassFieldTheory Layer 11; GlobalNumberFields Layers 1 and 9; NumberFieldArithmetic Layer 5. R16.1/full-local-character-prescription supplies full-local finite-order extension and its one-place norm-twist consequence, allowing auxiliary ramification. ArithmeticGaloisRepresentations §7.6’s idelic torsion-character extension has the different domain `μ_n(F)\μ_n(𝔸_F)`.

**Domain test.** `unramifiedQuadraticTwo : ContinuousMonoidHom ℚ₂× ℂ×`, `x↦(−1)^v₂(x)`,
is continuous, multiplicative and quadratic. `twoUnit : ℚ₂×` is the unit with value 2 and
inverse 1/2. **Checks.** The character sends `twoUnit` to −1; it is one on the image of every
ℤ₂-unit; it is one on every finite-order element of ℚ₂×, including −1. These distinguish
full-local prescription from restriction to integral units or torsion.

`quadraticDirichletFive : DirichletCharacter ℂ 5` is Mathlib's quadratic character of ZMod 5
extended along ℤ→ℂ. Its API gives zero extension, quadratic order, nontriviality and primitive
conductor 5. **Checks.** χ(0)=0; χ(2)=−1; χ(−1)=1. GlobalNumberFields Layer 9's
Dirichlet–Hecke comparison gives an even extension with auxiliary ramification at 5.

**Order test.** On ℤ/4ℤ, `quarticCharacter : AddChar (ZMod 4) ℂ`, `a↦i^a` extends the
nontrivial quadratic character of {0,2}, has fourth power one and nontrivial square.
`characterExtensionOrder_square_ne_one` proves that every additive character with χ(2)=−1
has χ²≠1, since χ(1)²=χ(2). **Checks.** The values at 1,2,3 are i,−1,−i respectively;
the fourth power is one; any extension of the character on {0,2} has nontrivial square.
For a+a=0, χ(a)²=1. These are finite-group order statements; arithmetic prescription and
Grunwald–Wang require separate arguments.

*Source:* [tunnell78], §1, Theorem 1.3 and proof, pp. 182–183; [carayol86], §12.2.3, proof of Proposition 12.2.2, p. 458.

<a id="r17-5-prescribed-local-induction"></a>

### R17.5.16 Automorphic induction with prescribed local and archimedean components (Carayol 11.2)

Let F be totally real of degree d, `k_i≥2` and w of common parity. Write `D_{k,w}=𝒲(ℂ,ζ_{k,w})`, `ζ_{k,w}(z)=(z z̄)^{(−w−k+1)/2}z^{k−1}`, with central character `t^{−w}`. At distinct finite places 𝔭,v prescribe a quadratic field `L_𝔭/F_𝔭` and a character `ξ_𝔭` not factoring through norm, with `ξ_𝔭|·|^{w/2}` finite-order. Construct CM L/F with this completion, nonsplit at v, and a Hecke quasicharacter ξ with `ξ_𝔭` as prescribed, infinity components `ζ_{k_i,w}`, and `ξ_v` not factoring through norm. Then `π′=AI_{L/F}(ξ)` is cuspidal, ordinary supercuspidal at 𝔭 and v, and has the prescribed `D_{k_i,w}`. For even d take v to be Carayol's fixed discrete-series place; for odd d it is auxiliary. Full-local prescription supplies the finite correction to an angular infinity-type character; global norm-twisted angular characters need not have finite image.

The finite-order condition is equivalent to the local central character being `|·|^(−w)` times a finite-order character. At a split place 𝒲 denotes the principal series of its two characters.

*Needs:* R17.4/quadratic-induction; R16.2; R16.3; GlobalNumberFields Layer 1; GlobalNumberFields Layer 7; GlobalNumberFields Layer 9; GlobalNumberFields Layer 10. R16.1/full-local-character-prescription supplements these carriers.

**Construction and local finiteness.** Weak approximation gives a CM L/F with the chosen quadratic completion at 𝔭 and nonsplit at v. Let σ be CM conjugation and 𝔓 the unique prime above 𝔭. Patrikis, Lemma 2.3.1, p. 28, gives unitary ψ₀ with infinity components `(z/|z|)^(k_i−1)`. Choose h>0 and a∈L× with `(a)=𝔓^h`. Since σ𝔓=𝔓, a/σa is an integer unit of absolute value one at every embedding; Mathlib's `NumberField.Units.mem_torsion` makes it torsion. Each phase ι(a)/|ι(a)| has finite order, since its square is ι(a/σa). Thus ψ₀,∞(a) is torsion. At other finite places a is a unit; continuity gives finite character image on units and only finitely many nontrivial factors. The principal-idele relation makes ψ₀,𝔓(a) torsion. As `a^ℤ` `O_𝔓×` has index h in `L_𝔓×`, ψ₀,𝔓 has finite order on the full local group.

Put `ψ=ψ₀|·|_𝔸_L^(−w/2)`; then `μ=ξ_𝔭/ψ_𝔓` has finite order. At 𝔙 above v choose finite-order θ with `ψ_𝔙θ` not σ-invariant: θ=1 if `ψ_𝔙` already is not invariant, otherwise a finite local quotient character detecting σx/x≠1. Full-local prescription at {𝔓,𝔙} gives finite-order χ with components μ,θ and trivial infinity components. Then ξ=ψχ satisfies (a)–(c). Hilbert 90 identifies local norm factorization with σ-invariance. The CM construction thus uses full-local finite-character prescription.

*Source:* [carayol86], §11.2, character formula, conditions (a)–(c) and conclusion, p. 450; [jl70-global], §12, Proposition 12.1, p. 206, and §4, Theorem 4.6(iii), p. 71; [patrikis], §2.3, Lemma 2.3.1 and its CM consequence, p. 28.

<a id="r17-5-octahedral-mod-three-application"></a>

### R17.5.17 The octahedral mod-3 application: odd mod-3 representations come from weight-one forms

For continuous absolutely irreducible odd `r̄:G_ℚ→GL₂(𝔽₃)`, put λ=(1+√−2) and use the finite section s:GL₂(𝔽₃)→GL₂(ℤ[√−2]) reducing to identity with √−2↦−1. It sends the generators ((1,1),(0,1)) and ((0,1),(1,0)) respectively to ((−2,−1+√−2),(1+√−2,1)) and ((−1−√−2,−2),(−1+√−2,1+√−2)); their generated group has order 48. Then ρ=s∘r̄ is finite-image irreducible odd, detρ is the ±1 lift of detr̄, and its projective image is the same subgroup of PGL₂(𝔽₃)=S₄. Langlands–Tunnell gives a weight-one newform g of Artin conductor N(ρ) and nebentypus detρ. Its stable `ℤ[√−2]_λ` lattice reduces to r̄; at good ℓ, `a_ℓ(g)=tr s(r̄(Frob_ℓ))` and both traces and determinants reduce correctly. N(ρ) may exceed N(r̄). DDT's passage to weight two is separate.

Define `redSqrtNegTwo : ℤ[√−2] →+* 𝔽₃` by √−2↦−1, using Mathlib's `Zsqrtd.lift`.
Its API gives evaluation a+b√−2↦a−b, surjectivity and kernel (1+√−2).
**Checks.** The element √−2 maps to −1; 1+√−2 maps to zero; √−2−1 maps to 1,
so the opposite choice of residue root gives a different kernel.

Arithmetic Frobenius and the reciprocity identification of det ρ agree with q-weight-one. Prove the defining relations of these generators and that their subgroup has order 48; reduction identifies this subgroup with GL₂(𝔽₃).

*Needs:* R17.5/solvable-artin; R17.5/q-weight-one; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 4; ArithmeticGaloisRepresentations Layer 5; Mathlib `Matrix.GeneralLinearGroup.map`; Tau Ceti `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

*Source:* [ddt], §3.2, Theorem 3.14(a), p. 90; §3.2, sketch of proof of Theorem 3.14, case (a), p. 90; §3.2, Theorem 3.9, p. 89; §3.2, Definition 3.12, p. 89.


### Examples

The unramified quadratic character of Q₂× is trivial on units and torsion but sends 2 to −1. Its prescribed finite global extension can ramify at 5. Extending a character of {0,2} in Z/4 may increase order from two to four. At odd residue characteristic, reduction of diag(1,−1) is odd; at characteristic two the identity already has residual determinant −1.

### Dependencies

R16.1–R16.6; R17.4; ArithmeticGaloisRepresentations Layers 1–5; GlobalNumberFields Layers 7–10; ClassFieldTheory Layers 5–11; ArithmeticGaloisRepresentations §7.6; RepresentationTheory/InductionRestriction Layers 3–7; AlgebraicModularFormsAndSerreWeights R15.5–R15.6.

## Layer R17.6: Characteristic two and residual modularity

<a id="r17-6-adelic-parabolic-realization"></a>

### R17.6.1 Adelic comparison of the classical rank-two summand

For integer weight k≥2, a normalized cuspidal primitive classical eigenform f and its
unitary adelic representation π_unit, use the finite-part coefficient model of
R16.4.5 for `π_alg,f=π_unit,f⊗|det|^{−(k−2)/2}`. Identify the primitive rank-two summand of
AlgebraicModularFormsAndSerreWeights R15.5A.1 with
`Hom_{GL₂(𝔸_f)}(π_alg,f,H¹_par)` in the modular-curve tower, over the specified coefficient
completion. Use its coefficient system `V_k=Sym^(k−2)R¹h_*ℚ_ℓ` and the image
`H¹_par=image(H¹_c→H¹)`, with the holomorphic and antiholomorphic contributions supplied
by the classical comparison. Construct the adelic Hom identification through the finite-level
and holomorphic dictionaries of R16.4 and R16.6. At exact level the automorphic newvector
projector recovers the primitive summand; at larger levels distinguish the dimension of
`π_alg,f`'s oldvector invariants from its rank-two cohomological multiplicity.

Prove compatibility with coefficient extension, Galois and Hecke actions, and level
pullback/trace. The adelic multiplicity is independent of the auxiliary neat full level;
pullback is adjoint to trace under the supplied coefficient pairing.
The geometric tower action uses the classical Hecke pullback/trace operators: at a good p,
the volume-one raw spherical operator on `π_alg,p` has eigenvalue `a_p`, and the central
operator `diag(p,p)` has eigenvalue `ε(p)p^{k−2}`. To apply R17.6.4's unitary local
formula, transport through `π_unit,p=π_alg,p⊗|det|^{(k−2)/2}` under the fixed coefficient
embedding; the cohomological multiplicity and its Galois action retain their geometric normalization.

**Checks.** For k=2 the comparison identifies the constant-coefficient Jacobian realization;
for the weight-twelve level-one form Δ the adelic multiplicity is two despite larger-level
oldvector spaces, and at p=2 its geometric raw Hecke eigenvalue is −24, whereas the unitary
raw eigenvalue is `2^(−5)(−24)=−3/4`; the central operator acts by `2¹⁰` on `π_alg,2`
and by 1 on `π_unit,2`; an Eisenstein boundary class has zero cuspidal projection; k=1 is excluded
from the prescribed symmetric coefficient system.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.5A.1
[classical rank-two cohomological summand](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-parabolic-realization);
R16.4/cohomological-rationality; R16.6; AutomorphicLFunctionsAndLocalFactors AL.2
[GL₂ newvectors](../AutomorphicLFunctionsAndLocalFactors/README.md#gl2-newvectors).

*Source:* [deligne69], Theorem 2.10, pp.147–148, Definition 3.9 and (3.10)–(3.12),
pp.153–154 (the coefficient tower and its adelic action); [carayol86], §§2.2 and 4.9,
pp.419–420 and 426. The normalization is R16.4.5's algebraic twist of the unitary dictionary.

AlgebraicModularFormsAndSerreWeights R15.5A.2
[classical eigenforms of weight at least two](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-higher-weight-attachment)
and R15.5A.3 [the Artin representation of a classical weight-one form](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-weight-one-attachment)
supply the classical Galois attachments, with coefficient descent, stable lattices and
Frobenius conventions. R17.6.4 constructs their local conductor comparison.

### R17.6.3a Proper-curve correspondence traces

For a smooth proper curve X over an algebraically closed field, ℓ invertible, a proper
correspondence c:C→X×X and a bounded constructible finite-Tor-dimension ℓ-adic complex F,
construct the trace map from Hom(c₂!c₁*F,F) to `H⁰(Fix(c),K_Fix(c))`, and the integrated local
term on each proper connected fixed component. Prove that the alternating trace on RΓ(X,F)
is the sum of these local terms. Construct the analogous adic trace by the normalized coefficient
realization, and prove compatibility with proper pushforward, open restriction and Verdier duality.

API: evaluation on the diagonal gives the usual complex trace; proper pushforward takes trace
classes to trace classes; transpose and biduality preserve the integrated alternating trace.

**Checks.** A correspondence on a point gives the ordinary alternating stalk trace; the identity
on a proper curve has a whole-curve fixed component rather than a finite point sum; a zero
cohomological correspondence has all local terms zero.

*Needs:* EtaleCohomologyFoundations §§0.6, 0.8, 0.11 and F.0–F.6 (scheme constructible
coefficients, proper pushforward, traces and Verdier duality); ClassicalAdicEtaleCohomology
Layers 8–9 (adic coefficient operations and normalized realization).

Derive transpose/Verdier-duality compatibility from the evaluation construction and biduality
on the supplied coefficient category.

*Source:* [varshavsky05], §1.2.2, pp.8–9, Proposition 1.2.5 and Corollary 1.2.6, p.10;
§1.5.7, p.16, for the quasi-finite restricted stalk term.

<a id="r17-6-contracting-curve-local-term"></a>

### R17.6.3b Contracting curve local terms

For c and F on the preceding coefficient category, a reduced closed point Z⊂X, and an open
connected fixed component β meeting Z, assume c contracts near Z on a neighborhood of the
fixed locus: `c₁*I_Z⊂c₂*I_Z` `O_C` and `(c₁*I_Z)^n⊂(c₂*I_Z)^(n+1)O_C` for some n>0.
Prove that β lies over Z and that its trace class and integrated local term equal those of the
restricted correspondence on Z. At an isolated fixed point this is the ordinary alternating
stalk trace, including the case of a nonreduced fixed scheme. Prove restriction and duality
compatibilities, then apply this theorem to the reordered unequal-order curve branches in
R17.6/classical-conductor-comparison.

API: restriction to the reduced point preserves the local term; shrinking the contracting
neighborhood changes no term; dualizing and transposing gives the dual-stalk version.

**Checks.** Reordered orders (2,3) contract with n=2 and contribute no length factor two;
orders (3,2) use the transposed dual-stalk trace; equal orders for the identity do not satisfy
contraction and have a positive-dimensional fixed locus.

*Needs:* R17.6/proper-curve-correspondence-trace; its constructible and adic coefficient suppliers;
Mathlib ideal powers; the `ramification_contraction` ideal-power calculation.

*Source:* [varshavsky05], Definition 2.1.1 and Theorem 2.1.3, pp.17–18.

### R17.6.4 The conductor bound needed for exact residual level

For a primitive newform f of weight k≥2, exact level M and character ε, its attachment at λ|ℓ has conductor away from ℓ equal to M's prime-to-ℓ part. Frobenius-semisimple Weil–Deligne compatibility, including N, identifies ramified factors. Stable-lattice reduction cannot increase it. Thus a semisimple residual representation of odd conductor N at ℓ=2, arising from a primitive form of level M|N, forces M=N. Apply this to the actual attachment of f.

For p≠ℓ set `ν_W(Φ)=p⁻¹`; `π_p` is unitary-normalized. The arithmetic attachment satisfies `WD(ρ_{f,λ})=rec(π_p)^∨⊗ν_W^((k−1)/2)`; its dual matches `rec(π_p)⊗ν_W^(−(k−1)/2)`. Dualizing sends N to −Nᵗ. Conductor is unchanged by this dual and unramified twist.

**Parabolic comparison.** For F=ℚ, Carayol uses M₂(ℚ) and classical parabolic H¹. The primitive `π_alg,f` multiplicity of R17.6.1 in the `Sym^(k−2)` modular-curve tower has dimension two; use R16.4.5's finite coefficient model with `π_alg,f=π_unit,f⊗|det|^{−(k−2)/2}`. Level, Hecke and Galois actions commute. Good-prime recognition identifies this geometric multiplicity's dual with `ρ_{f,λ}`. The displayed Weil–Deligne formula uses `π_p=π_unit,p=π_alg,p⊗|det|^{(k−2)/2}` under the fixed coefficient embedding, with its stated dual and norm factors.

For a semistable model set `X=ker(H¹_par(special fibre)→H¹(normalization))`. Keep cusp extension by zero in the coefficient nearby-cycle sequence. Picard–Lefschetz surjects generic H¹(1) onto X through the nondegenerate pairing of the node branch-difference cokernel and dual incidence kernel, forcing rank-one N on special summands. Principal series come from the normalized fibre; ordinary supercuspidals use CM induction and good-prime recognition of the same multiplicity.

Ramified trace specialization: let c₁,c₂:C→X be maps of smooth proper curves over an algebraically closed field, ℓ invertible. For constructible ℓ-adic F on X and u:c₂*F→c₁!F, suppose every fixed branch has c₁*t=αtᵃ, c₂*t=βtᵈ with units α,β and positive unequal a,d. The alternating cohomological trace is the sum of ordinary stalk traces for d>a and Verdier-dual stalk traces for a>d, including cusp extension by zero.

Proof: use Varshavsky on the **reordered** correspondence (c₂,c₁), with morphism c₁!c₂*F→F. For d>a, pullback ideals (tᵈ),(tᵃ) satisfy d≥a and da≥a(a+1), giving contraction with n=a (`ramification_contraction`). The fixed ideal is (tᵃ) up to a unit. The contracting theorem replaces its local term by the restricted point trace; nonreduced length a adds no factor. For a>d dualize and reverse, using n=d. Evaluation and biduality preserve the alternating local trace under transpose. Proper Lefschetz–Verdier sums these terms. At a cusp j!F has zero stalk, but D(j!F)=Rj*DF can contribute; retain the dual complex.

At odd p every supercuspidal is ordinary, so the ℓ=2 odd-conductor application uses Theorem (B), without cubic transfer. For p=2≠ℓ use Carayol §12.2's strong cubic comparison and field-change identification. Residual inequality gives N|M, hence M=N when M|N.
The API includes Ramified Frobenius-semisimple compatibility with N; equality of characteristic-zero conductor and primitive level away from ℓ; independence of stable lattice for the semisimple residual class; residual conductor inequality.

**Checks.** An unramified Steinberg twist has conductor one despite unramified semisimple Weil action; supercuspidals retain Swan conductor; reduction can lower conductor. For Δ at p=2, ℓ≠2, the algebraic multiplicity has raw Hecke eigenvalue −24; undoing its determinant twist gives the unitary eigenvalue −3/4 before the local Weil–Deligne formula is applied. For trace specialization, (a,d)=(1,pᵐ), m>0, uses the ordinary stalk, (2,3) has a length-two fixed scheme without an extra factor two, and (3,2) uses the dual stalk. Equal orders are excluded: the identity correspondence has a positive-dimensional fixed locus.

*Needs:* R17.6/proper-curve-correspondence-trace; R17.6/contracting-curve-local-term; AlgebraicModularFormsAndSerreWeights R15.5A.2
[classical higher-weight attachment](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-higher-weight-attachment); R16.3; R16.6/classical-hecke-and-level; ArithmeticGaloisRepresentations §§3.1–3.6 and ArithmeticGaloisRepresentations Layer 5; R17.5/prescribed-local-induction; R17.4/nonnormal-cubic-base-change. R17.6/proper-curve-correspondence-trace and R17.6/contracting-curve-local-term supply the ramified trace; parabolic comparison and field-change identification are subsidiary targets here.

*Source:* [ddt], Theorem 3.1(d)–(e), p.86 (weight two); [carayol86], Theorems (A)–(B), pp.409–412; §§2.2, 4.9, 11.1–9, 12.2, pp.419–420, 426, 449–454, 457–458; [langlands73], Proposition 3.1 p.27, Theorems 7.1 and 7.5 pp.67, 70, Proposition 7.12 pp.89–90, Lemma 7.14 pp.94–98 (author pagination); [varshavsky05], §1.2.2 pp.8–9, Corollary 1.2.6 p.10, §1.5.7 p.16, Definition 2.1.1 and Theorem 2.1.3 pp.17–18; [rt97], pp.302–306.

<a id="r17-6-determinant-untwist"></a>

### R17.6.5 Removing the characteristic-two scalar character

For continuous absolutely irreducible `r̄:G_Q→GL₂(F̄₂)` with dihedral projective image `D_n`, n odd ≥3, the determinant character det r̄ has odd order and a unique square root `ξ:G_Q→F̄₂^×` (unique among all characters, since a²=1 forces a=1 in characteristic two); ξ has odd order and is unramified at 2. The twist `r̄₀=r̄⊗ξ^{-1}` has determinant one and its image maps isomorphically onto the projective image, so it is dihedral of order 2n: a finite scalar in SL₂(F̄₂) is trivial. Conversely, a projective-dihedral r̄ has linear-dihedral image exactly when det r̄=1, because `D_n` (n odd) is generated by involutions and involutions in GL₂(F̄₂) are unipotent. Twisting a residual modular form for r̄₀ back by ξ (via reciprocity, a Teichmüller lift of ξ and a finite coefficient extension) recovers r̄; level and nebentypus are then recomputed using the actual twist, not held fixed.

Global reciprocity identifies ξ with an odd-order Dirichlet character. The modular-form twist uses its Teichmüller lift and a finite coefficient extension.

*Needs:* ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§3.1–3.6; ArithmeticGaloisRepresentations Layer 4; ClassFieldTheory Layer 11; GlobalNumberFields Layer 9.

*Source:* [wiese04], §4, proof of Theorem 10, p. 131; Introduction, p. 125; [rt97], Introduction, p. 300.

<a id="r17-6-solvable-dihedral"></a>

### R17.6.6 Solvable characteristic-two images are dihedral

A continuous absolutely irreducible `r̄:G_ℚ→GL₂(F̄₂)` with solvable projective image has image `D_n`, n≥3 odd, projectively. Apply ArithmeticGaloisRepresentations Layer 4: PGL₂(F̄₂)≅SL₂(F̄₂); a nontrivial normal two-subgroup fixes a unique line, excluding Borel groups, V₄ and A₄, and odd cyclic groups are reducible. S₄ cannot embed, since its Sylow-two group is nonabelian whereas these two-subgroups are elementary abelian. A dihedral rotation subgroup has odd order. Determinant-untwist removes scalars and gives linear image `D_n`. This is an application of the existing classification. Characteristic-two determinant oddness does not ensure an odd complex lift.

The coefficient field is discrete, so continuity gives finite image. ArithmeticGaloisRepresentations Layer 4 supplies the characteristic-two finite-subgroup classification.
`solvable_characteristicTwo_projective_dihedral` states the algebraic conclusion
for any finite-image irreducible rank-two representation over an algebraically
closed field of characteristic two whose projective image is solvable: that image
is isomorphic to `DihedralGroup n` for odd n≥3.

**Checks.** The natural representation of GL₂(F₂) gives n=3. A cyclic projective
image over algebraically closed coefficients fails irreducibility. A finite scalar
twist preserves the dihedral projective image, although its linear image can
contain additional scalars.

*Needs:* ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 4; R17.6/determinant-untwist.

*Source:* [wiese04], Introduction, p. 123; [rt97], §2, first paragraph, p. 306; Introduction, p. 299. [ddt], Theorem 2.47(b), p. 81, supplies the finite-subgroup alternatives.

<a id="r17-6-teichmuller-conductor"></a>

### R17.6.7 Teichmüller lift and the four dyadic conductor cases

Let `r̄₀:G_Q→GL₂(F̄₂)` be irreducible with linear-dihedral image of order 2n, n odd ≥3. Then `r̄₀=Ind_{G_K}^{G_Q}φ` for the uniquely determined quadratic field K and a character `φ:G_K→F̄₂^×` of odd order. Let φ̃ be the unique complex character of `G_K` of the same order with φ̃≡φ modulo the fixed prime l|2 (the place λ), and ρ̃=Ind φ̃. For every σ the 1-eigenspaces of ρ̃(σ) and r̄₀(σ) have equal dimension: rotations have eigenvalues `φ̃(σ)^{±1}`, odd-order roots of unity on which reduction is injective; a reflection has complex eigenvalues 1,−1 and its residual image is a nontrivial unipotent involution, never semisimple. Every subgroup of `D_n` is cyclic or contains a nontrivial rotation, so the invariants of all ramification groups at odd primes agree and the prime-to-two Artin conductor of ρ̃ is N=N(r̄₀): `|D|·N_{K/Q}f(φ̃)=2^νN`, D=disc K. If 2 splits or ramifies in K then N f(φ̃) is odd; if 2 is inert it is odd or an odd multiple of 4. The four cases are: (i) D and N f(φ̃) odd, ν=0; (ii) D≡5 mod 8 (printed 'D≡±5 (mod 8)'; −5≡3 mod 8 is not a discriminant) and N f(φ̃)≡4 mod 8, ν=2; (iii) D≡4 mod 8 and N f(φ̃) odd, ν=2; (iv) D≡0 mod 8 and N f(φ̃) odd, ν=3. The exponent ν=3 belongs to case (iv).

Fix Q̄⊂ℂ and the prime l above two, with compatible residue embeddings. φ̃ is also viewed as an odd-order ray-class character; f(φ̃) is its finite conductor.

*Needs:* ArithmeticGaloisRepresentations §§3.1–3.6; ArithmeticGaloisRepresentations Layer 4; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; GlobalNumberFields Layer 9.

*Source:* [rt97], §2, first paragraph, p. 306; §2, second paragraph, p. 306; §2, second paragraph, list (i)–(iv), p. 306; §2, sentence after the list, p. 307.

<a id="r17-6-rt-technical-lemma"></a>

### R17.6.8 Rohrlich–Tunnell’s weight and level lemma

Fix λ|2 in Q̄⊂ℂ. Let `g=Σb(n)q^n∈Prim₁(2^νNr,χ)`, χ²=1, ν∈{0,2,3}, N odd and r=1 or an odd prime prime to N. Require `N=N(ρ_g)`, b(r)≢1 modλ if r≠1, b(n)=0 for even n if ν=2, and b(2)≢0 if ν=3. Then some normalized `f∈Prim_k(N)`, trivial character, has `ρ_f≅ρ_g`, with k=2 for ν=0,2 and k=4 for ν=3. The Fourier conditions are used by the proof; necessity is not claimed. RT Remark2 says Case2 formula(3) fails without the even-index vanishing. Import DS lifting and old/new theory unchanged.

`ρ_h` means the semisimple residual representation at the fixed place, with good-prime traces and determinants of h.

*Needs:* AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.5/deligne-serre-eigenvalue-lifting-lemma`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; ArithmeticGaloisRepresentations §§3.1–3.6; ArithmeticGaloisRepresentations Layer 5; R17.6/classical-conductor-comparison; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.6/residual-modularity-witness`; ModularForms Layer 4; ModularForms Layer 6; AlgebraicModularFormsAndSerreWeights R15.5A.3
[classical weight-one attachment](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-weight-one-attachment); AlgebraicModularFormsAndSerreWeights R15.5A.2
[classical higher-weight attachment](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-higher-weight-attachment).

*Source:* [rt97], §1, Lemma, p. 302; §1, p. 301; §1, proof of the Lemma, step (iii), p. 302; §1, preliminary remark, p. 302; §1, Case 2 (ν=2), p. 304.

<a id="r17-6-serre-odd-trick"></a>

### R17.6.9 The real-quadratic odd-lift trick

Let `r̄₀=Ind_{G_K}^{G_Q}φ`, φ̃, N and ν be as in teichmuller-conductor with K real quadratic (D>0) and D odd or divisible by 8; let ∞₁,∞₂ be the real places of K. There exist a prime ideal 𝔯 of K of degree one, prime to 2N, and a quadratic Hecke character ξ of K ramified precisely at ∞₁ and 𝔯, with φ̃(𝔯)≠1. Put r=N𝔯, an odd prime not dividing N and split in K, and `g=Σb(n)q^n` where `L(s,φ̃ξ)=Σb(n)n^{−s}`. Then Ind(φ̃ξ) is odd because ξ has mixed signature, its Artin conductor is `2^νN·r`, and `g∈Prim₁(2^νNr,χ)` with χ the product of the Kronecker symbol at D and the (odd) Legendre symbol at r. Since ξ≡1 mod l, `ρ_g≅r̄₀` and `N(ρ_g)=N`. Moreover `b(r)≡φ̃(𝔯′)=φ̃(𝔯)^{−1}≢1 mod l`, in case (ii) b(n)=0 for even n, and in case (iv) b(2)≢0 mod l. Thus g satisfies every hypothesis of rt-technical-lemma. This controlled auxiliary ramification is the Serre trick used by Rohrlich–Tunnell, distinct from Wiese's trace-zero choice of auxiliary primes.

Use degree-one primes in the specified narrow ray class modulo 4f(φ̃), by Chebotarev.

*Needs:* R17.6/teichmuller-conductor; R17.5/dihedral-artin; R17.5/q-weight-one; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; ArithmeticGaloisRepresentations §§3.1–3.6; R17.4/quadratic-induction; Chebotarev Layer 10; GlobalNumberFields Layer 9.

*Source:* [rt97], §2, proof of the Theorem, case D>0, p. 307; §2, construction of 𝔯 and ξ, p. 308; Remark 1, p. 308.

<a id="r17-6-rohrlich-tunnell"></a>

### R17.6.10 Rohrlich–Tunnell characteristic-two modularity

Fix Q̄⊂ℂ and λ|2. For continuous irreducible linear-dihedral `r̄₀:G_ℚ→GL₂(F̄₂)`, use its inducing field K, D=disc K, odd conductor N, Teichmüller induction and dyadic exponent ν. If D is odd or 8|D, construct a normalized newform f of exact level N, trivial character and weight k=2 for ν=0,2, or k=4 for ν=3, whose residual attachment is r̄₀. For D<0 induce the Teichmüller character; for D>0 use serre-odd-trick and the technical lemma to remove the auxiliary prime. Case D≡4 mod8 is outside this theorem; the authors give neither examples nor counterexamples. Projective-dihedral classes with nontrivial determinant require determinant-untwist and recomputed level/character.

*Needs:* R17.6/teichmuller-conductor; R17.6/serre-odd-trick; R17.6/rt-technical-lemma; R17.5/q-weight-one; R17.5/dihedral-artin; R17.4/quadratic-induction.

*Source:* [rt97], §2, Theorem, p. 307; §2, paragraph before the Theorem, p. 307; §2, proof, case D<0, p. 307; Remark 2, p. 308; Remark 3, p. 308.

<a id="r17-6-wiese-odd-lift"></a>

### R17.6.11 Odd characteristic-zero lifts of mod-two dihedral representations

Let `r̄=Ind_{G_K}^{G_ℚ}χ` over F̄₂, with K quadratic and `χ≠χ^σ`; its projective image is `D_n`, n≥3 odd. For m=|im r̄| and P|2 in `ℚ(ζ_m)`, construct an odd lift `r̂:G_ℚ→GL₂(ℤ[ζ_m])` reducing to r̄. Induce the same-order lift χ̃ when it is odd. Otherwise K is real and induce χ̃ξ, where ξ cuts out K(√λ)/K for `λ∈𝓞_K` of negative norm. This gives no conductor bound. If r̄ is unramified at2 with conductor N, either a lift has conductor N, or K is real and infinitely many odd ℓ∤N split in K with `tr r̄(Frob_ℓ)=0` admit lifts of conductor Nℓ. This covers projective-dihedral scalar twists as well as linear-dihedral images; determinant oddness in characteristic two is vacuous.

Embed `ℤ[ζ_m]/P` in F̄₂ compatibly with χ. N is the prime-to-two Artin conductor in the unramified refinement.

*Needs:* R17.4/quadratic-induction; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§3.1–3.6; ArithmeticGaloisRepresentations Layer 4; ClassFieldTheory Layer 11; GlobalNumberFields Layer 7; Chebotarev Layer 10.

*Source:* [wiese04], Lemma 2, p. 126; Lemma 2(b), p. 126; Lemma 3 and proof, p. 127; proof of Lemma 2, p. 127.

<a id="r17-6-katz-coprime-level-descent"></a>

### R17.6.11a Katz coprime-level descent

For coprime positive N,m, and a coefficient ring R containing `μ_Nm` with Nm invertible, prove
that a noncompactified Katz cusp form of weight k on Γ₁(Nm) is pulled back from Γ₁(N) iff
its value on each elliptic tuple is independent of the m-part of the level. Construct descent
and pullback, prove their uniqueness and equality of the standard q-expansions. Over `F̄_p`,
p∤Nm, an all-Hecke eigenform f with character from level N and independent of the m-part
of the level gives an all-Hecke eigenform at level N with the same good-prime eigensystem and
residual representation. Keep Corollary 8’s extra
eigenvector selection: the unique descended section need not itself be an eigenvector at
primes dividing m.

API: pullback is injective, independent-level descent is inverse to it, and operators away from
m commute with pullback. For distinct auxiliary primes l₁,l₂ prime to Np, embed the level
Nl₁³ and Nl₂³ forms with identical q-expansions at level Nl₁³l₂³. The q-expansion principle
identifies them; dependence on neither auxiliary level gives descent to N, followed by the
all-Hecke eigenvector selection. Characteristic-zero oldform operators and the killing of the
auxiliary eigenvalue use ModularForms Layers 3–4 before reduction.

**Checks.** m=1 gives identity descent; a section changing with the m-level fails the descent
hypothesis; two distinct auxiliary primes give the intersection at N, while one auxiliary
prime alone does not establish independence of its own level.
The normalized weight-two level-11 cusp form modulo 5 has trivial character from level 1,
but cannot descend to the zero space S₂(SL₂(ℤ),F̄₅); character descent and coprimality alone
do not imply independence of the auxiliary level.

*Needs:* ModularCurves Layer 5B (full-level representability), Layer 9A (prime-to-level quotient
problems) and Layer 0E (effective descent of sections and morphisms);
SchemeAndStackFoundations §1.1 (fpqc descent of quasi-coherent modules);
AlgebraicModularFormsAndSerreWeights R15.1–R15.2 (Katz sections and q-expansion principle),
R15.6 (recognition); ModularForms Layers 3–4 (oldforms).

*Source:* [wiese04], §3, Proposition 7, p.129, Corollary 8, p.130, and proof of Theorem 9,
p.131; Proposition 4 and Corollary 5, pp.128–129, for the oldform operators.

<a id="r17-6-unramified-katz"></a>

### R17.6.12 Unramified mod-two dihedral Katz weight one

For Wiese-dihedral `r̄:G_ℚ→GL₂(F̄₂)` unramified at2, odd conductor N and ε=detr̄, construct a normalized cusp Katz eigenform f∈S₁(Γ₁(N),ε,F̄₂) for all Hecke operators, with `ρ_f≅r̄` and good-prime trace/determinant matching. Exceptional local restrictions at2, including two equal unramified characters, are allowed. This does not assert a characteristic-zero weight-one lift of level N; Wiese states nonexistence for real quadratic discriminant N with norm−1 fundamental unit, for example ℚ(√229). Use ModularForms Layers 3–4’s characteristic-zero oldforms for Wiese Proposition 4 and Corollary 5, and R17.6/katz-coprime-level-descent for Proposition 7 and Corollary 8.

Katz forms use Wiese's non-compactified Γ₁(N) definition; N is invertible in F̄₂. Unramifiedness at two is equivalent to the minimal weight being one.

*Needs:* R17.6/katz-coprime-level-descent; ModularForms Layers 3–4; R17.6/wiese-odd-lift; R17.5/q-weight-one; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.1/hodge-bundle-with-tate-curve-normalization`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.1/cusp-ideal-section-forms`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.2/q-expansion-principle-and-its-vanishing-theorem`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.2`; R16.6; ArithmeticGaloisRepresentations Layer 5; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.2/integral-hecke-operators-from-q-expansions`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.6/modularity-formulations-and-determinant`.

*Source:* [wiese04], Theorem 9, p. 130; proof of Theorem 9, p. 131; Proposition 7, p. 129; Introduction, p. 124.

<a id="r17-6-qualitative-residual-modularity"></a>

### R17.6.13 Characteristic-two solvable residual modularity

Every continuous absolutely irreducible `r̄:G_ℚ→GL₂(F̄₂)` with solvable projective image is the semisimple reduction of a holomorphic cusp weight-one newform, after choosing coefficient field, λ|2, residue embedding and stable lattice. Apply solvable-dihedral, Wiese's odd lift and dihedral Artin automorphy. Its level is the chosen lift's Artin conductor and is not controlled in general. For a weight≥2 witness use AlgebraicModularFormsAndSerreWeights R15.5 Eisenstein multiplication on characteristic-zero reductions; for Katz input use Hasse multiplication together with the integral lifting criterion. Exact minimal weight, level and trivial character require the more restricted Rohrlich–Tunnell theorem.

*Needs:* R17.6/solvable-dihedral; R17.6/wiese-odd-lift; R17.5/q-weight-one; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.6/residual-modularity-witness`.

*Source:* [wiese04], proof of Theorem 1, p. 131; Introduction, p. 123; Lemma 3, p. 127.

<a id="r17-6-weight-two-witness"></a>

### R17.6.14 Transfer to the weight-at-least-two residual witness

From an odd characteristic-zero dihedral weight-one form reducing to r̄, or the unramified Katz form above, obtain an AlgebraicModularFormsAndSerreWeights R15.6 witness of weight k≥2 at its primitive level. Use AlgebraicModularFormsAndSerreWeights R15.5's E₄≡1 mod2 multiplication for characteristic-zero reductions. For Katz forms the weight-one Hasse invariant preserves q-expansion and the away-two eigencharacter; one factor gives weight two. Wiese's classicality input holds for N≥5, as here. To obtain a characteristic-zero eigenform, choose weight and auxiliary full level meeting AlgebraicModularFormsAndSerreWeights R15.5's H¹-vanishing/integral lifting criterion and AlgebraicModularFormsAndSerreWeights R15.2's base change; then apply the DS lemma over a dominating DVR and old/new reduction. Record coefficient field, λ|2, residue embeddings and stable lattice. The character lifts detr̄ and need not be its Teichmüller lift.

At an odd ℓ the factor `ℓ^(k−1)` is one modulo two, so the Hasse shift preserves that eigencharacter. Use the cusp-sheaf H¹ vanishing and integral character conditions in AlgebraicModularFormsAndSerreWeights R15.5.

*Needs:* R17.6/qualitative-residual-modularity; R17.6/unramified-katz; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.5/deligne-serre-eigenvalue-lifting-lemma`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.6/residual-modularity-witness`; ArithmeticGaloisRepresentations Layer 5; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`; AlgebraicModularFormsAndSerreWeights `AlgebraicModularFormsAndSerreWeights R15.6/modularity-formulations-and-determinant`; AlgebraicModularFormsAndSerreWeights R15.5A.2
[classical higher-weight attachment](../AlgebraicModularFormsAndSerreWeights/README.md#target-classical-higher-weight-attachment).

*Source:* [wiese04], Introduction, p. 124; proof of Lemma 11, p. 132.

<a id="r17-6-disjoint-irreducibility"></a>

### R17.6.15 Residual irreducibility under disjoint base change

For continuous absolutely irreducible `r̄:G_F→GL₂(k̄)` with finite projective image, let M be its projective-kernel field. Any finite E/F linearly disjoint from M preserves the projective image and absolute irreducibility. Disjointness from the linear-kernel field L⊃M also suffices. E need not be Galois or solvable; solvability alone is insufficient. The extension E and the stated linear disjointness are explicit hypotheses of the representation criterion.
The matrix statement `disjoint_irreducibility` preserves the projective range;
`disjoint_restriction_irreducible` gives the irreducibility conclusion in every
finite rank. For a homomorphism i:H→G its hypothesis is
`i(H) ker(Pρ)=G`. Every ρ(G)-action then differs from a restricted action by a
scalar, so the two representations have the same invariant subspaces.

**Checks.** Disjointness from the linear-kernel field implies the projective
hypothesis. A projective scalar in the linear image does not require disjointness
from that larger kernel field. Restricting a dihedral representation to its
rotation subgroup is reducible, showing that solvability of the extension alone
is insufficient.

*Needs:* ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 4.

*Source:* [langlands80], §2, p. 13; [wiese04], §2, p. 125.

<a id="r17-6-quadratic-restriction"></a>

### R17.6.16 The bad-dihedral quadratic restriction condition

For finite-image irreducible `r=Ind_{G_K}^{G_F}θ`, K/F quadratic, algebraically closed coefficients of any characteristic and finite E/F, `r|G_E` is irreducible iff K⊄E and `θ|G_EK≠θ^σ|G_EK`. If K⊂E it is a sum of characters. Otherwise Mackey restriction is `Ind_{G_EK}^{G_E}θ`; distinct character lines are swapped by the other coset, proving irreducibility. If they coincide, θ extends to `G_E` (choose a square root of its value on the coset representative's square), and Frobenius reciprocity gives a one-dimensional quotient. This proof works in characteristic two; the ordinary Mackey criterion requiring invertible group order does not. The same condition controls cuspidality of quadratic automorphic induction after base change.

θ is continuous of finite image and `θ≠θ^σ`. E/F need not be Galois. The characteristic-zero Mackey theorem requiring invertible group order cannot be used for the even-order characteristic-two case.

*Needs:* ArithmeticGaloisRepresentations Layer 4; R17.4/quadratic-induction; R17.4/cuspidality; RepresentationTheory/InductionRestriction Layer 3; Tau Ceti `TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

*Source:* [wiese04], §2, p. 125; [langlands80], §2, p. 13.

<a id="r17-6-compatible-base-change"></a>

### R17.6.17 Base change of a supplied compatible system

For a supplied continuous semisimple compatible family `{ρ_λ}` over F with common coefficient field and polynomials `P_v`, and a matching automorphic π, restriction to finite solvable Galois E/F matches `BC_{E/F}(π)` at good w|v. Roots α,β of `P_v` become `α^f,β^f`, f=f(w/v), since `Frob_w` maps to `Frob_v^f` and local character lifting is norm pullback. Require v unramified for π and `ρ_λ` and prime to the coefficient characteristic; v may ramify in E. Check cuspidality and residual irreducibility by their separate criteria. Family construction and integral realization stay with their owners.

Each `ρ_λ` is continuous and semisimple. The `P_v` lie in M[X] and are λ-independent. Since `q_w=q_v^f`, the half-power normalization also commutes with restriction. A good v may ramify in E.

*Needs:* R17.4/solvable-base-change; R17.4/local-compatibility; R17.6/disjoint-irreducibility; R17.6/quadratic-restriction; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 5.

*Source:* [langlands80], §2 local lifting, condition (i), p. 9; §2 after properties (A)–(F), p. 14; [ac89], Chapter 3 §1 before Definition 1.1, eq. (1.1), p. 199.

<a id="r17-6-compatible-descent"></a>

### R17.6.18 Automorphic descent with a consistent compatible-system twist

For prime-cyclic E/F of degree ℓ and invariant cusp Π, its descents are the distinct `π⊗η^i`,
0≤i<ℓ, where η generates the norm-kernel characters. Supply compatible families `{r_λ}` and
`{ρ_{π,λ}}` with common coefficient embeddings and λ-independent good-place polynomials,
over a common coefficient field containing `μ_ℓ` after a specified finite extension.
Here `η_λ` is the Galois character corresponding to automorphic twisting by η under the
arithmetic-dual convention.
Assume for every λ that `r_λ|G_E≅ρ_{π,λ}|G_E` and this common restriction is absolutely
irreducible. Schur's lemma gives `r_λ≅ρ_{π,λ}⊗η_λ^{i(λ)}`. A match at one λ identifies the
common good-place polynomials with those of one twist index i; recognition then gives that
same twist at every λ. Absolute irreducibility of the common restriction excludes a nontrivial
norm-kernel self-twist and proves uniqueness. Impose these hypotheses at each step of a
solvable tower; separate choices at different λ do not supply a matching automorphic descent.

API: `compatible_descent_twist` gives the finite quotient character and its twist isomorphism
from a specified matching irreducible restriction on a normal finite-index subgroup over
algebraically closed coefficients; coefficient embeddings transport η and the good polynomials;
a chosen match and recognition fix one index for the entire family.

**Checks.** Equal restrictions with index zero recover the original family; a fixed nonzero
index transports to every coefficient place; the weight-twelve level-one attachment and a
non-CM elliptic-curve attachment over a quadratic extension have absolutely irreducible
restrictions but determinants `χ_cyc¹¹` and `χ_cyc`, so they fail the matching-restriction input.

*Needs:* R17.4/cyclic-descent; R17.4/cyclic-descent-fibers; R17.4/solvable-descent; ArithmeticGaloisRepresentations Layer 5; ClassFieldTheory Layer 11.

*Source:* [ac89], Chapter 3 Theorem 4.2(d), p. 202; Chapter 3 Theorem 3.1, p. 201; [langlands80], §11 Lemma 11.6(b), p. 151; [bcgp21], proof of Lemma 8.3.2, p. 452.

<a id="r17-6-potential-modularity-interface"></a>

### R17.6.19 Transfer interface for potential modularity

For supplied solvable Galois E/F with prescribed completions/disjointness, continuous rank-two ρ with absolutely irreducible restriction, and a cusp Π matching `ρ|G_E` almost everywhere, export conditional descent along a prime-cyclic tower. Strong multiplicity one proves cyclic invariance at each matching step, hence gives a descent and its twist fibre. Selecting the twist requires compatible-descent's common-index condition and supplied Galois representations of intermediate descents. Local transfer is restriction at every completion. E/F, its local and disjointness conditions, the compatible family and the Galois representations of intermediate descents are explicit hypotheses; this interface constructs the indicated descent from them.

ρ is continuous and its restriction to `G_E` is absolutely irreducible. Check the common-index condition with the supplied representations of intermediate descents at each prime-cyclic step. Non-Galois extensions are excluded.

*Needs:* R17.4/prescribed-local-base-change; R17.6/disjoint-irreducibility; R17.6/compatible-base-change; R17.6/compatible-descent; R16.4.

*Source:* [ac89], Chapter 3 Theorem 4.2, p. 202; Chapter 3 Theorem 5.1, p. 212; [bcgp21], proof of Lemma 8.3.2, p. 452.

### Examples

In characteristic two a reflection has a one-dimensional fixed space despite its two characteristic-zero eigenvalues ±1 coalescing. The dyadic discriminant cases (iii) and (iv) give exponents two and three respectively. A ramified curve branch (a,d)=(2,3) uses n=2 and no extra nonreduced length factor; equal orders fail contraction. Different twists at different coefficient places do not define a consistent compatible descent.

### Dependencies

R16.3 and R16.6; R17.4–R17.5; ArithmeticGaloisRepresentations Layers 1–5; AlgebraicModularFormsAndSerreWeights R15.1–R15.6, including R15.5A.1–R15.5A.3; ModularForms Layers 0–8W; EtaleCohomologyFoundations §§0.6, 0.8, 0.11 and F.0–F.6; ClassicalAdicEtaleCohomology Layers 8–9; ComplexComparisonPartII §§C6.3–C6.6; LefschetzPencilsAndVanishingCycles LPV.0 and LPV.2; ClassFieldTheory Layer 11.


## Bibliography
[jl70]: https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf "H. Jacquet and R. P. Langlands, Automorphic forms on GL(2). LNM 114 (1970), IAS retypeset (2026)."
[jl70-ubc]: https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/jl-ps.pdf "Jacquet–Langlands1970, UBC author retypeset pagination."
[casselman73]: https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf "W. Casselman, On some results of Atkin and Lehner. Math. Ann. 201 (1973), 301–314."
[nt26]: https://arxiv.org/pdf/2212.03595v2 "Newton–Thorne, Symmetric power functoriality for Hilbert modular forms. Annals203 (2026); v2 pagination."
[dlb17]: https://arxiv.org/pdf/1509.00606v2 "Dospinescu–Le Bras, Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique. Annals186 (2017); v2 pagination."
[bz76]: https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf "Bernstein–Zelevinsky, Representations of GL(n,F), F nonarchimedean. Russian Math. Surveys31:3 (1976),1–68."
[bm02]: https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf "Breuil–Mézard, Multiplicités modulaires; Henniart appendix, Sur l’unicité des types pour GL₂. Duke115 (2002)."
[cdt99]: https://math.stanford.edu/~conrad/papers/cdtmaster.pdf "Conrad–Diamond–Taylor, Modularity of certain potentially Barsotti–Tate Galois representations. JAMS12 (1999)."
[cg18]: https://math.uchicago.edu/~fcale/papers/CG.pdf "Calegari–Geraghty, Modularity lifting beyond the Taylor–Wiles method. Inventiones (2018), author PDF."
[cg20]: https://par.nsf.gov/servlets/purl/10184292 "Calegari–Geraghty, Minimal modularity lifting for nonregular symplectic representations. Duke169 (2020),801–896."
[bcgp21]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf "Boxer–Calegari–Gee–Pilloni, Abelian surfaces over totally real fields are potentially modular. IHÉS (2021)."
[hkp10]: https://www.math.umd.edu/~tjh/IHA.apr.09.pdf "Haines–Kottwitz–Prasad, Iwahori–Hecke algebras. JRMS25 (2010); April 2009 author version."
[aky22]: https://arxiv.org/pdf/2110.09070v4 "Atobe–Kondo–Yasuda, Local newforms for general linear groups over a nonarchimedean local field. Forum Math. Pi (2022); v4 pagination."
[cdn20]: https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf "Colmez–Dospinescu–Nizioł, Cohomologie p-adique de la tour de Drinfeld: dimension1. JAMS33 (2020)."
[cdn23]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf "Colmez–Dospinescu–Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld. Forum Math. Pi (2023)."
[pan26]: https://arxiv.org/pdf/2209.06366 "Pan, On locally analytic vectors of completed cohomology of modular curves II. Annals203 (2026); arXiv2209.06366."
[converse]: https://people.math.osu.edu/cogdell.1/PSCT-www.pdf "Cogdell, Piatetski-Shapiro’s work on converse theorems (2013)."
[langlands80]: https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf "R. P. Langlands, Base change for GL(2). Annals Studies 96 (1980), author version."
[ac89]: https://www.claymath.org/library/cw/arthur/pdf/30.pdf "Arthur–Clozel, Simple algebras, base change, and the advanced theory of the trace formula. Annals Studies120 (1989), Clay scan."
[getz15]: https://sites.math.duke.edu/~jgetz/aut_reps.pdf "Getz, An introduction to automorphic representations (13 March 2015)."
[cogdell-fields]: https://people.math.osu.edu/cogdell.1/fields-www.pdf "Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n). Fields Institute author notes."
[jl70-global]: https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf "Jacquet–Langlands1970, IAS author scan pagination."
[br10]: https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf "Badulescu–Renard, Global Jacquet–Langlands. Compositio146 (2010),1115–1164; author pagination."
[gj78]: https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf "Gelbart–Jacquet, A relation between automorphic representations of GL(2) and GL(3). ASENS11 (1978),471–542."
[patrikis]: https://people.math.osu.edu/patrikis.1/variationsrevision.pdf "Patrikis, Variations on a theorem of Tate. Author revision31 July 2016, submitted memoir."
[carayol86]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf "Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert. ASENS19 (1986),409–468."
[rt97]: https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf "Rohrlich–Tunnell, An elementary case of Serre’s conjecture. Pacific J. Math.181 special issue (1997),299–309."
[wiese04]: https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf "G. Wiese, Dihedral Galois representations and Katz modular forms. Documenta Mathematica 9 (2004), 123–133."
[cdn20-global]: https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf "Colmez–Dospinescu–Nizioł2020, GPW5 author pagination."
[pan26-global]: https://arxiv.org/pdf/2209.06366v1 "Pan2026, arXiv2209.06366v1 pagination."
[rt83]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf "Rogawski–Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one. Inventiones74 (1983),1–42; GDZ scan."
[ds74]: https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf "Deligne–Serre, Formes modulaires de poids1. ASENS7 (1974),507–530."
[tunnell81]: https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf "Tunnell, Artin's conjecture for representations of octahedral type. Bull. AMS5 (1981),173–175."
[jpss79]: https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf "Jacquet–Piatetski-Shapiro–Shalika, Automorphic forms on GL(3),II. Annals109 (1979),213–258."
[tunnell78]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf "Tunnell, On the local Langlands conjecture for GL(2). Inventiones46 (1978),179–200; GDZ article scan."
[ddt]: https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf "Darmon–Diamond–Taylor, Fermat’s Last Theorem. International Press1997,2–140;9 September 2007 author version and theorem numbering."
[chevalley51]: https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en "Deux théorèmes d’arithmétique"
[cht08]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf "Automorphy for some l-adic lifts of automorphic mod l Galois representations"
[isaacs74]: https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf "I. M. Isaacs, Lifting Brauer characters of p-solvable groups, Pacific J. Math. 53 (1974), 171–188"
[webb16]: https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf "P. Webb, A Course in Finite Group Representation Theory, 23 February 2016"
[bh06]: https://doi.org/10.1007/3-540-31511-X "C. J. Bushnell and G. Henniart, The Local Langlands Conjecture for GL(2), Springer 2006"
[clozel86]: https://backend.production.deepblue-documents.lib.umich.edu/server/api/core/bitstreams/3f8e76bd-61fa-4e50-b374-9c7298d7e482/content "Clozel, On limit multiplicities of discrete series representations in spaces of automorphic forms. Inventiones83 (1986),265–284."
[mr00]: https://doi.org/10.4153/CJM-2000-008-9 "Mao–Rallis, Cubic Base Change for GL(2). Canadian J. Math.52 (2000),172–196."
[jy96]: https://www.math.columbia.edu/~hj/S0002-9947-96-01549-8.pdf "Jacquet–Ye, Distinguished representations and quadratic base change for GL(3). Trans. AMS348 (1996),913–939."
[ag11]: https://www.wisdom.weizmann.ac.il/~dimagur/SmoothTransfer.pdf "Aizenbud–Gourevitch, Smooth transfer of Kloosterman integrals (Archimedean case).1 June 2011 version,28pp."
[deligne69]: https://www.numdam.org/article/SB_1968-1969__11__139_0.pdf "Deligne, Formes modulaires et représentations ℓ-adiques. Bourbaki355 (1969),139–172."
[langlands73]: https://www.sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/antwerp-ps.pdf "Langlands, Modular Forms and ℓ-adic Representations, LNM349 (1973),361–500; retypeset pp.1–100."
[prr23]: https://doi.org/10.1017/9781139017756 "V. Platonov, A. Rapinchuk and I. Rapinchuk, Algebraic Groups and Number Theory, Volume I, second edition, Cambridge 2023."
[varshavsky05]: https://arxiv.org/pdf/math/0505564v2 "Y. Varshavsky, Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara, arXiv:math/0505564v2 (25 November 2005); v2 pagination."
[flm11]: https://annals.math.princeton.edu/wp-content/uploads/annals-v174-n1-p05-p.pdf "Finis–Lapid–Müller, On the spectral side of Arthur's trace formula—absolute convergence. Annals174 (2011),173–195."
[mw26]: https://arxiv.org/pdf/2607.18870v2 "Müller–Wakatsuki, On the absolute convergence of the spectral side of the twisted trace formula. arXiv2607.18870v2 (2026)."
[henniart83]: https://www.numdam.org/item/10.24033/msmf.295.pdf "Henniart, La conjecture de Langlands locale pour GL(3), Mém. SMF11–12 (1983)."
[henniart02]: https://smf.emath.fr/system/files/2017-08/smf_bull_130_587-602.pdf "Henniart, Une caractérisation de la correspondance de Langlands locale pour GL(n). BSMF130 (2002),587–602."
[deligne73]: https://publications.ias.edu/sites/default/files/Number20.pdf "Deligne, Les constantes des équations fonctionnelles des fonctions L. LNM349 (1973),501–597."

[artin-tate]: https://www.ams.org/books/chel/366/ "Artin–Tate, Class Field Theory, Chapter XV (Weil groups)."
[tate-global]: https://math.arizona.edu/~cais/Prelim/CFT/CaFroCFT.pdf "Tate, Global class field theory, §11.6 (Weil groups), in Cassels–Fröhlich."

[clozel90]: https://www.jmilne.org/math/Books/AA1988a.pdf "Clozel, Motifs et formes automorphes, Theorem 3.13, in Automorphic Forms, Shimura Varieties, and L-functions, vol.1 (1990), 77–159."

[fargues-scholze]: https://arxiv.org/pdf/2102.13459v4 "Fargues–Scholze, Geometrization of the local Langlands correspondence, arXiv:2102.13459v4 (2024)."
