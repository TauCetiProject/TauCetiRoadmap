# Roadmap: Hochschild homology and the Hochschild–Kostant–Rosenberg theorem

**Summary.** Build the classical, ungraded Hochschild theory of an associative unital algebra
`A` over a commutative ring `k`, with coefficients in an arbitrary `A`-bimodule `M`, on Mathlib's
homological-complex carriers, and prove the cohomological Hochschild–Kostant–Rosenberg theorem.
The chain complex `C_•(A,M)` and the cochain complex `C^•(A,M)` are built as the alternating
(co)face complexes of a simplicial and a cosimplicial `k`-module, so that Mathlib's Dold–Kan
normalisation gives the normalisation theorem over every `k`. The low degrees are identified
(`HH_0 = M/[A,M]`, `HH^0 = M^A`, `HH^1 = Der/Inn`, `HH_1(R,R) = Ω¹_{R/k}` for commutative `R`,
and `HH²` as the classes of `k`-split square-zero extensions); the bar resolution identifies
`HH^n(A,M)`, for `k`-projective `A`, with Mathlib's `Ext^n` over the enveloping algebra
`Aᵉ = A ⊗_k Aᵐᵒᵖ`, and `HH_n(A,M)`, for `k`-flat `A`, with `Tor_n^{Aᵉ}(M,A)`. The cup product makes
`HH^•(A,A)` a graded `k`-algebra, equal up to sign to the Yoneda algebra. For `A` in degree zero,
an explicit sign dictionary identifies `C^•(A,A)` with the Hochschild cochains of DGAInfinity
Layer 8, and signs `ν_n` determined by Layer 8's chain differential identify `C_•(A,A)` with its
Hochschild chains; Gerstenhaber's homotopy formula, proved on the classical complex, gives graded
commutativity, and the antisymmetrisation map of RefinedTraceMethods §1.9 acts on the classical
complex. The end
theorems are: for `R` smooth and projective over an arbitrary commutative ring `k`, the map
`D₁ ∧ ⋯ ∧ D_n ↦ [D₁ ∪ ⋯ ∪ D_n]` is an isomorphism of graded `R`-algebras
`⋀^•_R Der_k(R) ≅ HH^•(R,R)`, equal to the duality isomorphism
`HH^n(R,R) ≅ Hom_R(Ω^n_{R/k}, R)`; the determinant cocycle `⟨D₁,…,D_n⟩` represents `n!` times
this class, so the normalised HKR map `(1/n!)⟨…⟩`, defined when `n!` is invertible in `k`,
realises the isomorphism; and for polynomial algebras over every `k` the Koszul resolution gives both
`HH_•` and `HH^•` with explicit bases, independently of any smoothness input.

## Scope and ownership

This roadmap owns:

- the ungraded Hochschild simplicial module, the cosimplicial module (its codegeneracies and
  its packaging over the pinned bimodule cofaces), chain complex `C_•(A,M)`, cochain complex
  `C^•(A,M)`, Hochschild homology and cohomology with arbitrary bimodule coefficients, their
  functoriality in `M` and in `A`, and the long exact sequences in `M` (Layer 1); the
  `R`-linear structure of these complexes for a commutative algebra `R` (§1.5);
- the normalised chain and cochain complexes and the normalisation theorem over every
  commutative `k` (Layer 2);
- the low-degree identifications: `HH₀`, `HH⁰`, the submodules of bimodule derivations (the maps
  underlying `TauCeti.BimoduleDerivation`) and of inner derivations with their comparison with
  cocycles, coboundaries and `HH¹`, `HH₁` of a commutative algebra, the twisted square-zero
  extension of a 2-cochain and the classification of `k`-split square-zero extensions by `HH²`
  (Layer 3);
- the bar resolution over `Aᵉ`, the identification of `HH^n` with Mathlib's `Ext`, the
  construction of `Tor` over `Aᵉ` with its computation by flat resolutions, and `HH_n ≅ Tor_n`
  (Layer 4);
- the cup product on `C^•(A,A)`, the Leibniz rule, the graded algebra `HH^•(A,A)`, the
  computation of Yoneda products from cocycles on projective resolutions and the comparison of the
  cup product with the Yoneda product (Layer 5);
- the comparison between the ungraded complexes and DGAInfinity Layer 8's Hochschild cochains
  (with an explicit sign dictionary) and chains (with the signs `ν_n` of §6.3) for an algebra in
  degree zero, Gerstenhaber's homotopy formula and graded commutativity of `HH^•(A,A)`, and the
  description of the antisymmetrisation and projection maps of RefinedTraceMethods §1.9 on the
  classical complex (Layer 6);
- the duality between cochains and chains of a commutative algebra, the bijectivity of the
  evaluation pairing below the first non-projective Hochschild homology group, the identification of
  `exteriorPower.pairingDual` on a finite projective module with the exterior-bidual evaluation
  of EulerSystemsAndKolyvaginSystems §6.1, polyvector fields `T^n_{R/k} = ⋀^n_R Der_k(R)`, the
  determinant cocycle, the unnormalised and normalised HKR maps, the canonical HKR map and the
  cohomological HKR theorem (Layer 7);
- the polynomial case through the Koszul bimodule resolution (Layer 8).

It leaves to other roadmaps, by section:

- **DGAInfinity** Layers 0–1: the signed graded multilinear calculus, suspension, brace
  operations with their Koszul signs, and DG algebras. Layer 8: Hochschild chains and cochains of
  DG and `A∞` algebras and categories, their normalised versions for strict units, the cup
  product, braces, the Gerstenhaber bracket, the Hochschild differential `[m,−]`, invariance
  under quasi-equivalence and Morita equivalence, and the deformation reading of `HH²` and `HH³`
  for formal deformations. This roadmap imports the bracket and the braces through §6.1 and plans
  none of them again.
- **KTheoryFiniteLocalFields** §4.0 (Cyclic homology foundations): the derived Hochschild chains of
  ordinary algebras built on DGAInfinity Layer 8, the cyclic structure, cyclic, negative cyclic
  and periodic homology, the SBI sequence and the smooth HKR comparison
  `HH_n(A/k) ≅ Ω^n_{A/k}` in homology.
- **RefinedTraceMethods** §1.9: the antisymmetrisation `ε_n : Ω^n_{A/k} → HH_n(A/k)`, the
  projection `π_n`, the identity `π_n ε_n = n!`, the multiplicativity of `ε` and the isomorphism
  `ε₁`; the identity `B ∘ ε_n = ε_{n+1} ∘ d` with Connes' operator. §1.10: the derived HKR
  filtration and Hochschild homology over non-flat bases.
- **DerivedModuleAlgebra** §0.K.1: the Koszul complex of a finite sequence in a commutative ring
  and its acyclicity for weakly regular sequences. §0.5: square-zero extensions of a commutative
  algebra by a module through commutative rings, their isomorphism classes `Exal` with the Baer
  sum, the split trivial extension, and the bijection between derivations and sections of the
  trivial extension.
- **EulerSystemsAndKolyvaginSystems** §6.1: the theorem that the exterior-bidual evaluation
  `⋀^r_R X → Hom_R(⋀^r_R Hom_R(X,R), R)` is an isomorphism for every finite projective module `X`
  over a commutative ring `R`; its carrier, the exterior bidual and its evaluation, is
  IntegralIwasawaTheory §12.6's.
- **DerivedDeRhamCohomology** Layer 2: the algebraic de Rham complex, its wedge product and
  differential. No statement here uses the de Rham differential.
- **NoncommutativeGeometry** N1: scalar-valued and continuous cyclic cochains of complex
  algebras. **BanachAlgebras** Layer 6: bounded Hochschild cohomology of Banach algebras and
  Banach square-zero extensions. **LanglandsParameterStacks** §1.17: the map from
  `H¹(L^∨)` to `HH²` and the action of Hochschild cohomology on self-Ext of complexes.
  **ZigzagPreprojective** Layer 7: bigraded Hochschild cohomology of zigzag and Ginzburg DG
  algebras.

Topological Hochschild homology, the HKR filtration on derived Hochschild homology, Kontsevich
formality, deformation quantisation and the Schouten–Nijenhuis bracket are not part of this
roadmap.

Already in the pinned libraries, and cited rather than planned: Mathlib's `Derivation` (for
commutative algebras), `KaehlerDifferential` with `KaehlerDifferential.linearMapEquivDerivation`,
`ExteriorAlgebra.exteriorPower` with `exteriorPower.pairingDual` and its bijectivity for finite
free modules, `exteriorPower.instFinite`, `Algebra.Smooth`, `Abelian.Ext` with its computation
from projective resolutions, `Functor.leftDerived`, the Dold–Kan normalisation of simplicial
objects, `TrivSqZeroExt`, the lifts along a square-zero ideal of a commutative ring and their
correspondence with derivations (`derivationToSquareZeroEquivLift`), the algebra `A` as a module
over `A ⊗[k] Aᵐᵒᵖ` (`instModuleTensorProductMop`); Tau Ceti's commutative square-zero extensions
`TauCeti.SquareZeroExtension` with their morphisms `TauCeti.SquareZeroExtension.Hom`, splittings
`TauCeti.SquareZeroExtension.Splitting` and isomorphism classes `TauCeti.Exal` (the objects of
DerivedModuleAlgebra §0.5), with the criterion that the class vanishes exactly for split extensions
(`TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff`), its weak regularity of distinct
polynomial variables over every commutative ring (`MvPolynomial.isWeaklyRegular_map_X`), its Koszul
complex `TauCeti.koszulComplex` (the formalisation of DerivedModuleAlgebra §0.K.1) with the zeroth
homology of a finite sequence (`TauCeti.koszulComplex.homologyZeroEquivSpan`) and acyclicity for
weakly regular sequences (`TauCeti.koszulComplex.exactAt_of_isWeaklyRegular`),
`TauCeti.BalancedTensorProduct`, the restrictions of a module over `A ⊗[k] B` to its two factors
(`TauCeti.Algebra.TensorProduct.moduleLeft` and `TauCeti.Algebra.TensorProduct.moduleRight`, with
`TauCeti.Algebra.TensorProduct.moduleSMulCommClass`,
`TauCeti.Algebra.TensorProduct.moduleLeftIsScalarTower` and
`TauCeti.Algebra.TensorProduct.moduleRightIsScalarTower`) and the linearity criterion
`TauCeti.Algebra.TensorProduct.linearMapOfFactors`, the algebra `A` as an instance-carrying
`B ⊗[k] Aᵐᵒᵖ`-module along an algebra map `B → A` (`TauCeti.Bimodule` with
`TauCeti.Bimodule.smul_of`), the Kronecker map
(`TauCeti.ChainComplex.kronecker`) and its bijectivity in degree `n` for a complex of projectives
indexed by `ℕ` whose homology is projective below `n`
(`TauCeti.ChainComplex.kronecker_bijective_of_projective_homology_lt`, and
`TauCeti.ChainComplex.kronecker_bijective_of_projective_homology` in every degree when all
homology is projective), `TauCeti.derivationLieAlgebra`
with `TauCeti.innerDerivation`, the projectivity of exterior powers of projective modules
(`exteriorPower.instProjective`), the bimodule cofaces `TauCeti.hochschildBimoduleCoface` with
their coface identities, the Hochschild coboundary `TauCeti.hochschildBimoduleCoboundary` with
arbitrary bimodule coefficients, its square-zero law and its characterisations of the
degree-zero cocycles (central elements) and degree-one cocycles (derivations), the bimodule
derivations `TauCeti.BimoduleDerivation`, and the suspended Hochschild cochains of positive
arity of an `A∞` algebra: the brace `TauCeti.ReducedTensorWords.brace` and the Gerstenhaber bracket
`TauCeti.ReducedTensorWords.gerstenhaberBracket` with their pre-Lie, antisymmetry and Jacobi
identities, the Hochschild differential `TauCeti.AInfinityAlgebra.hochschildDifferential` with
its Leibniz rule for the bracket, the cochain complex
`TauCeti.AInfinityAlgebra.PositiveHochschild.complex`, its cohomology
`TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology` with the bracket
`TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket`, and the normalised cochains
`TauCeti.AInfinityAlgebra.PositiveHochschild.normalizedCochains` for a strict unit. The pinned
suspended complex does not include cochains of arity zero (so neither `HH⁰` nor the quotient of
the derivations by the inner ones), the cup product and the multiple brace `m{F,G}`, or
Hochschild chains; these are imported from DGAInfinity Layer 8 by section, and Layer 6 compares
both with the classical complexes.

Variants kept here, each differing in one stated respect from an existing object:

- the ungraded complexes differ from DGAInfinity Layer 8's by allowing an arbitrary bimodule of
  coefficients and by living in Mathlib's `HomologicalComplex` of `ModuleCat k`, where `Ext`, `Tor`
  and the HKR comparison are stated;
- the cochain complex of §1.2 differs from Tau Ceti's bare coboundary
  `TauCeti.hochschildBimoduleCoboundary` by being a cosimplicial object of `ModuleCat k` with
  codegeneracies, which the normalisation of Layer 2 needs, and from
  `TauCeti.hochschildCochainComplex`, whose degree-`n` cochains take `n + 1` arguments with values
  in a `k`-module `M` and whose cohomology `TauCeti.hochschildCohomology` (with the cocycles
  `TauCeti.hochschildCocycles`, the coboundaries `TauCeti.hochschildCoboundaries` and the class map
  `TauCeti.hochschildCohomology.mk`) is `HH^n(A, Hom_k(A,M))`
  (`TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`), not `HH^n(A,M)`;
- the normalised chains of §2.1 differ from `TauCeti.normalizedHochschildChains` by allowing an
  arbitrary bimodule of coefficients and by their comparison with the unnormalised complex; for
  `M = A`, §2.1 identifies the two complexes, terms and boundaries, under
  `A ⊗[k] A^{⊗n} ≅ ⨂[k]^{n+1} A`; NoncommutativeGeometry N1.Cyclic constructs, for a unital
  complex algebra, the normalised form quotient `A ⊗ (A/ℂ·1)^{⊗n}` and its comparison with the
  pinned normalised chains, the case `k = ℂ`, `M = A` of §2.1's identifications
  `N_n(A,A) ≅ A ⊗[k] Ā^{⊗n}` and `N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`,
  and keeps that statement; §2.1 states both over every commutative `k`;
- the normalised cochains of §2.2 differ from `TauCeti.normalizedHochschildCochains`, its complex
  `TauCeti.normalizedHochschildCochainComplex` and the inclusion
  `TauCeti.normalizedHochschildCochainComplexι` by allowing an arbitrary bimodule of coefficients
  and by their homotopy equivalence with the full complex: the pinned cochains take `n + 1`
  arguments with values in a `k`-module `N`, and §2.2 identifies them, under currying of the first
  argument (`TauCeti.multilinearCurryFirstEquiv`), with the normalised cochains with coefficients
  in the dual bimodule `A →ₗ[k] N`, and states that the pinned inclusion is a homotopy equivalence
  over every `k` (`exists_homotopyEquiv_normalizedHochschildCochainComplexι`);
  NoncommutativeGeometry N1.Cyclic compares the normalised and
  full scalar cochains of a unital complex algebra on cohomology for its cyclic theory, the case
  `k = N = ℂ`, and keeps that statement;
- the normalisation theorem of Layer 2 is for ordinary algebras with arbitrary bimodule
  coefficients, where DGAInfinity Layer 8's is for strictly unital DG algebras with coefficients
  in the algebra;
- the `HH²` classification of §3.6 is for an arbitrary bimodule without a deformation parameter,
  where DGAInfinity Layer 8 reads `HH²(A,A)` as infinitesimal deformations and BanachAlgebras
  Layer 6 classifies bounded extensions of Banach algebras; DerivedModuleAlgebra §0.5, which
  Tau Ceti has at the pin as `TauCeti.SquareZeroExtension k R M` and `TauCeti.Exal k R M`, takes
  the extensions of a commutative `R` by an `R`-module through commutative rings, with no
  `k`-linear section required, and keeps them; Tau Ceti's
  `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` proves that the class vanishes exactly
  for split extensions; §3.6 allows noncommutative `A` and `E` and an arbitrary bimodule and requires a
  `k`-linear section, and the two meet in the commutative `k`-split extensions of a commutative `R`
  by a symmetric bimodule, which up to isomorphism are the `R ⊕_f M` for symmetric cocycles `f`,
  their splittings being the algebra sections of §3.6(d);
- the correspondence of §3.3 between derivations and sections of `TrivSqZeroExt A M` is for
  bimodule derivations of an arbitrary `A`; its commutative case is DerivedModuleAlgebra §0.5's
  bijection between derivations and sections of the trivial extension, kept there, and Mathlib's
  `derivationToSquareZeroEquivLift` states it for a square-zero ideal of a commutative ring;
- the equivalence of §4.1 between bimodules and `ModuleCat Aᵉ` differs from Tau Ceti's restrictions
  of an `A ⊗[k] B`-module to its factors (`TauCeti.Algebra.TensorProduct.moduleLeft`,
  `TauCeti.Algebra.TensorProduct.moduleRight`) and its linearity criterion
  (`TauCeti.Algebra.TensorProduct.linearMapOfFactors`) by adding the two round trips with Mathlib's
  converse construction `TensorProduct.Algebra.module` and the equivalence of categories;
- the cup product of §5.1 is the ungraded product on the carrier of Layer 1; §6.1 proves that it
  is DGAInfinity Layer 8's brace expression up to an explicit sign;
- `HH_1(R,R) ≅ Ω¹_{R/k}` of §3.4 is for the classical complex of every commutative `R`, flat or
  not, where RefinedTraceMethods §1.9 states `ε₁`, and KTheoryFiniteLocalFields §4.0 checks
  `HH₁(A/ℤ) = Ω¹_{A/ℤ}`, both on derived Hochschild chains;
- the homological computation of §8.4 (`homological_hkr_mvPolynomial`), that
  `ε^cl_n : Ω^n_{R/k} → HH_n(R,R)` is an isomorphism for `R = MvPolynomial (Fin m) k` with the
  classes `ε^cl_n(dX_I)` as a basis, is the polynomial case of the smooth HKR comparison
  `HH_n(A/k) ≅ Ω^n_{A/k}` of KTheoryFiniteLocalFields §4.0, which is kept there: §4.0 states it on
  derived Hochschild chains, for every smooth algebra, without naming the map, and RefinedTraceMethods
  §1.9 names the map `ε_n` on those chains; §8.4 states it on the classical complex (which §6.3
  identifies with the derived chains, `R` being free over `k`), with the antisymmetrisation as the map
  and an explicit basis, over every `k`, and proves it from the Koszul resolution of §8.2 with no
  smoothness input and without gap:smooth-hkr-antisymmetrisation, which §6.4(d) uses for the general
  smooth case.

Generality. The ground ring `k` is an arbitrary commutative ring throughout. The identification
`HH^n ≅ Ext^n` is stated for `A` projective as a `k`-module, where the bar complex is a
projective resolution, and `HH_n ≅ Tor_n` for `A` flat as a `k`-module, where it is a resolution
by flat `Aᵉ`-modules; flatness cannot be dropped (`k = ℤ`, `A = ℤ[x]/(px)`, §4.5 Checks). The
comparison with derived Hochschild chains is stated for `k`-flat `A`. The cohomological HKR theorem
is stated for `R` smooth over `k` in Mathlib's sense (`Algebra.Smooth`: formally smooth and
finitely presented) and projective as a `k`-module. Both hypotheses are needed by the route:
smoothness gives that `HH_•(R,R)` is finite projective, and `k`-projectivity makes `C_•(R,R)` a
complex of projective `R`-modules, which is what turns the
cohomology of `Hom_R(C_•(R,R), M)` into `Hom_R(HH_•(R,R), M)` (HKR62 Lemma 4.1 and Theorem 5.1,
whose standing hypothesis is a `K`-projective algebra). Smoothness does not imply
`k`-projectivity: `ℤ → ℤ[1/2]` is étale and `ℤ[1/2]` is not a projective `ℤ`-module (§7.6
Checks). The field case and the regular affine case over a perfect field are special cases. The
unnormalised determinant map `T^n → HH^n(R,R)` is `n!` times the canonical isomorphism, so it is
an isomorphism exactly when multiplication by `n!` is bijective on `T^n_{R/k}`, which fails for
`R = 𝔽₂[x,y]` and `n = 2`, and for `R = ℤ[x,y]` and `n = 2`; the theorem is therefore stated for the
canonical map, and the determinant map is identified as `n!` times it.

## Conventions

- **Rings and universes.** `k` is a commutative ring, `A` a ring with `Algebra k A`, and `R` a
  commutative ring with `Algebra k R`. The ring `k`, the algebras and all coefficient modules
  live in one universe `u`; complexes are objects of `ChainComplex (ModuleCat.{u} k) ℕ` and
  `CochainComplex (ModuleCat.{u} k) ℕ`.
- **Bimodules.** An `A`-bimodule is a `k`-module `M` with `Module A M`, `Module Aᵐᵒᵖ M`,
  `SMulCommClass A Aᵐᵒᵖ M`, `IsScalarTower k A M` and `IsScalarTower k Aᵐᵒᵖ M`; the right action is
  `m · a = op a • m`. This is the convention of `TauCeti.BalancedTensorProduct`. `A` is a
  bimodule over itself by left and right multiplication. For commutative `R`, an `R`-module `M`
  is the symmetric bimodule with `m · r = r m`.
- **Enveloping algebra.** `Aᵉ = A ⊗[k] Aᵐᵒᵖ`. A bimodule is a left `Aᵉ`-module through
  `TensorProduct.Algebra.module`, so `(a ⊗ op b) · m = a m b`, as in Ginz05 line 752. For `Tor`, a
  bimodule is a right `Aᵉ`-module by `m · (a ⊗ op b) = b m a`, as in Ginz05 lines 963–966. For
  commutative `R`, `Rᵉ = R ⊗[k] Rᵐᵒᵖ` is a commutative ring, identified with `R ⊗[k] R` by
  `Algebra.TensorProduct.congr` of the identity and `AlgEquiv.toOpposite` (`r ↦ op r`); elements of
  `Rᵉ` such as `X_i ⊗ 1 − 1 ⊗ op X_i` are written `X_i ⊗ 1 − 1 ⊗ X_i` through it.
- **Tensor powers.** `A^{⊗n}` is `⨂[k]^n A`. The chains are `C_n(A,M) = M ⊗[k] A^{⊗n}` and the
  cochains are `C^n(A,M) = MultilinearMap k (fun _ : Fin n ↦ A) M`, identified with
  `A^{⊗n} →ₗ[k] M` by `PiTensorProduct.lift`. `C_0(A,M) = M` and `C^0(A,M) = M`.
- **The carriers of `Suggested.lean`.** The cochains are `(Fin n → A) →ₘₗ[k] M` (Mathlib's notation
  for `MultilinearMap k (fun _ : Fin n ↦ A) M`), the coboundary is Tau Ceti's
  `TauCeti.hochschildBimoduleCoboundary k A M n`, and the cocycles `hochschildBimoduleCocycles`, the
  coboundaries `hochschildBimoduleCoboundaries` and the cohomology `hochschildBimoduleCohomology`
  are the submodules and the quotient `Z^n/B^n` of §1.2; the three definitions do not ask the two
  actions to commute, the cohomology being the quotient of `Z^n` by `B^n ∩ Z^n`, which is `Z^n/B^n`
  for a bimodule, and every statement uses them for bimodules only. `A` is a bimodule over itself through
  Mathlib's `Semiring.toOppositeModule` (`op b • x = x b`). For a commutative `R`, a symmetric
  bimodule is an `R`-module `M` with `Module Rᵐᵒᵖ M`, `IsCentralScalar R M` (so `op r • m = r • m`),
  `SMulCommClass R Rᵐᵒᵖ M`, `Module k M`, `IsScalarTower k R M` and `IsScalarTower k Rᵐᵒᵖ M`; every
  `R`-module is one in exactly one way. `Ext` over `Aᵉ` is a `k`-module through Mathlib's scoped
  instance `ModuleCat.Algebra.instLinear`. Hochschild homology of a commutative `R` with
  coefficients in `R` is read on Tau Ceti's normalised chains
  `TauCeti.normalizedHochschildChains.chainComplex k R`, whose homology is `HH_•(R,R)` by §2.1; a
  class in it is the image under `HomologicalComplex.homologyπ` of a cycle whose image under
  `HomologicalComplex.iCycles`, followed by the identification
  `TauCeti.normalizedHochschildChains.chainComplexXIso` of the terms, is a combination of the
  pinned tensors `TauCeti.normalizedHochschildChains.tensor k R n`, the coefficient in slot `0`.
  The pins give neither `HH^n(R,M)` nor this homology an `R`-module structure (§1.5 adds it on the
  complexes of Layer 1), so the isomorphisms of §§3.4, 7.6 and 8.4 are stated there as `k`-linear
  equivalences with prescribed values on generators, which determine them.
- **Hochschild boundary** (Ginz05 lines 973–976):
  `b(m ⊗ a₁ ⊗ ⋯ ⊗ a_n) = m a₁ ⊗ a₂ ⊗ ⋯ ⊗ a_n + Σ_{i=1}^{n−1} (−1)^i m ⊗ ⋯ ⊗ a_i a_{i+1} ⊗ ⋯ ⊗ a_n + (−1)^n a_n m ⊗ a₁ ⊗ ⋯ ⊗ a_{n−1}`.
  Witness: in degree one `b(m ⊗ a) = m a − a m`; for `A = M = Mat₂(k)`, `m = E₁₂`, `a = E₂₁` this is
  `E₁₁ − E₂₂`, nonzero for nonzero `k`, and for commutative `A = M` the degree-one boundary is zero.
- **Hochschild coboundary** (Ginz05 lines 1055–1062; the same formula as BanachAlgebras Layer 6
  and as Tau Ceti's `TauCeti.hochschildBimoduleCoboundary`, the alternating sum of the cofaces
  `TauCeti.hochschildBimoduleCoface`):
  `δf(a₁,…,a_{n+1}) = a₁ f(a₂,…,a_{n+1}) + Σ_{i=1}^n (−1)^i f(…, a_i a_{i+1}, …) + (−1)^{n+1} f(a₁,…,a_n) a_{n+1}`.
  Witnesses: `δm(a) = a m − m a` on `C⁰ = M`, and `δf(a,b) = a f(b) − f(ab) + f(a) b` on `C¹`.
  Ginzburg's `ad m` of Ginz05 line 404 is `a ↦ m a − a m = −δm(a)`; inner derivations are the
  image of `δ` in either sign.
- **Cup product** (Ginz05 lines 1339–1341): `(f ∪ g)(a₁,…,a_{p+q}) = f(a₁,…,a_p) g(a_{p+1},…,a_{p+q})`
  for `f ∈ C^p(A,A)`, `g ∈ C^q(A,A)`. Witness: for the derivations `∂_x, ∂_y` of `k[x,y]`,
  `(∂_x ∪ ∂_y)(x,y) = 1` and `(∂_y ∪ ∂_x)(x,y) = 0`.
- **Gerstenhaber composition.** For `f ∈ C^p(A,A)` and `g ∈ C^q(A,A)`,
  `(f ∘ g)(a₁,…,a_{p+q−1}) = Σ_{i=1}^{p} (−1)^{(i−1)(q−1)} f(a₁,…,a_{i−1}, g(a_i,…,a_{i+q−1}), …)`
  (Ginz05 lines 1359–1363). It is not a new operation: §6.1 proves it is the transport of
  DGAInfinity's brace `F{G}`.
- **Suspension dictionary with DGAInfinity.** For `f ∈ C^n(A,A)`, its suspension `Θf` is the map
  `(sA)^{⊗n} → sA` with `Θf ∘ s^{⊗n} = s ∘ f`, the commuting square fixed by DGAInfinity's primary
  `A∞` convention; on degree-zero inputs `Θf(sa₁ ⊗ ⋯ ⊗ sa_n) = s f(a₁,…,a_n)` with no sign, and `Θf`
  has degree `n − 1`. With `m` the suspended multiplication, the Koszul tensor-map rule gives
  `Θ(δf) = (−1)^{n+1} [m, Θf]`, `Θ(f ∪ g) = (−1)^{p(q−1)} m{Θf, Θg}` and `Θ(f ∘ g) = Θf{Θg}`.
  Witnesses: for `x ∈ C⁰`, `[m, Θx](sa) = s(xa − ax) = −Θ(δx)(sa)`; for `f ∈ C¹`,
  `[m, Θf](sa ⊗ sb) = s(f(a) b + a f(b) − f(ab)) = Θ(δf)(sa ⊗ sb)`; for `f ∈ C¹` and `y ∈ C⁰`,
  `m{Θf, Θy}(sa) = −s(f(a) y) = −Θ(f ∪ y)(sa)`.
- **Normalisation.** `Ā = A ⧸ k·1` as a `k`-module. Normalised chains are the quotient by the
  span of chains with some `a_i = 1`; normalised cochains are those vanishing whenever some
  argument equals `1`.
- **Commutative algebras.** For commutative `R` and an `R`-bimodule `M`, `C_•(R,M)` is a complex of
  `R`-modules through the left action on the coefficient factor and `C^•(R,M)` through the left
  action on values (§1.5). `Ω^n_{R/k}` is
  `⋀[R]^n Ω[R⁄k]` (Mathlib's `ExteriorAlgebra.exteriorPower` of `KaehlerDifferential`), with
  `dr = KaehlerDifferential.D k R r`. Polyvector fields are `T^n_{R/k} = ⋀[R]^n Der_k(R)` with
  `Der_k(R) = Derivation k R R`, so `T⁰ = R` and `T¹ = Der_k(R)`.
- **Determinant pairing.** The pairing of `⋀^n` of the dual with `⋀^n` is Mathlib's
  `exteriorPower.pairingDual`, `(f₁ ∧ ⋯ ∧ f_n)(v₁ ∧ ⋯ ∧ v_n) = det(f_j(v_i))`
  (`exteriorPower.pairingDual_ιMulti_ιMulti`). The determinant cocycle is
  `⟨D₁,…,D_n⟩(r₁,…,r_n) = det(D_j(r_i))`, with the same index convention. Witness on `k[x,y]`:
  `⟨∂_x, ∂_y⟩(x,y) = 1` and `⟨∂_x, ∂_y⟩(y,x) = −1`.
- **Antisymmetrisation and projection** are those of RefinedTraceMethods §1.9:
  `ε_n(r₀ dr₁ ∧ ⋯ ∧ dr_n) = [Σ_{σ∈S_n} sgn(σ) r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}]` and
  `π_n(r₀ ⊗ ⋯ ⊗ r_n) = r₀ dr₁ ∧ ⋯ ∧ dr_n` (summing over `σ⁻¹` instead of `σ` gives the same chain).
  Witness on `k[x,y]`: `ε₂(dx ∧ dy) = [1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x]` and `π₂ ε₂(dx ∧ dy) = 2 dx ∧ dy`.
- **Normalising factors.** Pairing `⟨D₁,…,D_n⟩` with `ε_n(dr₁ ∧ ⋯ ∧ dr_n)` gives
  `n! · det(D_j(r_i))`, and pairing `D₁ ∪ ⋯ ∪ D_n` gives `det(D_j(r_i))`. Witness on `k[x,y]`:
  `⟨∂_x, ∂_y⟩` pairs with `1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x` to `1 − (−1) = 2`, and `∂_x ∪ ∂_y` pairs with it to
  `1 − 0 = 1`.
- **Smoothness** is Mathlib's `Algebra.Smooth` (`Algebra.FormallySmooth` together with
  `Algebra.FinitePresentation` as an algebra), which agrees with the definition of StacksSmooth
  Tag 00T2 by Tag 00TN. Finite presentation as an algebra does not make `R` finitely presented,
  or projective, as a `k`-module.
