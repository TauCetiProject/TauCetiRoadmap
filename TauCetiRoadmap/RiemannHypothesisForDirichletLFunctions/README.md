# Riemann hypothesis for Dirichlet L-functions

A family of roadmaps whose end theorem is the generalized Riemann hypothesis (GRH), that is, the
Riemann hypothesis for Dirichlet L-functions: for
every modulus `N ≥ 1`, every Dirichlet character `χ` modulo `N` and every `s` with `Re s > 1/2`,
`L(s, χ) ≠ 0` unless `χ` is principal and `s = 1`. For the trivial character this is the Riemann
hypothesis for the Riemann zeta function, Mathlib's `RiemannHypothesis`; through the factorisation
of the Dedekind zeta function of an abelian number field into Dirichlet L-functions, it is also the
Riemann hypothesis for the Dedekind zeta function of every number field abelian over `ℚ`. The last
roadmap of the family states these theorems. The results that the family states are those of the
formal Lean proof, by Levent Alpöge, of the Riemann hypothesis and of the Riemann hypothesis for
Dirichlet L-functions, announced on 20 November 2026 ([announcement](https://alpo.ge/remark.pdf);
[the Lean source as published](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005),
which is the first commit of a
[repository with a public verification setup](https://github.com/leanprover-community/riemann-hypothesis)).
That repository says of the proof that it belongs to its author and was published without a license,
and that it is mirrored there for verification only: unmodified at that first commit, and with the
changes listed in its notes since. The files the roadmaps of this family name are files of the
source as published, so they are to be looked up at that first commit, under its directory `src/`. The theorems of that proof are
the two statements for Dirichlet L-functions and for the Riemann zeta function; the statement for
Dedekind zeta functions, and the further consequences listed in the last roadmap, are drawn from
them by published theorems and are not statements of the formal proof. Each roadmap states as
targets what the proof establishes, in the generality in which the statement holds, with the
published theory it rests on, and says so where a route is not written out.

The route is analytic at both ends. For a positively weighted family of characters, a one-sided
bound for the weighted sum of the Riesz-smoothed prime sums of its members, less their main terms,
on windows `[Y, Y^λ]` at arbitrarily large scales `Y`, is equivalent to the Riemann hypothesis for
every member of the family: this is a windowed form of Landau's theorem. For the cyclic family of a
primitive Dirichlet character `ψ`, the primitive characters that induce the powers of `ψ`, such
window bounds follow from an inequality between prime sums restricted by Frobenius over an abelian
CM field and their main terms. That inequality is proved with chains of theta lifts between
definite unitary groups, through the slopes of lattices of automorphic forms along the chain, the
congruence modules of the lifts, and uniform bounds for wild kernels. The general roadmaps of the
family supply the theory on which the chain rests: analytic number theory of Riesz sums and
zero-free boxes, Hermitian lattices, slopes and metrics, theta kernels and local factors, Galois
representations and Selmer groups, and integral models of unitary Shimura varieties.

Each subdirectory is a roadmap of its own, with a definitive `README.md` and a `Suggested.lean` of
target signatures; this page is the index of the family. The roadmaps are listed in merge order:
within the family, each roadmap cites only roadmaps listed above it. Citations between the roadmaps
are by section number, `<Roadmap> §k.n`, so the number of a section is part of its statement: a
section keeps its number.

## When a roadmap is wrong

The purpose of this family is to bring the mathematics of the formal Lean proof into Tau Ceti as
library mathematics. That does not mean copying the formal proof. The roadmaps are the plan and they
are followed, as in any other area. A contribution is free, as everywhere in Tau Ceti, to state a
result in greater generality, to arrange it differently and to prove it by another route.

The roadmaps were written from the formal proof, and they may contain mistakes. This section is
about one situation only: a roadmap of this family is demonstrably wrong at some point, in its
`README.md` or its `Suggested.lean` (a statement is false or inconsistent as written, a hypothesis
or a convention does not fit, or a step that the argument needs is missing), and the formal proof
shows what is right.

For those who write and those who review pull requests that carry out these roadmaps:

- In that situation a contribution may correct the statement, or supply the missing step, in a
  form consistent with the formal proof. Its description says what is wrong with the roadmap (the
  reason, or a counterexample) and names the file and declaration of the formal proof that settles
  it. The corrected statement may still be more general than the one in the formal proof.
- A review does not block or delay such a contribution on the ground that it departs from the
  roadmap, or that it proves something the roadmap does not list. What it checks is that the roadmap
  is indeed wrong or incomplete at that point, that the correction agrees with the formal proof
  there (the declaration named exists in the source as published and supports it), and the usual
  standards of the library.
- The roadmap is then corrected. The correction may follow the contribution; it need not come
  first.

This is not a licence to replace a roadmap's statement by the formal proof's wherever the two
differ in form: where the roadmap is right, it is followed. It does not cover a departure that
agrees with neither the roadmap nor the formal proof, and it does not change the roadmaps of other
areas that this family cites.

## The roadmaps

- [**Tensor induction and finite-group inputs**](TensorInductionAndFiniteGroupInputs/README.md):
  tensor induction in prime index, virtual characters of norm one on a coset, the decomposition of
  polynomial functions on matrices under two general linear groups, and identities of minors of the
  Capelli matrix.
- [**Positivity of Dirichlet series with kernels**](PositivityOfDirichletSeriesWithKernels/README.md):
  positivity arguments for Laplace transforms and Dirichlet series with kernels, a windowed form of
  Landau's theorem, Laplace's method with non-vanishing, and stationary phase over the complex
  numbers and over products of p-adic fields.
- [**Statements of the Riemann hypotheses and their consequences**](RiemannHypothesisStatementsAndConsequences/README.md):
  Riesz sums and explicit formulas, the Riemann-hypothesis predicates for Dirichlet characters,
  Dedekind zeta functions and ray-class characters, and their consequences.
- [**Riesz sums over primes and exceptional zeros**](RieszSumsOverPrimesAndExceptionalZeros/README.md):
  Riesz-smoothed sums over primes, exceptional zeros and zero-density boxes, and class numbers.
- [**Quadratic twists selected over primes**](QuadraticTwistSelectionOverPrimes/README.md):
  quadratic twists over primes in a progression, and the selection of auxiliary primes with
  zero-free boxes.
- [**Frobenius-restricted Riesz sums**](FrobeniusRestrictedRieszSums/README.md):
  abelian CM hosts and their Frobenius data, cyclic hosts and the cyclic family of a primitive
  Dirichlet character, tops, thick sets and admissible pairs; Riesz sums restricted by Frobenius,
  and the equivalence of the averaged inequality on a host with the window bound for the cyclic
  family.
- [**Adelic heights and successive minima**](AdelicHeightsAndSuccessiveMinima/README.md):
  adelic heights of vectors and subspaces for an adelic presentation, with their duality and
  behaviour under extension, and successive minima over number fields for balanced bodies.
- [**Orbit measures on adelic groups**](OrbitMeasuresOnAdelicGroups/README.md):
  measures of top forms over local fields and Tamagawa measures on homogeneous spaces of adelic
  groups, the Tamagawa numbers of `G_m`, of groups with a unipotent radical and of quotients by
  central induced tori, and centralisers of semisimple elements.
- [**Hodge–Tate lattices and Lubin–Tate logarithms**](HodgeTateLatticesAndLubinTateLogarithms/README.md):
  Hodge–Tate lattices and flag sequences with explicit cokernel bounds, and logarithms of Lubin–Tate
  formal group laws with sharp radii.
- [**Wach lattices over the cyclotomic tower**](WachLatticesOverTheCyclotomicTower/README.md):
  Wach lattices and crystalline lattices over the cyclotomic tower, with explicit exponents.
- [**Selmer length bounds and local lifting**](SelmerLengthBoundsAndLocalLifting/README.md):
  Selmer complexes in families, length bounds, local theorems at the places above the prime with
  explicit constants, and lifting with loss.
- [**Length bounds in p-adic families**](LengthBoundsInPadicFamilies/README.md):
  length bounds and eigensystems in `p`-adic families.
- [**Reducibility ideals and ultrafilter patching**](ReducibilityIdealsAndUltrafilterPatching/README.md):
  the order of an element on a module over a discrete valuation ring, graded cotangent bounds at
  smooth points, determinantal presentations and their reducibility ideals, and patching with an
  ultrafilter up to an element.
- [**Multiplier ideals of pairs and point separation**](MultiplierIdealsOfPairsAndPointSeparation/README.md):
  discrepancies and klt and lc pairs, multiplier ideals of pairs, Nadel vanishing for pairs,
  isolated non-klt centres, global generation and separation of points for adjoint bundles, Kollár's
  two-point separation, and statements on common zeros of sections of a birational linear system.
- [**Singular Hermitian metrics and L² methods**](SingularHermitianMetricsAndL2Methods/README.md):
  plurisubharmonic functions and Lelong numbers, singular Hermitian metrics, L² estimates and the
  Ohsawa–Takegoshi extension theorem, good metrics along a boundary, multiplier ideals,
  regularisation, and Bergman kernels.
- [**Discrete series coefficients and automorphic metrics**](DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md):
  matrix coefficients of discrete series, Poincaré series and trace-class statements, and invariant
  metrics on automorphic bundles with proportionality.
- [**Hermitian forms and lattices**](HermitianFormsAndLattices/README.md):
  unitary groups and Hermitian forms over quadratic étale algebras with their local and global
  classification; Hermitian lattices, genera and masses, Siegel's main theorem, and Hermitian theta
  series.
- [**Local factors of twists and types**](LocalFactorsOfTwistsAndTypes/README.md):
  local factors and epsilon factors of twists, converse theorems, and smooth representations with
  their types.
- [**Finite reductive groups and the characters of `GL_n(𝔽_q)`**](FiniteReductiveGroups/README.md):
  Harish-Chandra induction and Deligne–Lusztig theory for the groups of rational points of connected
  reductive groups over finite fields, the characters of `GL_n(𝔽_q)`, and Shintani descent for
  `GL_n` in prime degree.
- [**Base change and Galois representations for unitary groups**](BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md):
  base change and inertial types of depth-zero representations, and the Galois representations
  attached to automorphic representations of unitary groups.
- [**Hecke ideals and Taylor–Wiles relations**](HeckeIdealsAndTaylorWilesRelations/README.md):
  Taylor–Wiles relations, Hecke ideals and their stability, and Tate–Shafarevich kernels with
  lattice coefficients.
- [**Bernoulli bounds for class group eigenspaces**](BernoulliBoundsForClassGroupEigenspaces/README.md):
  twisted Tate–Shafarevich groups and their bounds by generalized Bernoulli numbers and by explicit
  torsion bounds for the homology of general linear groups over rings of integers, for étale
  cohomology and for K-groups, and the vanishing of Bloch–Kato groups.
- [**Theta kernels for unitary dual pairs**](ThetaKernelsForUnitaryDualPairs/README.md):
  the Weil representation, splittings and theta kernels for unitary dual pairs, the local theta
  correspondence, convergence and unfolding.
- [**Slopes of Hermitian vector bundles**](SlopesOfHermitianVectorBundles/README.md):
  degrees, maximal and minimal slopes and the Harder–Narasimhan filtration of Hermitian vector
  bundles over rings of integers, Bost's slope inequality, the comparison of slopes with successive
  minima, and a slope inequality for families of maps whose images form a nearly tight frame at one
  archimedean place; also the maximal slopes of lattices of sections of an ample line bundle and an
  explicit arithmetic Hilbert–Samuel inequality.
- [**Chow forms and heights of subvarieties**](ChowFormsAndHeightsOfSubvarieties/README.md):
  the change of metric in arithmetic intersection numbers, the comparison of the Fubini–Study height
  of a projective cycle with the spherical height of its Chow form, and heights of cycles in the
  projective space of a Hermitian vector bundle.
- [**Heights for log-singular metrics**](HeightsForLogSingularMetrics/README.md):
  heights for log-singular metrics, heights on projective spaces and flag varieties, and slopes of
  Lie algebras of abelian schemes.
- [**Projective models and period bounds on Shimura varieties**](ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/README.md):
  seminegativity of Hodge bundles over curves with a growth bound, logarithmic periods over a
  polydisc, conjugate data on a curve and their extension over global models, ampleness of twisted
  Hodge lines, global normal projective models of PEL type with their cubical line bundle, and the
  descent of a linearised line bundle to a quotient by a finite group.
- [**Integral Weyl modules of general linear groups**](IntegralWeylModulesOfGeneralLinearGroups/README.md):
  the integral theory of `GL_N`: the bideterminant basis of the integral dual Weyl module with
  saturation, Weyl and dual Weyl modules below the upper wall of the lowest alcove, the exponent
  comparing their integral forms, integral branching to `GL_{N−1}`, the linkage principle in
  multiset form and a graded Pieri bound, Fischer norms of products of minors, and slopes of Weyl
  and dual Weyl lattices.
- [**Theta lifts for definite unitary groups**](ThetaLiftsForDefiniteUnitaryGroups/README.md):
  one theta lift between definite unitary groups: Weil representations, lifts as operators on class
  sets, weights and Satake parameters, the Rallis inner product formula, nonvanishing, the lift of
  the trivial representation, and complementary spaces.
- [**Theta chains on definite unitary groups**](ThetaChainsOnDefiniteUnitaryGroups/README.md):
  the data of a chain of theta lifts (ranks, scales and size conditions, Hermitian spaces, weights
  and words, Hecke, twisting and splitting characters, the coefficient field, type, auxiliary and
  level primes, level structures and integral forms); the normal form of a step, the chain lift, the
  operators at the level prime, the source lattices and the top period.
- [**Taylor bounds and depths on height-two formal groups**](TaylorBoundsAndDepthsOnHeightTwoFormalGroups/README.md):
  Gauss norms of power series and quantisation, the biextension cocycle with its weight and
  classification, weighted Taylor bounds in several variables, jet bounds and Gaussian jets; the
  depth of a weight from character flags, and the row datum of an integral chart.
- [**Local gain of theta chains**](LocalGainOfThetaChains/README.md):
  the gain of a step and of the chain lift at a prime inert in the CM field; the local model of the
  Hecke operators, Hecke commutation and refinement, the depth of Hecke images; the gain sublattice,
  the operators at the level prime and the gain inequality.
- [**The row tower and Rallis identities**](RowTowerAndRallisIdentities/README.md):
  rows, the row step and its descent, target rows, Rallis steps and model lifts, the rational
  structure of the grid with its determinant identities, multiplicity comparison and the
  surjectivity of the descent.
- [**Bessel–Poincaré series and Gram bounds**](BesselPoincareSeriesAndGramBounds/README.md):
  Bessel models of discrete series of `U(p, q)`, Bessel–Poincaré series and their expansion, limit
  multiplicity with a uniform error, local kernels, archimedean Gram forms and the tower inequality,
  and their instances for the chain.
- [**The seesaw for theta chains**](SeesawForThetaChains/README.md):
  periods of unitary pairs (unfolding of Fourier–Jacobi periods and the passage between Bessel and
  Fourier–Jacobi periods); the period pairing of the chain, its unfolding, the local laws, the
  seesaw identity and its rationality.
- [**Uniform wild kernel bounds**](UniformWildKernelBounds/README.md):
  bounds, uniform in the field, for the logarithmic total of the groups `Ш¹(F, ℓ, e)` over families
  of host fields, with the windowed form consumed by the congruence modules.
- [**Congruence modules of theta lifts**](CongruenceModulesOfThetaLifts/README.md):
  congruence lengths of a step, Hecke–Galois families on definite unitary groups, lifted
  eigensystems and the local condition at `ℓ`, the congruence module bounded by a Selmer group,
  class groups, wild kernels and local defects, good twists, the total congruence bound, and weight
  elimination modulo `ℓ`.
- [**Arithmetic volumes and integral forms on unitary Shimura varieties**](ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md):
  CM periods and values (the class-mean Chowla–Selberg statement, denominators of CM values, toric
  ratios and Hecke's toric sums); the flat line and slopes under change of weight; arithmetic
  proportionality for flag bundles and the average volume; lattices of forms on deep covers, their
  slopes, and the generation of integral forms by theta series.
- [**The glued target and the division inequality**](GluedTargetAndDivisionInequality/README.md):
  the pairing integral, the divided source and the target glued place by place; heights along the
  chain, the step operator norm, the transported mean CM period, the Rallis eigenvalue and hook
  bound; the theta conditions, the depth table, the slope of the target, the division inequality and
  the cost of the type primes.
- [**Theta chains and Frobenius prime sums**](ThetaChainsAndFrobeniusPrimeSums/README.md):
  slopes of the source lattices, rank matching, the word code and the slope inequality of the chain;
  chain data, the loss bound, the key identity, the Frobenius-restricted inequality and its budget,
  and the windowed bound for the cyclic family of every primitive Dirichlet character.
- [**The generalized Riemann hypothesis from window bounds**](GeneralizedRiemannHypothesisFromWindowBounds/README.md):
  weighted families of characters and their Riesz remainders, Landau's theorem for families and its
  windowed form, window bounds as a form of the generalized Riemann hypothesis, cyclic families, and
  the Riemann hypothesis for Dirichlet L-functions in its standard forms, with the forms it gives of
  conditional theorems of other roadmaps.