- **The zero ring.** Every statement is made over an arbitrary commutative `k`, the zero ring
  included; over `k = 0` every module, complex and comparison of this roadmap is the zero object
  or the zero map, and every theorem holds with both sides zero. A Check asserting that an
  element is nonzero, or that a map or an extension fails a property, names the rings for which
  it is made (`k` nonzero, `2 ≠ 0` in `k`, or `k = ℤ`).

## Exact supplier contracts

### From Mathlib

- **Complexes and homology.** `HomologicalComplex`, `ChainComplex`, `CochainComplex`,
  `HomologicalComplex.homology`, `HomologicalComplex.cycles`, `HomologicalComplex.iCycles` (the
  inclusion of the cycles into the term), `HomologicalComplex.homologyπ` (the class of a cycle), `HomologicalComplex.homologyMap`, `HomotopyEquiv`, `QuasiIso`;
  the long exact homology sequence `CategoryTheory.ShortComplex.ShortExact.δ` with
  `CategoryTheory.ShortComplex.ShortExact.homology_exact₁`, `homology_exact₂` and
  `homology_exact₃` (`Mathlib/Algebra/Homology/HomologySequence.lean`), its naturality
  `HomologicalComplex.HomologySequence.δ_naturality` (`Mathlib/Algebra/Homology/HomologySequenceLemmas.lean`:
  a morphism of short exact sequences of complexes commutes with the connecting maps), and the five
  lemma `CategoryTheory.Abelian.isIso_of_epi_of_isIso_of_isIso_of_mono`
  (`Mathlib/CategoryTheory/Abelian/DiagramLemmas/Four.lean`).
- **Simplicial normalisation.** `CategoryTheory.SimplicialObject`,
  `CategoryTheory.CosimplicialObject`, `AlgebraicTopology.alternatingFaceMapComplex`,
  `AlgebraicTopology.alternatingCofaceMapComplex`, `AlgebraicTopology.normalizedMooreComplex`,
  `AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`
  (the inclusion of the normalised Moore complex is a homotopy equivalence in any abelian
  category), `AlgebraicTopology.DoldKan.PInfty`, `AlgebraicTopology.DoldKan.QInfty`,
  `AlgebraicTopology.DoldKan.DegeneraciesVanish` and
  `AlgebraicTopology.DoldKan.degeneraciesVanish_iff_QInfty_f_comp`
  (`Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean`), and
  `CategoryTheory.SimplicialObject.Augmented.ExtraDegeneracy`. These hold in every abelian
  category; nothing about flatness of the terms is assumed.
- **Tensor algebra.** `TensorProduct`, `PiTensorProduct` with `PiTensorProduct.lift` and
  `PiTensorProduct.subsingletonEquiv` (`⨂` over a one-element index type is the factor),
  `TensorPower.mulEquiv` (`⨂[R]^i M ⊗[R] ⨂[R]^j M ≅ ⨂[R]^(i + j) M`, the first factor in the first
  `i` slots), `TensorPower.algebraMap₀` (`R ≅ ⨂[R]^0 M`), `TensorPower.cast` (reindexing along
  `i = j`), `MultilinearMap`,
  `Algebra.TensorProduct`, `Algebra.TensorProduct.congr` (`Mathlib/RingTheory/TensorProduct/Maps.lean`:
  the tensor product of two algebra isomorphisms), `MulOpposite`, `AlgEquiv.toOpposite`
  (`Mathlib/Algebra/Algebra/Opposite.lean`: `R ≃ₐ[k] Rᵐᵒᵖ` for a commutative `R`),
  `TensorProduct.Algebra.module` (a `Module (A ⊗[R] B) M` from commuting actions; not an instance),
  `instModuleTensorProductMop` (`Mathlib/Algebra/Azumaya/Defs.lean`: that structure on `A` itself,
  `Module (A ⊗[R] Aᵐᵒᵖ) A`, for every commutative `R` and `R`-algebra `A`; an abbreviation, not an
  instance) with `AlgHom.mulLeftRight_apply` (`a ⊗ op b` acts on `A` by `x ↦ a x b`, the convention
  of §4.1),
  `Module.Projective.tensorProduct` (`Mathlib/Algebra/Module/Projective.lean`: `M ⊗[R₀] N` is
  `R`-projective for `M` projective over `R` and `N` projective over `R₀`, `R` any semiring),
  `Module.Projective.of_free`, `Module.Projective.of_equiv'` (transport along a linear
  equivalence), `Module.projective_lifting_property` (a map out of a projective module lifts along
  a surjection), `Module.Flat` (for a
  commutative ring of scalars only) with `Module.Flat.rTensor_preserves_injective_linearMap`
  (`Mathlib/RingTheory/Flat/Basic.lean`: `− ⊗[R] X` sends injective maps to injective maps for
  flat `X`), `Module.Flat.self`, `Module.Flat.of_linearEquiv` and the flatness of a tensor product
  of flat modules, `Module.Flat.instTensorProduct` (same file); `rTensor_exact` and
  `LinearMap.rTensor_surjective` (`Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean`: for
  every `Q`, `− ⊗[R] Q` keeps an exact pair `f, g` with `g` onto exact, and keeps a surjection
  onto).
- **Ext, Tor and derived functors.** `CategoryTheory.ProjectiveResolution`,
  `CategoryTheory.Abelian.Ext` with `CategoryTheory.Abelian.Ext.comp` (the Yoneda product), the
  instance `HasExt.{v} (ModuleCat.{v} R)` of `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean`
  (for `Small.{v} R`), `CategoryTheory.ProjectiveResolution.extMk`,
  `CategoryTheory.ProjectiveResolution.extMk_surjective`,
  `CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff`,
  `CategoryTheory.ProjectiveResolution.add_extMk`, `CategoryTheory.ProjectiveResolution.smul_extMk`
  and `CategoryTheory.ProjectiveResolution.extLinearEquivCohomologyClass`
  (`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean`: for any projective resolution `P` of `X`,
  every class of `Ext X Y n` is `P.extMk f` for a cocycle `f : P_n → Y`, additively and linearly
  in `f`, and in degree `n = p + 1` it vanishes exactly when `f` factors through `d : P_n → P_p`;
  the linear equivalence of `Ext X Y n` with the degree-`n` cohomology classes of `P` holds in
  every degree, with no condition on the differentials of `P`),
  `CategoryTheory.ProjectiveResolution.extMk_hom`, `CategoryTheory.ProjectiveResolution.extMk_comp_mk₀`
  and `CategoryTheory.ProjectiveResolution.mk₀_comp_extMk` (the class as a shifted morphism in the
  derived category, and its composition with a degree-zero class on either side, the one on the
  left through a morphism of resolutions `CategoryTheory.ProjectiveResolution.Hom`),
  `CategoryTheory.Abelian.Ext.comp_hom`, `CategoryTheory.Abelian.Ext.linearEquiv₀` (`Ext⁰ = Hom`,
  linearly), `CategoryTheory.ProjectiveResolution.homotopyEquiv` and
  `CategoryTheory.ProjectiveResolution.liftHomotopy` (two projective resolutions of the same object
  are homotopy equivalent, and any two lifts of a morphism are homotopic),
  `CategoryTheory.Functor.mapHomotopyEquiv`, `Homotopy.op` and `HomotopyEquiv.toHomologyIso`
  (additive functors preserve homotopy equivalences, homotopies pass to opposite complexes, and
  homotopy equivalences induce isomorphisms on homology),
  `CategoryTheory.Functor.leftDerived` with
  `CategoryTheory.ProjectiveResolution.isoLeftDerivedObj` and
  `CategoryTheory.Functor.leftDerivedZeroIsoSelf` (`F.leftDerived 0 ≅ F` for an additive `F` that
  preserves finite colimits), and the scoped instance
  `ModuleCat.Algebra.instLinear` making `ModuleCat S` linear over a commutative `S₀` with
  `Algebra S₀ S`, through which `CategoryTheory.Abelian.Ext.instModule`
  (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`) makes every `Ext` group over `Aᵉ`
  a `k`-module. The group-cohomology identifications `groupCohomologyIsoExt` and the separately
  derived `Rep.Tor` are the template for §§4.4–4.5: Mathlib's monoidal `Tor` does not apply to a
  noncommutative `Aᵉ`.
- **Square-zero extensions.** `TrivSqZeroExt` for a bimodule (`Module R M`, `Module Rᵐᵒᵖ M`), with
  `TrivSqZeroExt.algebra'`, `TrivSqZeroExt.fstHom`, `TrivSqZeroExt.inl` and `TrivSqZeroExt.inr`;
  `Subalgebra.center`. `derivationToSquareZeroEquivLift`
  (`Mathlib/RingTheory/Derivation/ToSquareZero.lean`: for commutative `A` and `B` over `R` with
  `Algebra A B`, `IsScalarTower R A B` and an ideal `I` of `B` with `I² = 0`, the `R`-derivations
  `A → I` are in bijection with the `R`-algebra maps `A → B` lifting the structure map `A → B/I`) is
  cited for the commutative case of §3.3 and not consumed.
- **Differentials and derivations.** `Derivation` (which requires a commutative algebra),
  `KaehlerDifferential`, `KaehlerDifferential.D`, `KaehlerDifferential.span_range_derivation`,
  `KaehlerDifferential.linearMapEquivDerivation` (`(Ω[S⁄R] →ₗ[S] M) ≃ₗ[S] Derivation R S M`), the
  instance `Module.FinitePresentation S Ω[S⁄R]` for `Algebra.FinitePresentation R S`
  (`Mathlib/RingTheory/Extension/Cotangent/Basic.lean`), `MvPolynomial.pderiv`,
  `KaehlerDifferential.mvPolynomialBasis` (`Mathlib/RingTheory/Kaehler/Polynomial.lean`:
  `Ω[MvPolynomial σ R⁄R]` is free with basis the `dX_i`, the coordinates of `dP` being the partial
  derivatives of `P`).
- **Smoothness.** `Algebra.FormallySmooth` (whose field
  `Algebra.FormallySmooth.projective_kaehlerDifferential` makes `Ω[A⁄R]` projective),
  `Algebra.Smooth` (formally smooth and finitely presented as an algebra, not as a module),
  `Algebra.Smooth.flat`, and the `Algebra.FormallySmooth` instance for `MvPolynomial`.
- **Exterior powers.** `ExteriorAlgebra.exteriorPower` (notation `⋀[R]^n M`),
  `exteriorPower.ιMulti`, `exteriorPower.map`, `exteriorPower.zeroEquiv`, `exteriorPower.oneEquiv`,
  `exteriorPower.alternatingMapLinearEquiv` (linear maps out of `⋀[R]^n M` are the alternating
  maps on `M`), `exteriorPower.instFinite`, `exteriorPower.instFree`, `Module.Basis.exteriorPower`
  (`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean`: a basis of `M` indexed by a linearly ordered
  type gives the basis of `⋀[R]^n M` of the wedges `e_I` over the `n`-element subsets `I`, with no
  nontriviality hypothesis, while the rank formula `exteriorPower.finrank_eq` assumes
  `Nontrivial R`) with `Module.Basis.constr` (a linear map is fixed by its values on a basis),
  `exteriorPower.pairingDual` with `exteriorPower.pairingDual_ιMulti_ιMulti`,
  `exteriorPower.bijective_pairingDual` (stated for `Module.Free` and `Module.Finite` only; the
  finite projective case is §7.3), `exteriorPower.subsingleton_of_span_eq_top_of_card_lt`, and
  `Matrix.det`. Mathlib has no `Module.Projective` instance for exterior powers; Tau Ceti's
  `exteriorPower.instProjective` (below) supplies it.
- **Duals.** `Module.Dual`, `Module.dual_finite` and `Module.dual_projective` (the dual of a
  finite projective module is finite projective, `Mathlib/LinearAlgebra/Dual/Lemmas.lean`), the
  `Module.IsReflexive` instance for finite projective modules (same file) and `Module.evalEquiv`
  (`P ≃ₗ[R] P**` for a reflexive `P`, `Mathlib/LinearAlgebra/Dual/Defs.lean`).
- **Regular sequences.** `MvPolynomial.algebraTensorAlgEquiv`
  (`Mathlib/RingTheory/TensorProduct/MvPolynomial.lean`:
  `A ⊗[R] MvPolynomial σ R ≃ₐ[A] MvPolynomial σ A` for a commutative `R`-algebra `A`,
  `a ⊗ P ↦ a · P`, the coefficients of `P` mapped into `A`), `MvPolynomial.aeval` and
  `AlgEquiv.ofAlgHom` (two mutually inverse algebra maps give an algebra isomorphism), for the
  change of variables of §8.1; `RingTheory.Sequence.IsWeaklyRegular`,
  `LinearEquiv.isWeaklyRegular_congr'` (`Mathlib/RingTheory/Regular/RegularSequence.lean`: weak
  regularity transported along a semilinear equivalence, the sequence mapped by the ring map) and
  `MvPolynomial.span_X_image_eq_ker_aeval_ite_mem` (`Mathlib/RingTheory/MvPolynomial/Ideal.lean`:
  the ideal spanned by a set of variables is the kernel of the substitution killing them). Weak
  regularity of the variables themselves is Tau Ceti's (below); what neither library states is its
  transport to the differences `t_i = X_i ⊗ 1 − 1 ⊗ op X_i` of the two copies of the variables in
  `Rᵉ = R ⊗[k] Rᵐᵒᵖ`, which is §8.1.
- **Multilinear maps, determinants and quotients** (the definitions of `Suggested.lean`).
  `LinearMap.ker`, `LinearMap.range`, `Submodule.comap`, the quotient module with
  `Submodule.Quotient.mk`; `MultilinearMap.domCoprod` (the tensor product of two multilinear maps
  on disjoint index types), `MultilinearMap.domDomCongr` (reindexing along an equivalence),
  `finSumFinEquiv` (`Fin p ⊕ Fin q ≃ Fin (p + q)`, the first summand on the first `p` indices),
  `finCongr`, `LinearMap.mul'` (multiplication `A ⊗[k] A → A`) and
  `LinearMap.compMultilinearMap`; `MultilinearMap.mkPiAlgebra` (the product of the entries, for a
  commutative algebra), `MultilinearMap.compLinearMap`, `LinearMap.pi`;
  `Matrix.detRowAlternating` (the determinant as an alternating map of the rows) with
  `MultilinearMap.restrictScalars`; `Equiv.Perm.sign` acting through `ℤˣ`; `IsCentralScalar`;
  `Semiring.toOppositeModule`.
- Mathlib has no Hochschild complex of an algebra, no derivation into a bimodule over a
  noncommutative algebra, no Koszul complex and no `Tor` over a noncommutative ring; Tau Ceti's
  bimodule coboundary, bimodule derivations and Koszul complex are below.

### From Tau Ceti

- `TauCeti.BalancedTensorProduct k A M N` (`TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean`):
  the tensor product of a right `A`-module and a left `A`-module over a noncommutative `A`, with
  `TauCeti.BalancedTensorProduct.tmul`, `TauCeti.BalancedTensorProduct.induction_on`,
  `TauCeti.BalancedTensorProduct.hom_ext`, `TauCeti.BalancedTensorProduct.liftEquiv` (balanced
  bilinear maps are the linear maps out of the balanced tensor product),
  `TauCeti.BalancedTensorProduct.lid` and `TauCeti.BalancedTensorProduct.rid`
  (`TauCeti/LinearAlgebra/TensorProduct/Balanced/Unit.lean`: `A ⊗[A] N ≃ N` and `M ⊗[A] A ≃ M`
  through the actions), `TauCeti.BalancedTensorProduct.outerFactors`
  (`TauCeti/LinearAlgebra/TensorProduct/Balanced/OuterFactors.lean`:
  `(M ⊗[k] L) ⊗[A] (N ⊗[k] P) ≃ (M ⊗[A] N) ⊗[k] (L ⊗[k] P)`, `A` acting on the first factors) and
  `TauCeti.BalancedTensorProduct.finsuppScalarRight`
  (`TauCeti/LinearAlgebra/TensorProduct/Balanced/Finsupp.lean`: `M ⊗[A] (I →₀ A) ≃ (I →₀ M)` for a
  right `A`-module `M` and any set `I`). It is an ordinary, underived tensor product.
- `TauCeti.Algebra.TensorProduct.moduleLeft`, `TauCeti.Algebra.TensorProduct.moduleRight`,
  `TauCeti.Algebra.TensorProduct.moduleSMulCommClass`,
  `TauCeti.Algebra.TensorProduct.moduleLeftIsScalarTower`,
  `TauCeti.Algebra.TensorProduct.moduleRightIsScalarTower` and
  `TauCeti.Algebra.TensorProduct.linearMapOfFactors` (`TauCeti/Algebra/TensorProduct/Module.lean`):
  for a commutative ring `k`, `k`-algebras `A` and `B` and a module `M` over `A ⊗[k] B`, the
  restricted actions `a • m = (a ⊗ 1) • m` and `b • m = (1 ⊗ b) • m` (abbreviations, not instances);
  the fact that they commute; their compatibility with the `k`-action when `M` is a `k`-module with
  `IsScalarTower k (A ⊗[k] B) M`; and the criterion that a `k`-linear map `M → N` into a second
  `A ⊗[k] B`-module commuting with every `a ⊗ 1` and every `1 ⊗ b` is `A ⊗[k] B`-linear. At
  `B = Aᵐᵒᵖ` the restrictions are the left action and the right action `m · a = op a • m` of the
  conventions. The converse construction is Mathlib's `TensorProduct.Algebra.module`; neither pinned
  library has the two round trips or the equivalence of categories, which §4.1 adds.
- `TauCeti.Bimodule` and `TauCeti.Bimodule.smul_of` (`TauCeti/Algebra/CentralSimple/Bimodule.lean`):
  for a commutative ring `K`, `K`-algebras `A` and `B` and `f : B →ₐ[K] A`, a type synonym
  `TauCeti.Bimodule f` of `A` with an instance `Module (B ⊗[K] Aᵐᵒᵖ) (TauCeti.Bimodule f)` in which
  `b ⊗ op a` acts by `x ↦ f(b) x a`. At `f = AlgHom.id k A` this agrees on pure tensors, hence
  everywhere, with the action `AlgHom.mulLeftRight k A` of `instModuleTensorProductMop`; the
  difference is that it is an instance on a synonym rather than an abbreviation on `A`.
- `TauCeti.ChainComplex.kronecker` (`TauCeti/Algebra/Homology/Kronecker.lean`): the Kronecker map
  `Hⁱ(Hom(X,Y)) → (Hᵢ(X) ⟶ Y)` for a chain complex `X` in a `k`-linear abelian category, the
  source being the cohomology of `ChainComplex.linearYonedaObj`, with
  `TauCeti.ChainComplex.kronecker_homologyπ` (its value on a cocycle and a cycle) and
  `TauCeti.ChainComplex.kronecker_naturality`.
  `TauCeti.ChainComplex.kronecker_bijective_of_projective_homology_lt`
  (`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean`): for `X : ChainComplex C ℕ` with
  every `X_i` projective and `n ∈ ℕ` with `H_j(X)` projective for every `j < n`, the Kronecker map
  in degree `n` is bijective for every object `Y`;
  `TauCeti.ChainComplex.kronecker_bijective_of_projective_homology` (same file): bijective in
  every degree when every `H_j(X)` is projective. Projectivity is the categorical
  `CategoryTheory.Projective`, which for `ModuleCat R` follows from `Module.Projective` by
  Mathlib's instance `ModuleCat.projective_of_categoryTheory_projective`.
- `TauCeti.hochschildBimoduleCoface`, `TauCeti.hochschildBimoduleCoface_hochschildBimoduleCoface`,
  `TauCeti.hochschildBimoduleCoboundary`, `TauCeti.hochschildBimoduleCoboundary_apply_eq_add_sum_add`,
  `TauCeti.hochschildBimoduleCoboundary_comp_hochschildBimoduleCoboundary`,
  `TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty`,
  `TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty_eq_zero_iff`,
  `TauCeti.hochschildBimoduleCoboundary_ofSubsingleton` and
  `TauCeti.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero_iff`
  (`TauCeti/RingTheory/HochschildCohomology/Coboundary.lean`): for a `k`-algebra `A` and an additive
  group `M` with `Module k M`, `Module A M`, `Module Aᵐᵒᵖ M`, `IsScalarTower k A M` and
  `IsScalarTower k Aᵐᵒᵖ M`, the cofaces `∂_i : C^n(A,M) → C^{n+1}(A,M)`, `0 ≤ i ≤ n + 1` (`∂₀` the
  left action of the first argument, `∂_{n+1}` the right action of the last, the others multiplying
  two adjacent arguments), the identities `∂_{j+1} ∘ ∂_i = ∂_i ∘ ∂_j` for `i ≤ j` (under
  `SMulCommClass A Aᵐᵒᵖ M`), the coboundary `Σ_i (−1)^i ∂_i`, which is the `δ` of the conventions,
  `δ ∘ δ = 0` (under `SMulCommClass A Aᵐᵒᵖ M`), `δm(a) = a m − m a` with `δm = 0` exactly when `m` is
  central, and `δf(a,b) = a f(b) − f(ab) + f(a) b` with `δf = 0` exactly when `f` satisfies the
  Leibniz rule. The pin has no codegeneracies, no complex in `ModuleCat k` and no cohomology for
  these cochains; Layer 1 adds them.
- `TauCeti.BimoduleDerivation k A M` with `TauCeti.BimoduleDerivation.leibniz`,
  `TauCeti.BimoduleDerivation.map_one_eq_zero`, `TauCeti.BimoduleDerivation.map_algebraMap` and
  `TauCeti.BimoduleDerivation.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero`
  (`TauCeti/RingTheory/Derivation/Bimodule.lean` and `Coboundary.lean`): the `k`-linear maps
  `D : A → M` into a bimodule with `D(ab) = a D(b) + D(a) b` and `D(1) = 0`, each a degree-one
  cocycle. The condition `D(1) = 0` is part of the structure; for an additive group `M` it follows
  from the Leibniz rule (`D(1) = 2D(1)`), so no intended derivation is lost. The structure carries
  no module structure at the pin; §3.3 uses the `k`-submodule of `A →ₗ[k] M` of the underlying
  maps.
- `TauCeti.degenerateHochschildChains`, `TauCeti.normalizedHochschildChains`,
  `TauCeti.normalizedHochschildChains.tensor`, `TauCeti.normalizedHochschildChains.b`,
  `TauCeti.normalizedHochschildChains.b_tensor`, `TauCeti.normalizedHochschildChains.chainComplex`
  and `TauCeti.normalizedHochschildChains.chainComplexXIso`
  (`TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean`): for a commutative ring `k` and a
  `k`-module `A` with an element `1`, the span in `⨂[k]^{n+1} A` (slots `0,…,n`) of the pure tensors
  with `1` in some slot other than `0`, and the quotient by it, the normalised chains of degree `n`,
  with the class `tensor k A n a` of the pure tensor of `a : Fin (n + 1) → A`;
  for a ring `A` with `Module k A`, `IsScalarTower k A A` and `SMulCommClass k A A` (all supplied by
  `Algebra k A`), the boundary `b` from degree `n + 1` to degree `n`, on a tensor
  `a₀ ⊗ ⋯ ⊗ a_{n+1}` the alternating sum of the faces `TauCeti.hochschildFace`: the `i`-th face,
  `i ≤ n`, multiplies `a_i a_{i+1}`, and the last, with sign `(−1)^{n+1}`, is
  `a_{n+1}a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n`; and the chain complex in `ChainComplex (ModuleCat k) ℕ` with these
  terms and `b`, with the identification `chainComplexXIso` of its degree-`n` term with the
  normalised chains (the identity isomorphism). `Suggested.lean` states §3.4 and the homology half
  of §8.4 on this complex. The coefficients are `A` itself, and the pinned file compares these chains neither
  with the unnormalised complex nor with `A ⊗ Ā^{⊗n}`; §2.1 does both over every `k`
  (NoncommutativeGeometry N1.Cyclic states the second comparison for unital complex algebras).
- `TauCeti.hochschildCochainComplex`, its cocycles `TauCeti.hochschildCocycles`, coboundaries
  `TauCeti.hochschildCoboundaries` and cohomology `TauCeti.hochschildCohomology`, the class map
  `TauCeti.hochschildCohomology.mk` with `TauCeti.hochschildCohomology.mk_surjective`,
  `TauCeti.hochschildCohomology.mk_eq_zero_iff` and `TauCeti.hochschildCohomology.desc`, and
  `TauCeti.mem_hochschildCocycles_zero_iff`
  (`TauCeti/RingTheory/HochschildCohomology/Complex.lean`), with
  `TauCeti.normalizedHochschildCochains`, `TauCeti.normalizedHochschildCochains_zero`,
  `TauCeti.normalizedHochschildCochainComplex` and `TauCeti.normalizedHochschildCochainComplexι`
  (`TauCeti/RingTheory/CyclicCohomology/Normalized/Basic.lean`): for a commutative ring `k`, a ring
  `A` with `Module k A`, `IsScalarTower k A A` and `SMulCommClass k A A`, and a `k`-module `N`, the
  complex in `CochainComplex (ModuleCat k) ℕ` with degree-`n` term
  `MultilinearMap k (fun _ : Fin (n + 1) ↦ A) N` and differential
  `bφ(a₀,…,a_{n+1}) = Σ_{i=0}^{n} (−1)^i φ(a₀,…,a_i a_{i+1},…,a_{n+1}) + (−1)^{n+1} φ(a_{n+1}a₀, a₁,…,a_n)`;
  the kernel of `b` and its image (`0` in degree zero), the cohomology of the complex in
  `ModuleCat k` with the class map from the cocycles, which is surjective with kernel the
  coboundaries, and the map out of the cohomology induced by a linear map on cocycles vanishing on
  coboundaries; the degree-zero cocycles are the traces, the `φ` with `φ(xy) = φ(yx)`;
  the submodule of cochains that vanish whenever some argument other than the zeroth is `1` (no
  condition in degree zero), the subcomplex they form, and its inclusion into the full complex.
  The pin has coefficients in a `k`-module only, and proves neither that the inclusion is a
  homotopy equivalence nor that the cohomologies agree; §2.2 does both for every bimodule, and
  `Suggested.lean` states the first on these complexes
  (`exists_homotopyEquiv_normalizedHochschildCochainComplexι`).
- `TauCeti.multilinearCurryFirstEquiv` (`TauCeti/LinearAlgebra/Multilinear/Curry.lean`), the scoped
  instances `TauCeti.DualBimodule.instModule` and `TauCeti.DualBimodule.instModuleOp`, and
  `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`
  (`TauCeti/RingTheory/HochschildCohomology/Dual.lean`): for a commutative ring `k`, a `k`-algebra
  `A` and a `k`-module `N`, the bimodule structure on `A →ₗ[k] N` with `(a · g)(x) = g(x a)` and
  `(g · a)(x) = g(a x)`, the `k`-linear equivalence `φ ↦ ((a₁,…,a_n) ↦ (x ↦ φ(x, a₁,…,a_n)))` from
  multilinear maps in `n + 1` arguments into `N` onto multilinear maps in `n` arguments into
  `A →ₗ[k] N`, and the identity that it carries `b` to
  `TauCeti.hochschildBimoduleCoboundary k A (A →ₗ[k] N) n`. The instances are scoped because a
  pointwise action also exists when `N` is an `A`-module; §2.2 uses the dual one only.
- `exteriorPower.instProjective` (`TauCeti/LinearAlgebra/ExteriorPower/Basic.lean`): `⋀[R]^n M` is a
  projective `R`-module when `M` is, for every commutative ring `R`, with no finiteness hypothesis.
- `TauCeti.derivationLieAlgebra R A` (`TauCeti/Algebra/Lie/Derivation/Basic.lean`): derivations of
  a nonassociative algebra as a Lie subalgebra of `Module.End R A`, with
  `TauCeti.innerDerivation` (`z ↦ ⁅z, −⁆`, that is `a ↦ z a − a z`) and
  `TauCeti.derivationEquivDerivationLieAlgebra` (agreement with Mathlib's `Derivation R A A` for
  commutative `A`).
- `TauCeti.SquareZeroExtension`, `TauCeti.SquareZeroExtension.Hom`,
  `TauCeti.SquareZeroExtension.Splitting`, `TauCeti.SquareZeroExtension.ι_algebraMap_smul`,
  `TauCeti.Exal`, `TauCeti.SquareZeroExtension.extensionClass`,
  `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` and `TauCeti.Exal.subsingleton_self`
  (`TauCeti/RingTheory/Extension/SquareZero/Basic.lean`): for commutative rings `A` and `B` with
  `Algebra A B` and an additive group `M` with `Module B M`, a square-zero extension of `B` by `M`
  over `A` is a commutative ring `E` with `Algebra A E`, a surjective `A`-algebra map `π : E → B` and
  an injective additive map `ι : M → E` with range `ker π` and `x · ι(m) = ι(π(x) • m)`; its `ι`
  carries `algebraMap A B a • m` to `a • ι(m)`; morphisms are `A`-algebra maps compatible with `π`
  and `ι`; a splitting is an `A`-algebra section of `π`; `TauCeti.Exal A B M` is the set of
  isomorphism classes of extensions whose ring lies in the universe of `B` and `M`. Under the further
  hypotheses `Module Bᵐᵒᵖ M`, `IsCentralScalar B M`, `Module A M`, `IsScalarTower A B M` and
  `IsScalarTower A Bᵐᵒᵖ M` (the symmetric bimodule over `A`), `TauCeti.Exal A B M` has the class of
  `TrivSqZeroExt B M` as its `0` and an extension has class `0` exactly when it has a splitting;
  with no further hypothesis, `TauCeti.Exal A A M` has at most one element (every extension of `A`
  itself splits). The ring `E` is commutative and `ι` is only additive. §3.6 compares its twisted
  extensions with these; nothing else is assumed of them.
- `TauCeti.AInfinityAlgebra`, `TauCeti.AInfinity.IsSuspension` and
  `TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra` (`TauCeti/Algebra/Homology/AInfinity/`), with
  `TauCeti.IsDGAlgebra` and `TauCeti.IsNonUnitalDGAlgebra`
  (`TauCeti/Algebra/Homology/DG/Algebra/Defs.lean`): the
  suspended bar convention of DGAInfinity, which fixes the sign of `Θ` in the conventions. The
  suspension sign of `TauCeti.AInfinity.IsSuspension` is `(−1)^{suspExp}` with
  `suspExp = Σ_i (n − 1 − i) d_i` for inputs of degrees `d_i` (`MultilinearMap.suspend` and
  `MultilinearMap.suspExp`, `TauCeti/LinearAlgebra/Graded/Shift.lean`), which is `0` on inputs of
  degree zero: `Θf(sa₁ ⊗ ⋯ ⊗ sa_n) = s f(a₁,…,a_n)` with no sign. The shifted grading
  `𝒜.grading.shift 1` places `sA` in degree `−1` (`TauCeti/Algebra/Module/GradedModule/Shift.lean`:
  the degree-`p` piece of the shift by `1` is the degree-`(p + 1)` piece); the suspension changes
  the grading, not the module.
- `TauCeti.ReducedTensorWords.brace` and `TauCeti.ReducedTensorWords.gerstenhaberBracket`
  (`TauCeti/LinearAlgebra/TensorCoalgebra/Brace.lean`): for a graded module `M`, its reduced tensor
  coalgebra `Tᶜ(M)` (`TauCeti.ReducedTensorWords`, words of positive length) and linear maps
  `F, G : Tᶜ(M) → M` of degrees `p` and `q`, the brace `F{G} = F ∘ D G`, where `D G`
  (`TauCeti.ReducedTensorWords.gradedCoderiv`) inserts `G` into every block of consecutive letters
  with the Koszul sign `(−1)^{q · (sum of the degrees of the letters before the block)}`, and the
  bracket `[F,G] = F{G} − (−1)^{pq} G{F}`; with the pre-Lie identity
  `F{G}{H} − (−1)^{qr} F{H}{G} = F{[G,H]}`
  (`TauCeti.ReducedTensorWords.brace_brace_sub_smul_brace_brace`), graded antisymmetry
  (`TauCeti.ReducedTensorWords.gerstenhaberBracket_swap`) and the graded Jacobi identity
  (`TauCeti.ReducedTensorWords.leibniz_gerstenhaberBracket`). These are the operations §6.1
  transports; nothing is assumed of them beyond their definitions.
- `TauCeti.AInfinityAlgebra.hochschildDifferential`
  (`TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean`): for an `A∞` algebra `𝒜`
  with suspended Taylor map `m` and a cochain `F` of degree `q`, the Hochschild differential
  `[m, F] = m{F} − (−1)^q F{m}` (`TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub`),
  squaring to zero, with the Leibniz rule `[m,[F,G]] = [[m,F],G] + (−1)^p [F,[m,G]]` for `F` of
  degree `p` (`TauCeti.AInfinityAlgebra.hochschildDifferential_gerstenhaberBracket`) and, for `ψ`
  of degree zero, the pre-Lie identity `m{ψ}{ψ} − m{ψ{ψ}} = [m,ψ]{ψ} + ψ{[m,ψ]} − [m, ψ{ψ}]`
  (`TauCeti.AInfinityAlgebra.brace_brace_sub_brace_brace_eq_hochschildDifferential`). All degrees
  are suspended degrees: an unsuspended map of arity `n` and internal degree `r` has degree
  `r + n − 1`.
- `TauCeti.AInfinityAlgebra.PositiveHochschild.cochains`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.complex`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.bracket`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket` and
  `TauCeti.AInfinityAlgebra.PositiveHochschild.normalizedCochains`
  (`TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Complex.lean`, `Cohomology.lean` and
  `Normalized.lean`): the homogeneous cochains of degree `p`, the `ℤ`-indexed cochain complex in
  `ModuleCat k` with differential `[m,−]`, the bracket of homogeneous cochains, the cohomology
  `Z^p/B^p` with the induced bracket (bilinear, graded antisymmetric, Jacobi), and the cochains
  vanishing on words containing a strict unit `e`. The complex has positive arities only: no
  arity-zero cochains, no cup product, no multiple brace, no chains.
- `CategoryTheory.ProjectiveResolution.extLinearEquiv`
  (`TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean`): for a projective resolution `P` of
  `X`, an object `Y` and `n ∈ ℕ` such that `d ≫ f = 0` for every `f : P_{n+1} → Y` with
  `d : P_{n+2} → P_{n+1}`, and `d ≫ g = 0` for every `g : P_n → Y` with `d : P_{n+1} → P_n`, the
  linear equivalence `Hom(P_{n+1}, Y) ≅ Ext^{n+1}(X, Y)`, `f ↦ P.extMk f`. Both vanishing
  hypotheses are part of the statement: it identifies a whole term of the `Hom`-complex with `Ext`
  only where the adjacent differentials die against `Y`, and is used only for the Koszul
  resolution of §8.2, never for the bar resolution of §4.4 (for `A = k = ℤ` the bar differential
  `B₂ → B₁` is the identity).
- `MvPolynomial.isWeaklyRegular_map_X` (`TauCeti/RingTheory/MvPolynomial/RegularSequence.lean`):
  for every commutative ring `R` and every list `l` of indices without repetition, the variables
  `X_i`, `i ∈ l`, form a weakly regular sequence in `MvPolynomial σ R`, with no nontriviality
  hypothesis (the regular version `MvPolynomial.isRegular_map_X` adds `Nontrivial R`). §8.1
  transports it to the `t_i`.
- `TauCeti.koszulComplex` (`TauCeti/RingTheory/KoszulComplex/Basic.lean`): for a linear functional
  `φ : M → B` on a module over a commutative ring `B`, the `ℕ`-indexed chain complex of `B`-modules
  with terms `⋀[B]^j M` and differential the contraction by `φ`, with
  `TauCeti.zeroEquiv_koszulDifferential_zero` (the first differential is `φ`),
  `TauCeti.oneEquiv_koszulDifferential_one` (`u ∧ v ↦ φ(u) v − φ(v) u`),
  `TauCeti.koszulComplex.homologyZeroEquivSpan` (`H₀ ≅ B/(x₁,…,x_m)` for the functional
  `Fintype.linearCombination B x` on `B^m`) and `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular`
  (`TauCeti/RingTheory/KoszulComplex/Regular.lean`: `H_{j+1} = 0` for every `j` when `x` is weakly
  regular). These are the pinned form of DerivedModuleAlgebra §0.K.1, whose own contract records
  them; §8.2 applies them to the sequence `t` of §8.1 in `Rᵉ`. Nothing is assumed of them beyond
  these statements.

### From TauCetiRoadmap.DGAInfinity

- Standing conventions and Layer 0: cohomological grading, the degree `−1` suspension `s`, the
  Koszul tensor-map rule `(f ⊗ g)(x ⊗ y) = (−1)^{|g||x|} f(x) ⊗ g(y)`, and the substitution (brace)
  operations with the exact Koszul sign for substituting an operation after the first inputs, the
  multiple brace `F{G,H}` among them. Assumed: Layer 0's single brace `F{G}` is the pinned
  `TauCeti.ReducedTensorWords.brace` (the same Koszul sign), and the multiple brace obeys the same
  rule. Only the comparison clauses of §6.1 use the multiple brace; no relation between braces is
  consumed, §6.2 proving Gerstenhaber's formula directly on the classical complex.
- Layer 1: an ordinary `k`-algebra is a DG algebra concentrated in degree zero with zero
  differential.
- Layer 8: the Hochschild cochains of such an algebra as coderivation components
  `(sA)^{⊗n} → sA` in all arities `n ≥ 0`, the cup product as the multiple brace `m{F,G}`, the
  Gerstenhaber bracket `[F,G] = F{G} − (−1)^{|F||G|} G{F}` and the Hochschild differential `[m, −]`
  on the full complex; and the Hochschild chains of the algebra (the cyclic bar construction with
  differential determined by `m`). Assumed: in arities `n ≥ 1` Layer 8's cochains, brace, bracket
  and differential are the pinned `TauCeti.AInfinityAlgebra.PositiveHochschild.cochains`,
  `TauCeti.ReducedTensorWords.brace`, `TauCeti.ReducedTensorWords.gerstenhaberBracket` and
  `TauCeti.AInfinityAlgebra.hochschildDifferential`, and the arity-zero cochains (elements of
  `sA`) extend them with the same Koszul signs; for an algebra in degree zero the chain
  differential is, termwise, the suspended classical boundary up to a sign depending only on the
  degree; §6.3 proves that the comparison then holds with signs `ν_n`, which these degree signs
  determine.

### From TauCetiRoadmap.DerivedModuleAlgebra

- §0.K.1 (Koszul complex of a finite sequence): for a commutative ring `B` and `x = (x₁,…,x_m)`
  in `B`, the chain complex `K(x)` with `K(x)_j = ⋀^j B^m` and `d₁(v) = Σ x_i v_i`, `H₀(K(x)) = B/(x)`,
  functoriality in the sequence, and acyclicity in positive degrees when `x` is weakly regular, so
  that `K(x) → B/(x)` is a finite free resolution. At the pin these clauses are Tau Ceti's
  `TauCeti.koszulComplex` of `Fintype.linearCombination B x` with the declarations listed under
  "From Tau Ceti", which §8.2 consumes.

### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

- §6.1 (Exterior biduals of Selmer modules): for a commutative ring `R`, `r ∈ ℕ` and a finite
  projective `R`-module `X`, the evaluation `TauCeti.StarkSystems.toExteriorBidual R r X` from
  `⋀[R]^r X` to the exterior bidual `Hom_R(⋀[R]^r Hom_R(X,R), R)` is an isomorphism. Assumed of it:
  that statement for every finite projective `X`, nothing of the Selmer specialisations.

### From TauCetiRoadmap.IntegralIwasawaTheory

- §12.6 (the shared exterior-bidual core): `TauCeti.StarkSystems.exteriorBidual R r X` and
  `TauCeti.StarkSystems.toExteriorBidual R r X`, defined for every commutative ring `R` and
  `R`-module `X` by flipping `exteriorPower.pairingDual`, with the determinant formula
  `toExteriorBidual(x₁ ∧ ⋯ ∧ x_r)(φ₁ ∧ ⋯ ∧ φ_r) = det(φ_j(x_i))` and naturality in `X`. These are the
  carrier of the EulerSystemsAndKolyvaginSystems §6.1 statement; the finite-abelian lattice
  comparison of §12.6 is not used.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

- §4.0 (Cyclic homology foundations): `HH_n(A/k)` for an ordinary `k`-algebra `A`, the homology
  of DGAInfinity Layer 8's Hochschild chains of `A` in degree zero over `k`; the checks
  `HH₀(A) = A/[A,A]`; and the smooth HKR comparison `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth
  commutative `A`.

### From TauCetiRoadmap.RefinedTraceMethods

- §1.1 (The cyclic enhancement of supplied derived Hochschild chains): for an ordinary `k`-algebra
  `A` flat as a `k`-module, the derived Hochschild homology `HH_n(A/k)` of KTheoryFiniteLocalFields
  §4.0 is the homology of the cyclic bar complex `(C_•(A/k), b)`, the derived object being the
  totalisation of the cyclic bar construction; for non-flat `A` the two differ (`k = ℤ`, `A = 𝔽_p`).
- §1.9 (The antisymmetrisation map and the HKR projection): for commutative `A` flat over `k`, the
  antisymmetrisation `ε_n : Ω^n_{A/k} → HH_n(A/k)` and the projection `π_n`, with the formulas of
  the conventions, `π_n ∘ ε_n = n!`, multiplicativity of `ε` for the shuffle product, naturality
  in `k → A`, and `ε₁` an isomorphism inverse to `a₀ ⊗ a₁ ↦ a₀ da₁`.
- What RefinedTraceMethods must provide (gap:smooth-hkr-antisymmetrisation): a statement in §1.9
  that `ε_n : Ω^n_{A/k} → HH_n(A/k)` is an isomorphism for every `n`, every commutative ring `k` and
  every smooth commutative `k`-algebra `A`, identified with the smooth HKR comparison of
  KTheoryFiniteLocalFields §4.0. §1.9 names the map and proves `π_n ε_n = n!` and the degree-one
  case, which give nothing in degree `n` when `n!` is not invertible (`k = 𝔽₂`, `A = 𝔽₂[x,y]`,
  `n = 2`); KTheoryFiniteLocalFields §4.0 asserts an isomorphism without naming the map. Only
  §6.4(d), and §7.6 through it, use the statement.

## How to read the build

Layer 1 builds the two complexes from a simplicial and a cosimplicial `k`-module, the latter on
Tau Ceti's bimodule cofaces, with functoriality, long exact sequences and the `R`-linear
structure in the commutative case.
Layer 2 deduces the normalisation theorem from Mathlib's Dold–Kan normalisation. Layer 3
identifies the low degrees and classifies square-zero extensions. Layer 4 constructs the bar
resolution and identifies the theory with `Ext` over `Aᵉ` for `k`-projective `A` and with `Tor`
over `Aᵉ` for `k`-flat `A`.
Layer 5 constructs the cup product, the graded algebra `HH^•(A,A)` and its comparison with the
Yoneda product. Layer 6 compares the cochain complex with the pinned positive-arity Hochschild complex of
Tau Ceti and DGAInfinity Layer 8, the chain complex with Layer 8's chains and, for flat
algebras, with the derived chains of KTheoryFiniteLocalFields §4.0 through RefinedTraceMethods
§1.1, proves Gerstenhaber's homotopy formula by a direct computation on the classical complex,
and describes the antisymmetrisation of RefinedTraceMethods §1.9 on the classical complex. Layer 7 pairs cochains
with chains, proves the evaluation pairing bijective below the first non-projective Hochschild
homology group from Tau Ceti's Kronecker theorem, identifies the exterior-power pairing of a
finite projective module with the exterior-bidual evaluation of EulerSystemsAndKolyvaginSystems
§6.1, defines polyvector fields and the HKR maps, and proves the cohomological HKR theorem.
Layer 8 computes the polynomial case from the Koszul resolution; it depends on Layers 1–5,
§§6.2 and 6.4(a) and §§7.1, 7.4 and 7.5, not on the smooth HKR input of §6.4(d) and §7.6.

## Layer 1: Hochschild complexes with bimodule coefficients

### 1.1 The Hochschild simplicial module and the chain complex

Define the Hochschild simplicial `k`-module `X(A,M)` of an algebra `A` and a bimodule `M` as the
simplicial object of `ModuleCat k` with `X_n = M ⊗[k] A^{⊗n}`, faces
`d₀(m ⊗ a₁ ⊗ ⋯ ⊗ a_n) = m a₁ ⊗ a₂ ⊗ ⋯ ⊗ a_n`, `d_i(m ⊗ ⋯) = m ⊗ ⋯ ⊗ a_i a_{i+1} ⊗ ⋯` for
`1 ≤ i ≤ n − 1`, `d_n(m ⊗ a₁ ⊗ ⋯ ⊗ a_n) = a_n m ⊗ a₁ ⊗ ⋯ ⊗ a_{n−1}`, and degeneracies
`s_j(m ⊗ a₁ ⊗ ⋯ ⊗ a_n) = m ⊗ a₁ ⊗ ⋯ ⊗ a_j ⊗ 1 ⊗ a_{j+1} ⊗ ⋯ ⊗ a_n` for `0 ≤ j ≤ n`. Define the
Hochschild chain complex `C_•(A,M)` as `AlgebraicTopology.alternatingFaceMapComplex` of
`X(A,M)` and Hochschild homology `HH_n(A,M)` as its homology in degree `n`. Prove the simplicial
identities, so that `X(A,M)` is a simplicial object, and prove that the differential of
`C_•(A,M)` is the Hochschild boundary `b` of the conventions (Ginz05 §5.1, lines 973–976; Loday98
§1.1; Weibel94 §9.1; CE56 Chapter IX).

*Needs:* Mathlib `CategoryTheory.SimplicialObject`, `AlgebraicTopology.alternatingFaceMapComplex`,
`HomologicalComplex.homology`, `PiTensorProduct`, `TensorPower.mulEquiv`.

- The term of `C_•(A,M)` in degree `n` is `M ⊗[k] A^{⊗n}`, and `C₀(A,M) = M`.
- Each face and degeneracy is given on pure tensors by the displayed formula.
- The differential on a pure tensor is `b(m ⊗ a₁ ⊗ ⋯ ⊗ a_n)` as in the conventions; in degree one
  it is `m ⊗ a ↦ m a − a m`.
- `b ∘ b = 0`, as for every alternating face complex.
- Every element of `HH_n(A,M)` is the class of a cycle, and two cycles have the same class exactly
  when their difference is a boundary.

**Checks.**

- For `A = M = k`, every `X_n` is `k` and every face is the identity, so `b_n` is multiplication by
  `Σ_{i=0}^{n} (−1)^i`, which is `1` for even `n ≥ 2` and `0` for odd `n`; hence `HH₀(k,k) = k` and
  `HH_n(k,k) = 0` for `n ≥ 1`. Omitting the last face `d_n` would make `b₁` the identity of `k` and
  `HH₀(k,k) = 0`.
- For `A = M = Mat₂(k)` with `k` nonzero, `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂ ≠ 0`. Using `m a_n` instead of
  `a_n m` in the last face would make the degree-one boundary `m ⊗ a ↦ m a − m a = 0` and give
  `HH₀(Mat₂(k)) = Mat₂(k)` instead of `k` (§3.1 Checks).
- For commutative `A = M`, the degree-one boundary vanishes, so every element of `A ⊗ A` is a
  cycle; with `A = k[x]` and `k` nonzero, the cycle `1 ⊗ x` is not a boundary (§3.4).

### 1.2 The Hochschild cosimplicial module and the cochain complex

Define the Hochschild cosimplicial `k`-module `Y(A,M)` as the cosimplicial object of `ModuleCat k`
with `Y^n = MultilinearMap k (fun _ : Fin n ↦ A) M`, cofaces the pinned
`TauCeti.hochschildBimoduleCoface k A M i`, that is `(δ⁰f)(a₁,…,a_{n+1}) = a₁ f(a₂,…,a_{n+1})`,
`(δ^i f)(a₁,…,a_{n+1}) = f(a₁,…,a_i a_{i+1},…,a_{n+1})` for `1 ≤ i ≤ n` and
`(δ^{n+1} f)(a₁,…,a_{n+1}) = f(a₁,…,a_n) a_{n+1}`, and codegeneracies
`(σ^j f)(a₁,…,a_n) = f(a₁,…,a_j, 1, a_{j+1},…,a_n)`. Define the Hochschild cochain complex
`C^•(A,M)` as `AlgebraicTopology.alternatingCofaceMapComplex` of `Y(A,M)`. Define the
`n`-cocycles `Z^n(A,M)` (`hochschildBimoduleCocycles`) as the kernel of
`TauCeti.hochschildBimoduleCoboundary k A M n`, the `n`-coboundaries `B^n(A,M)`
(`hochschildBimoduleCoboundaries`) as `0` for `n = 0` and as the image of
`TauCeti.hochschildBimoduleCoboundary k A M (n − 1)` for `n ≥ 1`, and Hochschild cohomology
`HH^n(A,M)` (`hochschildBimoduleCohomology`) as the quotient `k`-module `Z^n(A,M)/B^n(A,M)`; the
three are defined without `SMulCommClass A Aᵐᵒᵖ M`, the cohomology as the quotient of `Z^n` by
`B^n ∩ Z^n`, which is `Z^n/B^n` exactly when `B^n ⊆ Z^n`, in particular for every bimodule. The
coface identities are `TauCeti.hochschildBimoduleCoface_hochschildBimoduleCoface`; prove the
cosimplicial identities involving the codegeneracies, that the differential of `C^•(A,M)` from
degree `n` is `TauCeti.hochschildBimoduleCoboundary k A M n`, the coboundary `δ` of the conventions,
and that `HH^n(A,M)` is the cohomology of `C^•(A,M)` in degree `n` (Ginz05 §5.2, lines 1055–1062;
Loday98 §1.5; Weibel94 §9.1; CE56 Chapter IX).

*Needs:* Mathlib `CategoryTheory.CosimplicialObject`, `AlgebraicTopology.alternatingCofaceMapComplex`,
`MultilinearMap`, `PiTensorProduct.lift`, `LinearMap.ker`, `LinearMap.range`, `Submodule.comap`
and the quotient module; Tau Ceti `TauCeti.hochschildBimoduleCoface`,
`TauCeti.hochschildBimoduleCoface_hochschildBimoduleCoface`, `TauCeti.hochschildBimoduleCoboundary`,
`TauCeti.hochschildBimoduleCoboundary_apply_eq_add_sum_add`,
`TauCeti.hochschildBimoduleCoboundary_comp_hochschildBimoduleCoboundary`,
`TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty`,
`TauCeti.hochschildBimoduleCoboundary_ofSubsingleton`.

- `C⁰(A,M) = M` (multilinear maps on the empty family), and `C^n(A,M) ≅ (A^{⊗n} →ₗ[k] M)` through
  `PiTensorProduct.lift`, compatibly with the differentials.
- The differential from degree `n` is `TauCeti.hochschildBimoduleCoboundary k A M n`; so on `C⁰` it is
  `m ↦ (a ↦ a m − m a)` (`TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty`), on `C¹` it is
  `f ↦ ((a,b) ↦ a f(b) − f(ab) + f(a) b)` (`TauCeti.hochschildBimoduleCoboundary_ofSubsingleton`),
  and in general it is the displayed `δ`
  (`TauCeti.hochschildBimoduleCoboundary_apply_eq_add_sum_add`).
- `δ ∘ δ = 0`, as for every alternating coface complex and as
  `TauCeti.hochschildBimoduleCoboundary_comp_hochschildBimoduleCoboundary`.
- `B^n(A,M) ⊆ Z^n(A,M)` for every `n`, by `δ ∘ δ = 0`; `B⁰ = 0`, so `HH⁰(A,M) = Z⁰(A,M)`.
- The cohomology of `C^•(A,M)` in degree `n` is `HH^n(A,M) = Z^n/B^n`, naturally in `M`: the cycles
  of `C^•(A,M)` in degree `n` are `Z^n(A,M)` and the boundaries are `B^n(A,M)`.

**Checks.**

- For `A = M = k`, `C^n = k` and `δ : C^n → C^{n+1}` is multiplication by `Σ_{i=0}^{n+1} (−1)^i`,
  which is `1` for odd `n` and `0` for even `n`; so `HH⁰(k,k) = k` and `HH^n(k,k) = 0` for `n ≥ 1`.
- `δ(δm)(a,b) = a(bm − mb) − (abm − mab) + (am − ma)b = 0` for every `m ∈ C⁰`. The variant that
  gives the last term the sign `−` instead of `(−1)^{n+1}` in degree one,
  `f ↦ a f(b) − f(ab) − f(a) b`, gives `δδm(a,b) = 2(mab − amb)`, which is `2E₁₂ ≠ 0` for
  `A = M = Mat₂(ℤ)`, `m = E₁₁`, `a = E₁₂`, `b = E₂₂` (there `mab = E₁₂` and `amb = 0`).
- For `A = M = Mat₂(k)`, `HH⁰ = Z⁰` is the set of scalar matrices (§3.2 Checks). The variant
  that drops `δ⁰` leaves `m ↦ (a ↦ −m a)` in degree zero, whose kernel is `0` (evaluate at `a = 1`),
  so its degree-zero cocycles would be `0` instead of the centre: for `A = M = ℤ` the correct `Z⁰`
  is `ℤ` and the variant's is `0`, and for `Mat₂(k)` with `k` nonzero the scalar matrices are lost.
- The two actions must commute for `B^n ⊆ Z^n`. Let `A = M = Mat₂(ℤ)` with `a • m = a m` and
  `op b • m = bᵀ m`, a left `Aᵐᵒᵖ`-module since `(cb)ᵀ = bᵀ cᵀ`, whose action does not commute with
  the left one. Then `δm(a) = a m − aᵀ m` and `δ(δm)(a,b) = (bᵀ a − a bᵀ) m`, which at
  `a = b = E₁₂`, `m = 1` is `E₂₂ − E₁₁ ≠ 0`: the coboundary `δ1` is not a cocycle, so this `M` has no
  Hochschild cochain complex, and the quotient of `Z¹` by `B¹ ∩ Z¹` is not its cohomology.

### 1.3 Functoriality

Prove that `C_•(A,−)`, `C^•(A,−)`, `HH_n(A,−)` and `HH^n(A,−)` are functors on bimodule
homomorphisms, `k`-linear on morphisms, and that an algebra homomorphism `φ : A → B` and a
`B`-bimodule `N`, viewed as an `A`-bimodule `φ*N` through `φ`, give a chain map
`C_•(A, φ*N) → C_•(B, N)`, `n ⊗ a₁ ⊗ ⋯ ⊗ a_n ↦ n ⊗ φ(a₁) ⊗ ⋯ ⊗ φ(a_n)`, and a cochain map
`C^•(B, N) → C^•(A, φ*N)`, `f ↦ f ∘ (φ × ⋯ × φ)`; with identity and composition laws, and the two
functorialities commute (Loday98 §1.1; Weibel94 §9.1).

*Needs:* §§1.1–1.2; Mathlib `HomologicalComplex.homologyMap`.

**Checks.**

- For the structure map `φ : k → B` and a `B`-bimodule `N`, `C_n(k, φ*N) = N ⊗[k] k^{⊗n} ≅ N`. The
  chain map is `n ↦ n ⊗ 1 ⊗ ⋯ ⊗ 1` in each degree, and on `HH₀` it is the quotient map
  `N → N/[B,N]`. For `B = N = Mat₂(k)` this is `Mat₂(k) → Mat₂(k)/[Mat₂(k), Mat₂(k)] ≅ k`, the trace
  (§3.1 Checks).
- The chain map needs `φ` to be multiplicative. Take `k` nonzero and the `k`-linear map
  `φ : k[x] → k[x]` with `φ(1) = 1`, `φ(x) = x` and `φ(x^j) = 0` for `j ≥ 2`. The formula
  `n ⊗ a₁ ⊗ ⋯ ⊗ a_n ↦ n ⊗ φ(a₁) ⊗ ⋯ ⊗ φ(a_n)`, with the identity on the coefficients `k[x]`, does not
  commute with `b`. It sends `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²` to `2x ⊗ x`, while
  `b(1 ⊗ φ(x) ⊗ φ(x)) = 2x ⊗ x − 1 ⊗ x²`; the two differ by `1 ⊗ x² ≠ 0`.
- The cochain map goes from `B` to `A`, and a pulled-back cochain vanishes whenever one of its
  arguments lies in `ker φ`. Take the quotient `φ : k[x] → k[x]/(x²)` and `N = k[x]/(x²)`. The
  derivation `x∂_x` of `k[x]/(x²)` pulls back to the derivation `p ↦ x p′ mod x²` of `k[x]` into
  `φ*N`, which kills `x²`. When `2 ≠ 0` in `k`, the derivation `p ↦ p′ mod x²` of `k[x]` into `φ*N`
  sends `x²` to `2x ≠ 0`, so it is not a pulled-back cochain.

### 1.4 Long exact sequences in the coefficients

Let `0 → M' → M → M'' → 0` be a short exact sequence of `A`-bimodules. If `A` is flat as a
`k`-module, or the sequence is split as a sequence of `k`-modules, prove that
`0 → C_•(A,M') → C_•(A,M) → C_•(A,M'') → 0` is a short exact sequence of complexes, and obtain the
natural long exact sequence `⋯ → HH_n(A,M') → HH_n(A,M) → HH_n(A,M'') → HH_{n−1}(A,M') → ⋯`. If `A`
is projective as a `k`-module, or the sequence is `k`-split, prove the same for `C^•(A,−)` and
obtain `⋯ → HH^n(A,M') → HH^n(A,M) → HH^n(A,M'') → HH^{n+1}(A,M') → ⋯` (Weibel94 §9.1; CE56
Chapter IX). The connecting maps are natural in morphisms of short exact sequences.

*Needs:* §1.3; Mathlib `CategoryTheory.ShortComplex.ShortExact.δ`,
`CategoryTheory.ShortComplex.ShortExact.homology_exact₁`, `homology_exact₂`, `homology_exact₃`,
`Module.Flat`, `Module.Projective`, `TensorPower.algebraMap₀`, `TensorPower.mulEquiv`,
`PiTensorProduct.subsingletonEquiv`, `PiTensorProduct.lift`, `Module.Flat.self`,
`Module.Flat.instTensorProduct` (`Mathlib/RingTheory/Flat/Basic.lean`: `M ⊗[R] N` is flat for flat
`M` and `N`), `Module.Flat.of_linearEquiv`, `Module.Projective.of_free`,
`Module.Projective.tensorProduct`, `Module.Projective.of_equiv'`,
`Module.Flat.rTensor_preserves_injective_linearMap`, `rTensor_exact`,
`LinearMap.rTensor_surjective`, `Module.projective_lifting_property`.

- For every `n`, `A^{⊗n}` is a flat `k`-module when `A` is flat, and a projective `k`-module when
  `A` is projective. By induction on `n`: `A^{⊗0} ≅ k` (`TensorPower.algebraMap₀`) is free over
  itself, hence flat and projective, whatever `A` is; and `A^{⊗(n+1)} ≅ A^{⊗n} ⊗[k] A`, by
  `TensorPower.mulEquiv` with `PiTensorProduct.subsingletonEquiv` on the one-slot factor, is flat by
  `Module.Flat.instTensorProduct` and projective by `Module.Projective.tensorProduct`, carried
  along the equivalences by `Module.Flat.of_linearEquiv` and `Module.Projective.of_equiv'`.
- Exactness in each degree `n`. For flat `A`, `M' ⊗[k] A^{⊗n} → M ⊗[k] A^{⊗n}` is injective
  (`Module.Flat.rTensor_preserves_injective_linearMap` with the first bullet), and
  `− ⊗[k] A^{⊗n}` keeps the rest of the sequence exact (`rTensor_exact`,
  `LinearMap.rTensor_surjective`). For projective `A`, through `PiTensorProduct.lift`, a cochain in
  `C^n(A,M'')` is a `k`-linear map `A^{⊗n} → M''`, which lifts along `M → M''`
  (`Module.projective_lifting_property` with the first bullet), and `Hom_k(A^{⊗n}, −)` is left
  exact. A `k`-linear splitting of the sequence splits it again after `− ⊗[k] A^{⊗n}` or
  `Hom_k(A^{⊗n}, −)` is applied, whatever `A` is.

**Checks.**

- Chains need the hypothesis. Take `k = ℤ` and `A = ℤ[ε]/(ε², 2ε) = ℤ ⊕ (ℤ/2)ε`, which is not flat
  over `ℤ`. Make `ℤ` and `ℤ/2` into `A`-bimodules through the ring map `A → ℤ`, `ε ↦ 0`. The
  sequence `0 → ℤ --2--> ℤ → ℤ/2 → 0` of bimodules is exact and not split over `ℤ`. Here
  `C₁(A, ℤ) = ℤ ⊗_ℤ A ≅ ℤ ⊕ ℤ/2`, and the map induced by `2` sends `1 ⊗ ε ≠ 0` to `1 ⊗ 2ε = 0`. So
  `C₁(A, ℤ) → C₁(A, ℤ)` is not injective, and the sequence of complexes is not exact on the left.
- Cochains need the hypothesis, in the same example. The cochain in `C¹(A, ℤ/2)` sending `ε` to `1`
  and `1` to `0` has no lift to `C¹(A, ℤ)`, because every `ℤ`-linear map `A → ℤ` kills the torsion
  element `ε`. So `C¹(A, ℤ) → C¹(A, ℤ/2)` is not surjective.
- A `k`-split sequence needs nothing of `A`. Take `k = ℤ`, `A = 𝔽₂` (neither flat nor projective
  over `ℤ`) and the split sequence `0 → 𝔽₂ → 𝔽₂² → 𝔽₂ → 0` of `𝔽₂`-bimodules. For an `𝔽₂`-module
  `M`, `𝔽₂^{⊗n} = 𝔽₂` for `n ≥ 1`, `M ⊗_ℤ 𝔽₂ = M` and `Hom_ℤ(𝔽₂, M) = M`. So in every degree both
  the chain sequence and the cochain sequence are the given sequence, which is exact.

### 1.5 Commutative algebras

For a commutative `k`-algebra `R` and an `R`-bimodule `M`, give `C_•(R,M)` the structure of a
complex of `R`-modules through the left action on the coefficient factor,
`r · (m ⊗ a₁ ⊗ ⋯ ⊗ a_n) = (r m) ⊗ a₁ ⊗ ⋯ ⊗ a_n`, and `C^•(R,M)` through the left action on values,
`(r · f)(a₁,…,a_n) = r f(a₁,…,a_n)`; prove that `b` and `δ` are `R`-linear, so that `HH_n(R,M)` and
`HH^n(R,M)` are `R`-modules, and that restricting scalars along `k → R` recovers the complexes of
§§1.1–1.2 (Ginz05 lines 2161–2166 for the action of the centre).

*Needs:* §§1.1–1.3; Mathlib `ModuleCat.restrictScalars`.

- The `R`-linearity of `b` uses `(r m) a₁ = r (m a₁)` and `a_n (r m) = r (a_n m)`; the second needs
  `R` commutative.
- The `R`-structure on `HH^1(R,M)` restricted to derivations is the pointwise one, which for a
  symmetric `M` is the module structure of Mathlib's `Derivation k R M`.
- The structures are natural in `M` and compatible with the functoriality of §1.3 along
  homomorphisms of commutative algebras.

**Checks.**

- For `R = k[x]` with `k` nonzero and `M = R`, `HH₁(R,R)` is the free `R`-module on the class of
  `1 ⊗ x` (§3.4), so `x · [1 ⊗ x] = [x ⊗ x]` is nonzero. An action through the first algebra factor instead,
  `x · (r ⊗ s ⊗ t) = r ⊗ x s ⊗ t`, is not compatible with `b`: `b(1 ⊗ x ⊗ 1) = x ⊗ 1` while the
  same action applied to `b(1 ⊗ 1 ⊗ 1) = 1 ⊗ 1` gives `1 ⊗ x`, and `x ⊗ 1 − 1 ⊗ x ≠ 0` in
  `k[x] ⊗ k[x]` for nonzero `k`.
- For `R = k`, the `R`-structure is the `k`-structure and nothing new is added.
- For the noncommutative `A = Mat₂(k)` with `k` nonzero and `M = A`, left multiplication by `E₁₁`
  does not commute with `b`: `b(E₁₁ E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂` while `E₁₁ b(E₁₂ ⊗ E₂₁) = E₁₁`, so the
  construction needs commutativity of the acting ring.

### Examples

The algebra `k` itself has `HH₀ = HH⁰ = k` and no higher groups. For the matrix algebra
`Mat₂(k)` the degree-one boundary `E₁₂ ⊗ E₂₁ ↦ E₁₁ − E₂₂` already shows the role of the
wrap-around face. For `k[x]` the degree-one chains are all cycles.

### Dependencies

Mathlib's simplicial objects, alternating (co)face complexes, tensor powers, multilinear maps,
homology sequences, and flat and projective modules with their tensor products and the right
exactness of `− ⊗[k] Q` (§1.4); Tau Ceti's bimodule cofaces and coboundary
(`TauCeti.hochschildBimoduleCoface`, `TauCeti.hochschildBimoduleCoboundary`). No roadmap supplier
is used in this layer.

## Layer 2: Normalisation

### 2.1 Normalised chains

Define the normalised Hochschild chain complex `N_•(A,M)` as the quotient of `C_•(A,M)` by its
degenerate subcomplex `D_•`, where `D_n` is the sum of the images of the degeneracies
`s_j : X_{n−1} → X_n`. Prove that `D_•` is a subcomplex, that `D_n` is the kernel of
`M ⊗ A^{⊗n} → M ⊗ Ā^{⊗n}` (right exactness of the tensor product, no flatness), so that
`N_n(A,M) ≅ M ⊗[k] Ā^{⊗n}` with the differential induced by `b`, and that the quotient map
`C_•(A,M) → N_•(A,M)` is a homotopy equivalence of complexes of `k`-modules, for every commutative
ring `k` (Ginz05 §4.5, lines 894–931, for the reduced bar complex over an algebraically closed field
of characteristic zero; Loday98 §1.1 for
the normalised Hochschild complex). One route: by `AlgebraicTopology.DoldKan.degeneraciesVanish_iff_QInfty_f_comp`,
the image of `QInfty` is `D_•`, so the quotient is identified with the image of `PInfty`, which is
the normalised Moore complex; then apply
`AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`.

*Needs:* §1.1; Mathlib `AlgebraicTopology.DoldKan.PInfty`, `AlgebraicTopology.DoldKan.QInfty`,
`AlgebraicTopology.DoldKan.degeneraciesVanish_iff_QInfty_f_comp`,
`AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
`HomotopyEquiv`, `TensorPower.mulEquiv`, `TensorPower.cast`, `PiTensorProduct.subsingletonEquiv`
(for the comparison with Tau Ceti); Tau Ceti `TauCeti.degenerateHochschildChains`,
`TauCeti.normalizedHochschildChains`, `TauCeti.normalizedHochschildChains.b_tensor`,
`TauCeti.normalizedHochschildChains.chainComplex` (for the comparison only).

- `N₀(A,M) = M`, and the class of `m ⊗ a₁ ⊗ ⋯ ⊗ a_n` vanishes in `N_n` whenever some `a_i ∈ k·1`.
- The quotient map induces isomorphisms `HH_n(A,M) ≅ H_n(N_•(A,M))` for all `n`, natural in `M`.
- The homotopy inverse and the homotopy are natural in `M` and in `A`.
- For `M = A`, the `k`-linear isomorphism `A ⊗[k] A^{⊗n} ≅ ⨂[k]^{n+1} A`,
  `a₀ ⊗ (a₁ ⊗ ⋯ ⊗ a_n) ↦ a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n` with the coefficient in slot `0`, carries `D_n` onto
  `TauCeti.degenerateHochschildChains k A n`, since the image of the degeneracy `s_j` is spanned by
  the tensors with `1` in slot `j + 1`. It carries `b : C_{n+1}(A,A) → C_n(A,A)` to the alternating
  sum of the pinned faces (`TauCeti.normalizedHochschildChains.b_tensor`) with the same signs: `d₀`,
  which multiplies `a₀a₁`, is the pinned face `0`, and the last face `a_{n+1}a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n`, with
  sign `(−1)^{n+1}`, is the pinned last face. So it induces an isomorphism of chain complexes
  `N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`, in degree `n` an isomorphism
  `N_n(A,A) ≅ TauCeti.normalizedHochschildChains k A n`.

**Checks.**

- In degree one, `b(m ⊗ 1 ⊗ 1) = m ⊗ 1 − m ⊗ 1 + m ⊗ 1 = m ⊗ 1`, so the degenerate chain `m ⊗ 1` is a
  boundary, as the theorem requires.
- For `A = M = k`, `Ā = 0`, so `N_n = 0` for `n ≥ 1` and `N₀ = k`, in agreement with §1.1 Checks.
- For nonzero `k`, the span of the tensors with `a₁ ∈ k·x` in `C₂(k[x],k[x])` is not a subcomplex:
  `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²` has a component `1 ⊗ x²` outside it. Only the unit gives a
  subcomplex.
- Comparison with Tau Ceti for `A = M = k[x]` and nonzero `k`: `D₁` is spanned by the `m ⊗ 1` and
  the pinned degenerate tensors of degree one are the `a₀ ⊗ 1`, the same span; in degree one both
  boundaries send `a₀ ⊗ a₁` to `a₀a₁ − a₁a₀`. Putting the coefficient in the last slot instead
  (`m ⊗ a ↦ a ⊗ m`) would send `x ⊗ 1 ∈ D₁` to `1 ⊗ x`, which is nonzero in the pinned degree-one
  normalised chains `(A ⊗ A)/(A ⊗ 1) ≅ A ⊗ Ā`.

### 2.2 Normalised cochains

Define the normalised Hochschild cochain complex `N^•(A,M)` as the subcomplex of `C^•(A,M)` of
cochains `f` with `f(a₁,…,a_n) = 0` whenever some `a_i = 1`, the intersection of the kernels of the
codegeneracies. Prove that it is a subcomplex, that `N^n(A,M) ≅ MultilinearMap k (fun _ ↦ Ā) M`,
and that the inclusion `N^•(A,M) → C^•(A,M)` is a homotopy equivalence for every commutative ring
`k` (Ginz05 §5.7, lines 1120–1128, over an algebraically closed field of characteristic zero;
Loday98 §1.1, §1.5). One route: apply §2.1's
argument to `Y(A,M)` viewed as a simplicial object of `(ModuleCat k)ᵒᵖ`, where the quotient by
degeneracies becomes the intersection of the kernels of the codegeneracies.

*Needs:* §1.2; the Mathlib declarations of §2.1; the abelian structure of the opposite category
(`Mathlib/CategoryTheory/Abelian/Opposite.lean`); Tau Ceti `TauCeti.hochschildCochainComplex`,
`TauCeti.hochschildCocycles`, `TauCeti.hochschildCoboundaries`, `TauCeti.hochschildCohomology`,
`TauCeti.hochschildCohomology.mk`, `TauCeti.normalizedHochschildCochains`,
`TauCeti.normalizedHochschildCochains_zero`, `TauCeti.normalizedHochschildCochainComplex`,
`TauCeti.normalizedHochschildCochainComplexι`,
`TauCeti.multilinearCurryFirstEquiv`, `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`,
`TauCeti.DualBimodule.instModule`, `TauCeti.DualBimodule.instModuleOp` (for the comparison only).

- `N⁰(A,M) = M`; a 1-cochain is normalised exactly when `f(1) = 0`.
- The inclusion induces `H^n(N^•(A,M)) ≅ HH^n(A,M)`, natural in `M`.
- Every class of `HH^n(A,M)` is represented by a normalised cocycle.
- For a `k`-module `N` and `M = A →ₗ[k] N` with the dual bimodule structure
  `(a · g)(x) = g(x a)`, `(g · a)(x) = g(a x)` (the scoped instances of `TauCeti.DualBimodule`),
  currying the first argument, `φ ↦ ((a₁,…,a_n) ↦ (x ↦ φ(x, a₁,…,a_n)))`
  (`TauCeti.multilinearCurryFirstEquiv`), is an isomorphism of cochain complexes
  `TauCeti.hochschildCochainComplex k A N ≅ C^•(A, A →ₗ[k] N)`, since it carries the pinned `b` to
  `δ` (`TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`). Hence it carries
  `TauCeti.hochschildCocycles k A N n` onto `Z^n(A, A →ₗ[k] N)` and
  `TauCeti.hochschildCoboundaries k A N n` onto `B^n(A, A →ₗ[k] N)` (both `0` in degree zero), and
  induces `TauCeti.hochschildCohomology k A N n ≅ HH^n(A, A →ₗ[k] N)` in every degree, carrying
  `TauCeti.hochschildCohomology.mk` to the class map `Z^n → HH^n`. The pinned condition concerns
  the arguments in slots `1,…,n`, which are `a₁,…,a_n` after currying, so it restricts to an
  isomorphism of `TauCeti.normalizedHochschildCochains k A N n` onto `N^n(A, A →ₗ[k] N)` in every
  degree (both are everything in degree zero), hence of complexes
  `TauCeti.normalizedHochschildCochainComplex k A N ≅ N^•(A, A →ₗ[k] N)`, and the square formed with
  `TauCeti.normalizedHochschildCochainComplexι` and the inclusion `N^• → C^•` commutes.
- On the pinned complexes the normalisation theorem reads: for every commutative ring `k`, every
  `k`-algebra `A` and every `k`-module `N`, there is a homotopy equivalence from
  `TauCeti.normalizedHochschildCochainComplex k A N` to `TauCeti.hochschildCochainComplex k A N`
  whose underlying chain map is `TauCeti.normalizedHochschildCochainComplexι k A N`
  (`exists_homotopyEquiv_normalizedHochschildCochainComplexι`); it is the homotopy equivalence
  `N^•(A, A →ₗ[k] N) → C^•(A, A →ₗ[k] N)` transported along the two isomorphisms of the previous
  bullet.

**Checks.**

- Every derivation `D` is normalised, since `D(1) = D(1·1) = 2D(1)`; the inner derivation `δm` is
  normalised since `δm(1) = m − m = 0`.
- For `g ∈ C¹(k[x],k[x])` with `g(1) = 1` and `g(x^j) = 0` for `j ≥ 1`, the coboundary `δg` has
  `δg(1,1) = 1`; for nonzero `k` it is a cocycle that is not normalised, and its class is that of
  `0 ∈ N²`.
- For `A = k`, `N^n = 0` for `n ≥ 1` and `N⁰ = M`, in agreement with §1.2 Checks.
- The pinned complexes for `A = N = k`: every term of `TauCeti.hochschildCochainComplex k k k` is
  `k`, its differential from degree `n` is multiplication by `Σ_{i=0}^{n+1} (−1)^i`, that is
  `0, 1, 0, 1, …`, and the pinned normalised complex is `k` in degree zero and `0` above (a
  multilinear map on `k^{n+1}` that vanishes when `a₁ = 1` is `0`). The inclusion is a homotopy
  equivalence, both complexes having cohomology `k` in degree zero and `0` above. Asking the
  normalised cochains to vanish also when the zeroth argument is `1` would make the normalised
  complex `0` and lose `H⁰ = k`.
- Comparison with Tau Ceti for `A = k[x]`, `N = k` and nonzero `k`, with `∂ = ∂_x`: the pinned
  cochain `φ(a₀,a₁) = (a₀ ∂a₁)(0)` has `φ(a₀,1) = 0`, so it is normalised, and
  `bφ(a₀,a₁,a₂) = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`. Its curried form `ψ(a₁)(y) = φ(y,a₁)` has
  `ψ(1) = 0`, so `ψ ∈ N¹(A, A →ₗ[k] k)`, and `ψ` is a derivation into the dual bimodule, as it must
  be: `ψ(ab)(y) = (y a ∂b)(0) + (y b ∂a)(0) = (a · ψ(b))(y) + (ψ(a) · b)(y)`. Currying the last
  argument instead, `ψ′(a)(y) = φ(a,y)`, gives `ψ′(1)(x) = φ(1,x) = 1 ≠ 0`: that choice of slot does
  not carry normalised cochains to normalised ones.
- Comparison of cohomology classes in the same example: since `A = k[x]` is commutative, the pinned
  coboundaries of degree one are `0` (`bχ(a₀,a₁) = χ(a₀a₁) − χ(a₁a₀) = 0`) and so are the inner
  derivations into `A →ₗ[k] k` (`(a · g)(y) = g(ya) = g(ay) = (g · a)(y)`), so the pinned class
  `TauCeti.hochschildCohomology.mk` of `φ` is nonzero, as is the class of `ψ` in
  `HH¹(A, A →ₗ[k] k)` (`ψ(x)(1) = φ(1,x) = 1`). In degree zero the pinned cocycles are the traces,
  the `χ : A → N` with `χ(ab) = χ(ba)` (`TauCeti.mem_hochschildCocycles_zero_iff`), and
  `HH⁰(A, A →ₗ[k] N) = Z⁰` is the set of `g` with `a · g = g · a`, that is `g(ya) = g(ay)`: the same
  set, for every `A`. The pinned cohomology is not `HH^n(A,N)` for a bimodule structure on `N`:
  for `N = k` with `x` acting by `0` on both sides, `HH⁰(k[x], k) = k`, while the pinned
  degree-zero cohomology is all of `Hom_k(k[x], k)` (on a commutative algebra every functional is a
  trace), which surjects onto `k²` by `χ ↦ (χ(1), χ(x))`, and `k` does not for nonzero `k`.

### Examples

For `A = k[x]` the normalised complex replaces `k[x]^{⊗n}` by `(k[x]/k)^{⊗n}`; the cycle `1 ⊗ x`
survives as `1 ⊗ x̄`. Normalised 2-cocycles give square-zero extensions in which `(1,0)` is the
unit (§3.5).

### Dependencies

Layer 1; Mathlib's Dold–Kan normalisation and tensor powers; Tau Ceti's normalised chains of an
algebra with coefficients in itself (`TauCeti.normalizedHochschildChains`), for the comparison of
§2.1, and its cochains and normalised cochains with values in a `k`-module, their cohomology, and
the currying comparison to the dual bimodule (`TauCeti.hochschildCohomology`,
`TauCeti.normalizedHochschildCochainComplex`,
`TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`), for the comparison of §2.2. No roadmap
supplier is used; NoncommutativeGeometry N1.Cyclic also states the complex cases of the comparison
of §2.1 with `A ⊗ Ā^{⊗n}` and of the comparison of §2.2 between normalised and full scalar
cochains, which this layer states over every `k` (Scope and ownership).

## Layer 3: Low degrees and square-zero extensions

### 3.1 Hochschild homology in degree zero

Prove that `HH₀(A,M) ≅ M/[A,M]`, where `[A,M]` is the `k`-span of the elements `a m − m a`,
naturally in `M` (Ginz05 lines 941–953; Loday98 §1.1).

*Needs:* §1.1.

**Checks.**

- `HH₀(Mat₂(k)) ≅ k`: the commutators `E_{ij} = [E_{ij}, E_{jj}]` (`i ≠ j`) and `E_{ii} − E_{jj}` span
  the trace-zero matrices over every commutative `k` (Ginz05 lines 1001–1030). The variant with
  `m a_n` in the last face of §1.1 would give `Mat₂(k)` here.
- For every `n ≥ 1` the trace induces `HH₀(Mat_n(k)) ≅ k`: the same commutators span the
  trace-zero matrices, and at `n = 1` the trace is the identity of `k`. The bound `n ≥ 1` is needed:
  `Mat₀(k)` is the zero ring, so `HH₀(Mat₀(k)) = 0`, and the trace `0 → k` is not an isomorphism for
  nonzero `k`.
- For commutative `A` and symmetric `M`, `[A,M] = 0` and `HH₀(A,M) = M`.

### 3.2 Hochschild cohomology in degree zero

Prove that `HH⁰(A,M) ≅ M^A = {m ∈ M | a m = m a for all a}`, naturally in `M`, and that for `M = A`
this is the centre `Subalgebra.center k A` as a `k`-module (Ginz05 lines 1066–1069; Loday98 §1.5).
One route: `B⁰ = 0`, and `TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty_eq_zero_iff`
identifies `Z⁰(A,M)` with the central elements of `M`.

*Needs:* §1.2; Mathlib `Subalgebra.center`; Tau Ceti
`TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty_eq_zero_iff`.

**Checks.**

- For `A = M = Mat₂(k)`, `HH⁰` is the set of scalar matrices `k·1`; for nonzero `k`, `E₁₂` is not
  central since `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`.
- For commutative `A = M`, `HH⁰(A,A) = A`.

### 3.3 Derivations into a bimodule and HH¹

The bimodule derivations are Tau Ceti's `TauCeti.BimoduleDerivation k A M`, the `k`-linear maps
with `D(ab) = a D(b) + D(a) b` (and `D(1) = 0`, automatic here). Define `Der_k(A,M)` as the
`k`-submodule of `A →ₗ[k] M` of their underlying linear maps, and the submodule `Inn(A,M)` of inner
derivations `a ↦ a m − m a`. Prove that `Der_k(A,M) = Z¹(A,M)` under `C¹(A,M) ≅ A →ₗ[k] M` (the
transport of `TauCeti.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero_iff`), that
`Inn(A,M) = B¹(A,M)` (by `TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty`), that
`HH¹(A,M) ≅ Der_k(A,M)/Inn(A,M)`, and that `0 → HH⁰(A,M) → M → Der_k(A,M) → HH¹(A,M) → 0` is exact,
the map `M → Der_k(A,M)` being `m ↦ δm` (Ginz05 §3.1, lines 398–411, and §5.4, lines 1075–1085;
Weibel94 §9.2; CE56 Chapter IX).

*Needs:* §§1.2, 3.2; Mathlib `Derivation`, `TrivSqZeroExt`, `TrivSqZeroExt.fstHom`; Tau Ceti
`TauCeti.BimoduleDerivation`, `TauCeti.BimoduleDerivation.map_algebraMap`,
`TauCeti.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero_iff`,
`TauCeti.hochschildBimoduleCoboundary_constOfIsEmpty`, `TauCeti.derivationLieAlgebra`,
`TauCeti.innerDerivation`, `TauCeti.derivationEquivDerivationLieAlgebra`.

- A `k`-linear `D : A → M` is a derivation if and only if `a ↦ (a, D a)` is a `k`-algebra
  homomorphism `A → TrivSqZeroExt A M` whose composite with `TrivSqZeroExt.fstHom` is the identity;
  every such section arises from a unique derivation. For commutative `A` and a symmetric `M` this
  is the bijection of DerivedModuleAlgebra §0.5, and Mathlib's `derivationToSquareZeroEquivLift`
  applied to the square-zero ideal `0 × M` of `TrivSqZeroExt A M`; the statement here allows a
  noncommutative `A`.
- For commutative `R` and an `R`-module `M`, `Der_k(R,M)` is the image of Mathlib's
  `Derivation k R M`, as `k`-modules and as `R`-modules (§1.5).
- For `M = A`, `Der_k(A,A)` is the underlying submodule of `TauCeti.derivationLieAlgebra k A`, and
  `TauCeti.innerDerivation z = −δz`, so `Inn(A,A)` is its range.
- Derivations kill `k·1` (`TauCeti.BimoduleDerivation.map_algebraMap`), compose with bimodule
  maps, and pull back along algebra maps compatibly with §1.3.

**Checks.**

- For `A = M = k[x]`, `D ↦ D(x)` identifies `Der_k(A,A)` with `k[x]`, and `Inn = 0`, so
  `HH¹(k[x],k[x]) ≅ k[x]`, free of rank one on `∂_x`.
- For `A = M = Mat₂(k)`, every derivation is inner and `HH¹ = 0`; the derivation `δE₁₁` sends `E₁₂`
  to `E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`. For nonzero `k`, the identity map of `k[x]` is not a derivation,
  since it sends `1` to `1 ≠ 0`; over the zero ring it is the zero map, a derivation.
- Dropping the condition `D(1) = 0` of `TauCeti.BimoduleDerivation` loses nothing over an additive
  group `M`: the Leibniz rule at `a = b = 1` gives `D(1) = 2D(1)`, hence `D(1) = 0`; for the
  derivation `∂_x` of `ℤ[x]` both conditions hold, and the map `1 ↦ 1`, `x^j ↦ 0` for `j ≥ 1` fails
  both.
- `TauCeti.innerDerivation E₁₁` sends `E₁₂` to `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ = −(δE₁₁)(E₁₂)`, pinning the
  sign between the two conventions.

### 3.4 Hochschild homology in degree one of a commutative algebra

For every commutative `k`-algebra `R`, flat or not, prove that `[r₀ ⊗ r₁] ↦ r₀ dr₁` is a well-defined
`R`-linear isomorphism `HH₁(R,R) ≅ Ω¹_{R/k}` with inverse `r dr′ ↦ [r ⊗ r′]` (Ginz05 §8.1,
lines 1914–1926; Loday98 §1.1). One route: the degree-one boundary is zero, `b(1 ⊗ a ⊗ c) =
a ⊗ c − 1 ⊗ ac + c ⊗ a` shows that `a ↦ [1 ⊗ a]` is a derivation into `HH₁`, and
`KaehlerDifferential.linearMapEquivDerivation` gives the inverse map. On Tau Ceti's normalised
chains, whose first homology is `HH₁(R,R)` by §2.1, the existence of a `k`-linear isomorphism
from the first homology of `TauCeti.normalizedHochschildChains.chainComplex k R` to `Ω¹_{R/k}`
sending the class of every tensor `r₀ ⊗ r₁` (each a cycle) to `r₀ dr₁` is
`homology_one_linearEquiv_kaehler`; the same route proves it, the degenerate tensors `r₀ ⊗ 1` going
to `r₀ d1 = 0`.

*Needs:* §§1.1, 1.5; §2.1 (only to read the stated form, on Tau Ceti's normalised chains, as
`HH₁(R,R)`); Mathlib `KaehlerDifferential`, `KaehlerDifferential.D`,
`KaehlerDifferential.linearMapEquivDerivation`, `KaehlerDifferential.span_range_derivation`,
`HomologicalComplex.iCycles`, `HomologicalComplex.homologyπ`; Tau Ceti
`TauCeti.normalizedHochschildChains.chainComplex`,
`TauCeti.normalizedHochschildChains.chainComplexXIso`, `TauCeti.normalizedHochschildChains.tensor`,
`TauCeti.normalizedHochschildChains.b_tensor` (for the stated form).

**Checks.**

- For `R = k[x]/(x²)`, `Ω¹_{R/k} = R dx/(2x dx)`: over `𝔽₂` it is free of rank one over `R`
  (dimension `2`), over `ℚ` it is `ℚ dx` (dimension `1`); the theorem gives the same dimensions for
  `HH₁`.
- For `k = ℤ` and `R = 𝔽_p`, `Ω¹ = 0`, and the classical `HH₁(𝔽_p,𝔽_p)` vanishes: every `C_n` is
  `𝔽_p` and `b_n` is multiplication by `Σ_{i=0}^{n}(−1)^i`, so `b₂` is surjective onto `C₁`.
- For `R = k`, both sides vanish.
- The coefficient sits in slot `0`: the class of `r₀ ⊗ r₁` goes to `r₀ dr₁`. The transposed
  assignment `[r₀ ⊗ r₁] ↦ r₁ dr₀` is not well defined: for `R = k[x]` with `k` nonzero, `x ⊗ 1` is
  zero in Tau Ceti's normalised chains (a `1` in slot `1`) and is the boundary `b(x ⊗ 1 ⊗ 1)` in
  `C₁(R,R)`, but would go to `dx ≠ 0`. In the same example `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²`, so
  `[1 ⊗ x²] = 2[x ⊗ x]`, matching `d(x²) = 2x dx`.

### 3.5 Twisted square-zero extensions

For `f ∈ C²(A,M)` define the twisted square-zero extension `A ⊕_f M`: the `k`-module `A × M` with
`(a,m)(a′,m′) = (aa′, a m′ + m a′ + f(a,a′))`. Prove that this product is associative if and only if
`δf = 0`; that for a cocycle `f` it is a unital `k`-algebra with unit `(1, −f(1,1))`; that the first
projection is a surjective `k`-algebra homomorphism whose kernel `0 × M` has square zero and
induces the given bimodule structure, with `k`-linear section `a ↦ (a,0)`; that `A ⊕₀ M` is
`TrivSqZeroExt A M`; and that for `g ∈ C¹(A,M)` the map `(a,m) ↦ (a, m + g(a))` is a `k`-algebra
isomorphism `A ⊕_f M ≅ A ⊕_{f − δg} M` over `A` and under `M` (Ginz05 §5.5, lines 1088–1106;
Weibel94 §9.3).

*Needs:* §§1.2, 2.2, 3.3; Mathlib `TrivSqZeroExt`, `TrivSqZeroExt.algebra'`,
`TrivSqZeroExt.fstHom`, `TrivSqZeroExt.inr`.

- The cocycle identity at `(1,1,a)` and `(a,1,1)` gives `f(1,a) = f(1,1) a` and `f(a,1) = a f(1,1)`,
  which is why `(1, −f(1,1))` is the unit; for normalised `f` the unit is `(1,0)` and the section
  `a ↦ (a,0)` is unital.
- The inclusion `m ↦ (0,m)` is a `k`-linear map with `(0,m)(0,m′) = 0`,
  `(a,m′′)(0,m) = (0, a m)` and `(0,m)(a,m′′) = (0, m a)`.
- The construction is functorial in bimodule maps `M → M′` (pushing `f` forward) and natural in
  algebra maps (pulling `f` back).

**Checks.**

- For `f = 0` the product `(a,m)(a′,m′) = (aa′, a m′ + m a′)` is that of `TrivSqZeroExt A M`.
- For nonzero `k`, `A = k[x]/(x²)`, `M = k` with `x` acting by `0` on both sides, and the 2-cochain
  with `f(x,x) = 1` and `f = 0` on the other pairs of basis elements `1, x`, the cocycle identity
  holds and `t = (x,0)` satisfies `t² = (0,1) ≠ 0` and `t³ = 0`, so `A ⊕_f M ≅ k[t]/(t³)`. An algebra
  section would send `x` to some `(x,c) = t + c t²` with `c ∈ k`, whose square is `t² ≠ 0` although
  `x² = 0`, so this extension does not split.
  Over the zero ring every term is `0` and the extension splits uniquely.
- For nonzero `k`, `A = k[x]`, `M = k` with `x` acting by `0`, and `f(x, x²) = 1`, `f = 0` on the
  other pairs of monomials, `δf(x,x,x) = 1`, and indeed `((x,0)(x,0))(x,0) = (x³,0)` while
  `(x,0)((x,0)(x,0)) = (x³,1)`: associativity fails exactly when the cocycle identity does.
- For the coboundary `f = δg` with `g(1) = 1`, `g(x^j) = 0` for `j ≥ 1` on `k[x]`, `f(1,1) = 1` and,
  for nonzero `k`, `(1,0)` is not a unit of `A ⊕_f A`: `(1,0)(x,0) = (x, f(1,x)) = (x, x)`.

### 3.6 HH² classifies split square-zero extensions

A `k`-split square-zero extension of `A` by `M` is a `k`-algebra `E` with a surjective `k`-algebra
homomorphism `p : E → A`, an injective `k`-linear `i : M → E` with range `ker p` and `i(m) i(m′) = 0`,
satisfying `e · i(m) = i(p(e) m)` and `i(m) · e = i(m p(e))`, which admits a `k`-linear section of
`p`. Prove: (a) for such an extension and a `k`-linear section `s`, the cochain
`f_s(a,a′) = i⁻¹(s(a) s(a′) − s(aa′))` is a 2-cocycle and `(a,m) ↦ s(a) + i(m)` is an isomorphism
`A ⊕_{f_s} M ≅ E` compatible with the projections and inclusions; (b) changing `s` changes `f_s` by
a coboundary; (c) `A ⊕_f M ≅ A ⊕_{f′} M` compatibly with projections and inclusions if and only
if `f − f′ ∈ B²(A,M)`; (d) the projection of `A ⊕_f M` has a `k`-algebra section if and only if
`[f] = 0` in `HH²(A,M)`. Hence `HH²(A,M)` is in bijection with the isomorphism classes of
`k`-split square-zero extensions of `A` by `M` inducing the given bimodule structure, the class
`0` corresponding to `TrivSqZeroExt A M` (Ginz05 §5.5, lines 1088–1111, and Remark 5.5.1;
Weibel94 §9.3).

*Needs:* §3.5; Mathlib `TrivSqZeroExt`, `TrivSqZeroExt.fstHom`; for the comparison below, Tau Ceti
`TauCeti.SquareZeroExtension`, `TauCeti.SquareZeroExtension.Splitting`,
`TauCeti.SquareZeroExtension.ι_algebraMap_smul`, `TauCeti.Exal`,
`TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff`.

- For commutative `R`, an `R`-module `M` regarded as the symmetric bimodule, and a 2-cocycle
  `f ∈ C²(R,M)`, the ring `R ⊕_f M` is commutative if and only if `f(a,b) = f(b,a)` for all `a, b`
  (the commutator of `(a,m)` and `(b,m′)` is `(0, f(a,b) − f(b,a))`). For symmetric `f`, the first
  projection and `m ↦ (0,m)` make `R ⊕_f M` a `TauCeti.SquareZeroExtension k R M`, whose splittings
  (`TauCeti.SquareZeroExtension.Splitting`) are exactly the `k`-algebra sections of (d); hence its
  class in `TauCeti.Exal k R M` is `0` (`TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff`) if
  and only if `[f] = 0` in `HH²(R,M)`. Conversely a `TauCeti.SquareZeroExtension k R M` with a
  `k`-linear section of its projection is a `k`-split extension in the sense above (its `ι` is
  `k`-linear by `TauCeti.SquareZeroExtension.ι_algebraMap_smul`), and its cocycles `f_s` of (a) are
  symmetric. Every coboundary `δg(a,b) = a g(b) − g(ab) + b g(a)` is symmetric, so a class that
  contains a symmetric cocycle consists of symmetric cocycles, and (a)–(c) identify the isomorphism
  classes of commutative `k`-split square-zero extensions of `R` by `M` with these classes of
  `HH²(R,M)`.

**Checks.**

- For `k = ℤ`, `A = 𝔽₂` and `M = 𝔽₂`, every `C^n` is `𝔽₂` and `δ : C¹ → C²` is the identity, so
  `HH²(𝔽₂, 𝔽₂) = 0`; yet `ℤ/4 → 𝔽₂` is a square-zero extension by `2ℤ/4 ≅ 𝔽₂` with no ring section.
  It is not `ℤ`-split, so the `k`-splitting hypothesis cannot be dropped.
- `HH²(k, M) = 0` for every `k`-module `M` (the computation of §1.2 Checks with `M` in place of the
  coefficients `k`), and indeed
  `k[ε]/ε² → k` splits through the structure map; for commutative extensions this is Tau Ceti's
  `TauCeti.Exal.subsingleton_self`.
- For nonzero `k`, the extension `k[t]/(t³) → k[x]/(x²)` by `k·t²` is `k`-split and does not split
  as algebras (§3.5 Checks), so its class in `HH²(k[x]/(x²), k)` is nonzero.
- The comparison with `TauCeti.SquareZeroExtension` separates three cases. For nonzero `k`,
  `R = k[x]/(x²)`, `M = k` and the symmetric cocycle `f(x,x) = 1` of §3.5 Checks, `R ⊕_f M ≅ k[t]/(t³)`
  is commutative and is a `TauCeti.SquareZeroExtension k R k` with no splitting (a section sends `x`
  to some `t + c t²`, whose square is `t² ≠ 0`), so its class is nonzero both in `TauCeti.Exal k R k`
  and in `HH²(R,k)`. For `k = ℤ` and `R = M = 𝔽₂`, `ℤ/4 → 𝔽₂` with `ι(1) = 2` is a
  `TauCeti.SquareZeroExtension ℤ 𝔽₂ 𝔽₂` with no splitting, so its class in `TauCeti.Exal ℤ 𝔽₂ 𝔽₂` is
  nonzero, while it has no `ℤ`-linear section (a `ℤ`-linear map `𝔽₂ → ℤ/4` takes values in `{0, 2}`)
  and `HH²(𝔽₂,𝔽₂) = 0`: it lies outside §3.6. For nonzero `k`, `R = M = k[x,y]` and the cocycle
  `f(a,b) = ∂_x a · ∂_y b` (that is `∂_x ∪ ∂_y`), `f(x,y) = 1 ≠ 0 = f(y,x)`, so
  `(x,0)(y,0) = (xy,1) ≠ (xy,0) = (y,0)(x,0)`: `R ⊕_f M` is not commutative and is no
  `TauCeti.SquareZeroExtension`, and since coboundaries are symmetric, `f` is cohomologous to no
  symmetric cocycle and `[f] ≠ 0` in `HH²(k[x,y],k[x,y])`. A comparison that ignored commutativity
  would misplace the third extension, and one that dropped the `k`-splitting the second.

### Examples

`HH₀(Mat_n(k)) ≅ k` through the trace for every `n ≥ 1` (for `n = 0` the matrix ring is zero and
so is `HH₀`); `HH⁰(Mat₂(k)) = k`; `HH¹(k[x]) ≅ k[x]`; `HH₁(k[x]) ≅ k[x] dx`. For nonzero `k`, the
extension `k[t]/(t³) → k[x]/(x²)` represents a nonzero class of `HH²(k[x]/(x²), k)`, and
`k[ε]/ε² → k` splits because `HH²(k, k) = 0`.

### Dependencies

Layers 1–2; Mathlib's `TrivSqZeroExt`, Kähler differentials, centre, and cycles and homology
classes of a complex (§3.4); Tau Ceti's normalised chains of an algebra with coefficients in itself
(`TauCeti.normalizedHochschildChains.chainComplex`), the carrier of the stated form of §3.4; its bimodule
derivations, the low-degree cocycle characterisations of its bimodule coboundary, its derivation
Lie algebra, and its commutative square-zero extensions
(`TauCeti/RingTheory/Extension/SquareZero/Basic.lean`) for the comparison of §3.6. No roadmap
supplier is used: DerivedModuleAlgebra §0.5, the owner of the commutative extensions and of the
derivation–section bijection, is cited, and the comparison of §3.6 uses only their pinned form.
DGAInfinity Layer 8's reading of `HH²(A,A)` as first-order deformations is the special case `M = A`
over `k[ε]/ε²` and is not restated.

## Layer 4: The bar resolution, Ext and Tor

### 4.1 Bimodules as modules over the enveloping algebra

Construct the equivalence between `A`-bimodules (with the conventions above) and `ModuleCat Aᵉ`,
`Aᵉ = A ⊗[k] Aᵐᵒᵖ`, through `TensorProduct.Algebra.module`, `(a ⊗ op b) · m = a m b`; the bimodule `A`
as an object of `ModuleCat Aᵉ`, whose module structure is Mathlib's `instModuleTensorProductMop`
(the same `TensorProduct.Algebra.module` on `A`; Tau Ceti's `TauCeti.Bimodule (AlgHom.id k A)` carries
the same action as an instance on a type synonym of `A`, a carrier for places where an instance is
required); and the right `Aᵉ`-module structure on a bimodule, `m · (a ⊗ op b) = b m a`, used for
balanced tensor products (Ginz05 §4.2, lines 751–752, and §5.1, lines 934–947).

*Needs:* Mathlib `Algebra.TensorProduct`, `MulOpposite`, `TensorProduct.Algebra.module`,
`instModuleTensorProductMop`, `ModuleCat`; Tau Ceti `TauCeti.BalancedTensorProduct`,
`TauCeti.Algebra.TensorProduct.moduleLeft`, `TauCeti.Algebra.TensorProduct.moduleRight`,
`TauCeti.Algebra.TensorProduct.moduleSMulCommClass`,
`TauCeti.Algebra.TensorProduct.moduleLeftIsScalarTower`,
`TauCeti.Algebra.TensorProduct.moduleRightIsScalarTower`,
`TauCeti.Algebra.TensorProduct.linearMapOfFactors`, `TauCeti.Bimodule`,
`TauCeti.Bimodule.smul_of`.

- Bimodule homomorphisms are exactly `Aᵉ`-linear maps, and the equivalence is `k`-linear. From
  bimodule maps to `Aᵉ`-linear maps this is `TauCeti.Algebra.TensorProduct.linearMapOfFactors`,
  since `(a ⊗ 1) · m = a m` and `(1 ⊗ op b) · m = m b`; the inverse functor restricts an
  `Aᵉ`-module along `TauCeti.Algebra.TensorProduct.moduleLeft` and
  `TauCeti.Algebra.TensorProduct.moduleRight` at `B = Aᵐᵒᵖ`.
- The left and right `Aᵉ`-structures on a bimodule commute with the `k`-structure, and for the
  bimodule `Aᵉ` itself they are left and right multiplication up to the swap `(Aᵉ)ᵐᵒᵖ ≅ Aᵉ`.
- `M ⊗_{Aᵉ} A ≅ M/[A,M]` through `m ⊗ a ↦ [m a]`.

**Checks.**

- For `A = Mat₂(k)` with `k` nonzero and `M = A`, `(E₁₂ ⊗ op E₂₁) · E₂₂ = E₁₂ E₂₂ E₂₁ = E₁₁`, while
  the opposite ordering `a m b` read as `b m a` would give `E₂₁ E₂₂ E₁₂ = 0`.
- For commutative `R`, `Rᵉ = R ⊗[k] Rᵐᵒᵖ ≅ R ⊗[k] R` through `AlgEquiv.toOpposite` on the second
  factor (the conventions), and the multiplication map `R ⊗ R → R` is `Rᵉ`-linear:
  `(a ⊗ op b) · (r s) = a r s b = μ((a ⊗ op b) · (r ⊗ s))`. For the noncommutative `A = Mat₂(k)` with
  `k` nonzero there is no such identification compatible with the action: `a ↦ op a` is not
  multiplicative, as `op (E₁₂ E₂₁) = op E₁₁` while `op E₁₂ · op E₂₁ = op (E₂₁ E₁₂) = op E₂₂`.
- For `A = k`, `Aᵉ = k` and bimodules are `k`-modules with equal left and right actions.

### 4.2 The bar resolution

Define the bar complex `B_•(A)`, `B_n(A) = A ⊗[k] A^{⊗n} ⊗[k] A` with the outer `Aᵉ`-action and
`b′(a₀ ⊗ ⋯ ⊗ a_{n+1}) = Σ_{i=0}^{n} (−1)^i a₀ ⊗ ⋯ ⊗ a_i a_{i+1} ⊗ ⋯ ⊗ a_{n+1}`, as the alternating face
complex of the two-sided bar simplicial `Aᵉ`-module, augmented to `A` by multiplication. Prove that
after forgetting to `k`-modules the augmented complex has the contracting homotopy
`h(a₀ ⊗ ⋯ ⊗ a_{n+1}) = 1 ⊗ a₀ ⊗ ⋯ ⊗ a_{n+1}` (an extra degeneracy), so the augmentation is a
quasi-isomorphism of complexes of `Aᵉ`-modules over every `k`; that `B_n(A) ≅ Aᵉ ⊗[k] A^{⊗n}` as
`Aᵉ`-modules; and that if `A` is projective as a `k`-module, each `B_n(A)` is a projective
`Aᵉ`-module and `B_•(A)` is a projective resolution of `A` in `ModuleCat Aᵉ` (Ginz05 §4.2,
lines 747–782; HKR62 lines 414–447; Weibel94 §9.1; Loday98 §1.1).

*Needs:* §§1.4, 4.1; Mathlib `CategoryTheory.SimplicialObject.Augmented.ExtraDegeneracy`,
`CategoryTheory.ProjectiveResolution`, `Module.Projective.tensorProduct`, `TensorPower.mulEquiv`.

- For `k`-projective `A`, `B_n(A) ≅ Aᵉ ⊗[k] A^{⊗n}` is a projective `Aᵉ`-module by
  `Module.Projective.tensorProduct`, since `Aᵉ` is free over itself and `A^{⊗n}` is `k`-projective
  (§1.4, first bullet).
- `μ ∘ h = id` on `A`, `b′ ∘ h + h ∘ μ = id` on `B₀(A)`, and `b′ ∘ h + h ∘ b′ = id` on `B_n(A)` for `n ≥ 1`.
- `B_•(A)` is natural in algebra homomorphisms, and the homotopy `h` is right `A`-linear.

**Checks.**

- On `B₀(A) = A ⊗ A`, `(h μ + b′ h)(a₁ ⊗ a₂) = 1 ⊗ a₁a₂ + a₁ ⊗ a₂ − 1 ⊗ a₁a₂ = a₁ ⊗ a₂` (Ginz05
  lines 774–782, which counts tensor factors and calls this the degree-two piece). On `B₁(A)`, the
  first degree where `h b′` is the right term,
  `(b′ h + h b′)(a₀ ⊗ a₁ ⊗ a₂) = (a₀ ⊗ a₁ ⊗ a₂ − 1 ⊗ a₀a₁ ⊗ a₂ + 1 ⊗ a₀ ⊗ a₁a₂) + (1 ⊗ a₀a₁ ⊗ a₂ − 1 ⊗ a₀ ⊗ a₁a₂) = a₀ ⊗ a₁ ⊗ a₂`.
- For `A = k`, `B_n(k) = k` with `b′_n` multiplication by `Σ_{i=0}^{n}(−1)^i`, and the augmented
  complex `⋯ → k → k → k → k → 0` is exact.
- The homotopy `h` is not left `A`-linear: for `A = k[x]` with `k` nonzero, `h(x · (1 ⊗ 1)) = 1 ⊗ x ⊗ 1` while
  `x · h(1 ⊗ 1) = x ⊗ 1 ⊗ 1`; contractibility holds over `k`, not over `Aᵉ`.

### 4.3 Cochains as bimodule homomorphisms out of the bar resolution

Prove that `φ ↦ (a₁,…,a_n) ↦ φ(1 ⊗ a₁ ⊗ ⋯ ⊗ a_n ⊗ 1)` is an isomorphism of cochain complexes
`Hom_{Aᵉ}(B_•(A), M) ≅ C^•(A,M)` over every `k`, natural in `M` (Ginz05 §5.2, lines 1033–1062;
HKR62 lines 480–489, for commutative `A` and `M = A`). The differential of the left side is
precomposition with `b′`, as in `ChainComplex.linearYonedaObj`; no sign is introduced.

*Needs:* §§1.2, 4.2; Mathlib `ChainComplex.linearYonedaObj`.

### 4.4 Hochschild cohomology as Ext

For `A` projective as a `k`-module, prove that `HH^n(A,M) ≅ Ext^n_{Aᵉ}(A,M)` as `k`-modules,
naturally in `M`, where `Ext` is `CategoryTheory.Abelian.Ext` in `ModuleCat Aᵉ`; the isomorphism
sends the class of a cocycle `f` to `ProjectiveResolution.extMk` of the corresponding
homomorphism `B_n(A) → M`. In degree zero it is `M^A ≅ Hom_{Aᵉ}(A,M)` and in degree one it sends a
derivation `D` to the class of `a₀ ⊗ a₁ ⊗ a₂ ↦ a₀ D(a₁) a₂` (Ginz05 §5.2, lines 984–988; HKR62 lines
337–351; Weibel94 §9.1; CE56 Chapter IX). The existence of a `k`-linear isomorphism
`HH^n(A,M) ≅ Ext^n_{Aᵉ}(A,M)` for every `n`, with `M` an `Aᵉ`-module through
`TensorProduct.Algebra.module`, `A` through `instModuleTensorProductMop` and the `k`-structure of
`Ext` through `ModuleCat.Algebra.instLinear`, is `nonempty_linearEquiv_ext`; the description of the
map through `extMk` and its naturality are statements about the bar resolution of §4.2. One route: through §4.3, cocycles and coboundaries of
`C^n(A,M)` are those of `Hom_{Aᵉ}(B_•(A), M)`; `f ↦ extMk f` is additive and `k`-linear
(`add_extMk`, `smul_extMk`), onto (`extMk_surjective`), and in degree `n ≥ 1` kills exactly the
coboundaries (`extMk_eq_zero_iff`); in degree zero, where there are no coboundaries, it is
injective through `extLinearEquivCohomologyClass`, and `CategoryTheory.Abelian.Ext.linearEquiv₀`
identifies the target with `Hom_{Aᵉ}(A,M) = M^A`. No hypothesis on the differentials of the bar
complex enters: for `A = k = M = ℤ`, `C¹ = ℤ` with `δ¹ = id`, so the degree-one cocycles are `0`
and `HH¹ = 0 = Ext¹`, not the whole term `C¹ = ℤ`.

*Needs:* §§1.2, 4.2–4.3; Mathlib `CategoryTheory.Abelian.Ext`, `TensorProduct.Algebra.module`,
`instModuleTensorProductMop`, `CategoryTheory.Abelian.Ext.instModule`,
`CategoryTheory.ProjectiveResolution.extMk`, `CategoryTheory.ProjectiveResolution.extMk_surjective`,
`CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff`, `CategoryTheory.ProjectiveResolution.add_extMk`,
`CategoryTheory.ProjectiveResolution.smul_extMk`,
`CategoryTheory.ProjectiveResolution.extLinearEquivCohomologyClass`,
`CategoryTheory.Abelian.Ext.linearEquiv₀`, the instance `HasExt.{u}` on `ModuleCat.{u}`,
`ModuleCat.Algebra.instLinear`.

### 4.5 Tor over the enveloping algebra and Hochschild homology

Define, for a bimodule `M`, the functor `M ⊗_{Aᵉ} − : ModuleCat Aᵉ ⥤ ModuleCat k`,
`N ↦ TauCeti.BalancedTensorProduct k Aᵉ M N` with the right structure of §4.1, and
`Tor_n^{Aᵉ}(M, −)` as its `CategoryTheory.Functor.leftDerived` functors, as Mathlib does for
`Rep.Tor`. Call a left `Aᵉ`-module `F` flat when `N ↦ N ⊗_{Aᵉ} F` sends injective maps of
bimodules to injective maps; Mathlib's `Module.Flat` requires a commutative ring of scalars and
does not apply to `Aᵉ`. Prove that `M ⊗_{Aᵉ} B_n(A) ≅ M ⊗[k] A^{⊗n}` through
`m ⊗ (a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n ⊗ a_{n+1}) ↦ a_{n+1} m a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n`, compatibly with `b`, and that for
`A` flat as a `k`-module `HH_n(A,M) ≅ Tor_n^{Aᵉ}(M,A)`, naturally in `M` (Ginz05 §5.1,
lines 944–976; Weibel94 §9.1; Loday98 §1.1). One route: for `k`-flat `A` every `A^{⊗n}` is
`k`-flat (§1.4), so `B_n(A) ≅ Aᵉ ⊗[k] A^{⊗n}` is a flat `Aᵉ`-module (fifth bullet below); the
augmentation `B_•(A) → A` is a resolution over every `k` (§4.2), so the sixth bullet below
identifies `Tor_n^{Aᵉ}(M,A)` with the homology of `M ⊗_{Aᵉ} B_•(A) ≅ C_•(A,M)`. Projectivity of `A`
over `k` is used for `Ext` (§4.4), not here.

*Needs:* §§1.1, 1.4, 4.1–4.2; Mathlib `CategoryTheory.Functor.leftDerived`,
`CategoryTheory.Functor.leftDerivedZeroIsoSelf`,
`CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`, `CategoryTheory.ProjectiveResolution`,
`Module.Flat`, `Module.Flat.rTensor_preserves_injective_linearMap`,
`CategoryTheory.ShortComplex.ShortExact.δ`, `HomologicalComplex.HomologySequence.δ_naturality`,
`CategoryTheory.Abelian.isIso_of_epi_of_isIso_of_isIso_of_mono`; Tau Ceti
`TauCeti.BalancedTensorProduct`, `TauCeti.BalancedTensorProduct.liftEquiv`,
`TauCeti.BalancedTensorProduct.outerFactors`,
`TauCeti.BalancedTensorProduct.lid`, `TauCeti.BalancedTensorProduct.rid`,
`TauCeti.BalancedTensorProduct.finsuppScalarRight`.

- For every left `Aᵉ`-module `F`, the functor `N ↦ N ⊗_{Aᵉ} F` on bimodules, and for every
  bimodule `M`, the functor `M ⊗_{Aᵉ} −` on left `Aᵉ`-modules, are `k`-linear, right exact (they
  preserve finite colimits) and commute with arbitrary direct sums, each being a left adjoint
  (Weibel94 §2.6): by `TauCeti.BalancedTensorProduct.liftEquiv` the `k`-linear maps
  `N ⊗_{Aᵉ} F → X` into a `k`-module `X` are the balanced bilinear maps, and these correspond,
  naturally in `N`, `F` and `X`, both to the `Aᵉ`-linear maps `F → Hom_k(N,X)`, where
  `(e·φ)(n) = φ(n·e)`, and to the maps `N → Hom_k(F,X)` linear for the right structures, where
  `(φ·e)(f) = φ(e·f)`. For a free bimodule `Q = (I →₀ Aᵉ)`, on whose summands the right structure of
  §4.1 is right multiplication up to the swap, `Q ⊗_{Aᵉ} F ≅ (I →₀ F)` naturally in `F`
  (`TauCeti.BalancedTensorProduct.lid` on each summand); for a free left module,
  `M ⊗_{Aᵉ} (I →₀ Aᵉ) ≅ (I →₀ M)` naturally in `M`
  (`TauCeti.BalancedTensorProduct.finsuppScalarRight`).
- `Tor_0^{Aᵉ}(M,N) ≅ M ⊗_{Aᵉ} N`, naturally in `N` (`CategoryTheory.Functor.leftDerivedZeroIsoSelf`,
  which needs the right exactness of `M ⊗_{Aᵉ} −` of the first bullet).
- `Tor_n^{Aᵉ}(M,P) = 0` for projective `P` and `n ≥ 1`.
- `Tor_n^{Aᵉ}(M,N)` is computed by any projective resolution of `N`, and is functorial in `M`.
- Free left `Aᵉ`-modules are flat: `N ⊗_{Aᵉ} (I →₀ Aᵉ) ≅ (I →₀ N)` naturally in `N` (first
  bullet), and `I →₀ −` preserves injective maps. Projective left `Aᵉ`-modules are flat too, as
  direct summands of free ones (Weibel94 §3.2): for `i : P → Q` and `r : Q → P` with `r ∘ i = id`
  and `Q` free, and an injective bimodule map `f : N → N'`, the map `f ⊗ P` is injective, because
  `(id ⊗ i) ∘ (f ⊗ P) = (f ⊗ Q) ∘ (id ⊗ i)` and `(id ⊗ r) ∘ (id ⊗ i) = id` (the argument of
  Mathlib's `Module.Flat.of_retract`, which is stated for commutative scalars only). For a flat
  `k`-module `X`, the left `Aᵉ`-module `Aᵉ ⊗[k] X`, with `Aᵉ` acting on the first factor, is flat:
  `N ⊗_{Aᵉ} (Aᵉ ⊗[k] X) ≅ N ⊗[k] X` naturally in the bimodule `N` (`TauCeti.BalancedTensorProduct.outerFactors` with
  `TauCeti.BalancedTensorProduct.rid`), and `− ⊗[k] X` preserves injective maps
  (`Module.Flat.rTensor_preserves_injective_linearMap`).
- Flat resolutions compute `Tor`: for every resolution `F_• → N` by flat left `Aᵉ`-modules,
  `Tor_n^{Aᵉ}(M,N) ≅ H_n(M ⊗_{Aᵉ} F_•)` for every `n`, naturally in `M`; with `F_• = F` in degree
  zero, `Tor_n^{Aᵉ}(M,F) = 0` for flat `F` and `n ≥ 1` (Weibel94 §3.2, over any ring). One route:
  a chain map `φ` over the identity of `N` from a projective resolution `P_•` of `N` to `F_•` exists
  because `F_•` is exact (the comparison theorem, Weibel94 §2.2; Mathlib's
  `CategoryTheory.ProjectiveResolution.lift` is the case of a projective target). Each
  `− ⊗_{Aᵉ} P_j` and `− ⊗_{Aᵉ} F_j` is right exact (first bullet) and preserves injective maps (the
  `P_j` are projective, hence flat by the fifth bullet, and the `F_j` are flat), so a short exact
  sequence of bimodules `0 → M' → M → M'' → 0` stays short exact after `− ⊗_{Aᵉ} P_•` and
  `− ⊗_{Aᵉ} F_•`, and `φ` maps the first long exact homology sequence to the second
  (`HomologicalComplex.HomologySequence.δ_naturality`). In degree zero both complexes have
  homology `M ⊗_{Aᵉ} N`, by the right exactness of `M ⊗_{Aᵉ} −` (first bullet), and `φ` induces
  its identity. For a free bimodule `Q = (I →₀ Aᵉ)`, `Q ⊗_{Aᵉ} P_•` and `Q ⊗_{Aᵉ} F_•` are
  isomorphic to `I →₀ P_•` and `I →₀ F_•` (first bullet), direct sums of copies of the two
  resolutions, and so have no homology in positive degrees. Induction on `n` with a presentation
  `0 → L → Q → M → 0`, `Q` free, and the five lemma
  (`CategoryTheory.Abelian.isIso_of_epi_of_isIso_of_isIso_of_mono`) on
  `0 → H_n(M ⊗ −) → H_{n−1}(L ⊗ −) → H_{n−1}(Q ⊗ −)` shows that `φ` induces isomorphisms in
  every degree.

**Checks.**

- `Tor_0^{Aᵉ}(M,A) ≅ M/[A,M]`, matching §3.1; for `A = M = Mat₂(k)` it is `k`.
- A flat algebra that is not projective: for `k = ℤ` and `A = M = ℚ[x]`, `A` is torsion-free,
  hence flat over `ℤ`, and not projective, since its direct summand `ℚ` is not. As
  `ℚ ⊗_ℤ ℚ = ℚ`, `C_•(A,A)` is the Hochschild complex of `ℚ[x]` over `ℚ` and `Aᵉ = ℚ[x,y]`, and
  `ℚ[x,y] --(x−y)--> ℚ[x,y] → ℚ[x]` is a free resolution
  (`x − y` is a nonzerodivisor) that becomes `ℚ[x] --0--> ℚ[x]` after `M ⊗_{Aᵉ} −`, as `x` and `y`
  both act on `M` by `x`. So `Tor_n^{Aᵉ}(M,A)` is `ℚ[x], ℚ[x], 0, 0, …`, matching `HH₀ = ℚ[x]` (§3.1),
  `HH₁ ≅ Ω¹_{ℚ[x]/ℤ} = ℚ[x] dx` (§3.4) and the vanishing above degree one of §8.4 over `ℚ`.
- Flatness of `A` cannot be dropped: for a prime `p`, `k = ℤ`, `A = ℤ[x]/(px)` (`x` is `p`-torsion, so
  `A` is not flat) and `M = 𝔽_p` with `x` acting by `0` on both sides, the normalised chains of §2.1 are
  `𝔽_p ⊗_ℤ V^{⊗_ℤ n} = V^{⊗_{𝔽_p} n}` with `V = A/ℤ·1 = x𝔽_p[x]`, with the boundary of `𝔽_p[x]` over
  `𝔽_p` with the same coefficients, so `HH₂(A,𝔽_p) = HH₂(𝔽_p[x],𝔽_p) = 0` (the resolution of
  `𝔽_p[x]` over `𝔽_p[x,y]` by `x − y` has length one). Over `Aᵉ = ℤ[x,y]/(px,py)` the annihilator of
  `x − y` is `pℤ` and that of `p` is `(x,y)`, so
  `⋯ → (Aᵉ)² --(x,y)--> Aᵉ --p--> Aᵉ --(x−y)--> Aᵉ → A` is the start of a free resolution, whose
  differentials in degrees `1`, `2` and `3` vanish after `𝔽_p ⊗_{Aᵉ} −`; hence
  `Tor₂^{Aᵉ}(𝔽_p, A) = 𝔽_p ≠ 0`. Both sides are `𝔽_p` in degrees `0` and `1`.
- Flatness of `F` cannot be dropped from the vanishing: for `k = A = ℤ`, so `Aᵉ = ℤ`, and
  `M = ℤ/p`, `Tor₁(ℤ/p, ℚ) = 0` although `ℚ` is not projective, while the resolution `ℤ → ℚ` of
  `ℚ/ℤ` by flat modules gives `Tor₁(ℤ/p, ℚ/ℤ) = ker(ℤ/p → ℤ/p ⊗ ℚ = 0) = ℤ/p`, the `p`-torsion of
  `ℚ/ℤ`.
- Right exact, not exact: for `k = A = ℤ`, so `Aᵉ = ℤ`, and `F = ℤ/p`, the sequence
  `0 → ℤ --p--> ℤ → ℤ/p → 0` becomes `ℤ/p --0--> ℤ/p --id--> ℤ/p → 0`, exact in the middle and on
  the right, as for every `F`, while the first map has kernel `ℤ/p = Tor₁(ℤ/p, ℤ/p)`; with the flat
  `F = ℚ` it becomes `0 → ℚ --p--> ℚ → 0 → 0`, short exact. Direct sums pass through the tensor
  product and products do not: `(⊕_ℕ ℤ) ⊗ ℚ = ⊕_ℕ ℚ`, while the canonical map
  `(Π_ℕ ℤ) ⊗ ℚ → Π_ℕ ℚ` has image the sequences with a common denominator and misses
  `(1, 1/2, 1/3, …)`.
- Projective but not free, and still flat: for `k = A = ℤ/6`, so `Aᵉ = ℤ/6`, the idempotents `3`
  and `4` split `ℤ/6 = 3·ℤ/6 ⊕ 4·ℤ/6`, so `P = 3·ℤ/6 ≅ ℤ/2` is projective; it is not free, having
  two elements where a free `ℤ/6`-module has `6^r` or infinitely many. `N ⊗_{ℤ/6} P ≅ 3N` through
  `n ⊗ 3 ↦ 3n`, and an injective `f : N → N'` restricts to an injective `3N → 3N'`, so `P` is flat,
  which the free case alone does not give.
- For `A = k`, `Aᵉ = k`, `Tor_0(M,k) = M` and `Tor_n(M,k) = 0` for `n ≥ 1`, as for `HH_n(k,M)`.
- `Tor_n^{Aᵉ}(M, Aᵉ) = 0` for `n ≥ 1` and `Tor_0^{Aᵉ}(M,Aᵉ) ≅ M`.
- The left structure `m · (a ⊗ op b) = a m b` is not a right `Aᵉ`-structure: for `A = M = Mat₂(k)`
  with `k` nonzero,
  applying `E₁₂ ⊗ 1` and then `E₂₁ ⊗ 1` to `m = 1` gives `E₂₁E₁₂ = E₂₂`, while the product
  `(E₁₂ ⊗ 1)(E₂₁ ⊗ 1) = E₁₁ ⊗ 1` gives `E₁₁`.

### Examples

For `A = k[x]` (free over `k`) the bar resolution is a free resolution of `k[x]` over
`k[x] ⊗ k[x]`, and §8.2's Koszul resolution is a smaller one; comparing them computes `HH^•` and
`HH_•` (§8.4).

### Dependencies

Layers 1–3; Mathlib `Ext`, projective resolutions, left derived functors, flat modules over `k`,
the naturality of the homology sequence, the five lemma and the zeroth left derived functor of a
right exact functor (§4.5); Tau Ceti balanced tensor products with their universal property, unit
isomorphisms and free modules (§4.5), the restrictions of an
`A ⊗[k] B`-module to its factors with their linearity criterion
(`TauCeti.Algebra.TensorProduct.moduleLeft`, `TauCeti.Algebra.TensorProduct.moduleRight`,
`TauCeti.Algebra.TensorProduct.moduleSMulCommClass`,
`TauCeti.Algebra.TensorProduct.moduleLeftIsScalarTower`,
`TauCeti.Algebra.TensorProduct.moduleRightIsScalarTower`,
`TauCeti.Algebra.TensorProduct.linearMapOfFactors`) and the bimodule `TauCeti.Bimodule` with
`TauCeti.Bimodule.smul_of` (§4.1). No roadmap supplier is used.

## Layer 5: The cup product

### 5.1 The cup product of cochains

Define the cup product `∪ : C^p(A,A) × C^q(A,A) → C^{p+q}(A,A)` (`cupProduct`),
`(f ∪ g)(a₁,…,a_{p+q}) = f(a₁,…,a_p) g(a_{p+1},…,a_{p+q})`: the tensor product of `f` and `g` on the
disjoint index sets `Fin p ⊕ Fin q`, followed by the multiplication of `A` and reindexed along
`Fin p ⊕ Fin q ≃ Fin (p + q)` with the first `p` arguments going to `f`; prove that it is
`k`-bilinear (Ginz05 §6.6, lines 1335–1341; HKR62 lines 479–484, where it is the product induced by
the diagonal of the bar resolution; Loday98 §1.5; Ger63 §7).

*Needs:* §1.2; Mathlib `MultilinearMap`, `MultilinearMap.domCoprod`, `LinearMap.mul'`,
`LinearMap.compMultilinearMap`, `MultilinearMap.domDomCongr`, `finSumFinEquiv`.

- The cup product is associative, `k`-bilinear, and has unit `1 ∈ A = C⁰(A,A)`.
- In degrees `(0,q)` and `(p,0)`, `x ∪ g = (a ↦ x g(a))` and `f ∪ y = (a ↦ f(a) y)`; in degree `(0,0)`
  it is the multiplication of `A`.
- Normalised cochains are closed under `∪`.
- For commutative `R`, `x ∪ g` is the `R`-module structure of §1.5, so `∪` is `R`-bilinear.
- It is natural for algebra isomorphisms.

**Checks.**

- For `k[x,y]`, `(∂_x ∪ ∂_y)(x,y) = 1` and `(∂_y ∪ ∂_x)(x,y) = 0`: for nonzero `k` the cup product is
  not commutative on cochains, even up to sign.
- `1 ∪ f = f = f ∪ 1`. The variant that multiplies in the other order, `g(a_{p+1},…) f(a₁,…)`, is
  associative (it is the cup product of `Aᵒᵖ`) but breaks the Leibniz rule of §5.2: for
  `A = Mat₂(k)`, `x = E₁₁ ∈ C⁰` and `g = id ∈ C¹`, the defect
  `g(b)ax − g(b)xa + g(a)bx − g(a)xb` at `(a,b) = (E₂₁, E₁₂)` is `E₁₁ − E₂₂`, nonzero for nonzero `k`.
- For `D = ∂_x` on `k[x]` with `k` nonzero, `(D ∪ D)(x,x) = 1`, so `D ∪ D ≠ 0` as a cochain, although
  its class is zero (§6.2 Checks).

### 5.2 The Leibniz rule and the cohomology algebra

Prove `δ(f ∪ g) = δf ∪ g + (−1)^p f ∪ δg` for `f ∈ C^p(A,A)`, so cocycles are closed under `∪` and
`Z ∪ B ⊆ B`, `B ∪ Z ⊆ B`; deduce an associative unital `k`-bilinear product on
`HH^•(A,A) = ⊕_n HH^n(A,A)` making it a graded `k`-algebra with `HH⁰(A,A) = Z(A)` as degree-zero
part; for commutative `R` it is a graded `R`-algebra (Ginz05 lines 1342–1350; Loday98 §1.5;
Ger63 §7).

*Needs:* §§1.2, 3.2, 5.1; Mathlib `GradedMonoid.GMonoid`, `DirectSum`.

- Witnesses: for `f, g ∈ C¹`, `δ(f ∪ g)(a,b,c) = a f(b) g(c) − f(ab) g(c) + f(a) g(bc) − f(a) g(b) c`,
  which equals `(δf ∪ g − f ∪ δg)(a,b,c)`; for `x ∈ C⁰`, `δ(x ∪ g) = δx ∪ g + x ∪ δg`.
- The product on `HH^•` is natural for algebra isomorphisms and, for commutative `R`, `R`-bilinear.

**Checks.**

- For `A = k`, `HH^•(k,k)` is `k` in degree zero and `0` above (§1.2 Checks), and the product is
  the multiplication of `k`.
- For `R = k[x]` with `k` nonzero and `∂ = d/dx`, `HH⁰ = R`, `HH¹ = R·[∂]` and `HH^n = 0` for
  `n ≥ 2` (§8.4). The product `HH⁰ × HH¹ → HH¹` is `[p] ∪ [∂] = [p∂]`, the `R`-module structure of
  §1.5, and `[∂] ∪ [∂] = 0`, although the cochain `∂ ∪ ∂` takes the value `1` at `(x,x)` (§5.1
  Checks): the product is one of classes, not of chosen representatives.
- The product descends because cocycles are multiplied. For a central `x ∈ Z⁰` and `m ∈ A`,
  `x ∪ δm = δ(xm)`, since `x(am − ma) = a(xm) − (xm)a`. For `A = Mat₂(k)` with `k` nonzero, the
  non-central `x = E₁₁` and `m = E₁₂` give `δ(x ∪ δm) = δx ∪ δm` by the Leibniz rule, and
  `(δx ∪ δm)(E₂₁, E₁₁) = (E₂₁E₁₁ − E₁₁E₂₁)(E₁₁E₁₂ − E₁₂E₁₁) = E₂₁E₁₂ = E₂₂ ≠ 0`: the product of the
  cochain `x` with the coboundary `δm` is not even a cocycle.

### 5.3 Yoneda products computed on projective resolutions

In an abelian category with enough projectives and `HasExt`, let `P` be a projective resolution
of `X` and `Q` one of `Y`, let `f : P_p → Y` and `g : Q_q → Z` be cocycles, and let
`f̃ = (f̃_i : P_{i+p} → Q_i)` be a family with `ε_Q ∘ f̃₀ = f` and `d^Q ∘ f̃_{i+1} = f̃_i ∘ d^P`
(such a family exists, and any two are homotopic, by the comparison theorem). Prove that
`Abelian.Ext.comp (P.extMk f) (Q.extMk g) = s(p,q) · P.extMk (f̃_q ≫ g)`, where `s(p,q) ∈ {±1}` is a
sign depending only on `p` and `q`, fixed by Mathlib's shift conventions for `Abelian.Ext`, with
`s(p,0) = 1` and `s(0,q) = 1` (CE56 Chapter XI; HKR62 lines 425–431 for the products on `Ext`). In
degree zero the class `P.extMk f` of a cocycle `f : P_0 → Y` is `Ext.mk₀` of the map `X → Y` that
`f` induces on `X = coker(P_1 → P_0)`, and for `p = 0` the family `f̃` is a morphism of resolutions
over that map. So the case `q = 0` is `CategoryTheory.ProjectiveResolution.extMk_comp_mk₀` and the
case `p = 0` is `CategoryTheory.ProjectiveResolution.mk₀_comp_extMk`, both stated without a sign,
which gives `s(p,0) = s(0,q) = 1`; in general the composite is computed on the shifted morphisms of
the derived category given by `extMk_hom` and `Ext.comp_hom`.

*Needs:* Mathlib `CategoryTheory.Abelian.Ext.comp`, `CategoryTheory.Abelian.Ext.comp_hom`,
`CategoryTheory.ProjectiveResolution.extMk`, `CategoryTheory.ProjectiveResolution.extMk_hom`,
`CategoryTheory.ProjectiveResolution.extMk_comp_mk₀`,
`CategoryTheory.ProjectiveResolution.mk₀_comp_extMk`, `CategoryTheory.ProjectiveResolution.Hom`.

### 5.4 The cup product is the Yoneda product

For `A` projective as a `k`-module and cocycles `f ∈ Z^p(A,A)`, `g ∈ Z^q(A,A)`, prove that the
isomorphism `θ` of §4.4 satisfies
`θ_{p+q}[f ∪ g] = (−1)^{pq} s(p,q) · Abelian.Ext.comp (θ_p[f]) (θ_q[g])` with the sign `s` of §5.3.
One route: the family `f̃_i(a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_{p+i+1}) = (−1)^{pi} a₀ f(a₁,…,a_p) ⊗ a_{p+1} ⊗ ⋯ ⊗ a_{p+i+1}`
lifts `f` along the bar resolution with strict commutation, and `f̃_q` followed by `g` is
`(−1)^{pq} f ∪ g` (Ginz05 lines 1348–1350; HKR62 lines 479–484; CE56 Chapter XI).

*Needs:* §§4.4, 5.2, 5.3.

**Checks.**

- Without the factor `(−1)^{pi}` the squares commute only up to `(−1)^p`: for `p = 1` and a derivation
  `f`, the unsigned maps satisfy `f̃₀ ∘ b′ = −b′ ∘ f̃₁` on `a₀ ⊗ a₁ ⊗ a₂ ⊗ a₃`, both sides being
  `±(a₀ f(a₁) a₂ ⊗ a₃ − a₀ f(a₁) ⊗ a₂ a₃)`, the cocycle condition `δf = 0` cancelling the other terms.
- For `q = 0`, `g` is the class of a central element `y` and the identity reads
  `θ_p[f ∪ y] = Ext.comp (θ_p[f]) (mk₀ (· y))`, the case of
  `CategoryTheory.ProjectiveResolution.extMk_comp_mk₀`.
- For `p = 0`, `f` is a central element `x` and the family is
  `f̃_i(a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_{i+1}) = a₀ x ⊗ a₁ ⊗ ⋯ ⊗ a_{i+1}`, left multiplication by `x` on the first
  factor of `B_i(A)`: it is `Aᵉ`-linear, and it commutes with `b′` and lies over `· x : A → A`
  because `x` is central (`a₀ x a₁ = a₀ a₁ x`). Followed by the homomorphism of `g`, `f̃_q` sends
  `1 ⊗ a₁ ⊗ ⋯ ⊗ a_q ⊗ 1` to `x g(a₁,…,a_q) = (x ∪ g)(a₁,…,a_q)`, so the identity reads
  `θ_q[x ∪ g] = Ext.comp (mk₀ (· x)) (θ_q[g])`, the case of
  `CategoryTheory.ProjectiveResolution.mk₀_comp_extMk`: `s(0,q) = 1`, not `(−1)^q`.
- In degree `(0,0)` both sides are composition in `Z(A) = End_{Aᵉ}(A)`: `θ₀[x ∪ y] = mk₀(· xy)` is
  `mk₀(· x)` followed by `mk₀(· y)`, as `Ext.comp` of degree-zero classes is composition.

### Examples

For `A = k[x,y]` the cocycles `∂_x ∪ ∂_y` and `∂_y ∪ ∂_x` are different but their classes are
negatives of each other (§6.2). For `A = Mat₂(k)` the cohomology algebra is `k` in degree zero.

### Dependencies

Layers 1–4 (Tau Ceti's bimodule coboundary enters only through the cochains of Layer 1); Mathlib
graded monoids, direct sums, `Ext` composition and the `Ext` classes of cocycles on projective
resolutions (`extMk` with its composition lemmas and morphisms of resolutions). No Tau Ceti
declaration is used directly and no roadmap supplier is used.

## Layer 6: Comparison with the graded and derived carriers

### 6.1 Cochains of an algebra in degree zero

Regard an ordinary `k`-algebra `A` as a DG algebra concentrated in degree zero with zero
differential (DGAInfinity Layer 1): the grading with `A` in degree `0` and the zero differential
satisfy `TauCeti.IsNonUnitalDGAlgebra`, and `𝒜 = TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra`
is the `A∞` algebra with `m₂(a,b) = ab` and all other operations zero, whose suspended Taylor map
`m` is `sa ⊗ sb ↦ s(ab)` (no sign: `TauCeti.AInfinity.IsSuspension` on degree-zero inputs).
Prove that for every `n ≥ 1` the suspension `Θ` of the conventions, `Θf ∘ s^{⊗n} = s ∘ f`, is a
`k`-linear isomorphism from `C^n(A,A)` onto
`TauCeti.AInfinityAlgebra.PositiveHochschild.cochains 𝒜 (n − 1)`: a homogeneous map of degree
`n − 1` out of the reduced tensor coalgebra on `sA`, with `sA` in degree `−1`, is supported on the
words of length `n`, so the cochains of degree `n − 1` are exactly the arity-`n` cochains, and
`Θf` is `f` itself on the length-`n` summand of `TauCeti.ReducedTensorWords k A` and `0` on the
others. Prove that for `f ∈ C^p(A,A)` and `g ∈ C^q(A,A)` with `p, q ≥ 1`:
`Θ(δf) = (−1)^{p+1} · TauCeti.AInfinityAlgebra.hochschildDifferential 𝒜 (p − 1) (Θf)`;
`Θ(f ∘ g) = TauCeti.ReducedTensorWords.brace (Θf) (Θg) (q − 1)` with `f ∘ g` the Gerstenhaber
composition of the conventions (the brace inserts `Θg`, of degree `q − 1`, after `i − 1` letters
of degree `−1` with the Koszul sign `(−1)^{(q−1)(i−1)}`, which is Ginzburg's sign); and
`Θ{f,g} = TauCeti.ReducedTensorWords.gerstenhaberBracket (p − 1) (q − 1) (Θf) (Θg)` with
`{f,g} = f ∘ g − (−1)^{(p−1)(q−1)} g ∘ f`. Prove the remaining clauses of the dictionary against
DGAInfinity Layer 8, which extends the pinned cochains by the arity-zero cochains `C⁰ = A` and
carries the cup product as the multiple brace: `Θ(δx) = −[m, Θx]` for `x ∈ C⁰`; `Θ(f ∘ y) = Θf{Θy}`
and `Θ{f,y} = [Θf, Θy]` for `y ∈ C⁰` by the same brace rule; and
`Θ(f ∪ g) = (−1)^{p(q−1)} m{Θf, Θg}` for all `p, q ≥ 0`. Consequently `Θ` identifies `HH^n(A,A)`
for `n ≥ 2` with `TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology 𝒜 (n − 1)` and
transports `TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket` to an operation
`{−,−} : HH^p(A,A) × HH^q(A,A) → HH^{p+q−1}(A,A)` for `p, q ≥ 2`, graded antisymmetric and
satisfying the graded Jacobi identity for the degrees `p − 1`, `q − 1`
(`TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket_swap`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.leibniz_cohomologyBracket`); in degree `0` the pinned
cohomology is `Z¹(A,A) = Der_k(A)`, there being no arity-zero cochain to quotient by, and the
extension of `{−,−}` to the degrees involving `HH¹` and `HH⁰` is the transport of Layer 8's
bracket on the full complex, which identifies `HH^n(A,A)` with Layer 8's Hochschild cohomology of
`A` in suspended degree `n − 1` (the degree of `Θf` for `f` of arity `n`) for every `n ≥ 0`
(Ginz05 §6.6, lines 1351–1375; Ger63 §7; the
sign dictionary follows from DGAInfinity's Koszul tensor-map rule and suspension square). The
clauses with arity-zero cochains and the cup-product clause compare this roadmap's complex with
DGAInfinity Layer 8's; no later section uses them, and §6.2 proves its formula on the classical
complex without them.

*Needs:* §§1.2, 5.1; Tau Ceti `TauCeti.AInfinity.IsSuspension`, `TauCeti.IsDGAlgebra`,
`TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra`, `TauCeti.ReducedTensorWords.brace`,
`TauCeti.ReducedTensorWords.gerstenhaberBracket`,
`TauCeti.AInfinityAlgebra.hochschildDifferential` with
`TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.cochains`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.complex`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket`; DGAInfinity Layer 0 (the
multiple brace and its Koszul sign); DGAInfinity Layer 1 (an algebra as a DG algebra in degree
zero); DGAInfinity Layer 8 (the arity-zero cochains, the cup product as `m{−,−}`, the bracket on
the full complex).

- On degree-zero inputs `Θf(sa₁ ⊗ ⋯ ⊗ sa_n) = s f(a₁,…,a_n)`; `Θ` is natural for algebra
  isomorphisms.
- On `C¹`, `{f,g} = f ∘ g − g ∘ f` is the commutator of linear maps, so `{−,−}` on `HH¹(A,A)` is the
  bracket of `Der_k(A,A)/Inn(A,A)` inherited from `TauCeti.derivationLieAlgebra`; on the pinned
  complex it is the bracket of `TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology 𝒜 0 = Der_k(A)`
  before the quotient by inner derivations.
- The Hochschild cohomology of Layer 8 for `A` is concentrated in suspended degrees `≥ −1`, the
  degree `−1` part being `HH⁰(A,A) = Z(A)` (an element `x ∈ C⁰ = A` has arity `0`, and `Θx ∈ sA` has
  degree `−1`); the pinned positive-arity complex sees the degrees
  `≥ 0` and misses the arity-zero cochains, so its degree-`0` cohomology is `Der_k(A)` rather than
  `HH¹(A,A)`, and its cohomology in degree `n − 1 ≥ 1` is `HH^n(A,A)`.

**Checks.**

- `n = 0` (arity zero, DGAInfinity Layer 8 only): for `x ∈ C⁰`,
  `[m, Θx](sa) = m(sx, sa) − m(sa, sx) = s(xa − ax)`, the second sign coming from moving `Θx`
  (degree `−1`) past `sa` (degree `−1`); and `Θ(δx)(sa) = s(ax − xa)`, so the sign is
  `(−1)^{0+1} = −1`.
- `n = 1` (at the pin, `TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub` with
  `q = 0`): `m{Θf}(sa ⊗ sb) = s(f(a) b + a f(b))` (no sign: `Θf` has degree `0`),
  `Θf{m}(sa ⊗ sb) = s f(ab)`, so `[m, Θf](sa ⊗ sb) = s(f(a) b + a f(b) − f(ab)) = Θ(δf)(sa ⊗ sb)`,
  sign `+1`; a dictionary with a uniform sign would fail one of the two cases `n = 0`, `n = 1` as
  soon as some `Θ(δx)` has `2Θ(δx) ≠ 0`, for instance `x = E₁₁` in `Mat₂(ℤ)`, where
  `δx(E₁₂) = −E₁₂`.
- `n = 2` (at the pin, `q = 1`): `m{Θf}(sa ⊗ sb ⊗ sc) = s(f(a,b) c − a f(b,c))` (the sign of moving
  `Θf`, of degree `1`, past `sa`), `Θf{m}(sa ⊗ sb ⊗ sc) = s(f(ab, c) − f(a, bc))` (the sign of moving
  `m` past `sa`), and `[m, Θf] = m{Θf} + Θf{m}`, so
  `[m, Θf](sa ⊗ sb ⊗ sc) = s(f(a,b) c − a f(b,c) + f(ab,c) − f(a,bc)) = −Θ(δf)(sa ⊗ sb ⊗ sc)`, sign
  `(−1)^{2+1} = −1`; the model `m{F} − F{m}` without the `(−1)^q` would give
  `s(f(a,b) c − a f(b,c) − f(ab,c) + f(a,bc))`. For the bilinear cochain `f(a,b) = a ∂_x b` on `ℤ[x]`,
  `δf(a,b,c) = ab ∂_x c` while the model is `s(2a(∂_x b)c − ab ∂_x c)`; at `(a,b,c) = (1,x,1)`,
  `δf = 0`, so `[m,Θf] = −Θ(δf) = 0`, while the model gives `s(2)`: it is neither `Θ(δf)` nor
  `−Θ(δf)`.
- `(p,q) = (1,0)` (arity zero, Layer 8 only): `m{Θf, Θy}(sa) = −s(f(a) y)`, the sign of moving `Θy`
  past `sa`, so `Θ(f ∪ y) = −m{Θf, Θy} = (−1)^{1·(0−1)} m{Θf,Θy}`; at `(p,q) = (1,1)` the sign is `+1`.

### 6.2 Gerstenhaber's homotopy formula and graded commutativity

Prove that for `f ∈ C^p(A,A)` and `g ∈ C^q(A,A)`,
`g ∪ f − (−1)^{pq} f ∪ g = δf ∘ g + (−1)^q (δ(f ∘ g) − f ∘ δg)`, and deduce that the cup product on
`HH^•(A,A)` is graded commutative, `[g] ∪ [f] = (−1)^{pq} [f] ∪ [g]` (Ger63 §7; Ginz05
Proposition 6.6.4, line 1379; Loday98 §1.5). On cocycles `f ∈ Z^p(A,A)` and `g ∈ Z^q(A,A)` the
second statement says that `g ∪ f − (−1)^{pq} f ∪ g`, the second term reindexed along
`p + q = q + p` (`finCongr`), lies in `B^{p+q}(A,A)`; this is `cupProduct_graded_comm`, for every
commutative `k` and every `k`-algebra `A`. One route is Gerstenhaber's direct computation: evaluate
`δf ∘ g`, `δ(f ∘ g)` and `f ∘ δg` on `(a₁,…,a_{p+q})` with the coboundary and the composition of the
conventions. The inner terms of `δ(f ∘ g)` cancel against the inner terms of `δg` in `f ∘ δg` when
the product `a_j a_{j+1}` lies among the arguments of `g`, and against inner terms of `δf ∘ g`
when it lies outside them; the inner terms of `δf ∘ g` that multiply `g(…)` by a neighbouring
argument cancel against the outer terms of `δg` in `f ∘ δg`; the first outer term of `δf ∘ g`
cancels against the first outer term of `δ(f ∘ g)` unless `g` fills the first slot of `δf`, and
the last against the last unless `g` fills the last slot. The two terms that remain are `g ∪ f`
and `f ∪ g`, with the signs of the display. This uses §§1.2 and 5.1 only. Under §6.1's dictionary
the antisymmetrisation of the identity in `(f,g)` is the pinned Leibniz rule `D[F,G] = [DF,G] + (−1)^{|F|} [F,DG]` for
`D = [m, −]` (`TauCeti.AInfinityAlgebra.hochschildDifferential_gerstenhaberBracket`, with
`[m, F] = m{F} − (−1)^{|F|} F{m}` from
`TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub`), the reason the bracket of §6.1
descends to cohomology (see the Checks); this comparison is not an input of the route. The
identity printed as Ginz05 (6.6.3), line 1368, does not hold with the coboundary of Ginz05
line 1058 (see the Checks); the form above is the one used.

*Needs:* §§1.2, 5.1, 5.2; Mathlib `finCongr`; for the comparison with the pinned Leibniz rule only,
§6.1 and Tau Ceti `TauCeti.AInfinityAlgebra.hochschildDifferential_eq_brace_sub`,
`TauCeti.AInfinityAlgebra.hochschildDifferential_gerstenhaberBracket`.

**Checks.**

- `(p,q) = (1,1)` computed directly: `f ∘ δg + δf ∘ g − δ(f ∘ g) = f ∪ g + g ∪ f`, all other terms
  cancelling. For derivations `f = g = ∂` of `k[x]` this reads `2(∂ ∪ ∂) = −δ(∂²)`, and indeed
  `−δ(∂²)(a,b) = 2∂a ∂b`; Ginz05 (6.6.3) would read `2(∂ ∪ ∂) = δ(∂²)`, that is
  `2∂a∂b = −2∂a∂b`, which fails at `(a,b) = (x,x)` (`2 = −2`) unless `4 = 0` in `k`.
- `(p,q) = (1,0)` with `g = y ∈ A`: both sides equal `a ↦ y f(a) − f(a) y`; `(p,q) = (2,0)`: both
  sides equal `(a,b) ↦ y f(a,b) − f(a,b) y`, the other terms on the right cancelling in pairs.
- `(p,q) = (0,1)` with `f = x ∈ A`: the left side is `g ∪ x − x ∪ g`, and on the right `x ∘ g = 0` and
  `x ∘ δg = 0` (`f ∘ g` sums over the `p` arguments of `f`, none when `p = 0`), leaving `δx ∘ g`; both
  sides equal `a ↦ g(a) x − x g(a)`. For `A = Mat₂(ℤ)`, `x = E₁₁`, `g = id` and `a = E₁₂`, both sides
  are `E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`, whereas the reversed expression `x g(a) − g(a) x` is `E₁₂`, so this
  case fixes the sign of the term `δf ∘ g`.
- On `k[x,y]`, `∂_x ∪ ∂_y + ∂_y ∪ ∂_x = −δ(∂_x ∂_y)`, so `[∂_x ∪ ∂_y] = −[∂_y ∪ ∂_x]` although the
  cochains differ (§5.1 Checks). On `k[x]`, `∂ ∪ ∂ = −δ(∂^{[2]})` with `∂^{[2]}(x^j) = C(j,2) x^{j−2}`,
  defined over every `k`: at `(x,x)`, `−δ(∂^{[2]})(x,x) = −(0 − 1 + 0) = 1 = (∂ ∪ ∂)(x,x)`.
- Antisymmetrisation: adding `(−1)^{pq}` times the identity with `f` and `g` exchanged cancels the
  cup products and leaves `δ{f,g} = {f, δg} − (−1)^q {δf, g}`, using
  `(−1)^{pq+p+q} = −(−1)^{(p−1)(q−1)}`; under §6.1 this is the pinned Leibniz rule
  `[m,[F,G]] = [[m,F],G] + (−1)^{|F|} [F,[m,G]]` at `|F| = p − 1`, `|G| = q − 1`, since
  `Θ(δ{f,g}) = (−1)^{p+q} D[Θf,Θg]`, `DΘf = (−1)^{p+1} Θ(δf)` and `DΘg = (−1)^{q+1} Θ(δg)`. A
  wrong sign on the `(−1)^q` of the displayed identity would contradict the pinned rule.

### 6.3 Chains of a flat algebra

Prove that there are signs `ν_n ∈ {±1}` with `ν₀ = 1` such that
`a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n ↦ ν_n a₀ ⊗ sa₁ ⊗ ⋯ ⊗ sa_n` is an isomorphism of complexes from `C_•(A,A)`
(homological degree `n` placed in cohomological degree `−n`) to the Hochschild chains of
DGAInfinity Layer 8 of `A` in degree zero; the signs are determined by Layer 8's chain differential
through the Koszul rule. For `A` flat as a `k`-module, RefinedTraceMethods §1.1 identifies the
homology of the cyclic bar complex with the derived Hochschild homology `HH_n(A/k)` of
KTheoryFiniteLocalFields §4.0 (the derived object is the totalisation of the cyclic bar
construction of a `k`-flat algebra), so `HH_n(A,A) ≅ HH_n(A/k)`, naturally in `A`; under this
isomorphism the check `HH₀(A) = A/[A,A]` of §4.0 is §3.1 (Loday98 §1.1; the identification of the
underlying modules is that of Ginz05 §5.1, lines 963–976).

*Needs:* §1.1; DGAInfinity Layer 8 (Hochschild chains); KTheoryFiniteLocalFields §4.0 (Cyclic
homology foundations, the derived `HH_n(A/k)`); RefinedTraceMethods §1.1 (the cyclic enhancement
of supplied derived Hochschild chains: for `k`-flat `A`, `HH(A/k)` is the homology of
`(C_•(A/k), b)`); Mathlib `ComplexShape.embeddingDownNat` (the embedding `n ↦ −n` of
`ComplexShape.down ℕ` into `ComplexShape.up ℤ`) with `HomologicalComplex.extend`.

**Checks.**

- For `A = k` both complexes have `k` in every degree and differentials alternating between `0`
  and an isomorphism; the comparison is the identity up to the signs `ν_n`.
- For `k = ℤ` and `A = 𝔽_p`, which is not flat, the classical `HH₂(𝔽_p,𝔽_p) = 0` (§3.4 Checks), while
  the derived `HH₂(𝔽_p/ℤ) = 𝔽_p` (RefinedTraceMethods §§1.1 and 1.10): the flatness hypothesis is
  needed for the second identification.
- For `A = Mat₂(k)` the degree-one boundaries correspond: `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂` is sent to
  `ν₀(E₁₁ − E₂₂)`, so `ν₁` is the sign of Layer 8's degree-one differential on `a₀ ⊗ sa₁`.

### 6.4 Antisymmetrisation and projection on the classical complex

For a commutative `k`-algebra `R`, prove: (a) the classical antisymmetrisation
`ε^cl_n : Ω^n_{R/k} → HH_n(R,R)`, `r₀ dr₁ ∧ ⋯ ∧ dr_n ↦ [Σ_{σ∈S_n} sgn(σ) r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}]`, is a
well-defined natural `R`-linear map, and, if `R` is flat over `k`, §6.3 carries it to `ν_n ε_n` of
RefinedTraceMethods §1.9; (b) the classical projection `π^cl_n : HH_n(R,R) → Ω^n_{R/k}`,
`[r₀ ⊗ ⋯ ⊗ r_n] ↦ r₀ dr₁ ∧ ⋯ ∧ dr_n`, is well-defined and, if `R` is flat over `k`, corresponds to
`ν_n π_n`; (c) `π^cl_n ∘ ε^cl_n = n! · id`, and `ε^cl₁` is the inverse of the isomorphism of §3.4;
(d) if `R` is smooth over `k` (hence flat, `Algebra.Smooth.flat`), `ε^cl_n` is an isomorphism for
every `n`. Flatness enters only through the comparison with the derived chains: (a)–(c) hold
for every commutative `R`. Write `Alt(r₀; r₁,…,r_n) = Σ_{σ∈S_n} sgn(σ) r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}`.
One route to (a) takes three steps on the classical complex. First, `Alt(r₀; r₁,…,r_n)` is a cycle:
the inner terms of `b` cancel in the pairs `σ, σ ∘ (i i+1)`, and the first term of `σ` cancels the
last term of its cyclic shift. Second, it is `0` when `r_i = r_j` for some `1 ≤ i < j ≤ n`, the
terms `σ` and `(i j) ∘ σ` cancelling. Third, its class is a derivation in each `r_i`, `i ≥ 1`, and
by the second step it suffices to treat `r₁`. For `a, c ∈ R` let `W` be the sum of
`sgn(w) r₀ ⊗ w₁ ⊗ ⋯ ⊗ w_{n+1}` over the orderings `w` of the letters `a, c, r₂, …, r_n` in which `a`
comes before `c`, `sgn(w)` being the sign of `w` as a permutation of `(a, c, r₂, …, r_n)`; then

    b(W) = Alt(r₀a; c, r₂,…,r_n) − Alt(r₀; ac, r₂,…,r_n) + Alt(r₀c; a, r₂,…,r_n).

Indeed the inner terms of `b` cancel in the pairs `w, w ∘ (i i+1)`, except those that multiply `a` by
the `c` right after it, which sum to `−Alt(r₀; ac, r₂,…,r_n)`. The first term of `w` cancels the last
term of its cyclic shift, except when `w` begins with `a` or ends with `c`; these terms give
`Alt(r₀a; c, r₂,…,r_n)` and `Alt(r₀c; a, r₂,…,r_n)`. So `(r₁,…,r_n) ↦ [Alt(1; r₁,…,r_n)]` is an
alternating `k`-multilinear map into the `R`-module `HH_n(R,R)` of §1.5 that is a `k`-derivation
in each argument. Applying `KaehlerDifferential.linearMapEquivDerivation` one argument at a time
gives an `R`-multilinear map on `Ω¹_{R/k}`. It is alternating on the elements `dr`, which span
`Ω¹_{R/k}` over `R`, hence alternating, and `exteriorPower.alternatingMapLinearEquiv` gives
`ε^cl_n` on `⋀[R]^n Ω[R⁄k]`, the coefficient `r₀` acting through §1.5. For (b), `π^cl_n ∘ b = 0` by
the Leibniz rule of `d` (Ginz05 §9.2, lines 2142–2156; AV20 lines 237–243; Loday98 §1.3 and §3.4,
Theorem 3.4.4; Weibel94 §9.4).

*Needs:* §§1.5, 3.4; §6.3 and RefinedTraceMethods §1.9 (the antisymmetrisation map and the HKR
projection) for the comparison clauses of (a) and (b); gap:smooth-hkr-antisymmetrisation (for
(d)); Mathlib `Algebra.Smooth.flat`, `exteriorPower.alternatingMapLinearEquiv` with
`KaehlerDifferential.linearMapEquivDerivation` and `KaehlerDifferential.span_range_derivation` (to
define `ε^cl_n` on `Ω^n_{R/k}` from its values on `r₀ dr₁ ∧ ⋯ ∧ dr_n`), `exteriorPower.ιMulti` and
`KaehlerDifferential.D` (the values of `π^cl_n`).

**Checks.**

- For `R = k[x,y]`, `ε^cl₂(dx ∧ dy) = [1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x]` and `π^cl₂ ε^cl₂(dx ∧ dy) = 2 dx ∧ dy`;
  over `𝔽₂` the composite is zero while `ε^cl₂(dx ∧ dy) ≠ 0` (it pairs to `1` with `∂_x ∪ ∂_y`).
- For `R = k[x]/(x²)` with `k` a nonzero field, `R` is flat but not smooth, `Ω²_{R/k} = 0` while
  `HH₂(R,R) ≠ 0`, so `ε^cl₂` is not surjective and (d) needs smoothness.
- `ε^cl₀` is the identity of `R = HH₀(R,R)`.
- For `k = ℤ` and `R = 𝔽_p`, which is not flat: `Ω^n_{𝔽_p/ℤ} = 0` for `n ≥ 1` and the classical
  complex is `𝔽_p` in every degree with `b_n = 1` for even `n ≥ 2` and `0` for odd `n`, so
  `HH_n(𝔽_p,𝔽_p) = 0` for `n ≥ 1`; (a)–(c) hold with both sides zero, while the derived
  `HH₂(𝔽_p/ℤ) = 𝔽_p` is not `HH₂(𝔽_p,𝔽_p)`: the comparison clauses need flatness, (a)–(c) do not.
- The derivation step, computed. For `n = 1`, `W = r₀ ⊗ a ⊗ c`, and the identity is the boundary
  `b(r₀ ⊗ a ⊗ c) = r₀a ⊗ c − r₀ ⊗ ac + c r₀ ⊗ a` of §3.4. For `n = 2`,
  `W = r₀ ⊗ a ⊗ c ⊗ r − r₀ ⊗ a ⊗ r ⊗ c + r₀ ⊗ r ⊗ a ⊗ c`. Of the twelve terms of `b(W)`, six cancel in
  pairs by commutativity of `R`, and the other six are
  `Alt(r₀a; c, r) − Alt(r₀; ac, r) + Alt(r₀c; a, r)`. All orderings with `a` before `c` are needed: for
  `R = k[a, c, r]` with `k` nonzero and `r₀ = 1`, leaving out the middle ordering `(a, r, c)` adds
  `b(1 ⊗ a ⊗ r ⊗ c)` to the boundary, and so leaves in it the basis tensor `1 ⊗ a ⊗ rc`, which the
  right side does not contain.
- No flatness enters. Take `k = ℤ` and `R = 𝔽₂[x,y]`, which is not flat over `ℤ`, with
  `a = c = x`, `r = y` and `r₀ = 1`. Then `b(W) = 2 · Alt(x; x, y) − Alt(1; x², y)`, so the nonzero chain
  `1 ⊗ x² ⊗ y − 1 ⊗ y ⊗ x²` equals `−b(W)` and its class is `0`. This is what
  `ε^cl₂(d(x²) ∧ dy) = ε^cl₂(2x dx ∧ dy) = 0` requires.

### Examples

For `A = k` the comparison of §6.3 is the identity up to sign. For `k[x,y]` the homotopy formula
explains why `∂_x ∪ ∂_y` and `−∂_y ∪ ∂_x` are cohomologous although different, and the
antisymmetrised chain `1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x` represents `ε(dx ∧ dy)`.

### Dependencies

Layers 1–5; the pinned Tau Ceti suspension convention and DG algebras
(`TauCeti.AInfinity.IsSuspension`, `TauCeti.IsDGAlgebra`), braces, Gerstenhaber bracket, Hochschild
differential and positive-arity Hochschild complex (`TauCeti.ReducedTensorWords.brace`,
`TauCeti.AInfinityAlgebra.hochschildDifferential`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.complex`); Mathlib's embedding of `ℕ`-indexed chain
complexes into `ℤ`-indexed cochain complexes (§6.3), and flatness of smooth algebras, exterior
powers with their universal property and Kähler differentials (§6.4);
DGAInfinity Layers 0, 1 and 8 (§§6.1 and 6.3; §6.2 proves its formula on the classical complex
and uses none of them);
KTheoryFiniteLocalFields §4.0; RefinedTraceMethods §§1.1 and 1.9; gap:smooth-hkr-antisymmetrisation,
used only in §6.4(d).

## Layer 7: Polyvector fields and the cohomological HKR theorem

### 7.1 Duality between cochains and chains of a commutative algebra

For a commutative `k`-algebra `R` and an `R`-module `M`, viewed as a symmetric bimodule, prove that
`f ↦ (r₀ ⊗ r₁ ⊗ ⋯ ⊗ r_n ↦ r₀ f(r₁,…,r_n))` is an isomorphism of cochain complexes of `R`-modules
`C^•(R,M) ≅ Hom_R(C_•(R,R), M)` (the right side being `ChainComplex.linearYonedaObj` in
`ModuleCat R`, whose differential is precomposition with `b`), natural in `M`. Define the
evaluation pairing `h_n : HH^n(R,M) → Hom_R(HH_n(R,R), M)` as this isomorphism followed by
`TauCeti.ChainComplex.kronecker` (HKR62 §4, lines 284–298 and 352–364).

*Needs:* §§1.1, 1.2, 1.5; Mathlib `ChainComplex.linearYonedaObj`; Tau Ceti
`TauCeti.ChainComplex.kronecker`, `TauCeti.ChainComplex.kronecker_homologyπ`,
`TauCeti.ChainComplex.kronecker_naturality`.

- On cocycles and cycles, `h_n[f]([Σ r₀ ⊗ r₁ ⊗ ⋯ ⊗ r_n]) = Σ r₀ f(r₁,…,r_n)`.
- `h₀` is the identity of `M = Hom_R(R,M)`, and under §3.3 and §3.4, `h₁(D)(r₀ dr₁) = r₀ D(r₁)`, the
  isomorphism `Der_k(R,M) ≅ Hom_R(Ω¹_{R/k}, M)` of `KaehlerDifferential.linearMapEquivDerivation`.
- `h_n` is natural in `M` and `R`-linear.

**Checks.**

- The chain-level identification uses that `M` is symmetric: for `R = k[x]` and the bimodule `k` on
  which `x` acts by `1` on the left and `0` on the right, `δm(x) = x·m − m·x = m ≠ 0` for `m ≠ 0`,
  while every degree-one chain of `C_•(R,R)` is a cycle, so the cochain `r ↦ r·m` has zero image
  under the transpose of `b`.
- For `R = k[x]` and `M = R`, `h₁(∂_x)([1 ⊗ x]) = 1`.
- For `R = k`, both sides vanish in positive degrees and `h₀` is the identity of `M`.

### 7.2 The evaluation pairing below the first non-projective Hochschild homology

Let `R` be a commutative `k`-algebra such that every `C_j(R,R) = R ⊗[k] R^{⊗j}` is a projective
`R`-module for the structure of §1.5 (for instance `R` projective as a `k`-module, by §1.4 and
`Module.Projective.tensorProduct`), and let `n ∈ ℕ` be such that `HH_j(R,R)` is a projective
`R`-module for every `j < n`. Prove that for every `R`-module `M` and every `i ≤ n` the evaluation
pairing `h_i : HH^i(R,M) → Hom_R(HH_i(R,R), M)` of §7.1 is bijective; in particular every `h_i` is
bijective when every `HH_j(R,R)` is `R`-projective (HKR62 Lemma 4.1, lines 301–330). The
hypothesis in degree zero is empty and `HH₀(R,R) = R` is free, so `h₀` and `h₁` are always
bijective under the hypothesis on the terms. The proof is a transport: `h_i` is the isomorphism of
§7.1 followed by the Kronecker map of `C_•(R,R)` in `ModuleCat R`, whose terms are projective
objects by `ModuleCat.projective_of_categoryTheory_projective`, and Tau Ceti's
`TauCeti.ChainComplex.kronecker_bijective_of_projective_homology_lt` in degree `i` applies, since
`j < i ≤ n` gives `j < n`.

*Needs:* §§1.4, 1.5, 7.1; Tau Ceti `TauCeti.ChainComplex.kronecker_bijective_of_projective_homology_lt`,
`TauCeti.ChainComplex.kronecker_bijective_of_projective_homology`; Mathlib
`ModuleCat.projective_of_categoryTheory_projective`, `Module.Projective.tensorProduct`.

**Checks.**

- For `R = k[x]`, which is `k`-free, `HH₀ = R`, `HH₁ = R·[1 ⊗ x]` and `HH_j = 0` for `j ≥ 2` (the
  values of §8.4) are all free, so every `h_i` is bijective; for `M = R`, `HH¹(R,R) = R·[∂_x]` is
  carried to `Hom_R(R·[1 ⊗ x], R) = R` by `h₁(∂_x)([1 ⊗ x]) = 1`, and `HH^i(R,R) = 0 = Hom_R(0, R)`
  for `i ≥ 2`.
- The hypothesis is on the terms, not on `k`-projectivity of `R`: for `k = ℤ` and `R = 𝔽_p`, every
  `C_j(𝔽_p,𝔽_p) = 𝔽_p` is `𝔽_p`-free, `HH₀ = 𝔽_p` and `HH_j = 0` for `j ≥ 1` (§6.4 Checks); for an
  `𝔽_p`-vector space `M` every `C^i(𝔽_p, M)` is `M` with `δ^i` equal to `0` for even `i` and the
  identity for odd `i`, so `HH⁰ = M`, `HH^i = 0` for `i ≥ 1`, and every `h_i` is bijective,
  although `𝔽_p` is not a projective `ℤ`-module.
- The hypothesis on `HH₁` is needed in degree two: for `k = ℚ` and `R = ℚ[x]/(x²)`, the two-periodic
  resolution with differentials `x ⊗ 1 − 1 ⊗ x` and `x ⊗ 1 + 1 ⊗ x` gives `HH₁(R,R) = R/(2x) = R/(x)`,
  not projective, and `HH₂(R,R) = ker(2x) = xR`. For `M = ℚ = R/(x)`, `HH²(R,ℚ) = ℚ` and
  `Hom_R(xR, ℚ) = ℚ`, but `h₂` sends a cochain `f` to `x·e₂ ↦ x·f(e₂) = 0`, so `h₂ = 0` is neither
  injective nor surjective. Over `𝔽₂` the same algebra has both differentials `0` after
  `R ⊗_{Rᵉ} −`, every `HH_j(R,R) = R` is free, and every `h_i` is bijective.

### 7.3 Exterior powers of finite projective modules

Let `R` be a commutative ring and `P` a finite projective `R`-module. Then `⋀[R]^n P` is finite
(Mathlib `exteriorPower.instFinite`) and projective (Tau Ceti `exteriorPower.instProjective`), and
EulerSystemsAndKolyvaginSystems §6.1 proves that the exterior-bidual evaluation
`TauCeti.StarkSystems.toExteriorBidual R n X` (on the carrier of IntegralIwasawaTheory §12.6) is an
isomorphism for every finite projective `X`. Prove the comparison needed by §7.4: for every `n`,
`exteriorPower.pairingDual R P n : ⋀[R]^n (Module.Dual R P) → Module.Dual R (⋀[R]^n P)` is bijective,
because it equals the evaluation for `X = Module.Dual R P`, which is finite projective
(`Module.dual_finite`, `Module.dual_projective`), followed by the dual of
`⋀^n (Module.evalEquiv R P) : ⋀^n P ≅ ⋀^n P**` (HKR62 lines 531–535). On pure wedges both send
`f₁ ∧ ⋯ ∧ f_n` to the form `v₁ ∧ ⋯ ∧ v_n ↦ det(f_j(v_i))`: the evaluation gives `det(Φ_j(f_i))` on
`Φ_j = ev(v_j)`, which is `det(f_i(v_j))`, the transposed matrix, with the same determinant.

*Needs:* EulerSystemsAndKolyvaginSystems §6.1 (the finite-projective exterior-bidual evaluation);
IntegralIwasawaTheory §12.6 (`TauCeti.StarkSystems.toExteriorBidual` and its determinant formula);
Mathlib `exteriorPower.map`, `exteriorPower.instFinite`, `exteriorPower.pairingDual`,
`exteriorPower.pairingDual_ιMulti_ιMulti`, `Module.dual_finite`, `Module.dual_projective`,
`Module.evalEquiv`; Tau Ceti `exteriorPower.instProjective`.

**Checks.**

- For `P = R²`, `(e₁* ∧ e₂*)(e₁ ∧ e₂) = det(e_j*(e_i)) = 1`, and the evaluation of
  EulerSystemsAndKolyvaginSystems §6.1 at `X = (R²)*` gives `det(I₂) = 1` on the same wedges; the
  transpose `e₂* ∧ e₁*` gives `−1` in both.
- For `P = 0`, `⋀⁰ = R` with pairing the identity and `⋀^n = 0` for `n ≥ 1`; above the rank
  (`P = R`, `n = 2`) both sides are `0`.
- Finiteness is needed for surjectivity: for the free module `P = R^{(ℕ)}` over a field `R`,
  the alternating form on `⋀² P` with value `1` on every `e_{2i} ∧ e_{2i+1}` and `0` on the other
  basis wedges has infinite rank and is not a finite sum of `f ∧ g`.

### 7.4 Polyvector fields

Define the polyvector fields `T^n_{R/k} = ⋀[R]^n Der_k(R)` and `T^•_{R/k}` as the exterior algebra
over `R` of `Der_k(R) = Derivation k R R`, graded by `n` (Ginz05 §6.1, lines 1130–1140; HKR62
Theorem 5.2, line 548; Mat86 §25). Define the `R`-linear map
`τ_n : T^n_{R/k} → Hom_R(Ω^n_{R/k}, R)`,
`D₁ ∧ ⋯ ∧ D_n ↦ (r₀ dr₁ ∧ ⋯ ∧ dr_n ↦ r₀ det(D_j(r_i)))`, as `exteriorPower.pairingDual` composed
with `⋀^n` of the inverse of `KaehlerDifferential.linearMapEquivDerivation`.

*Needs:* Mathlib `ExteriorAlgebra.exteriorPower`, `Derivation`, `Derivation.instModule`,
`exteriorPower.zeroEquiv`, `exteriorPower.oneEquiv`, `exteriorPower.pairingDual`,
`KaehlerDifferential.linearMapEquivDerivation`, `exteriorPower.subsingleton_of_span_eq_top_of_card_lt`,
`Module.FinitePresentation`, `Algebra.FormallySmooth.projective_kaehlerDifferential`; §7.3.

- `T⁰_{R/k} ≅ R` and `T¹_{R/k} ≅ Der_k(R)`; the wedge product of the exterior algebra is
  graded commutative and strictly alternating.
- `τ₀` is the identity of `R`, `τ₁` is `KaehlerDifferential.linearMapEquivDerivation` inverted.
- If `Ω¹_{R/k}` is finite projective, in particular if `R` is smooth over `k` (finite presentation
  of `Ω¹` from `Algebra.FinitePresentation`, projectivity from
  `Algebra.FormallySmooth.projective_kaehlerDifferential`), then `τ_n` is an isomorphism for every
  `n` (§7.3).
- If `Ω¹_{R/k}` is generated by `d` elements, `Hom_R(Ω^n_{R/k}, M) = 0` for `n > d`.

**Checks.**

- For `R = k[x,y]`, `T²` is free of rank one on `∂_x ∧ ∂_y`, and `τ₂(∂_x ∧ ∂_y)(dx ∧ dy) = 1`.
- Over `𝔽₂[x]`, `∂_x ∧ ∂_x = 0` in `T²`; a signed-coinvariant model of `⋀²` would leave a nonzero
  element of order two.
- For `K = 𝔽₂(u)` and the inseparable field `R = K[a]/(a² − u)`, every `D(a)` is allowed since
  `D(a² − u) = 2a D(a) = 0`, so `Der_K(R) = R·∂` with `∂a = 1` and `T² = 0`.

### 7.5 The determinant cocycle and the HKR maps

For `D₁,…,D_n ∈ Der_k(R)` define the determinant cochain `⟨D₁,…,D_n⟩ ∈ C^n(R,R)` (`detCochain`),
`(r₁,…,r_n) ↦ det(D_j(r_i))`, the determinant of the matrix whose row `i` is `(D₁(r_i),…,D_n(r_i))`
(Mathlib's `Matrix.detRowAlternating`, restricted to `k`-scalars), and write `D₁ ∪ ⋯ ∪ D_n`
(`cupDerivations`) for the cochain `(r₁,…,r_n) ↦ D₁(r₁)⋯D_n(r_n)`, the iterated cup product of §5.1
(for commutative `R` the order of the factors does not matter). Prove that `⟨D₁,…,D_n⟩` is `R`-multilinear and alternating in the `D_j`, so
that it defines the unnormalised HKR map `T^n_{R/k} → C^n(R,R)`; that it is a derivation in each
`r_i` and therefore a normalised Hochschild cocycle; that `⟨D⟩ = D` for `n = 1` and `⟨⟩ = 1` for
`n = 0`; that `⟨D₁,…,D_n⟩ = Σ_{σ∈S_n} sgn(σ) D_{σ(1)} ∪ ⋯ ∪ D_{σ(n)}`; and that if `Ω¹_{R/k}` is finite
projective, the unnormalised map is injective. When `n!` is invertible in `k`, define the
normalised HKR map `Φ^n_HKR = (1/n!)⟨…⟩`. The determinant cochain is `D₁ ∪ ⋯ ∪ D_n` composed with
the alternation map `r₁ ⊗ ⋯ ⊗ r_n ↦ Σ_σ sgn(σ) r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}` of Ginz05 §9.2, line 2142,
which names the resulting map from polyvector fields to cochains without a formula (lines
2104–2113); HKR62 lines 509–521 for the alternating forms `h*(a)(D₁,…,D_n)` and the duality map
they come from; AV20 lines 237–243 for the factor `n!`.

*Needs:* §§1.2, 2.2, 5.1, 6.2, 6.4(a), 7.1, 7.4; Mathlib `Matrix.det`, `Matrix.detRowAlternating`,
`MultilinearMap.restrictScalars`, `MultilinearMap.mkPiAlgebra`, `MultilinearMap.compLinearMap`,
`LinearMap.pi`, `Derivation`, `exteriorPower.alternatingMapLinearEquiv` (the alternating map
`(D₁,…,D_n) ↦ ⟨D₁,…,D_n⟩` factors through `T^n_{R/k}`).

- Evaluation, for every commutative `k`-algebra `R`, flat or not:
  `h_n[⟨D₁,…,D_n⟩](ε^cl_n(r₀ dr₁ ∧ ⋯ ∧ dr_n)) = n! r₀ det(D_j(r_i))` and
  `h_n[D₁ ∪ ⋯ ∪ D_n](ε^cl_n(r₀ dr₁ ∧ ⋯ ∧ dr_n)) = r₀ det(D_j(r_i))` (§§6.4(a), 7.1). Both are
  computed on the antisymmetrised chain: the first is `Σ_σ sgn(σ) r₀ det(D_j(r_{σ(i)}))`, `n!` equal
  terms, and the second is `Σ_σ sgn(σ) r₀ Π_j D_j(r_{σ(j)})`, the Leibniz expansion of the
  determinant; no exactness of tensor products enters.
- A cochain that is a derivation in each argument is a Hochschild cocycle for commutative `R`;
  at `n = 2`, `δf(a,b,c) = a f(b,c) − f(ab,c) + f(a,bc) − f(a,b) c = 0` after expanding the two middle
  terms.
- For every commutative `k`-algebra `R`, every `n` and all `D₁,…,D_n ∈ Der_k(R)`, the cochain
  `⟨D₁,…,D_n⟩ − n! · (D₁ ∪ ⋯ ∪ D_n)` lies in `B^n(R,R)`, so `[⟨D₁,…,D_n⟩] = n! · [D₁ ∪ ⋯ ∪ D_n]` in
  `HH^n(R,R)` (`detCochain_sub_factorial_smul_cupDerivations_mem`): by graded commutativity (§6.2)
  adjacent degree-one classes anticommute, so `[D_{σ(1)} ∪ ⋯ ∪ D_{σ(n)}] = sgn(σ) [D₁ ∪ ⋯ ∪ D_n]`, and
  the determinant is the signed sum of these cup products. For `n = 0` both cochains are `1` and the
  difference is `0 ∈ B⁰ = 0`.
- The unnormalised map is natural for isomorphisms of `k`-algebras.

**Checks.**

- On `k[x,y]`, `⟨∂_x, ∂_y⟩(x,y) = 1` and `⟨∂_x, ∂_y⟩(y,x) = −1`; the product cochain `∂_x ∪ ∂_y` takes
  the values `1` and `0`, so on the alternation `x ⊗ y − y ⊗ x` of `x ⊗ y` it gives `1 − 0 = 1`, the
  value of `⟨∂_x, ∂_y⟩` at `(x,y)`; for nonzero `k` the product cochain is not alternating in the derivations:
  `(∂_x ∪ ∂_x)(x,x) = 1` while `⟨∂_x, ∂_x⟩ = 0`.
- On `𝔽₂[x,y]`, `⟨∂_x, ∂_y⟩ = δ(∂_x ∂_y)`: `δ(D₁D₂)(a,b) = −(D₁a D₂b + D₂a D₁b)`, which in
  characteristic two is `det(D_j(r_i))`; the cocycle is nonzero but its class is zero.
- The evaluation needs no flatness: for the non-flat `ℤ`-algebra `R = 𝔽₂[x,y]`, `D₁ = ∂_x`,
  `D₂ = ∂_y` and `r₀ = 1`, `r₁ = x`, `r₂ = y`, the cup product evaluates to `1 = det(I₂)` on
  `ε^cl₂(dx ∧ dy)` and the determinant cocycle to `2 · 1 = 0`, as both formulas predict.
- For `n = 1` the map is `D ↦ D`, and its class is the class of §3.3.

### 7.6 The cohomological HKR theorem

Let `k` be a commutative ring and `R` a commutative `k`-algebra with `Algebra.Smooth k R` and
`Module.Projective k R`. Prove:

1. for every `R`-module `M` and every `n`, the evaluation pairing `h_n` of §7.1 is an isomorphism,
   and with `ε^cl_n` it gives a natural `R`-linear isomorphism `HH^n(R,M) ≅ Hom_R(Ω^n_{R/k}, M)`,
   sending the class of a cocycle `f` to the map with
   `dr₁ ∧ ⋯ ∧ dr_n ↦ Σ_{σ∈S_n} sgn(σ) f(r_{σ(1)},…,r_{σ(n)})`; as a `k`-linear equivalence with these
   values, which determine it, this is `cohomological_hkr_hom_kaehler`;
2. the map `Ψ_n : T^n_{R/k} → HH^n(R,R)`, `D₁ ∧ ⋯ ∧ D_n ↦ [D₁ ∪ ⋯ ∪ D_n]`, is well defined and is an
   `R`-linear isomorphism, equal to the composite of `τ_n` (§7.4) with the inverse of (1); the maps
   `Ψ_n` together form an isomorphism of graded `R`-algebras `(T^•_{R/k}, ∧) ≅ (HH^•(R,R), ∪)`; as a
   `k`-linear equivalence with `Ψ_n(r · D₁ ∧ ⋯ ∧ D_n) = [r · (D₁ ∪ ⋯ ∪ D_n)]` for all `r ∈ R`, which
   determines it, this is `cohomological_hkr` (multiplicativity follows from the formula, the cup
   product of `D₁ ∪ ⋯ ∪ D_p` and `D_{p+1} ∪ ⋯ ∪ D_{p+q}` being `D₁ ∪ ⋯ ∪ D_{p+q}`);
3. `[⟨D₁,…,D_n⟩] = n! · Ψ_n(D₁ ∧ ⋯ ∧ D_n)` for all derivations;
4. if `n!` is invertible in `k`, `[Φ^n_HKR(ξ)] = Ψ_n(ξ)` for every `ξ ∈ T^n_{R/k}`, so the normalised
   HKR map induces an isomorphism `T^n_{R/k} ≅ HH^n(R,R)`; if `ℚ ⊆ k`, these maps form the algebra
   isomorphism of (2);
5. if `Ω¹_{R/k}` is generated by `d` elements, `HH^n(R,M) = 0` for every `n > d`.

(HKR62 Theorem 5.1, line 522, Lemma 4.1, line 301, the product formula of line 495, and the
deduction of lines 528–546 leading to Theorem 5.2, line 548; Ginz05 Theorem 9.1.3, line 2086, over
an algebraically closed field of characteristic zero. The homological form, which (1) dualises,
is Loday98 §3.4, Theorem 3.4.4, Weibel94 §9.4, Theorem 9.4.7, over a field, and AV20
Proposition 1.2, line 70, as a quasi-isomorphism over every `k`.)
One route: `C_n(R,R) = R ⊗_k R^{⊗n}` is a projective `R`-module (§1.4 and
`Module.Projective.tensorProduct`); `HH_n(R,R) ≅ Ω^n_{R/k}` through `ε^cl_n` (§6.4(d)) is finite
projective (`exteriorPower.instFinite`, `exteriorPower.instProjective`); §7.2, that is Tau Ceti's
`TauCeti.ChainComplex.kronecker_bijective_of_projective_homology` transported through §7.1, makes
`h_n` bijective for every `n`; §7.4 identifies `Hom_R(Ω^n, R)` with `T^n`; the evaluation
formulas of §7.5 identify the composite with `Ψ_n` and give (3); multiplicativity of `Ψ` is
associativity of `∪`; (5) follows from §7.4.

*Needs:* §§1.4, 1.5, 5.2, 6.4, 7.1–7.5; gap:smooth-hkr-antisymmetrisation (through §6.4(d));
Mathlib `Algebra.Smooth`, `Algebra.Smooth.flat`, `Module.Projective.tensorProduct`,
`Module.FinitePresentation`, `Algebra.FormallySmooth.projective_kaehlerDifferential`,
`exteriorPower.instFinite`; Tau Ceti `exteriorPower.instProjective`,
`TauCeti.ChainComplex.kronecker_bijective_of_projective_homology` (through §7.2).

**Checks.**

- For `k` a field, `Module.Projective k R` holds automatically; the theorem is then HKR62
  Theorem 5.2 when `k` is perfect, and Ginz05 Theorem 9.1.3 when `k` is algebraically closed of
  characteristic zero. For `k = 𝔽₂` and `R = 𝔽₂[x,y]` only the first applies (Ginz05 fixes an
  algebraically closed ground field of characteristic zero throughout, lines 96–97); for `k = ℂ`
  both do.
- For `R = 𝔽₂[x,y]`, `Ψ₂(∂_x ∧ ∂_y) = [∂_x ∪ ∂_y]` is nonzero (it pairs to `1` with
  `ε^cl₂(dx ∧ dy) = [1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x]`), while `[⟨∂_x, ∂_y⟩] = 2Ψ₂(∂_x ∧ ∂_y) = 0`: the unnormalised
  determinant map is not an isomorphism on cohomology when `n! = 0` in `k`.
- `ℤ → ℤ[1/2]` is étale, so `Algebra.Smooth` holds, but `ℤ[1/2]` is not a projective `ℤ`-module (its
  element `1` is divisible by every power of `2`, which no nonzero element of a free `ℤ`-module is, and
  projective `ℤ`-modules are free): smoothness does not imply
  `k`-projectivity. Here the conclusion holds anyway: `ℤ[1/2] ⊗ ℤ[1/2] = ℤ[1/2]`, every `C^n` is
  `ℤ[1/2]`, `HH^n = 0` for `n ≥ 1`, and `Der = 0`.
- For the inseparable `R = 𝔽₂(u)[a]/(a² − u)` over `𝔽₂(u)`, which is not smooth, `T² = 0` (§7.4
  Checks) while the two-periodic resolution with differentials `a ⊗ 1 − 1 ⊗ a` and
  `a ⊗ 1 + 1 ⊗ a` gives `HH²(R,R) ≅ R/(2a) = R ≠ 0`; HKR62 lines 569–582 give the corresponding
  non-strictly-alternating class in `Tor₂`. Smoothness cannot be dropped.
- For `R = k[x]`, `HH¹ ≅ R·∂`, `HH² = 0`, and `[∂ ∪ ∂] = 0` (§6.2 Checks), as the alternation of `Ψ`
  requires.

### Examples

For `R = k[x,y]` over any `k`, `HH²(R,R)` is free of rank one on `[∂_x ∪ ∂_y]`, the class of the
determinant cocycle is twice it, and `HH^n(R,R) = 0` for `n ≥ 3`. For `R = k[x, x⁻¹]` (smooth and
free over `k`), `HH¹(R,R) = R·x∂_x` and `HH^n = 0` for `n ≥ 2`.

### Dependencies

Layers 1–6; Tau Ceti's Kronecker map, its bijectivity for complexes of projectives with projective
homology below the degree, and projectivity of exterior powers; Mathlib's exterior powers, duals,
Kähler differentials and smoothness;
EulerSystemsAndKolyvaginSystems §6.1 (the finite-projective exterior-bidual evaluation, §7.3) on
the carrier of IntegralIwasawaTheory §12.6; through §6.4(d), gap:smooth-hkr-antisymmetrisation on
RefinedTraceMethods §1.9.

## Layer 8: Polynomial algebras through the Koszul resolution

### 8.1 The diagonal of a polynomial algebra

For `R = MvPolynomial (Fin m) k` over any commutative `k`, prove that the elements
`t_i = X_i ⊗ 1 − 1 ⊗ op X_i` of `Rᵉ = R ⊗[k] Rᵐᵒᵖ`, written `X_i ⊗ 1 − 1 ⊗ X_i` (Conventions), form
a weakly regular sequence and generate the kernel of the multiplication map `Rᵉ → R` (the statement over every commutative `k` is proved by the route
below; Loday98 §3.2 for the Koszul resolution of a symmetric algebra; neither of the other sources
names the `t_i`: HKR62 lines 268–271 obtain, by citation, a regular sequence generating a prime
ideal with regular quotient of a regular local ring, and Ginz05 §9.3, lines 2193–2196, asserts
without proof a regular sequence generating the ideal of the diagonal of a smooth variety over an
algebraically closed field of characteristic zero). One route: `Rᵉ ≅ R ⊗[k] R` by
`Algebra.TensorProduct.congr` of the identity and `AlgEquiv.toOpposite` (`R` is commutative), and
`R ⊗[k] R ≅ MvPolynomial (Fin m) R` by `MvPolynomial.algebraTensorAlgEquiv k R`
(`r ⊗ P ↦ r · P`, so `r ⊗ X_i ↦ r X_i`, with the first factor `R ⊗ 1` as coefficients and
`X_i ⊗ 1` going to the constant `C(X_i)`), followed by the `R`-algebra automorphism
`MvPolynomial.aeval (X_i ↦ X_i + C(X_i))`, whose inverse is `MvPolynomial.aeval (X_i ↦ X_i − C(X_i))`
(`AlgEquiv.ofAlgHom`); under the composite the variable `X_i` of the target is
`Y_i = 1 ⊗ X_i − X_i ⊗ 1 = −t_i`. Both maps are ring isomorphisms.
Under their composite the multiplication map is evaluation at `Y = 0`, whose kernel is spanned by
the `Y_i` (`MvPolynomial.span_X_image_eq_ker_aeval_ite_mem` for the set of all variables); Tau
Ceti's `MvPolynomial.isWeaklyRegular_map_X` makes the `Y_i` weakly regular over the coefficient
ring `R`, with no nontriviality hypothesis, and `LinearEquiv.isWeaklyRegular_congr'` transports
this to `Rᵉ` along the composite.
Replacing each `Y_i` by `t_i = −Y_i` changes neither the ideals `(Y₁,…,Y_j)` nor the kernel of
multiplication by `Y_{j+1}` on their quotients, so the `t_i` are weakly regular as well.

*Needs:* Mathlib `MvPolynomial`, `Algebra.TensorProduct`, `Algebra.TensorProduct.congr`,
`AlgEquiv.toOpposite`, `MvPolynomial.algebraTensorAlgEquiv`, `MvPolynomial.aeval`,
`AlgEquiv.ofAlgHom`, `RingTheory.Sequence.IsWeaklyRegular`, `LinearEquiv.isWeaklyRegular_congr'`,
`MvPolynomial.span_X_image_eq_ker_aeval_ite_mem`; Tau Ceti `MvPolynomial.isWeaklyRegular_map_X`.

**Checks.**

- `m = 0`: the empty sequence, `Rᵉ = k`, and the kernel is `0`.
- `m = 1`: under the composite of the route, `X ⊗ 1 ↦ C(X)` and `1 ⊗ X ↦ X ↦ X + C(X)`, so the
  variable of `MvPolynomial (Fin 1) R` is `1 ⊗ X − X ⊗ 1 = −t`, and the multiplication map, which
  sends `1 ⊗ X − X ⊗ 1` to `X − X = 0`, is evaluation of that variable at `0`. The element `t` is a
  nonzerodivisor of `k[X] ⊗ k[X] ≅ k[X,Y]` for nonzero `k`. Without the change of variables the
  variable would be `1 ⊗ X`, whose image under multiplication is `X ≠ 0` for nonzero `k`.
- For `R = k[x]/(x²)` with `k` nonzero, `t = x ⊗ 1 − 1 ⊗ x` is a zero divisor:
  `t (x ⊗ 1 + 1 ⊗ x) = x² ⊗ 1 − 1 ⊗ x² = 0` with `x ⊗ 1 + 1 ⊗ x ≠ 0`.

### 8.2 The Koszul bimodule resolution

Construct the Koszul bimodule resolution `K(R)` of `R = MvPolynomial (Fin m) k`: the Koszul complex
of DerivedModuleAlgebra §0.K.1 of the sequence `(t₁,…,t_m)` in `Rᵉ`, augmented to `R` by
multiplication. Prove that it is a projective resolution of `R` in `ModuleCat Rᵉ` of length `m` with
`K_j = ⋀^j (Rᵉ)^m` free, with basis the wedges `e_I = e_{i₁} ∧ ⋯ ∧ e_{i_j}` for the `j`-element
subsets `I = {i₁ < ⋯ < i_j}` of `{1,…,m}`, for every commutative `k`, and that `R ⊗_{Rᵉ} K(R)` and
`Hom_{Rᵉ}(K(R), R)` have zero differential (HKR62 lines 268–279, the Koszul resolution in the proof
of Theorem 3.1; Ginz05 §9.3, lines 2187–2197).

*Needs:* §§4.1, 4.5 (for `Tor`), 8.1; DerivedModuleAlgebra §0.K.1 (Koszul complex of a finite
sequence); Mathlib `CategoryTheory.ProjectiveResolution`,
`CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`, `CategoryTheory.Abelian.Ext.linearEquiv₀`,
`exteriorPower.instFree`, `Module.Basis.exteriorPower` (the basis `e_I` of `K_j`);
Tau Ceti `TauCeti.koszulComplex`, `TauCeti.koszulComplex.homologyZeroEquivSpan` (with §8.1,
`H₀(K(R)) ≅ Rᵉ/(t) ≅ R`), `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` (with §8.1, `H_j = 0`
for `j ≥ 1`), `TauCeti.zeroEquiv_koszulDifferential_zero`, `TauCeti.oneEquiv_koszulDifferential_one`,
`CategoryTheory.ProjectiveResolution.extLinearEquiv`.

- `d(e_i) = t_i` and `d(e_i ∧ e_j) = t_i e_j − t_j e_i`, the sign of §0.K.1's degree `−1` derivation
  (at the pin, `TauCeti.zeroEquiv_koszulDifferential_zero` and
  `TauCeti.oneEquiv_koszulDifferential_one` with `φ(e_i) = t_i`).
- `Tor_j^{Rᵉ}(R,R) ≅ ⋀^j R^m` and `Ext^j_{Rᵉ}(R,R) ≅ ⋀^j (R^m)^*` as `R`-modules. Since
  `R ⊗_{Rᵉ} K(R)` has zero differential, `Tor_j` is its degree-`j` term
  (`isoLeftDerivedObj`); since `Hom_{Rᵉ}(K(R), R)` has zero differential, the two vanishing
  hypotheses of Tau Ceti's `CategoryTheory.ProjectiveResolution.extLinearEquiv` hold in every
  degree, so `Ext^j = Hom_{Rᵉ}(K_j, R)` for `j ≥ 1`, and `Ext⁰ = Hom_{Rᵉ}(R, R) = R` by
  `CategoryTheory.Abelian.Ext.linearEquiv₀`.
- The construction is natural in the ground ring `k`.

**Checks.**

- `m = 1`: `0 → Rᵉ --t--> Rᵉ → R → 0` is exact.
- `m = 0`: `K = k` in degree zero, augmented by the identity.
- For nonzero `k`, the same complex for `k[x]/(x²)` is not exact in degree one, by §8.1's zero
  divisor.
- `m = 2`, `j = 1`: the basis is `e₁, e₂`, the `C(2,1) = 2` one-element subsets, and `K₂` has the
  single basis wedge `e₁ ∧ e₂`. Over `k = 0`, `Rᵉ = 0` and these wedges still form a basis of the
  zero module, whose rank over the zero ring is `1` in Mathlib's convention (`rank_subsingleton`),
  not `C(2,1) = 2`: the statement names the basis, which holds for every `k`.

### 8.3 Comparison with the bar resolution

Construct the chain map `ι : K(R) → B_•(R)` over the identity of `R`,
`ι_j(e_{i₁} ∧ ⋯ ∧ e_{i_j}) = Σ_{σ∈S_j} sgn(σ) 1 ⊗ X_{i_{σ(1)}} ⊗ ⋯ ⊗ X_{i_{σ(j)}} ⊗ 1`, and prove that it is a
homotopy equivalence of projective resolutions (Ginz05 §9.2, lines 2142–2150, for the alternation
map; HKR62 lines 448–466 for the shuffle product on the bar resolution).

*Needs:* §§4.2, 8.2; Mathlib `Module.Basis.exteriorPower` with `Module.Basis.constr` (`ι_j` is
fixed by its values on the basis wedges `e_I` of §8.2), `CategoryTheory.ProjectiveResolution`,
`CategoryTheory.ProjectiveResolution.homotopyEquiv`, `CategoryTheory.ProjectiveResolution.liftHomotopy`
(a chain map over the identity is homotopic to the comparison map, hence a homotopy equivalence).

- `ι` commutes with the augmentations and with the differentials; `R ⊗_{Rᵉ} ι` sends `e_I` to the
  antisymmetrised chain `Σ sgn(σ) 1 ⊗ X_{i_{σ(1)}} ⊗ ⋯ ⊗ X_{i_{σ(j)}}`.
- `ι` has a homotopy inverse `ρ : B_•(R) → K(R)` over the identity, unique up to homotopy.
- `ι` is natural in the ground ring.

**Checks.**

- `j = 1`: `b′(ι(e_i)) = b′(1 ⊗ X_i ⊗ 1) = X_i ⊗ 1 − 1 ⊗ X_i = ι(d e_i)`.
- `j = 2`: `b′(1 ⊗ X₁ ⊗ X₂ ⊗ 1 − 1 ⊗ X₂ ⊗ X₁ ⊗ 1) = X₁ ⊗ X₂ ⊗ 1 + 1 ⊗ X₁ ⊗ X₂ − X₂ ⊗ X₁ ⊗ 1 − 1 ⊗ X₂ ⊗ X₁`,
  which is `t₁ · (1 ⊗ X₂ ⊗ 1) − t₂ · (1 ⊗ X₁ ⊗ 1) = ι(d(e₁ ∧ e₂))`. The map `ι′` without the sign of
  `σ` has `b′ι′(e₁ ∧ e₂) − ι′(d(e₁ ∧ e₂)) = 2(X₂ ⊗ X₁ ⊗ 1 + 1 ⊗ X₂ ⊗ X₁ − 1 ⊗ X₁X₂ ⊗ 1)`, so it is not a
  chain map when `2 ≠ 0` in `k`; over `𝔽₂` the two maps coincide.
- `m = 0`: `R = Rᵉ = k`, `K(R)` is `k` in degree zero and `0` above, while `B_n(k) = k` in every
  degree with `b′_n` multiplication by `Σ_{i=0}^{n}(−1)^i`. So `ι₀ = id_k` and `ι_n` is the zero map
  `0 → B_n(k)` for `n > 0`: `ι` is not the identity of complexes but an augmentation-compatible
  homotopy equivalence, both complexes having homology `k` in degree zero and `0` above (for
  `k = ℤ`, in degree one `ι₁ : 0 → ℤ`).

### 8.4 Hochschild homology and cohomology of polynomial algebras

For `R = MvPolynomial (Fin m) k` over any commutative `k`, prove that `HH_n(R,R)` is a free
`R`-module with basis the classes `ε^cl_n(dX_I) = [Σ_{σ} sgn(σ) 1 ⊗ X_{i_{σ(1)}} ⊗ ⋯ ⊗ X_{i_{σ(n)}}]` for
`I = {i₁ < ⋯ < i_n} ⊆ {1,…,m}`; that `HH^n(R,R)` is a free `R`-module with basis the classes
`[∂_{i₁} ∪ ⋯ ∪ ∂_{i_n}]`, `∂_i = MvPolynomial.pderiv i`; that the two bases are dual under `h_n`; and
that `HH_n(R,R) = HH^n(R,R) = 0` for `n > m`. Consequently `ε^cl_n` is an isomorphism, and
`D₁ ∧ ⋯ ∧ D_n ↦ [D₁ ∪ ⋯ ∪ D_n]` is a well-defined isomorphism `T^n_{R/k} ≅ HH^n(R,R)` (the map `Ψ_n` of
§7.6), for polynomial algebras over every `k`, without the gap used in §6.4(d). In cohomology this
is the statement of `cohomological_hkr` for `R = MvPolynomial (Fin m) k`, which is smooth
(`Algebra.Smooth`) and free over `k`; here it is proved from the Koszul resolution (HKR62 lines
268–279, the Koszul-resolution computation inside the proof of Theorem 3.1, which needs only a
regular sequence generating the ideal, here the one of §8.1, and not the Noetherian and regularity
hypotheses of the theorem's statement at line 210; Ginz05 Lemma 9.3.1, line 2187, for a regular
sequence in a commutative algebra over an algebraically closed field of characteristic zero;
Loday98 §3.2, symmetric algebras over any `k`; Weibel94 §9.4). In homology, on Tau Ceti's
normalised chains, whose homology is `HH_•(R,R)` by §2.1 (the quotient map sends the antisymmetrised
chain to its class, the antisymmetrised normalised chain), the existence of a `k`-linear isomorphism
`Ω^n_{R/k} ≅ H_n(TauCeti.normalizedHochschildChains.chainComplex k R)` sending
`r₀ dr₁ ∧ ⋯ ∧ dr_n` to the class of the cycle `Σ_σ sgn(σ) r₀ ⊗ r_{σ(1)} ⊗ ⋯ ⊗ r_{σ(n)}`, for every `m`,
`n` and `k`, that is the bijectivity of `ε^cl_n` read on normalised chains, is
`homological_hkr_mvPolynomial`.

*Needs:* §§4.3, 4.4, 4.5, 6.2, 6.4(a), 7.1, 7.4, 7.5, 8.2, 8.3; §2.1 (only to read the stated form,
on Tau Ceti's normalised chains, as `HH_n(R,R)`); Tau Ceti
`TauCeti.normalizedHochschildChains.chainComplex`,
`TauCeti.normalizedHochschildChains.chainComplexXIso` and
`TauCeti.normalizedHochschildChains.tensor`, with Mathlib `HomologicalComplex.iCycles`,
`HomologicalComplex.homologyπ` and `exteriorPower.ιMulti` (for the stated form); Mathlib `MvPolynomial.pderiv`,
`KaehlerDifferential.mvPolynomialBasis` and `Module.Basis.exteriorPower` (the basis `dX_I` of
`Ω^n_{R/k}`, which `ε^cl_n` sends to the basis of `HH_n(R,R)`),
`CategoryTheory.ProjectiveResolution.isoLeftDerivedObj`, `CategoryTheory.Functor.mapHomotopyEquiv`,
`Homotopy.op`, `HomotopyEquiv.toHomologyIso` (the homotopy equivalence `ι` of §8.3 stays one after
`R ⊗_{Rᵉ} −` and, through the opposite category, after `Hom_{Rᵉ}(−, R)`, so the Koszul complexes
of §8.2 compute `HH_•` and `HH^•` through §§4.3 and 4.5).

**Checks.**

- `m = 1`, `n = 2`: `Ω²_{R/k} = ⋀²_R (R dX) = 0`, and `HH₂(k[X]) = 0`. The antisymmetrised chain
  `1 ⊗ X ⊗ X² − 1 ⊗ X² ⊗ X` is a cycle (both terms have boundary `X ⊗ X² − 1 ⊗ X³ + X² ⊗ X`) and is
  the boundary `b(1 ⊗ X ⊗ X ⊗ X)`, so its class is `0`, as `ε^cl₂(dX ∧ dX²) = 0` requires.
- `m = 2`, `n = 2`, `k = 𝔽₂`: `dX₁ ∧ dX₂` goes to the class of `1 ⊗ X₁ ⊗ X₂ − 1 ⊗ X₂ ⊗ X₁`, which is
  nonzero (it pairs to `1` with `∂₁ ∪ ∂₂`, §6.4 Checks), although `π^cl₂ ∘ ε^cl₂` is multiplication
  by `2 = 0`: the inverse of the isomorphism is not `π^cl_n/n!`, which is undefined here.
- The sign of `σ` is needed: when `2 ≠ 0` in `k`, the unsigned chain `1 ⊗ X₁ ⊗ X₂ + 1 ⊗ X₂ ⊗ X₁` has
  boundary `2(X₁ ⊗ X₂ + X₂ ⊗ X₁ − 1 ⊗ X₁X₂)`, nonzero in the normalised chains of degree one, so it
  is not a cycle and has no class.
- `m = 0`: `R = k`, `Ω^0 = k ≅ HH₀(k,k)` by `r₀ ↦ [r₀]`, and both sides vanish for `n ≥ 1`
  (`Ω¹_{k/k} = 0`, and the normalised chains of positive degree are `0` since `k̄ = 0`).

### 8.5 The top degree and the Jacobian determinant

For every `m ∈ ℕ`, `R = MvPolynomial (Fin m) k`, `g ∈ R` and `r₁,…,r_m ∈ R`, prove that
`(g · ⟨∂₁, …, ∂_m⟩)(r₁,…,r_m) = g · det(∂_j r_i)`, `g` times the Jacobian determinant, that its class
is `m! · g · [∂₁ ∪ ⋯ ∪ ∂_m]`, that `HH^m(R,R)` is free of rank one on `[∂₁ ∪ ⋯ ∪ ∂_m]`, and that when
`m!` is invertible in `k`, `Φ^m_HKR(g · (∂₁ ∧ ⋯ ∧ ∂_m))(r₁,…,r_m) = (g/m!) det(∂_j r_i)` with class
`g · [∂₁ ∪ ⋯ ∪ ∂_m]`. The scalar `g` multiplies the whole cochain and the whole wedge, so the
statement covers `m = 0`, where `R = k`, the empty determinant is `1`, the empty cup product is the
unit `1 ∈ C⁰(k,k)` and the empty wedge is `1 ∈ T⁰`; for `m ≥ 1`, `R`-multilinearity of `⟨…⟩` in
the derivations (§7.5) gives the first-column form `g · ⟨∂₁, …, ∂_m⟩ = ⟨g∂₁, ∂₂, …, ∂_m⟩`. The
determinant formula is the evaluation of the determinant cocycle of §7.5 at `∂₁, …, ∂_m`, its class
identity is that of §7.5 with the product formula of HKR62 line 495, and the rank-one statement is
the top degree of §8.4 (HKR62 Theorem 5.2, line 548, is the case of a perfect field `k`; the
determinant cochain is the cup product composed with the alternation map of Ginz05 §9.2,
line 2142, as in §7.5).

*Needs:* §§7.5, 8.4.

**Checks.**

- `m = 2`, `r₁ = X₁²`, `r₂ = X₂`: `det(∂_j r_i) = 2X₁`, so the normalised value is `g X₁` when `2` is
  invertible.
- `m = 1`: `g · ⟨∂⟩ = g∂` and its class is `g[∂]`, with no factorial.
- `m = 0`, `k = ℤ`, `g = 2`: the cochain `g · ⟨⟩`, its class and the normalised value
  `Φ⁰_HKR(g · 1)` are all `2 ∈ HH⁰(ℤ,ℤ) = ℤ`, as `0! = 1` and the empty determinant is `1`. The
  first-column form `⟨g∂₁, …⟩` has no first slot here and, read as the empty family, would give
  `⟨⟩ = 1` instead of `2`.
- `m = 2` over `𝔽₂`: the Jacobian cocycle `⟨∂₁, ∂₂⟩ = δ(∂₁∂₂)` is a nonzero coboundary, while
  `[∂₁ ∪ ∂₂]` generates `HH²`.

### Examples

For `R = k[X]`: `K(R)` is `Rᵉ --t--> Rᵉ`, `HH₀ = HH⁰ = R`, `HH₁ = R·[1 ⊗ X]`, `HH¹ = R·[∂]`, and all higher
groups vanish, over every `k`. For `R = k[X₁,X₂,X₃]`, `HH³(R,R)` is free on `[∂₁ ∪ ∂₂ ∪ ∂₃]` and the
Jacobian cocycle of `(X₁, X₂, X₃)` represents `6` times it.

### Dependencies

Layers 1–5; §§6.2 and 6.4(a) (the antisymmetrisation map); §§7.1, 7.4 and 7.5 (not §6.4(d) or
§7.6, which carry the smooth HKR input); DerivedModuleAlgebra §0.K.1,
consumed through its pinned form, Tau Ceti's Koszul complex `TauCeti.koszulComplex` with its
zeroth homology and its acyclicity for weakly regular sequences (§8.2); Tau Ceti's weak
regularity of distinct variables `MvPolynomial.isWeaklyRegular_map_X` (§8.1) and
`CategoryTheory.ProjectiveResolution.extLinearEquiv` (§8.2); Tau Ceti's normalised chains
`TauCeti.normalizedHochschildChains.chainComplex`, the carrier of the stated homology form of §8.4,
read as `HH_•(R,R)` through §2.1; Mathlib's cycles and homology classes of a complex (§8.4), polynomial rings and
partial derivatives, the basis of the Kähler differentials of a polynomial ring (§8.4), exterior
powers of free modules with their bases of wedges (§§8.2–8.4), tensor products of algebras, regular
sequences with their transport along equivalences, projective resolutions, `Ext` in degree zero,
left derived functors, and homotopy
equivalences of resolutions with their images under additive functors and on homology
(§§8.2–8.4).

## Downstream consumers

No other roadmap imports this one. The roadmaps that use Hochschild theory import DGAInfinity
Layer 8 directly: KTheoryFiniteLocalFields §4.0 and
RefinedTraceMethods §§1.9–1.10 (homological HKR and cyclic theory), LanglandsParameterStacks
§1.17 (the Hochschild action on self-Ext), ZigzagPreprojective Layer 7 (bigraded Hochschild
cohomology and `A∞` deformations), NoncommutativeGeometry N1 and BanachAlgebras Layer 6 (scalar and
bounded variants). The comparison of Layer 6 lets each of them read its statements on the classical
complex of this roadmap. Gerstenhaber algebras, the Schouten–Nijenhuis bracket, Kontsevich
formality and deformation quantisation of polynomial algebras build on Layers 6–8 and lie outside
this roadmap.

## Worked examples

- **The cohomology of `k[x,y]` in characteristic two.** Over `𝔽₂`, `Ψ₂(∂_x ∧ ∂_y) = [∂_x ∪ ∂_y]`
  generates `HH²(𝔽₂[x,y])`, the antisymmetrised chain `c = 1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x` generates
  `HH₂`, and `h₂[∂_x ∪ ∂_y](c) = 1`. The determinant cocycle satisfies `⟨∂_x, ∂_y⟩(x,y) = 1` and
  `⟨∂_x, ∂_y⟩ = δ(∂_x∂_y)`, consistent with `h₂[⟨∂_x,∂_y⟩](c) = 2 = 0`.
- **A non-split extension.** `k[t]/(t³) → k[x]/(x²)` is the twisted square-zero extension of the
  2-cocycle `f(x,x) = 1` with coefficients in `k`; for nonzero `k` no algebra section exists, so the
  class is nonzero in `HH²(k[x]/(x²), k)`.
- **Matrices.** `Mat₂(k)` has `HH₀ ≅ k` (trace), `HH⁰ = k`, and every derivation inner.

## References

- **HKR62**: Gerhard Hochschild, Bertram Kostant and Alex Rosenberg, *Differential forms on regular
  affine algebras*, Transactions of the American Mathematical Society 102 (1962), 383–408,
  DOI 10.1090/S0002-9947-1962-0142598-8. Theorem 3.1 (line 210) and the Koszul computation inside
  its proof (lines 268–279), Lemma 4.1 (line 301), the bar
  resolution and its products (lines 410–495), Theorem 5.1 (line 522), Theorem 5.2 (line 548), the
  characteristic-two example (lines 569–582).
- **Ginz05**: Victor Ginzburg, *Lectures on noncommutative geometry*, arXiv:math/0506603 (2005).
  The ground field is algebraically closed of characteristic zero throughout (lines 96–97).
  §3.1 (derivations), §§4.2–4.5 (bar and reduced bar complexes), §§5.1–5.7 (Hochschild homology and
  cohomology, low degrees, extensions, reduced cochains), §6.6 (cup product, Gerstenhaber
  composition and bracket, Proposition 6.6.4), §8.1 (Kähler differentials and `HH₁`), §9 (the HKR
  theorem, Theorem 9.1.3, the maps of §9.2, Lemma 9.3.1).
- **AV20**: Benjamin Antieau and Gabriele Vezzosi, *A remark on the Hochschild–Kostant–Rosenberg
  theorem in characteristic p*, arXiv:1710.06039v1; Annali della Scuola Normale Superiore di Pisa
  (2020). Proposition 1.2 (line 70) and the factorial remark (lines 237–243).
- **StacksSmooth**: The Stacks Project Authors, *The Stacks Project*, Commutative Algebra, Section
  Smooth ring maps, Tags 00T2 and 00TN.
- **Loday98**: Jean-Louis Loday, *Cyclic Homology*, 2nd ed., Grundlehren der mathematischen
  Wissenschaften 301, Springer (1998). §§1.1, 1.3, 1.5, 3.2, 3.4 (Theorem 3.4.4).
- **Weibel94**: Charles A. Weibel, *An Introduction to Homological Algebra*, Cambridge Studies in
  Advanced Mathematics 38, Cambridge University Press (1994). §2.2 (the comparison theorem), §2.6
  (left adjoints are right exact), §3.2 (Tor and flat resolutions), §§9.1–9.4 (Theorem 9.4.7).
- **CE56**: Henri Cartan and Samuel Eilenberg, *Homological Algebra*, Princeton Mathematical
  Series 19, Princeton University Press (1956). Chapters IX and XI.
- **Ger63**: Murray Gerstenhaber, *The cohomology structure of an associative ring*, Annals of
  Mathematics 78 (1963), 267–288. §7.
- **Mat86**: Hideyuki Matsumura, *Commutative Ring Theory*, Cambridge Studies in Advanced
  Mathematics 8, Cambridge University Press (1986). §25.
