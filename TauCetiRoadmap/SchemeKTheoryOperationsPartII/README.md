# Roadmap: k-theory of schemes, localisation and operations, part II — supported formal K-theory and derived intersection degrees

**Summary.** Build supported coherent and strict-complex K₀ on locally noetherian formal schemes, extending SchemeKTheoryOperations from ordinary schemes. Starting with the formal geometry of AdicSpacesPartIII, categorical Grothendieck groups and the supplied derived tensor product, the build reaches regular supported dévissage, the comparison of support filtrations, rational affine filtration multiplicativity, closed-union decomposition, expected-dimension Tor vanishing, and derived Euler intersection degrees with their base-change and projection formulas. Dimension comes from local rings and support from powers of coherent ideals. These choices distinguish formal subschemes even when their underlying spaces coincide.

## Scope and ownership

SchemeKTheoryOperations owns the ordinary-scheme theory: strict and perfect models (§§1.5–1.6), coherent G-theory, pullback and proper transfers (§§2.1–2.3), base change and projection formulas (§2.4), coherent supported dévissage (§3.5), coniveau (Layer 4), products (§6.1), degree-zero supported operations and rational filtration products (§6.12), and cycle comparisons and Riemann–Roch (Layer 7). This Part II starts at formal support. Its affine comparison transports that theory from Spec A to Spf A; it does not construct scheme operations again.

AdicSpacesPartII §§R0.1a–R0.1b owns adic rings and noetherian completion. AdicSpacesPartIII §§F0.1–F0.8 owns completed localisations, locally ringed formal schemes, their coherent modules and the affine coherent equivalence. SchemeAndStackFoundations §§4.7–4.10 owns formal thickening systems and their algebraic completion comparisons, and JacobianChallenge Layer C owns coherence and finiteness of proper coherent cohomology of schemes. Those formal carriers, coherent categories and comparisons are imported rather than reconstructed. The new geometry here consists of the stalk-dimension conventions and formal-support adapters needed for supported K₀.

GrothendieckEulerForms Layers 2–3 and the pinned categorical Grothendieck groups own universal additive presentations and resolving-category comparison. GeneralAlgebraicKTheory §4.8 owns categorical dévissage. DerivedModuleAlgebra §0.K.1 owns module Koszul complexes, and EnhancedDerivedSheaves §§0.3–0.4, E1.4–E1.6 owns derived tensor, ringed functors and the regular-ring homological bound. This roadmap constructs their formal supported specialisations. SchemeAndStackFoundations §5.7 owns ordinary scheme K₀ and G₀; its §3.3 owns line-bundle and vector-bundle degree on arbitrary proper curves, including singular and nonreduced curves. No second curve-degree theory is constructed here.

The affine full-support Cartan map and finite-resolution equivalence are already in the library as `TauCeti.cartanMap` and `TauCeti.cartanEquiv`. The formal supported comparison differs by its formal carrier and arbitrary closed formal support. The containment of an ideal of definition in every maximal ideal is supplied by `IsAdicComplete.le_jacobson_bot`; no new adic-ring lemma is required. The affine power-annihilation criterion uses `Module.support` and `Module.support_eq_zeroLocus`; it is a compatibility theorem here, not a second module-support definition. The auxiliary affine coherent group is the supplied `TauCeti.ExactK0` of finite modules, with no new alias or independent quotient.

Rational multiplicativity is a target for affine regular formal schemes (§2.4). Non-affine multiplicativity is outside this roadmap: Zhang explicitly leaves its general formal extension unproved, and the relevant numerical case is proved directly in §4.5 (ZHANG21 lines 4555–4560; LIZHANG22 lines 363–367). Open-exhaustion limits in §2.5 and continuous K-theory of infinitesimal thickenings are different objects; only the former is constructed. Higher K-theory, Adams operations on non-affine formal schemes, and the special cycles themselves belong to their respective scheme, categorical and arithmetic roadmaps.

## Conventions

Formal schemes are locally noetherian, and noetherian adds quasi-compactness. An affine formal spectrum uses an adic noetherian ring complete and separated for an ideal of definition I. All local power-series examples use the maximal-ideal-adic topology unless another topology is specified. Thus Spf ℤ_p⟦t⟧ has one underlying point and ring dimension 2; with the p-adic topology its underlying space would instead include the special-fibre generic point (EGA-I §10.1; EGA-I lines 7294–7299).

A closed formal subscheme Y = V(𝒥) has a coherent ideal. Intersections use the sum of ideals and unions their intersection. Formal support means locally 𝒥ⁿF = 0 for a positive integer n. On Spf A this is support in V(J) inside Spec A, not support inside the formal topological space (ZHANG21 lines 4511–4521).

At x, local dimension is `dim 𝒪_{X,x}`; global dimension is its supremum. Local codimension is the difference of the two finite stalk dimensions, taken only at points of the source; global codimension is their infimum. Empty dimension is ⊥ and empty codimension is ⊤. For nonempty noetherian X, pure dimension d means dimension d at each closed stalk. Noetherian does not itself mean finite global dimension. The filtrations use integer indices: Fʳ is full for r ≤ 0 and Fᵢ is zero for i < 0, so d − i is integer subtraction (ZHANG21 lines 4534–4544).

Strict complexes are bounded global complexes of finite locally free coherent modules. Their homology has formal support. K₀^Y is their group modulo degreewise short exact sequences and quasi-isomorphisms. A comparison with all coherent modules assumes regularity, finite dimension and the resolution property. Coefficients are integral unless a tensor product with ℚ is displayed (ZHANG21 lines 4525–4544; SchemeKTheoryOperations §§1.5–1.6, 6.12).

Complexes use homological degree for Tor and cohomological degree for coherent cohomology: a sheaf placed in homological degree one has class −[F]. For homogeneous elements of degrees i,j the tensor symmetry has sign (−1)ⁱʲ. The Cartier complex has its line bundle in degree one and its structure sheaf in degree zero, so [O(−D) → O] has Euler class [O_D] when D is Cartier. For the equation p on ℤ_p, H₀ = 𝔽_p and H₁ = 0, so the supported class is +1. Derived functors from EnhancedDerivedSheaves are reindexed with homological i equal to cohomological −i (ZHANG21 lines 4530–4533, 4593–4600; EnhancedDerivedSheaves §E1.5).

A is a complete discrete valuation ring only in the degree layer; k is its residue field and ϖ a chosen uniformiser. A scheme proper over Spf A factors through a finite thickening. Lengths are over A and finite before they are read as integers. Proper formal morphisms are adic and of finite type, with proper reductions. Restriction of scalars along a finite DVR extension contributes residue degree f, while flat local DVR base change contributes ramification index e ≥ 1, including infinite residue extensions (EGA-III1 lines 4444–4464; §4.4).

All coherent categories are taken in fixed universes in which their object and gluing data are essentially small; the Grothendieck group uses a small skeleton and is independent of that choice. The index poset of an exhaustion is small in a fixed larger universe. Ranks may vary by connected component; the rank in §4.5 is the generic rank over the particular regular local domain at the indicated closed point (GrothendieckEulerForms, Standing conventions; §4.5).

## Exact supplier contracts

### From Mathlib

Use `ringKrullDim` in `Mathlib/RingTheory/KrullDimension/Basic.lean`, `Ideal.height` in `Mathlib/RingTheory/Ideal/Height.lean`, `IsRegularLocalRing` and `IsRegularRing` in `Mathlib/RingTheory/RegularLocalRing/Defs.lean`, and `RingTheory.Sequence.IsRegular` in `Mathlib/RingTheory/Regular/RegularSequence.lean`. A regular local ring includes localness and noetherianity; a regular sequence includes a nonzero final quotient. Use `IsAdicComplete` and `AdicCompletion` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`; completeness here includes separatedness. Use `Ideal.jacobson` in `Mathlib/RingTheory/Jacobson/Ideal.lean` and `IsAdicComplete.le_jacobson_bot` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`: an ideal of definition is contained in every maximal ideal.

Use `Module.support` and its finite-module support criterion `Module.support_eq_zeroLocus` in `Mathlib/RingTheory/Support.lean`, `Module.length` in `Mathlib/RingTheory/Length.lean`, and `Submodule.annihilator` in `Mathlib/RingTheory/Ideal/Maps.lean`. Module length takes values in ℕ∞; finite-length hypotheses precede the integer Euler sum. Use `Module.Flat` in `Mathlib/RingTheory/Flat/Basic.lean`, `Module.FaithfullyFlat` in `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`, `Module.Projective` in `Mathlib/Algebra/Module/Projective.lean` and `Module.Free` in `Mathlib/LinearAlgebra/FreeModule/Basic.lean`; `Module.free_of_flat_of_isLocalRing` in `Mathlib/RingTheory/LocalRing/Module.lean` makes a finite flat module over a local ring free. Use `HomologicalComplex` in `Mathlib/Algebra/Homology/HomologicalComplex.lean` and `CategoryTheory.Tor` in `Mathlib/CategoryTheory/Monoidal/Tor.lean`; the latter requires an abelian monoidal preadditive category with projective resolutions. It supplies module Tor, not a formal coherent Tor-sheaf carrier.

### From Tau Ceti

Use `TauCeti.ExactK0` in `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean` and `TauCeti.AbelianK0` with `TauCeti.AbelianK0.of` in `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean`, under the explicit essentially-small and abelian hypotheses. Use `TauCeti.finiteModulesExactStructure`, `TauCeti.finiteProjectiveModulesExactStructure`, `TauCeti.cartanMap` and `TauCeti.cartanEquiv` in `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean`. The equivalence requires that every finite module admit a finite resolution by finite projectives; it is not unconditional for a noetherian ring. Use `TauCeti.ExactStructure.IsResolving.resolutionEquiv` in `TauCeti/CategoryTheory/GrothendieckGroup/Resolving.lean` for the degree-zero resolving-category comparison. Use `TauCeti.SheafOfModules.tensorProduct` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean` for sheaf tensor products.

### From TauCetiRoadmap.AdicSpacesPartII

Sections R0.1a–R0.1b supply adic rings of finite ideal type and their noetherian adic completion, with quotient and flatness comparisons. Completeness and separatedness are retained. The completed localisations and formal spectra consumed below belong to Part III.

### From TauCetiRoadmap.AdicSpacesPartIII

Section F0.1, *completed-localization*, supplies completed principal localisations, their quotient descriptions and flatness. F0.2 supplies Spf with its ring sheaf and *spf-morphism-correspondence*: morphisms from a formal scheme X to Spf A are the ring maps A → Γ(X, 𝒪_X) that are continuous on affine formal opens. F0.3 supplies locally noetherian formal schemes, gluing and the scheme embedding. F0.4 supplies adic, finite-type and proper morphisms, base change and coherent-ideal closed formal subschemes. F0.6, *associated-formal-module*, *affine-coherent-equivalence* and *coherent-as-inverse-system*, supplies association of finite modules, exactness, and tensor and Hom comparisons, the affine pullback formula `FormalScheme.Spf.completedTilde.pullbackIso` and the ideal-image formula `FormalScheme.Spf.completedTilde.ideal_map` (EGA-I (10.10.8)–(10.10.9)); the comparison of locally free coherent modules with finite projective modules is §1.3 here. F0.8, *coherent-formal-module-properties*, supplies the coherent abelian category, its closure under images, and coherent pullback *FormalScheme.cohPullback* with its composition law. Inverse images of closed formal subschemes and flat morphisms of formal schemes are defined in §0.6 here. F0.6, *formal-direct-image-comparison*, compares proper algebraic morphisms with their completions; that does not by itself cover arbitrary proper formal morphisms.

Affine coherent acyclicity is imported from that comparison, not requested. Let B be an adic noetherian ring with ideal of definition J and M a finite B-module. Apply *formal-direct-image-comparison* to the identity of Spec B with closed subscheme V(J): the completion is Spf B, and M~ completes to M^Δ (*associated-formal-module*). It identifies `H^q(Spf B, M^Δ)` with the J-adic completion of `H^q(Spec B, M~)`, which is zero for q > 0 by scheme affine acyclicity (SchemeAndStackFoundations §2.6). Every coherent module on Spf B is some M^Δ (*affine-coherent-equivalence*), so coherent modules on affine noetherian formal schemes have no cohomology in positive degrees. For B = k⟦t⟧ and M = B/(t²), H⁰ is M, of length 2, and H¹ = 0.

The additional proper formal coherent-direct-image contract required from AdicSpacesPartIII §F0.6 is the following: for an adic proper finite-type morphism p of locally noetherian formal schemes, a target ideal of definition I and coherent F, provide coherent Rᵠp_*F with its canonical inverse-limit comparison for the reductions `F/(I𝒪_{X′})ⁿ⁺¹F` and the Mittag–Leffler assertion on every noetherian target open. (EGA-III1 (3.4.2)–(3.4.4), pp. 119–120; EGA-III1 lines 4471–4507).

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.16–0.18 supply catenarity, depth, Cohen–Macaulay local algebra and coherent support. Section 0.7 supplies neighbourhood dimension, which is distinguished from the stalk dimension defined here. Sections 2.2 and 2.6 supply Leray, coherent scheme cohomology, affine acyclicity (*serre_affineness_criterion*) and the affine-base bound *QCoh.higherDirectImage_vanishing*; §4.13 supplies regular schemes. Section 3.3, *vectorBundleDegree* and its tensor/dual formulas, supplies degree for finite locally free sheaves on arbitrary proper schemes of dimension at most one over a field. Section 5.7 supplies the scheme resolution-property predicate and scheme K₀/G₀ interfaces; their supported K-theory refinements are consumed from SchemeKTheoryOperations.

### From TauCetiRoadmap.JacobianChallenge

Layer C supplies, for a proper morphism f : X → S of schemes with S locally noetherian and coherent F on X, coherence of every Rᵠf_*F with no flatness hypothesis, and, over S = Spec A with A noetherian, finiteness of Hᵠ(X, F) as an A-module together with its identification with the global sections of Rᵠf_*F. Section 4.1 uses only the affine-base finiteness statement.

### From TauCetiRoadmap.GrothendieckEulerForms and TauCetiRoadmap.GeneralAlgebraicKTheory

GrothendieckEulerForms Layers 2–3 supplies additive Grothendieck-group functoriality, universal properties and the resolving-category comparison, with finite admissible resolutions and common-refinement independence. GeneralAlgebraicKTheory §4.8 supplies dévissage for an essentially small abelian category and a full subcategory closed under subobjects and quotients, where every object has a finite filtration with quotients in that subcategory. The ideal-adic filtration here verifies these hypotheses; it is not asserted to be an exact filtration functor.

### From TauCetiRoadmap.DerivedModuleAlgebra and TauCetiRoadmap.EnhancedDerivedSheaves

DerivedModuleAlgebra §0.K.1 supplies the finite Koszul complex, its signed tensor formula and its resolution theorem for regular sequences. EnhancedDerivedSheaves §§0.3–0.4 and E1.4 supplies derived tensor, ringed pullback and pushforward, their composition, associativity and the projection transformation on ringed spaces; §E1.5 supplies the cochain comparison for Koszul complexes and §E1.6 supplies the finite-dimensional regular-ring homological bound. Section 4.7 proves that the projection transformation is invertible in the formal coherent setting with a locally perfect first input. No generic projection isomorphism for an arbitrary functor is assumed.

### From TauCetiRoadmap.SchemeKTheoryOperations

Use §§1.5–1.6 and 2.5 for strict complexes and the strict/perfect comparison on schemes with the resolution property, §2.1 for coherent G₀, §2.2 for derived pullback and the underived flat pullback on G₀, §2.3 for proper pushforward on G₀ with its alternating higher-direct-image formula and composition, §2.4 for Tor-independent base change of G-transfers and the projection formula, §3.5 for coherent supported dévissage, §4.4 for support filtrations, §6.1 for support products and pullback compatibility, and §6.12 for degree-zero strict support comparison and rational supported filtration multiplicativity on separated regular noetherian finite-dimensional schemes. Apply the last result to Spec A, where the resolution property holds. No multiplicativity input for non-affine formal schemes is supplied or assumed.

## How to read the build

Layer 0 fixes stalk dimension, regular immersions and power-annihilated support, then glues coherent Tor. Layer 1 forms the two Grothendieck groups and their products and identifies the affine theory with Spec A. Layer 2 proves the regular supported comparison, builds the two filtrations, transports affine rational multiplicativity and passes to limits over noetherian opens. Layer 3 proves the closed-union and expected-dimension lemmas and Cartier pullback. Layer 4 turns proper scheme support into finite Euler degree, proves the numerical pairings, and constructs formal coherent proper pushforward. Internal dependencies point to earlier subsections; the affine product theorem has no Euler-degree input.

## Layer 0: local algebra and formal supports

### 0.1 Stalks of Spf A, localisations of A and completed localisations share their completion

Let A be a noetherian adic ring with ideal of definition I, X = Spf A, and let x ∈ |X| correspond to the open prime p ⊇ I. The canonical maps `A_p → 𝒪_{X,x} → A{A∖p}` (the last is the completed localisation lim_n (A/I^n)_p) are local homomorphisms of noetherian local rings, both flat, and each induces isomorphisms modulo I^n for every n ≥ 1: `A_p/I^nA_p ≅ 𝒪_{X,x}/I^n𝒪_{X,x} ≅ (A/I^n)_p`. Consequently the three rings have isomorphic maximal-ideal-adic completions, and hence the same Krull dimension, and one of them is regular (respectively Cohen–Macaulay) if and only if all three are. The closed points of |Spf A| are exactly the maximal ideals of A. (EGA-I, Ch. 0 (7.6.15)–(7.6.18), pp. 74–75, and Ch. I (10.1.5)–(10.1.6), p. 182; EGA-I lines 2849–2892 and 7294–7299; STACKS, more-algebra, Tag 07NV; STACKS line 5216 (5216–5223); STACKS, more-algebra, Tag 07NY; STACKS line 5229 (5229–5237); STACKS, more-algebra, Tag 07NX; STACKS line 5224 (5224–5228); STACKS, algebra, Tag 05GI; STACKS line 10601 (10601–10618)).

A noetherian and complete and separated for its I-adic topology (an adic noetherian ring, AdicSpacesPartII §R0.1a). x is a point of the formal spectrum, i.e. an open prime ideal p of A (p ⊇ I).

*Proof route.* Write the stalk as the filtered colimit of completed principal localisations. Those are A-flat; the map from the stalk to the completed localisation is its I-adic completion and is faithfully flat. Modulo Iⁿ, n ≥ 1, both maps identify with the identity on (A/Iⁿ)_𝔭. To compare maximal-ideal completions, quotient further by the image of the nth maximal-ideal power, not by an unrelated ideal. Completion invariance of dimension, regularity and the Cohen–Macaulay condition then applies. The supplied `IsAdicComplete.le_jacobson_bot` makes every maximal ideal an open prime.

*Needs:* AdicSpacesPartII §R0.1a; AdicSpacesPartIII §F0.1 (completed-localization); AdicSpacesPartIII §F0.3; Mathlib `ringKrullDim`; Mathlib `IsRegularLocalRing`; Mathlib `IsAdicComplete`; Mathlib `Ideal.jacobson`; Mathlib `IsAdicComplete.le_jacobson_bot`; Mathlib `AdicCompletion`; SchemeAndStackFoundations §§0.17–0.18.

**Checks.**

- For A = ℤ_p⟦t⟧ and x the closed point, all three rings are ℤ_p⟦t⟧ itself.
- For A = ℤ_p⟨t⟩ (p-adic completion of ℤ_p[t]) and p = (p), A_p is a discrete valuation ring, `𝒪_{X,x}` is a discrete valuation ring with the same completion, and all have dimension 1, while maximal ideals (p, f(t)), with f nonconstant and irreducible modulo p, have height 2.
- For I = 0 and A = k[t], the stalk and the completed localisation at (t) are k[t]_(t); their maximal-ideal completions are k⟦t⟧. I-adic completion must not be confused with maximal-ideal completion.

### 0.2 Local dimension and codimension on locally noetherian formal schemes

For a locally noetherian formal scheme X define `dimₓ X = dim 𝒪_{X,x}` and dim X = supₓ dimₓ X, with dim ∅ = ⊥. For nonempty noetherian X and d ∈ ℕ, define pure dimension d by dimₓ X = d at every closed point. For a closed formal immersion Z → X define `codim_z(Z,X) = dim 𝒪_{X,z} − dim 𝒪_{Z,z}` at z ∈ Z, and codim_X Z as the infimum of these integers, taking the empty infimum as ⊤. Prove dimₓ Spf A = dim A_𝔭 at its open prime 𝔭, dim Spf A = dim A, and dim Spf(A/𝔞) = dim(A/𝔞). Every stalk dimension is finite; the global supremum can be infinite. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; EGA-I, Ch. 0 (7.6.15)–(7.6.18), pp. 74–75, and Ch. I (10.1.5)–(10.1.6), p. 182; EGA-I lines 2849–2892 and 7294–7299).

X locally noetherian, so every stalk is a noetherian local ring (EGA I (10.1.6)) and has finite Krull dimension. Codimension is measured in the ambient X, never relative to an intermediate support. The local symbol dimₓ means stalk dimension, not the infimum of dimensions of open neighbourhoods (the different convention of SchemeAndStackFoundations §0.7).

The API consists of these facts under the hypotheses above.

- The local dimension at x is the Krull dimension of its stalk, and the global dimension is their supremum, with dimension ⊥ for the empty formal scheme.
- For noetherian X and d ∈ ℕ, purity means that every closed stalk has dimension d; it implies dim X = d when X is nonempty.
- Local codimension for Z → X is the difference of the two finite stalk dimensions; global codimension is their infimum, with value ⊤ on empty Z.
- At the open prime 𝔭 of Spf A, local dimension is dim A_𝔭; globally dim Spf A = dim A, and dim Spf(A/𝔞) = dim(A/𝔞).
- For an ordinary locally noetherian scheme, these stalks and the global dimension agree with the scheme notions; neighbourhood dimension is a separate function.
- If Z ⊆ Z′ ⊆ X are closed formal subschemes, then codim_X Z′ ≤ codim_X Z.

*Proof route.* Use §0.1 to identify local dimensions with dim A_𝔭. Every maximal ideal of A is open, so taking the supremum at maximal ideals gives dim A and the same argument works for A/𝔞. Stalk dimensions increase under specialisation. For a noetherian formal scheme every point has a closed specialisation, so closed points suffice for the supremum. The ordinary-scheme compatibility follows from equality of the stalk rings.

*Needs:* AdicSpacesPartIII §F0.3; AdicSpacesPartIII §F0.4; §0.1; Mathlib `ringKrullDim`.

**Checks.**

- In Spf ℤ_p⟦t⟧: codim V(t) = codim V(t − p) = 1, codim V(p, t) = 2 and codim V(t·(t − p)) = 1.
- The underlying space of Spf ℤ_p⟦t⟧ is a single point, so a definition by the Krull dimension of the topological space |X| gives 0 instead of 2, and would give every nonempty closed formal subscheme codimension 0 (V(t) and V(p, t) instead of 1 and 2); the empty V(1) has no points, so its infimum stays ⊤.
- For the scheme 𝔸¹_k regarded as a formal scheme, dim = 1, agreeing with the scheme dimension.
- dim ∅ = ⊥ and codim ∅ X = ⊤; no subtraction involving ⊥ defines a local codimension.
- At the generic point η of A¹_k embedded as an ordinary scheme, the stalk dimension is dim k(t) = 0, while every open neighbourhood has dimension 1. This distinguishes stalk dimension from neighbourhood dimension.

### 0.3 Regular and Cohen–Macaulay formal schemes

A locally noetherian formal scheme X is regular (respectively Cohen–Macaulay) if every stalk `𝒪_{X,x}`, x ∈ |X|, is a regular local ring in the native sense (respectively a Cohen–Macaulay local ring, SchemeAndStackFoundations §§0.17–0.18). A closed formal subscheme is regular or Cohen–Macaulay when it is so as a formal scheme. For X = Spf A with A adic noetherian: X is regular if and only if A is a regular ring, and Cohen–Macaulay if and only if every localisation of A at a maximal ideal is Cohen–Macaulay. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; STACKS, algebra, Tag 0AFS; STACKS line 12566 (12566–12576); STACKS, algebra, Tag 00NP; STACKS line 11920 (11920–11933); STACKS, algebra, Tag 00O7; STACKS line 12478 (12478–12503)).

X locally noetherian. Regularity is a condition on all stalks, closed or not; on each affine formal open it suffices to check the points given by maximal ideals of its coordinate ring. Globally closed points suffice when X is noetherian.

The zero ring gives the empty formal scheme; regularity and the Cohen–Macaulay condition there are vacuous, with no nonzero local stalk asserted.

The API consists of these facts under the hypotheses above.

- Regularity, respectively the Cohen–Macaulay condition, is equivalent to that condition on every stalk.
- For adic noetherian A, Spf A is regular exactly when A is regular; its Cohen–Macaulay condition is equivalent to that condition on all A_𝔪 for maximal 𝔪.
- For an ordinary locally noetherian scheme, formal regularity agrees with scheme regularity.
- A regular formal scheme is Cohen–Macaulay and each of its stalks is a domain.
- Restriction to an open formal subscheme preserves regularity and the Cohen–Macaulay condition.

*Proof route.* Use the common-completion comparison at open primes. Maximal ideals of an adic noetherian ring are all open. Regularity and the Cohen–Macaulay property localise, so testing those maximal ideals also tests primes which are not points of Spf A. The regular-local domain theorem and the depth formula supply the other implications.

*Needs:* §0.1; §0.2; Mathlib `IsRegularLocalRing`; Mathlib `IsRegularRing`; SchemeAndStackFoundations §§0.17–0.18; SchemeAndStackFoundations §4.13.

**Checks.**

- Spf k⟦x, y⟧/(xy) is Cohen–Macaulay (a hypersurface) but not regular: its maximal ideal needs two generators while its dimension is 1.
- Spf k⟦x, y, z, w⟧/((x, y) ∩ (z, w)), the union of two planes meeting in a point, is not Cohen–Macaulay: it has dimension 2 and depth 1.
- `𝔸ⁿ_{ℤ_p}` regarded as a formal scheme is regular, as the scheme is.
- For n = 0, 1, 2, Spf ℤ_p⟦t_1, …, t_n⟧ is regular of dimension 1, 2, 3 respectively; Spf of every complete regular local ring is regular, as is the p-adic completion of a smooth ℤ_p-scheme. Regularity cannot mean dimension zero of the underlying one-point space.

### 0.4 Codimension formula on Cohen–Macaulay formal schemes

Let X be a noetherian formal scheme all of whose stalks are Cohen–Macaulay (for instance a regular one), and Z ⊆ X a nonempty closed formal subscheme. (a) The infimum defining codim_X Z is attained at a closed point, and on every affine formal open Spf A meeting Z, with Z ∩ Spf A = Spf(A/𝔞), `codim_{Spf A}(Z ∩ Spf A) = height(𝔞)` := min over the minimal primes q of 𝔞 of ht q, the codimension of V(𝔞) in Spec A. (b) If moreover X has pure dimension d, then codim_X Z = d − dim Z. (STACKS, algebra, Tag 00NA; STACKS line 11785 (11785–11792); ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603).

X is noetherian, so every point has a closed specialisation in X. The affine height identity also applies on each affine formal open of a locally noetherian X. All stalks Cohen–Macaulay (catenary and equidimensional). (b) only: pure dimension d, i.e. `dim 𝒪_{X,x} = d` at every closed point.

*Proof route.* In a Cohen–Macaulay local ring R, dim R = dim R_𝔮 + dim(R/𝔮). Thus dim R − dim(R/𝔞) is the minimum height of a prime over 𝔞. Localisation and §0.1 identify this with the local codimension. Specialising a prime enlarges the set over which the minimum is taken, so the minimum is attained at closed points in noetherian X. If X is pure d, there the difference is d − dim O_Z, and its infimum is d − dim Z.

*Needs:* §0.2; §0.3; §0.1; SchemeAndStackFoundations §§0.16–0.18; SchemeAndStackFoundations §0.16; Mathlib `Ideal.height`.

**Checks.**

- Spf ℤ_p⟦t⟧ (d = 2): Z = V(t) has dim 1 and codim 1; Z = V(p, t) has dim 0 and codim 2.
- The height description fails without the Cohen–Macaulay hypothesis: in Spf k⟦x, y, z⟧/(xz, yz) (a plane union a line through the origin, not equidimensional) the line V(x, y) is an irreducible component, of height 0 in the coordinate ring, while `dim 𝒪_{X,x} − dim O_{L,x} = 2 − 1 = 1` at the closed point.
- For Z = X nonempty, both codimension and d − dim X are 0; the empty support has codimension ⊤ and is outside the displayed finite subtraction formula.

### 0.5 Regular immersions and effective Cartier divisors of formal schemes

A closed immersion i : Z → X of locally noetherian formal schemes with coherent ideal 𝒜 ⊆ 𝒪_X is a regular immersion if for every z ∈ |Z| the ideal `𝒜_z ⊆ 𝒪_{X,z}` is generated by a regular sequence (the native regular-sequence predicate) f_1, …, f_m of `𝒪_{X,z}`; m = codim_z(Z, X) is then locally constant on |Z|. An effective Cartier divisor is a closed formal subscheme D whose ideal is invertible (locally generated by one nonzerodivisor), i.e. a regular immersion of codimension 1. On Spf A with Z = Spf(A/𝔞), i is a regular immersion iff 𝔞 is generated by a regular sequence locally near every maximal ideal containing 𝔞; if X and Z are both regular, every closed immersion Z → X is a regular immersion. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372; STACKS, algebra, Tag 00KW; STACKS line 6769 (6769–6776); STACKS, more-algebra, Tag 062F; STACKS line 3571 (3571–3585)).

X locally noetherian. The local equations are taken in the formal stalks `𝒪_{X,z}`; by faithful flatness of `A_p → 𝒪_{X,z}` (§0.1) this is equivalent to the condition in A_p.

The API consists of these facts under the hypotheses above.

- A closed immersion is regular exactly when its stalk ideals at points of the source are generated by regular sequences.
- The length of such a sequence is independent of its choice, equals local codimension, and is locally constant on the source.
- A closed formal subscheme is an effective Cartier divisor exactly when its ideal is invertible, equivalently when its immersion is regular of codimension one at every point of its source.
- Every closed immersion between regular locally noetherian formal schemes is regular.
- For Spf(A/𝔞) → Spf A, regular immersion means that 𝔞 is generated by a regular sequence locally at every maximal ideal containing 𝔞; the condition is vacuous off V(𝔞).
- Locally the Koszul complex of the equations is a finite free resolution of the quotient structure sheaf.

*Proof route.* Regular sequences descend and ascend along the local faithfully flat maps of §0.1, as witnessed by Koszul homology. Their successive dimension drops are one. The conormal module is locally free of rank the length, proving local constancy. A quotient between regular local rings is cut out by part of a regular system of parameters. The supplied Koszul resolution gives the final assertion.

*Needs:* AdicSpacesPartIII §F0.4; §0.2; §0.1; Mathlib `RingTheory.Sequence.IsRegular`; DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5; DerivedModuleAlgebra §0.K.1 (Koszul resolution).

**Checks.**

- V(t − p) ⊂ Spf ℤ_p⟦t⟧ is an effective Cartier divisor, and V(t − p) ≅ Spf ℤ_p.
- V(t²) ⊂ Spf ℤ_p⟦t⟧ is an effective Cartier divisor although it is not reduced: the definition must not require reducedness.
- The identity immersion of nonempty X is cut out by the empty regular sequence and has codimension 0; the empty immersion has the regular-immersion condition vacuously.
- The closed point of Spf k⟦x, y⟧/(xy) is not a regular immersion: its maximal ideal needs two generators, but the ring has dimension and depth 1, so it cannot be generated by a regular sequence.

### 0.6 Formal support of a coherent module; inverse images and flat morphisms

Let X be a locally noetherian formal scheme, Y ⊆ X the closed formal subscheme with coherent ideal 𝒥 (AdicSpacesPartIII §F0.4). A coherent 𝒪_X-module F is formally supported on Y if every point of |X| has an open neighbourhood U with 𝒥^n·F|_U = 0 for some n; on noetherian X one n works globally. Coh_Y(X) ⊆ Coh(X) is the full subcategory of such F; it is a Serre subcategory. On X = Spf A with Y = Spf(A/J) and F = M^Δ (M a finite A-module): F is formally supported on Y iff J^nM = 0 for some n iff Supp_A(M) ⊆ V(J) ⊆ Spec A. Formal support depends on 𝒥 only through its radical, and it is not detected by the topological support Supp F ⊆ |X|. (ZHANG21, Appendix B.1, p. 971; ZHANG21 lines 4511–4521; STACKS, algebra, Tag 00L6; STACKS line 6891 (6891–6900)).

For a morphism g : X′ → X of locally noetherian formal schemes define the inverse image `g⁻¹Y := V(g^*𝒥·𝒪_{X′})`, where `g^*𝒥·𝒪_{X′}` is the image of the coherent pullback `g^*𝒥 → g^*𝒪_X = 𝒪_{X′}`; it is a coherent ideal, being the image of a map of coherent modules. For a continuous A → A′ and the induced Spf A′ → Spf A, the inverse image of Spf(A/J) is Spf(A′/JA′) by the supplied `FormalScheme.Spf.completedTilde.ideal_map` (AdicSpacesPartIII §F0.6, *associated-formal-module*; EGA-I, Ch. I (10.10.9), p. 203; EGA-I lines 8193–8199). Prove that id⁻¹Y = Y and (g∘h)⁻¹Y = h⁻¹(g⁻¹Y), and that `g^*` carries `Coh_Y(X)` into `Coh_{g⁻¹Y}(X′)`. Call g flat when every stalk map `𝒪_{X,g(x′)} → 𝒪_{X′,x′}` is flat, and prove that pullback of coherent modules along a flat g is exact.

X locally noetherian; 𝒥 a coherent ideal. Supports are formal (power of the ideal kills), not topological. The inverse-image ideal is the image of g^*𝒥, not g^*𝒥 itself, and g is arbitrary unless flatness is stated.

The API consists of these facts under the hypotheses above.

- Formal support on V(𝒥) means local annihilation by a positive power of 𝒥; on noetherian X one exponent suffices.
- The inverse image of V(𝒥) along any g : X′ → X is cut out by the image of `g^*𝒥` in `𝒪_{X′}`; on affine formal spectra it is Spf(A′/JA′); it respects identities and composition, and pullback carries modules formally supported on Y to modules formally supported on g⁻¹Y.
- A morphism whose stalk maps are all flat is flat; pullback of coherent modules along it is exact.
- The coherent modules with this property form a full Serre subcategory, denoted Coh_Y(X).
- For finite M on Spf A the condition is equivalent both to JⁿM = 0 for some n ≥ 1 and to Supp_A M ⊆ V(J) in Spec A.
- Enlarging Y preserves the support condition. In affine terms, J′ ⊆ J and J-power annihilation imply J′-power annihilation.
- Tensor products of modules formally supported on Y and Z are formally supported on Y ∩ Z.
- Ideals with the same radical give the same supported subcategory.
- For n ≥ 1, closed pushforward from V(𝒥ⁿ) takes coherent modules into Coh_Y(X).

*Proof route.* For an extension killed on its ends by 𝒥ᵃ and 𝒥ᵇ, the middle is killed by 𝒥ᵃ⁺ᵇ. Subobjects and quotients inherit annihilation. On Spf A apply the finite-module support criterion and the exact affine coherent equivalence. Ideals with the same radical contain powers of one another locally. If two factors are killed by Jᵃ and Kᵇ with a,b ≥ 1, their tensor and Tor are killed by (J+K)ᵃ⁺ᵇ⁻¹; the exponent is positive. Coherent pullback is right exact and the category of coherent modules is closed under images, so the inverse-image ideal is coherent; on affine formal spectra the supplied `FormalScheme.Spf.completedTilde.pullbackIso` and `FormalScheme.Spf.completedTilde.ideal_map` give the affine formula. Since `(𝒥𝒪_{X′})ⁿ = 𝒥ⁿ𝒪_{X′}`, a module killed by 𝒥ⁿ pulls back to one killed by the nth power of the inverse-image ideal. Right exactness of pullback applied to the surjection of `h^*g^*𝒥` onto `h^*(g^*𝒥·𝒪_{X′})` gives the composition law. The stalk of g^*F at x′ is `F_{g(x′)} ⊗ 𝒪_{X′,x′}`, which gives exactness for flat g.

*Needs:* AdicSpacesPartIII §F0.6 (associated-formal-module: `FormalScheme.Spf.completedTilde.pullbackIso`, `FormalScheme.Spf.completedTilde.ideal_map`); AdicSpacesPartIII §F0.8 (coherent-formal-module-properties, including *cohPullback* and closure under images); AdicSpacesPartIII §F0.4; AdicSpacesPartIII §F0.6 (affine-coherent-equivalence); Mathlib `Module.support`; Mathlib `Submodule.annihilator`; Mathlib `Module.Flat`.

**Checks.**

- On Spf A and n ≥ 1, (A ⧸ J^n)^Δ is formally supported on V(J); at n = 0 it is the zero module.
- On Spf ℤ_p with Y = V(p), O is not formally supported on Y although its topological support is |Y|: a definition by topological support accepts it.
- Every coherent F is formally supported on Y = X (J = 0, killed by J¹); only F = 0 is formally supported on Y = ∅ (𝒥 = 𝒪_X). A positive exponent rules out using J⁰ = A to misclassify the zero ideal.
- For a noetherian scheme X, a coherent F is formally supported on Y iff its set-theoretic support lies in |Y|.
- For g : Spf ℤ_p⟦t⟧ → Spf ℤ_p and Y = V(p²), g⁻¹Y = Spf (ℤ/p²)⟦t⟧, which is nonreduced, while the topological preimage of |Y| is the whole one-point space; g is flat because ℤ_p⟦t⟧ is flat over ℤ_p.
- For i : Spec 𝔽_p → Spf ℤ_p and 𝒥 = (p), the pullback i^*𝒥 = (p) ⊗ 𝔽_p ≅ 𝔽_p is nonzero, but its image in 𝒪 = 𝔽_p is zero, so i⁻¹V(p) = Spec 𝔽_p is the whole source; taking i^*𝒥 itself as the ideal would be wrong. The map i is not flat: i^* sends the injection p : ℤ_p → ℤ_p to the zero map 𝔽_p → 𝔽_p.

### 0.7 Tor sheaves of coherent modules on a locally noetherian formal scheme

For a locally noetherian formal scheme X and coherent 𝒪_X-modules F, G, there are coherent 𝒪_X-modules `Torⱼ^{𝒪_X}(F, G)`, j ≥ 0, with Tor₀ = F ⊗ G, such that on every affine formal open Spf A with F = M^Δ, G = N^Δ one has `Torⱼ|_{Spf A} ≅ Torⱼ^A(M, N)^Δ`, compatibly with restriction to smaller affine formal opens; their stalks are `Torⱼ^{𝒪_{X,x}}(F_x, G_x)`. They are symmetric in F and G, give long exact sequences in each variable, are formally supported on Y ∩ Z when F is formally supported on Y and G on Z, vanish for j > d when every stalk has global dimension ≤ d (for instance X regular of dimension d), and vanish for j > 0 when F is locally free. When the pair has a uniform finite Tor bound (for example X regular of finite dimension, or one input has a fixed finite Tor-amplitude interval), the derived tensor class is [F ⊗^L G] := Σ_j (−1)^j [`Torⱼ^{𝒪_X}(F, G)`]. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; EGA-I, (10.10.2), (10.10.8), pp. 201–203; EGA-I lines 8098–8114 and 8186–8192; STACKS, algebra, Tag 00M0; STACKS line 8230 (8230–8245); STACKS, algebra, Tag 00M3; STACKS line 8393 (8393–8409); STACKS, algebra, Tag 00O7; STACKS line 12478 (12478–12503)).

X locally noetherian; F, G coherent. Tor is taken over 𝒪_X itself, never over a thickening `X_n = V(𝒥^{n+1})` or over the reduction. Each Torⱼ exists without finite amplitude. An alternating class is defined only when all sufficiently high Torⱼ vanish uniformly; for locally noetherian exhaustion constructions this bound may instead be checked on each noetherian member.

The API consists of these facts under the hypotheses above.

- For every j ∈ ℕ the coherent Tor sheaf is functorial in both coherent inputs; degree zero is their tensor product.
- On Spf A, association of finite modules carries module Tor to the formal Tor sheaf, compatibly with completed localisations.
- The stalk at x is Tor over `𝒪_{X,x}` of the two stalks.
- Interchanging the inputs gives the symmetry isomorphism; a short exact sequence in either input gives the long exact Tor sequence.
- Inputs formally supported on Y and Z have Tor sheaves formally supported on Y ∩ Z.
- If every stalk has global dimension at most d, Torⱼ vanishes for j > d. A locally free input gives vanishing for all j > 0.
- On an ordinary noetherian scheme these Tor sheaves agree with the scheme Tor sheaves.

*Proof route.* Associate the finite A-module Torⱼ^A(M,N) on every affine formal open. Flat completed localisations commute with module Tor, hence give compatible restrictions and gluing. The same flatness computes stalks. Module long exact sequences and symmetry give the sheaf laws; finite global dimension of regular local rings gives the stated bound. Without a uniform finite bound no alternating class is formed.

*Needs:* AdicSpacesPartIII §F0.6 (affine-coherent-equivalence); AdicSpacesPartIII §F0.6; AdicSpacesPartIII §F0.1 (completed-localization); AdicSpacesPartIII §F0.3; AdicSpacesPartIII §F0.8 (coherent-formal-module-properties); §0.1; §0.6; §0.3; Mathlib `CategoryTheory.Tor`; Mathlib `Module.Flat`; EnhancedDerivedSheaves §E1.6 (regular-ring dimension bound).

**Checks.**

- On Spf ℤ_p⟦t⟧, Tor 1 (O/(t)) (O/(t)) ≅ O/(t).
- On Spf ℤ_p⟦t⟧, Tor 1 (O/(t)) (O/(t − p)) = 0 and Tor 0 ≅ O/(t, p) ≅ 𝔽_p.
- On Spf ℤ_p, Tor 1 𝔽_p 𝔽_p ≅ 𝔽_p, whereas Tor over the reduction Spec 𝔽_p vanishes: a definition through the thickenings or the reduction is wrong.
- For R = k[ε]/(ε²), Torⱼ^R(k,k) ≅ k for every j ≥ 0, from the resolution with every differential multiplication by ε. Thus coherence of every Tor sheaf does not justify an infinite alternating sum in K′₀.

### Examples

For R = ℤ_p⟦t⟧ with maximal-ideal topology, dim Spf R = 2, while |Spf R| is a point. The divisors t and t−p have codimension one; their common quotient is 𝔽_p of codimension two. Tor₁(R/(t),R/(t−p)) = 0, but Tor₁(R/(t),R/(t)) = R/(t). Reducing the coefficient ring before taking Tor would replace `Tor₁^{ℤ_p}(𝔽_p,𝔽_p) = 𝔽_p` by `Tor₁^{𝔽_p}(𝔽_p,𝔽_p) = 0`. These are the local-dimension, support and tensor conventions used by every subsequent layer (§§0.2, 0.6–0.7).

### Dependencies

AdicSpacesPartII §§R0.1a–R0.1b; AdicSpacesPartIII §§F0.1–F0.4, F0.6, F0.8; SchemeAndStackFoundations §§0.16–0.18, 4.13; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §§E1.5–E1.6; Mathlib local algebra and module Tor.

## Layer 1: Grothendieck groups and products

### 1.1 The Grothendieck group K′₀ of coherent modules on a noetherian formal scheme

For a noetherian formal scheme X, K′₀(X) is the abelian Grothendieck group of Coh X, the free abelian group on isomorphism classes of coherent 𝒪_X-modules modulo [F] = [F′] + [F″] for every short exact sequence 0 → F′ → F → F″ → 0; K′₀(X)_ℚ := K′₀(X) ⊗ ℚ. It is functorial for restriction to open formal subschemes, for pushforward along closed immersions (i_* is exact), and for pullback along flat morphisms. For X = Spf A, Γ(X, ·) gives K′₀(Spf A) ≅ G₀(A), the supplied exact Grothendieck group of finite A-modules; for a noetherian scheme regarded as a formal scheme, K′₀ is π_0 of the parent's G-theory (SchemeKTheoryOperations §2.1). (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X noetherian (quasi-compact and locally noetherian), so Coh X is an essentially small abelian category (AdicSpacesPartIII §F0.8 (coherent-formal-module-properties)): finitely many affine formal opens, finite modules and gluing data. Integral coefficients; rational coefficients only by explicit tensoring.

The API consists of these facts under the hypotheses above.

- Every coherent module has a class, and a short exact sequence gives the sum of the outer classes.
- Restriction to opens, closed pushforward and flat pullback induce homomorphisms with identity and composition laws; their sources and targets are the corresponding coherent Grothendieck groups.
- On Spf A the exact affine coherent equivalence induces K′₀(Spf A) ≅ G₀(A), carrying the class of M^Δ to the class of M.
- For an ordinary noetherian scheme, this group is its scheme G₀.
- An assignment to an abelian group that respects short exact sequences extends uniquely to an additive homomorphism.
- Two homomorphisms agree if they agree on all coherent classes. To prove a subgroup is the whole group it suffices to contain those classes; zero, sums and negatives give additive induction.

*Proof route.* Apply the supplied abelian Grothendieck group to the essentially small coherent category. Exact restriction, closed pushforward and flat pullback induce the maps. The exact affine coherent equivalence identifies its group with finite-module G₀. The ordinary-scheme comparison uses the equality of the coherent categories and the supplied scheme degree-zero comparison.

*Needs:* §0.6 (flat morphisms); AdicSpacesPartIII §F0.6; AdicSpacesPartIII §F0.8 (coherent-formal-module-properties); AdicSpacesPartIII §F0.6 (affine-coherent-equivalence); Tau Ceti `TauCeti.AbelianK0`; Tau Ceti `TauCeti.AbelianK0.of`; Tau Ceti `TauCeti.ExactK0`; Tau Ceti `TauCeti.finiteModulesExactStructure`; SchemeKTheoryOperations §2.1.

**Checks.**

- K′₀(Spf ℤ_p) ≃+ ℤ by generic rank, and [𝔽_p] = 0 (from 0 → ℤ_p → ℤ_p → 𝔽_p → 0).
- K′₀(Spf k⟦x, y⟧/(xy)) ≃+ ℤ², sending [M] to the ranks at the minimal primes (x) and (y); [k] = 0 and [O] = (1, 1).
- K′₀(∅) = 0.
- For a field k, K′₀(Spf k) = K′₀(Spec k) ≃+ ℤ by dimension, as TauCeti's G₀ of k; [k²] = 2.
- The pushforward system `G₀(Spec ℤ/p^{n+1})` is canonically ℤ by length, with [𝔽_p] = 1. Its map to K′₀(Spf ℤ_p) ≅ ℤ by generic rank sends that generator to 0. Both abstract groups are ℤ, but the marked comparison is not an isomorphism.

### 1.2 Dévissage for formally supported coherent modules

Let X be a noetherian formal scheme and Y = V(𝒥) a closed formal subscheme. Pushforward along i : Y → X induces an isomorphism K′₀(Y) ≅ K₀(Coh_Y(X)) (abelian K₀ of the Serre subcategory of §0.6). Hence K′₀(V(𝒥^n)) ≅ K′₀(Y) for every n ≥ 1, and K′₀(Y) depends only on the radical of 𝒥; every coherent F formally supported on Y has a class [F] ∈ K′₀(Y). (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; STACKS, algebra, Tag 00L6; STACKS line 6891 (6891–6900)).

X noetherian, so a single power of 𝒥 kills each object of Coh_Y(X).

*Proof route.* Filter each object by 𝒥ⁱF. The finite successive quotients are actual coherent modules on Y. Categorical dévissage makes closed pushforward an isomorphism; its inverse is the sum of their classes, independent of a chosen finite filtration by refinement. Applying this to V(𝒥) and V(𝒥ⁿ) identifies both with the same formally supported category. Underived restriction is not this inverse.

*Needs:* §0.6; §1.1; GeneralAlgebraicKTheory §4.8; AdicSpacesPartIII §F0.4; SchemeKTheoryOperations §3.5.

**Checks.**

- For Y = V(p) ⊂ Spf ℤ_p, K′₀(Spec 𝔽_p) ≅ ℤ ≅ K₀(Coh_Y(Spf ℤ_p)), generated by [𝔽_p], and [ℤ/p^n] = n[𝔽_p].
- For a dual-number thickening Spec(k[ε]/ε²), the structure sheaf has class 2[k] under dévissage, whereas its underived restriction has class [k].
- For Y empty the supported category has only the zero object and its group is 0.

### 1.3 Strict complexes with formal support

For a noetherian formal scheme X and a closed formal subscheme Y, C^b_Y(X) is the category of bounded chain complexes of locally free coherent 𝒪_X-modules of finite rank whose homology sheaves are formally supported on Y (§0.6), with chain maps as morphisms. It is closed under shifts, mapping cones, finite direct sums and degreewise split extensions; `E ⊗ F ∈ C^b_{Y∩Z}(X)` for E ∈ C^b_Y(X), F ∈ C^b_Z(X); and for any morphism g : X′ → X of noetherian formal schemes, `g^*E ∈ C^b_{g^{-1}Y}(X′)` with `g^{-1}Y := V(g^*𝒥·O_{X′})`. On X = Spf A with A an adic noetherian ring, prove that for a finite A-module M the coherent module M^Δ is locally free of finite rank if and only if M is projective; hence Γ identifies `C^b_{Spf(A/J)}(Spf A)` with the bounded complexes of finite projective A-modules whose homology is supported in V(J) ⊆ Spec A, i.e. with Gillet–Soulé's strict category of Spec A with support V(J). (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

Global strict complexes: a perfect complex need not be quasi-isomorphic to one of these unless X has the resolution property (§2.1). Support is formal: acyclicity 'outside Y' means homology killed by a power of the ideal of Y.

The API consists of these facts under the hypotheses above.

- The strict supported category is the full category of bounded global finite locally free complexes with formally supported homology.
- Shifts, cones, finite sums and degreewise split extensions preserve membership with a fixed support.
- Total tensor takes the categories with supports Y and Z to the category with support Y ∩ Z.
- For every formal morphism g, termwise pullback takes the category with support Y to the category with support g⁻¹Y and respects composition.
- On Spf A, for finite M, the associated coherent module M^Δ is locally free of finite rank exactly when M is projective.
- On Spf A, membership means a bounded complex of finite projective A-modules whose homology has support in V(J) in Spec A.
- The Koszul complex of any finite list of global functions has formal support in their common vanishing subscheme, even when the list is not regular.

*Proof route.* If M^Δ is locally free, its stalk `M ⊗_A 𝒪_{X,x}` at the point x of a maximal ideal 𝔪 is free; the map `A_𝔪 → 𝒪_{X,x}` is a flat local homomorphism of noetherian local rings (§0.1), hence faithfully flat, so M_𝔪 is flat and therefore free, and a finite module that is free at every maximal ideal is projective. Conversely, if M is projective then at an open prime 𝔭 some f ∉ 𝔭 makes M_f free, and the restriction of M^Δ to the formal open D(f) is the associated module of `M ⊗_A A{f}`, which is free. The Serre property and bounded long exact homology sequence give cone and extension closure. On affine charts a bounded projective complex exact away from V(J) is contractible after localising at a prime away from V(J). Tensor and arbitrary base change preserve that contraction. The affine support criterion then gives formal support after tensor or pullback, without assuming flatness of the formal morphism.

*Needs:* §0.1; §0.6; AdicSpacesPartIII §F0.1 (completed-localization); AdicSpacesPartIII §F0.6 (associated-formal-module, affine-coherent-equivalence); AdicSpacesPartIII §F0.8 (coherent-formal-module-properties); Mathlib `HomologicalComplex`; Mathlib `Module.Projective`; Mathlib `Module.Free`; Mathlib `Module.FaithfullyFlat`; Mathlib `Module.free_of_flat_of_isLocalRing`; SchemeKTheoryOperations §6.12; DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5.

**Checks.**

- On Spf ℤ_p, `[O →p O] ∈ C^b_{V(p)}`.
- On Spf ℤ_p, `[O →0 O] ∉ C^b_{V(p)}`: its homology is O in two degrees, formally supported only on Y = X, although its topological support is |V(p)|.
- An exact bounded complex of locally free modules lies in C^b_∅(X), and C^b_∅(X) consists exactly of these: [O →₁ O] qualifies and [O →₀ O] on nonempty X does not.
- For g : Spf ℤ_p⟦t⟧ → Spf ℤ_p the pullback of [O →p O] is `[O →p O] ∈ C^b_{V(p)}(Spf ℤ_p⟦t⟧)`.
- Pulling the p-Koszul complex on Spf ℤ_p to Spec 𝔽_p gives [𝔽_p →₀ 𝔽_p], with H₀ = H₁ = 𝔽_p; it is still a strict complex with full support.
- On Spf ℤ_p, ℤ_p^Δ = 𝒪 is locally free while 𝔽_p^Δ is not: its stalk 𝔽_p is not flat, hence not free, over ℤ_p, matching that 𝔽_p is not a projective ℤ_p-module.
- For A = ℤ_p × ℤ_p with ideal of definition (p) × (p), Spf A is two copies of Spf ℤ_p and M = ℤ_p × 0 is projective but not free; M^Δ is locally free of rank 1 on one copy and 0 on the other, so a criterion demanding a free M would wrongly exclude it.

### 1.4 The Gillet–Soulé group K₀^Y of a noetherian formal scheme

For a noetherian formal scheme X and a closed formal subscheme Y, K₀^Y(X) is the free abelian group on isomorphism classes of objects of C^b_Y(X) (§1.3) modulo [E] = [E′] + [E″] for every degreewise exact sequence 0 → E′ → E → E″ → 0 in C^b_Y(X), and [E] = [F] whenever E and F are quasi-isomorphic by a chain map. K₀(X) := K₀^X(X). Consequences: exact complexes have class 0, [E[1]] = −[E], and [cone(u)] = [F] − [E] for u : E → F. Maps: support enlargement `K₀^Y(X) → K₀^{Y′}(X)` for Y ⊆ Y′; restriction to open formal subschemes; pullback `g^* : K₀^Y(X) → K₀^{g⁻¹Y}(X′)` for every morphism g of noetherian formal schemes. K₀(X) is a commutative ring and K₀^Y(X) a K₀(X)-module under the cup product (§1.7). This is not the exact K₀ of the category of complexes: the quasi-isomorphism relation is essential. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X noetherian; Y closed formal subscheme. Global strict model; without the resolution property it may differ from a K₀ of locally perfect complexes, and nothing here asserts otherwise.

The API consists of these facts under the hypotheses above.

- The class of a strict supported complex satisfies the degreewise exact-sequence relation and is invariant under quasi-isomorphism.
- An exact complex has zero class; shifting once negates a class; the cone of E → F has class [F] − [E].
- Support enlargement, restriction to opens and pullback along every formal morphism induce maps with identities and composition laws, into the indicated enlarged, restricted or inverse-image support groups.
- The group with full support is a commutative ring under cup product, with unit [𝒪_X]; every supported group is a module over it.
- An assignment to an abelian group respecting both defining relations extends uniquely to a homomorphism.
- Homomorphisms are determined on strict-complex classes, and containing these classes gives the additive subgroup induction principle.

*Proof route.* Use the quotient presentation of strict complexes with quasi-isomorphisms. Tensor and pullback preserve the relations because bounded locally free complexes are K-flat. The cone of the identity is exact; its degreewise split sequence proves the shift sign and the cone relation. On affine schemes use the strict presentation and its supplied strict/perfect comparison in the resolution-property scope.

*Needs:* §1.3; Tau Ceti `TauCeti.ExactK0`; SchemeKTheoryOperations §6.12; SchemeKTheoryOperations §3.1.

**Checks.**

- K₀^∅(X) = 0: an object of C^b_∅(X) is exact.
- For A a noetherian complete local ring, K₀(Spf A) ≃+ ℤ by alternating sum of ranks.
- On Spf ℤ_p, the class of [O →p O] in `K₀^{V(p)}(Spf ℤ_p)` is nonzero and maps to 1 under the homology class map to K′₀(Spec 𝔽_p) ≃ ℤ.
- For X = Spf k, the degreewise exact group of bounded strict complexes without the quasi-isomorphism relation records [O →id O] as (1,1) in its two degree coordinates; in K₀(X) its class is 1 − 1 = 0.
- For X = P¹_k, a separated regular noetherian scheme with the resolution property, K₀(X) is freely generated by [O] and [O(−1)], and the Euler sequence 0 → O(−1) → O² → O(1) → 0 gives [O(1)] = 2[O] − [O(−1)]; with L = [O(−1)] this says L⁻¹ = 2 − L, equivalently (1 − L)² = 0. The parent's strict group (SchemeKTheoryOperations §6.12) carries the same values. This tests the exact-sequence relation; the acyclic complex [O →id O] in the preceding Check separately tests the quasi-isomorphism relation.

### 1.5 Affine transport: K-groups of Spf A are those of Spec A

Let A be a noetherian adic ring, J ⊆ A an ideal, X = Spf A and Y = Spf(A/J). (i) Γ(X, ·) is an equivalence from C^b_Y(X) onto the category of bounded complexes of finite projective A-modules with homology supported in V(J), compatible with ⊗, shifts, cones and quasi-isomorphisms. (ii) Hence `K₀^Y(Spf A) ≅ K₀^{V(J)}(Spec A)` in Gillet–Soulé's strict model, compatibly with cup products, support enlargement and pullback along continuous maps A → A′. (iii) K′₀(Spf(A/J)) ≅ G₀(A/J) ≅ G₀(Spec(A/J)). (iv) If A is regular of finite Krull dimension, closed formal subschemes Spf(A/𝔞) ⊆ Spf A and closed subschemes V(𝔞) ⊆ Spec A have the same codimension (§0.4), so the codimension filtrations correspond. Consequently the parent’s strict supported products, comparison and filtration-product theorem transport to Spf A under these hypotheses. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; EGA-I, (10.10.2), (10.10.5), pp. 201–202; EGA-I lines 8098–8114 and 8138–8177).

A noetherian adic; Spec A is affine, hence separated and has the resolution property. No such transport is asserted for non-affine formal schemes.

*Proof route.* By the locally free criterion of §1.3, the exact coherent equivalence restricts to an equivalence between finite locally free sheaves and finite projective modules. Homology and tensor commute with it. Thus the two strict supported presentations have identical generators and relations. For regular finite-dimensional A, §0.4 identifies dimension-drop codimension with height, matching the scheme filtration. No gluing of K₀ groups is used to deduce a non-affine theorem.

*Needs:* §1.3; §1.4; §1.1; §0.4; §0.6; AdicSpacesPartIII §F0.6 (affine-coherent-equivalence); SchemeKTheoryOperations §6.12; SchemeKTheoryOperations §3.4; SchemeKTheoryOperations §§4.4, 6.12.

**Checks.**

- For A = ℤ_p⟦t⟧ and J = (p, t): `K₀^{V(p,t)}(Spf A) ≅ K₀^{V(p,t)}(Spec A) ≅ ℤ`, generated by the Koszul complex of (p, t).
- For J = A both formal and scheme supported groups are 0; for A a field and J = 0 both full-support groups are ℤ.
- For A = k⟦t⟧ with J = (t), the t-Koszul complex has class 1 in either supported group, while its image in the full-support group is 0.

### 1.6 The homology class map K₀^Y(X) → K′₀(Y)

For a noetherian formal scheme X and a closed formal subscheme Y, h_Y : K₀^Y(X) → K′₀(Y), [E] ↦ Σ_i (−1)^i [Hᵢ(E)], where Hᵢ(E) ∈ Coh_Y(X) has a class in K′₀(Y) by §1.2. It is well defined, compatible with support enlargement (on the right, pushforward K′₀(Y) → K′₀(Y′)), with restriction to opens and with flat pullback. For Y = X it is the formal Cartan map K₀(X) → K′₀(X); on Spf A it is Gillet–Soulé's map with supports and, for Y = X, the supplied affine Cartan map. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X noetherian. h_Y is not an isomorphism in general (§2.1 gives the regular case).

The API consists of these facts under the hypotheses above.

- The map h_Y is an additive homomorphism from K₀^Y(X) to K′₀(Y), taking a complex to the alternating sum of its homology classes through coherent dévissage.
- Support enlargement on the source agrees with closed pushforward on the target; restriction to opens and flat pullback commute with h.
- For full support on Spf A, the affine comparison identifies h with the supplied Cartan map.
- The Koszul class of a regular sequence maps to the structure-sheaf class of its quotient.

*Proof route.* A bounded exact sequence of complexes gives a finite long exact homology sequence with zero Euler class in the supported coherent category. Quasi-isomorphisms preserve homology. Use §1.2 to interpret the sum in K′₀(Y). Exact restriction and flat pullback commute with homology. For full support on Spf A, the alternating-projective presentation identifies this map with the pinned Cartan map.

*Needs:* §1.4; §1.2; §1.1; §1.5; Tau Ceti `TauCeti.cartanMap`; DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5.

**Checks.**

- On Spf ℤ_p, h [O →p O] = [𝔽_p], i.e. 1 in K′₀(Spec 𝔽_p) ≃ ℤ.
- For A = k[ε]/(ε²) (discrete, so Spf A = Spec A) and Y = X, h_X : K₀(Spf A) ≅ ℤ → K′₀(Spf A) ≅ G₀(A) ≅ ℤ, the target normalised by [k] = 1, sends 1 = [A] to 2, since A has a two-step filtration with quotients k; this is the value of the supplied affine Cartan map, and a rank-based target would give 1.
- For X = Spf k⟦x, y⟧/(xy) and Y = X, h : ℤ → ℤ² sends r to (r, r) and cannot reach (1, 0): without regularity h is not an isomorphism.
- For Y = ∅ both sides are 0.
- A one-step shift of a residue-field resolution changes its supported homology class from 1 to −1; the Euler sign is fixed.

### 1.7 The supported cup product

For a noetherian formal scheme X and closed formal subschemes Y, Z, the tensor product of complexes induces a biadditive map `∪ : K₀^Y(X) × K₀^Z(X) → K₀^{Y∩Z}(X)`, [E] ∪ [F] = [Tot(E ⊗ F)], where Y ∩ Z := V(𝒥_Y + 𝒥_Z). It is associative, graded-commutative (commutative on these K₀'s), unital with unit [𝒪_X] ∈ K₀(X), compatible with support enlargement and restriction, and with pullback: g^*(a ∪ b) = g^*a ∪ g^*b. On Spf A it is the Gillet–Soulé product of Spec A with supports. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X noetherian. The product is derived: its homology is computed by Tor, not by tensoring homology.

The API consists of these facts under the hypotheses above.

- Total tensor defines a homomorphism in either variable from K₀^Y(X) × K₀^Z(X) to `K₀^{Y∩Z}(X)`.
- Associativity and symmetry hold under the canonical identifications of the support intersections; in degree zero symmetry is ordinary commutativity.
- The structure-sheaf class in K₀(X) is a two-sided unit.
- Support enlargement and restriction commute with the product, and g*(a ∪ b) = g*a ∪ g*b for every formal morphism g.
- On Spf A the product agrees with the strict supported product on Spec A.

*Proof route.* The total tensor complex has the required support by §1.3. Locally free terms and boundedness preserve exact-sequence and quasi-isomorphism relations in either input. The signed tensor symmetry gives commutativity on K₀. Associativity, the unit and pullback compatibility descend from the natural complex isomorphisms.

*Needs:* §1.4; §1.3; §1.5; SchemeKTheoryOperations §6.1; Tau Ceti `TauCeti.SheafOfModules.tensorProduct`.

**Checks.**

- On Spf ℤ_p⟦t⟧, the homology class of ([K(t)] ∪ [K(t − p)]) = [𝔽_p] in K′₀(Spec 𝔽_p) ≃ ℤ, i.e. 1.
- On Spf ℤ_p⟦t⟧, the homology class of ([K(t)] ∪ [K(t)]) = 0 in K′₀(V(t)) ≃ ℤ, while [H(K(t)) ⊗ H(K(t))] = [O/(t)] = 1: the product is not the tensor product of homologies.
- [𝒪_X] ∪ a = a and [0] ∪ a = 0. For two degree-one free generators the interchange isomorphism of the tensor complex carries the sign −1, which equals +1 in characteristic 2; on K₀ the product is still commutative.
- On P¹_k let h = [O] − [O(−1)], the class of a rational point. Then h ≠ 0 but h ∪ h = 0, and [O(1)] ∪ [O(−1)] = [O]; a product that ignored the Euler-sequence relation, or the zero product, fails one of these.

### 1.8 The Tor pairing and derived intersections on a regular formal scheme

Let X be a regular noetherian formal scheme of finite dimension. For closed formal subschemes Y, Z there is a biadditive pairing K′₀(Y) × K′₀(Z) → K′₀(Y ∩ Z), `[F] ·^L [G] := Σ_j (−1)^j [Torⱼ^{𝒪_X}(i_{Y*}F, i_{Z*}G)]` (§0.7; finite since Torⱼ = 0 for j > dim X), symmetric, associative and unital with unit [𝒪_X], compatible with pushforward along closed immersions Y ⊆ Y′. The derived intersection is Y ∩^L_X Z := [𝒪_Y] ·^L [O_Z] ∈ K′₀(Y ∩ Z). It is compatible with the cup product: `h_{Y∩Z}(a ∪ b) = h_Y(a) ·^L h_Z(b)` for a ∈ K₀^Y(X), b ∈ K₀^Z(X). On a regular noetherian scheme X of finite dimension it corresponds, under the supported Cartan equivalence K₀(X on Y) ≅ G₀(Y) and the coherent dévissage G₀(X on Z) ≅ G₀(Z) of SchemeKTheoryOperations §3.5, to the degree-zero part of the parent's K × G support pairing K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z) (SchemeKTheoryOperations §6.1). (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; STACKS, algebra, Tag 00O7; STACKS line 12478 (12478–12503)).

X regular (finite Tor-dimension of every stalk) and noetherian of finite dimension. Without regularity the alternating sum need not be finite and the pairing is not defined.

The API consists of these facts under the hypotheses above.

- For regular noetherian X of finite dimension the finite alternating Tor sum defines a biadditive map K′₀(Y) × K′₀(Z) → K′₀(Y ∩ Z).
- The map is symmetric and associative under the canonical support identifications, with unit [𝒪_X] in K′₀(X).
- The derived intersection class is the pairing of the two structure-sheaf classes.
- The homology map carries the cup product of two strict classes to the Tor pairing of their homology classes.
- Closed pushforward under support enlargement commutes with the pairing in either variable.
- A biadditive map with this source is determined by its values on pairs of coherent-module classes.

*Proof route.* Finite long exact Tor sequences prove biadditivity. To prove associativity and compatibility with strict cup products, use global finite hyper-Tor spectral sequences from the supplied derived tensor: the two bracketings have canonically isomorphic derived abutments, and truncations express their Euler classes as the iterated pairings. Finite dimension gives a uniform bound. These are global Euler identities in supported coherent K₀; equality of stalkwise K₀ classes alone would not prove them.

*Needs:* §0.7; §0.3; §1.2; §1.1; §1.6; §1.7; SchemeKTheoryOperations §3.5 (supported Cartan equivalence, dévissage); SchemeKTheoryOperations §6.1; EnhancedDerivedSheaves §§0.3, E1.4.

**Checks.**

- On Spf ℤ_p⟦t⟧, the derived intersection of V(t) and V(t − p) = `[O_{Spec 𝔽_p}] = 1` in K′₀(Spec 𝔽_p) ≃ ℤ.
- On Spf ℤ_p⟦t⟧, the derived self-intersection of V(t) equals 0 in K′₀(V(t)) ≃ ℤ: the derived self-intersection of a divisor with trivial normal bundle is not its structure sheaf.
- On X = P²_k, two distinct k-lines L = V(x) and M = V(y) meet in the rational point P = V(x, y): x is a nonzerodivisor on O_M, so Tor₀(O_L, O_M) = O_P and the positive Tor sheaves vanish, and the pairing is [O_P] = 1 in K′₀(P) ≅ ℤ. Under the Cartan equivalence the Koszul class of x pairs with [O_M] in the parent's K × G pairing to the same value.
- For a free rank-two input and a residue-field class, the pairing is 2[k]; this excludes the zero pairing.

### Examples

The p-Koszul complex on Spf ℤ_p has class 1 in `K₀^{V(p)}`, and its degree-one shift has class −1. Its image in full-support K′₀(Spf ℤ_p) is 0. On the two-dimensional formal spectrum, the product of the t- and (t−p)-Koszul classes maps to [𝔽_p] = 1 in the point's group; the self-product has Tor Euler class [ℤ_p] − [ℤ_p] = 0 in K′₀(V(t)). Thus the same marked class is nonzero with point support and zero after enlarging support (§§1.2, 1.6–1.8).

### Dependencies

Layer 0; AdicSpacesPartIII §§F0.6, F0.8; Tau Ceti categorical Grothendieck groups and Cartan map; GeneralAlgebraicKTheory §4.8; GrothendieckEulerForms Layers 2–3; EnhancedDerivedSheaves §§0.3, E1.4; SchemeKTheoryOperations §§2.1, 2.5, 3.5, 6.1.

## Layer 2: regular comparison and filtrations

### 2.1 Regular supported dévissage: K₀^Y(X) ≅ K′₀(Y)

Let X be a regular noetherian formal scheme of finite dimension d with the resolution property: every coherent 𝒪_X-module is a quotient of a locally free coherent one (automatic for X = Spf A). Then for every closed formal subscheme Y ⊆ X the homology class map h_Y : K₀^Y(X) → K′₀(Y) (§1.6) is an isomorphism. Its inverse sends [F], for F ∈ Coh_Y(X), to the class of any finite resolution E → F by locally free coherent modules (of length ≤ d), which lies in C^b_Y(X). Consequently K₀^Y(X) is identified with K′₀(Y), K₀(X) ≅ K′₀(X), and for an open U ⊆ X containing Y and also having the resolution property, the restriction K₀^Y(X) → K₀^Y(U) is an isomorphism. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372; STACKS, algebra, Tag 00O7; STACKS line 12478 (12478–12503)).

X regular of finite Krull dimension d, noetherian. Resolution property for X (for example X affine). Without it the theorem is not asserted; a locally perfect model of K-theory would be needed. The statement is false without regularity (§1.6, node non-example).

*Proof route.* Successively surject finite locally free sheaves onto a coherent sheaf and its kernels. After d steps the syzygy has free stalks and is locally free. Resolve bounded coherent complexes and the finite diagrams needed for common refinements by taking further locally free covers of fibre products. Apply the supplied resolving-category argument, rather than projective lifting for arbitrary preselected resolutions: vector bundles need not be projective objects of the coherent category. It identifies the strict supported presentation with bounded supported coherent Euler classes; truncation and §1.2 finish the comparison. The construction is compatible with restriction. An open neighbourhood containing Y is noetherian and retains regularity and dimension bounds; its resolution property is an explicit hypothesis.

*Needs:* §1.6; §1.2; §1.5; §0.3; SchemeKTheoryOperations §6.12; SchemeKTheoryOperations §3.5; Mathlib `IsRegularLocalRing`; Tau Ceti `TauCeti.cartanMap_bijective`; GrothendieckEulerForms Layer 3; EnhancedDerivedSheaves §E1.6 (regular-ring dimension bound); GrothendieckEulerForms Layer 3 (common refinements).

**Checks.**

- X = Spf ℤ_p⟦t⟧, Y = V(p, t): K₀^Y(X) ≅ K′₀(Spec 𝔽_p) ≅ ℤ, generated by the Koszul complex of (p, t).
- Spf k⟦x, y⟧/(xy) (not regular): h_X : ℤ → ℤ² is not surjective.
- For Y empty the comparison is 0 → 0. For a field with full support it sends 1 to 1.

### 2.2 Codimension filtration on K₀^Y and dimension filtration on K′₀

For noetherian X and closed Y, define FʳK₀^Y(X) as the sum of the images of K₀^Z(X) → K₀^Y(X) over closed Z ⊆ Y with codim_X Z ≥ r. Here r ∈ ℤ, and coefficients in an image may have either sign. Define FᵢK′₀(X) by the sum of closed-pushforward images from closed Z with dim Z ≤ i, with Fᵢ = 0 for i < 0. Define Grʳ = Fʳ/Fʳ⁺¹ and Grᵢ = Fᵢ/Fᵢ₋₁, and rationalise by tensoring with ℚ. Prove the former filtration descending and the latter ascending, F⁰ full and F₋₁ zero; if dim X = d < ∞ then Fʳ = 0 for r > d and F_d is full. Codimension is measured in X. Supports with the same dimension bound are directed under union. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X noetherian; its global Krull dimension need not be finite. Any bound using a natural number dim X assumes separately dim X = d < ∞. Integral filtrations; ℚ only where stated.

The API consists of these facts under the hypotheses above.

- Membership in Fʳ means a finite sum of images of strict classes with closed supports inside Y of ambient codimension at least r.
- The filtration Fʳ is descending, F⁰ is the whole supported group, and Fʳ is zero for r > d when dim X = d < ∞.
- Support enlargement carries Fʳ into Fʳ in the same ambient X.
- The quotient Fʳ/Fʳ⁺¹ is the codimension graded group; its rational version is obtained by tensoring with ℚ.
- The dimension filtration Fᵢ on K′₀ is ascending; a coherent class supported in dimension at most i belongs to Fᵢ. It is zero for i < 0, and F_d is full when dim X = d < ∞.
- For regular finite-dimensional A the affine comparison carries these filtrations to the scheme support and dimension filtrations.

*Proof route.* The local quotient dimension of a union is the maximum of the two quotient dimensions, hence the codimension of the union is the minimum. This gives directedness of the support images. Taking Z = Y gives F⁰; when r > d only empty support can contribute. A module with support dimension at most i has its class in Fᵢ by coherent dévissage. The definition supplies enlargement compatibility; no general flat-pullback law for dimension-drop codimension is inferred.

*Needs:* §0.2; §1.4; §1.1; §1.2; SchemeKTheoryOperations §§4.4, 6.12; SchemeKTheoryOperations §4.5.

**Checks.**

- On Spf ℤ_p⟦t⟧ with Y = V(p, t): F^2 = ⊤ and F^3 = ⊥.
- On Spf ℤ_p⟦t⟧, `[K(t)] ∈ F^1 K₀^{V(t)}(X)` and its image in Gr^1 is nonzero (it maps to 1 ∈ K′₀(V(t)) ≃ ℤ).
- With topological codimension of |Z| in |X| (both a point for every nonempty Z ⊆ Spf ℤ_p⟦t⟧) every class would lie in F^0 only, and [K(p, t)] would not lie in F^2; the local-ring codimension puts it in F^2.
- On X = P²_k with full support and h = 1 − [O(−1)], the class of a line: F¹K₀ = ℤh + ℤh², F²K₀ = ℤh² and F³K₀ = 0, and the class h² of a rational point is nonzero. A curve of degree e contributes 1 − (1 − h)ᵉ = e·h − (e(e−1)/2)·h², inside F¹; a filtration that ignored codimension would not separate F² from F¹.
- For X = Spec k, F⁰ = ℤ, F¹ = 0, F₀ = ℤ and F₋₁ = 0; for the empty X all groups and all filtration terms are 0.

### 2.3 Codimension filtration versus dimension filtration

For regular nonempty noetherian X of pure dimension d with the resolution property, and closed Y ⊆ X, prove that h_Y identifies `F^{d−i}K₀^Y(X)` with FᵢK′₀(Y) for every i ∈ ℤ, and hence identifies `Gr^{d−i}` with Grᵢ. The exponent d − i is an integer. For empty X every group is zero, so the corresponding assertion holds directly without assigning a finite pure dimension. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603).

X regular, noetherian, pure of dimension d, with the resolution property.

*Proof route.* Apply §2.1 to every closed support Z inside Y. The square between support enlargement and coherent closed pushforward commutes with h. Formula §0.4 converts codim_X Z ≥ d − i into dim Z ≤ i. Summing the corresponding images gives equality of filtration subgroups and then the graded comparison.

*Needs:* §2.1; §2.2; §0.4; §1.6.

**Checks.**

- Spf ℤ_p⟦t⟧ (d = 2), Y = V(t): F^1K₀^Y ↔ F_1K′₀(V(t)) = K′₀(Spf ℤ_p) ≅ ℤ and F^2K₀^Y ↔ F_0K′₀(Spf ℤ_p) = 0, since [𝔽_p] = 0 there.
- For X = Spec k with d = 0, Gr⁰ = Gr₀ = ℤ; for i = −1 both compared filtration terms are 0.
- At i = d+1 the formula uses the integer index d − i = −1: F⁻¹ is full, as is `F_{d+1}`. Natural subtraction would obscure this convention.

### 2.4 Rational multiplicativity of the codimension filtration on affine regular formal schemes

Let A be a regular noetherian adic ring of finite Krull dimension, X = Spf A, and Y, Z closed formal subschemes. Then `F^aK₀^Y(X)_ℚ ∪ F^bK₀^Z(X)_ℚ ⊆ F^{a+b}K₀^{Y∩Z}(X)_ℚ` for all a, b ≥ 0. Its Euler-characteristic consequence is §4.3. (ZHANG21, (B.3) and its formal-scheme qualification, p. 972; ZHANG21 lines 4545–4560; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

A regular, noetherian, adic, of finite Krull dimension; affine X only. Rational coefficients. The ambient formal scheme is affine throughout this statement.

*Proof route.* Transport products and filtrations to the separated regular noetherian scheme Spec A using §1.5 and §0.4, and apply SchemeKTheoryOperations §6.12 with its rational coefficients. This proves the affine formal statement. Section 4.3 applies this theorem to numerical Euler characteristics.

*Needs:* §1.5; §2.2; §1.7; §0.4; SchemeKTheoryOperations §6.12; SchemeKTheoryOperations §6.12 (rational support weights).

**Checks.**

- On Spf ℤ_p⟦t, u⟧ (dimension 3), the classes of the Cartier divisors V(t) and V(tu) meet in the codimension-one V(t); their product is the Koszul class of (t, tu) = (t, 0) up to change of basis, which is 0, consistent with the predicted membership in F^2.
- For transverse divisors V(t), V(u) the product [K(t, u)] lies in F^2 because its support V(t, u) has codimension 2; the theorem says the same holds after any excess.
- For A a field, indices a = b = 0 give ℚ · ℚ ⊆ ℚ; if a > 0 or b > 0 the corresponding term is 0.

### 2.5 K-groups of locally noetherian formal schemes by noetherian exhaustion

Let X be a locally noetherian formal scheme which is the increasing union of a directed family `(X_i)_{i∈I}` of noetherian open formal subschemes. Define K′₀(X) := lim_i K′₀(X_i), K₀(X) := lim_i K₀(X_i) and, for a closed formal subscheme Y with Y_i := Y ∩ X_i, `K₀^Y(X) := lim_i K₀^{Y_i}(X_i)`, along restriction maps; `F^jK₀^Y(X) := lim_i F^jK₀^{Y_i}(X_i) ⊆ K₀^Y(X)` and F_jK′₀(X) likewise, with `Gr^j := F^j/F^{j+1}` of these limits. Cup products, homology class maps, pullbacks along morphisms compatible with exhaustions, and Tor pairings (on regular members of finite dimension) pass to the limit. For a pullback along g : X′ → X, each noetherian source open must map into some target member; choose such members after a common directed refinement, and prove independence of the choices by restriction compatibility. The groups do not depend on the exhaustion: they are canonically the limits over all quasi-compact open formal subschemes. If Y is quasi-compact, `Y ⊆ X_{i_0}`, and all X_i are regular of finite dimension with the resolution property, then `K₀^Y(X) ≅ K₀^Y(X_{i_0}) ≅ K′₀(Y)`. (ZHANG21, Appendix B.1, p. 973; ZHANG21 lines 4563–4575; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X locally noetherian and exhausted by noetherian opens (for instance any locally noetherian formal scheme whose underlying space is a countable increasing union of quasi-compact opens). These are limits over open subschemes, not over the thickenings X_n of an ideal of definition; they are not continuous K-theory of thickenings. Gr^j of the limits is not asserted to be the limit of the Gr^j.

The API consists of these facts under the hypotheses above.

- An exhaustion is a directed family of noetherian open formal subschemes with union X; the transition maps on groups are restrictions from larger opens to smaller ones.
- The coherent and strict supported groups and their filtrations are the inverse limits of their noetherian values, with their canonical projections.
- Two exhaustions give canonically isomorphic groups, preserving every projection after passage to a common refinement and all constructed operations.
- A one-member exhaustion of noetherian X recovers its original groups.
- For quasi-compact closed Y contained in one member, if all members are regular of finite dimension with the resolution property, the supported system stabilises to K′₀(Y).
- Associated graded groups are quotients of the limit filtrations. No identification with limits of graded groups or cokernels is part of their definition.

*Proof route.* Restrictions commute with all the noetherian structure maps. Every quasi-compact open is contained in one exhaustion member by directedness, so comparison with all quasi-compact opens proves independence of the exhaustion. For quasi-compact closed Y the cofinal members containing it all compare with K′₀(Y), giving stabilisation under the stated regularity and resolution hypotheses. Products and Tor pairings are formed memberwise; a Tor bound is required on each regular member, not uniformly over the entire exhaustion.

*Needs:* §1.1; §1.4; §1.7; §1.6; §2.2; §2.1; AdicSpacesPartIII §F0.3.

**Checks.**

- For X noetherian, the exhaustion {X} gives K′₀(X) and K₀^Y(X).
- For `X = ⊔_{n∈ℕ} Spf ℤ_p`, the coherent group defined by the exhaustion ≃ ∏_n ℤ (not ⊕_n ℤ).
- The exhaustion of ⊔_n Spf ℤ_p by the unions of the first N pieces and the exhaustion by the unions of the first N pieces in a reordered enumeration give canonically isomorphic limits.
- For Spf ℤ_p, the one-member open exhaustion gives G₀ ≅ ℤ by generic rank and [𝔽_p] = 0. Under pushforward along the closed thickenings, each `G₀(Spec ℤ/p^{n+1}) ≅ ℤ` by length and [𝔽_p] = 1. Thus these marked constructions differ; no underived pullback inverse system on coherent G₀ is assumed.
- On the infinite disjoint union, the support in one component gives the stabilised supported group ℤ rather than the entire product ∏ℕ ℤ.

### Examples

For Y = V(p,t) in Spf ℤ_p⟦t⟧, F²K₀^Y = ℤ and F³ = 0. For Y = V(t), h identifies F¹ with K′₀(Spf ℤ_p) = ℤ and F² with the zero subgroup generated by finite-length classes. For the infinite disjoint union of Spf ℤ_p, exhaustion by finite unions gives ∏ℕ ℤ; the supported group on one component is only ℤ (§§2.2–2.5).

### Dependencies

Layers 0–1; GrothendieckEulerForms Layer 3; EnhancedDerivedSheaves §E1.6; SchemeKTheoryOperations §§4.4, 6.12; AdicSpacesPartIII §F0.3.

## Layer 3: closed unions and Tor vanishing

### 3.1 Closed-union decomposition of K′₀ modulo the overlap (Lemma B.1)

(a) Let X be a noetherian formal scheme and X = X_1 ∪ X_2 a union of closed formal subschemes X_k = V(𝒥_k) with 𝒥_1 ∩ 𝒥_2 = 0; put X_12 := V(𝒥_1 + 𝒥_2). For coherent E on X the sheaves `Tor₁^{𝒪_X}(E, O_{X_k})` and `E ⊗ O_{X_12}` are formally supported on X_12, and `[E] ↦ ([E ⊗ O_{X_1}], [E ⊗ O_{X_2}])` induces an isomorphism coker(K′₀(X_12) → K′₀(X)) ≅ coker(K′₀(X_12) → K′₀(X_1)) ⊕ coker(K′₀(X_12) → K′₀(X_2)), whose inverse is induced by `(a_1, a_2) ↦ i_{1*}a_1 + i_{2*}a_2`. The maps K′₀(X_12) → K′₀(X_k) need not be injective; the quotients are cokernels. (b) If X is locally noetherian with a noetherian exhaustion (X_i), the isomorphisms of (a) for the X_i form an isomorphism of inverse systems, giving lim_i coker_i(X) ≅ lim_i coker_i(X_1) ⊕ lim_i coker_i(X_2); the comparison of the cokernel of a limit with the limit of cokernels is not asserted. (ZHANG21, Lemma B.1 and footnote 11, p. 974; ZHANG21 lines 4607–4626 and 4643–4644; STACKS, algebra, Tag 00L6; STACKS line 6891 (6891–6900)).

(a) X noetherian; 𝒥_1 ∩ 𝒥_2 = 0 (scheme-theoretic union).

*Proof route.* For restriction to a component, the failure of tensor to preserve a short exact sequence comes from Tor₁. On Spf A, localise at coordinate-ring primes outside V(J₁+J₂); one component ideal is the unit ideal and the other is zero since J₁∩J₂ = 0. Thus the defect has formal support in the overlap. Tensoring `0 → 𝒪_X → O_{X₁} ⊕ O_{X₂} → O_{X₁₂} → 0` gives the inverse identity modulo the image of overlap classes. For a module from X₁ its other-component restriction is an overlap module, proving the other composite. Restriction commutes with these maps. Finite direct sums commute with inverse limits, which gives the limit-of-cokernels assertion without interchanging a cokernel with a limit.

*Needs:* §0.6; §0.7; §1.1; §1.2; §2.5; AdicSpacesPartIII §F0.4.

**Checks.**

- X = Spf k⟦x, y⟧/(xy) = V(x) ∪ V(y), X_12 = Spec k: K′₀(X_12) ≅ ℤ maps to 0 in K′₀(V(x)) ≅ K′₀(Spf k⟦y⟧) ≅ ℤ (since [k] = 0 there), so the overlap map is not injective; both sides of (a) are ℤ ⊕ ℤ, matching K′₀(X) ≅ ℤ² with [k] = 0.
- If X_1 ∩ X_2 = ∅, (a) is the additivity K′₀(X_1 ⊔ X_2) ≅ K′₀(X_1) ⊕ K′₀(X_2).
- If X₁ = X₂ = X, the overlap is X and all three cokernels are 0. Restriction of the zero class is (0,0).

### 3.2 Tor vanishing in the expected dimension (Lemma B.2(i))

Let X be a locally noetherian formal scheme, Z_1 → X a regular immersion (§0.5) and Z_2 ⊆ X a Cohen–Macaulay closed formal subscheme. Suppose that at every point z ∈ |Z_1 ∩ Z_2|, codim_z(Z_1 ∩ Z_2, X) = codim_z(Z_1, X) + codim_z(Z_2, X). Then `Torᵢ^{𝒪_X}(O_{Z_1}, O_{Z_2}) = 0` for all i > 0, so on every noetherian open the finite Tor class satisfies `O_{Z_1} ⊗^L O_{Z_2} = O_{Z_1} ⊗ O_{Z_2} = O_{Z_1∩Z_2}` in K′₀(Z_1 ∩ Z_2), and Z_1 ∩ Z_2 → Z_2 is again a regular immersion. (ZHANG21, Lemma B.2(i), pp. 974–975; ZHANG21 lines 4629–4680; STACKS, more-algebra, Tag 062F; STACKS line 3571 (3571–3585); STACKS, algebra, Tag 02JN; STACKS line 11776 (11776–11781)).

Z_1 → X regular immersion, for example X and Z_1 regular. Z_2 Cohen–Macaulay; the conclusion fails without it. Codimensions are those of §0.2; pure-dimensionality, assumed in the source, is not needed for this part.

*Proof route.* At z put `R = O_{X,z}`, `B = O_{Z₂,z}`, and choose regular equations f₁,…,f_m for Z₁, so m is its local codimension. The dimension hypothesis gives dim B/(f) = dim B − m. Since B is Cohen–Macaulay, the images of f form a regular sequence. Its Koszul complex has zero positive homology and `H₀ = O_{Z₁∩Z₂,z}`. This computes Tor at every formal stalk and proves vanishing as sheaves. On each noetherian open the immersion ranks are bounded, so its Tor Euler class is a finite sum; the locally noetherian class is its compatible exhaustion limit.

*Needs:* §0.5; §0.3; §0.7; §0.2; DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5; SchemeAndStackFoundations §§0.17–0.18; Mathlib `RingTheory.Sequence.IsRegular`; DerivedModuleAlgebra §0.K.1 (Koszul resolution).

**Checks.**

- On Spf ℤ_p⟦t⟧: Z_1 = V(t), Z_2 = V(t − p) meet in Spec 𝔽_p of the expected codimension 2, and Tor₁ = 0.
- Serre's example: in Spf k⟦x, y, z, w⟧ let Z_2 = V(x, y) ∪ V(z, w) (not Cohen–Macaulay) and Z_1 = V(x − z, y − w). The intersection is the closed point, of the expected codimension 4, but `O_{Z_1∩Z_2} = k⟦x, y⟧/(x², xy, y²)` has length 3 while the Euler characteristic is 2, so Tor₁ ≠ 0.
- Self-intersection V(t) with V(t) in Spf ℤ_p⟦t⟧ has codimension 1 rather than 1+1 = 2, and Tor₁ is O/(t), so the dimension hypothesis fails.

### 3.3 Tor vanishing on an expected-dimensional part (Lemma B.2(ii))

Let X be noetherian, Z₁ → X a regular immersion, and Z₂ ⊆ X Cohen–Macaulay. Suppose Z₁ ∩ Z₂ = Y ∪ Y′ as closed formal subschemes and codim_z(Y,X) = codim_z(Z₁,X) + codim_z(Z₂,X) at every z ∈ |Y|. For every i > 0 prove that `Torᵢ^{𝒪_X}(O_{Z₁},O_{Z₂}) ⊗ 𝒪_Y` is formally supported on Y ∩ Y′. Its class therefore vanishes in coker(K′₀(Y ∩ Y′) → K′₀(Y)). Under §3.1 the Y-component of the derived intersection is [𝒪_Y] in this cokernel. The sheaf itself need not be zero. For a locally noetherian X, make this assertion on each noetherian exhaustion member and then take the limit of the cokernels. (ZHANG21, Lemma B.2(ii), p. 975; ZHANG21 lines 4651–4680; LIZHANG22, arXiv v3 Definition 5.2.1, p. 24; LIZHANG22 lines 965–986; STACKS, algebra, Tag 0BBZ; STACKS line 6757 (6757–6768); STACKS, algebra, Tag 00NA; STACKS line 11785 (11785–11792); STACKS, algebra, Tag 02JN; STACKS line 11776 (11776–11781); STACKS, algebra, Tag 00L6; STACKS line 6891 (6891–6900)).

Z_1 → X regular immersion, Z_2 Cohen–Macaulay, X noetherian (for the locally noetherian case use §2.5). The localisation away from Y′ must be done at primes of the stalks `O_{Z_2,z}`, not at points of |X|: in Spf ℤ_p⟦s, t⟧, Y = V(s, t) and Y′ = V(s, t − p) have the same underlying point.

*Proof route.* Fix z ∈ |Y| and put `B = O_{Z₂,z}`. For a prime P of B on Y but not on Y′, the intersection ideal equals the ideal of Y after localising at P. Krull's height theorem bounds the height of every minimal prime over its m equations by m. The expected dimension at z and the Cohen–Macaulay dimension formula force each such prime lying on Y and outside Y′ to have height m. Localising preserves those heights, so the images of the equations form a B_P-regular sequence. Positive Koszul homology vanishes at every such P. The finite module Torᵢ ⊗ 𝒪_Y therefore has support in `V(I_Y+I_{Y′})` in Spec B, hence is killed by a power of the overlap ideal. Dévissage and §3.1 give the cokernel conclusion. The argument uses prime ideals of B, even when the formal topological complement is empty.

*Needs:* §3.2; §3.1; §1.2; §0.6; §0.2; SchemeAndStackFoundations §§0.16–0.18; SchemeAndStackFoundations §§0.17–0.18; DerivedModuleAlgebra §0.K.1 (Koszul resolution).

**Checks.**

- If Y′ = ∅ the statement is §3.2.
- Consumer pattern: for the Kudla–Rapoport cycle of a rank n−1 lattice, Z(L♭) = Z(L♭)_H ∪ Z(L♭)_V with the horizontal part of expected dimension, so the horizontal component of the derived cycle in `Gr^{n−1}` is represented by the structure sheaf of Z(L♭)_H (Li–Zhang, Definition 5.2.1).
- In Spf ℤ_p⟦s,t⟧, V(s,t) and V(s,t−p) have identical underlying one-point spaces, but the sum of their ideals is (s,t,p); the formal overlap is Spec 𝔽_p, distinct from either copy of Spf ℤ_p. A topological-complement argument cannot detect this.
- For R = k⟦x,y,z⟧, Z₁ = V(xy,xz), Z₂ = X is outside the regular-immersion hypothesis: the ideal has two generators but height one. The theorem cannot be applied merely because a component V(y,z) has codimension two.

### 3.4 Pullback of the class of an effective Cartier divisor

Let g : X′ → X be a morphism of noetherian formal schemes and D ⊆ X an effective Cartier divisor such that `g^{-1}D := V(g^*𝒥_D · O_{X′})` is an effective Cartier divisor of X′, i.e. the pulled-back local equations are nonzerodivisors of the stalks of X′ (for instance X, X′ regular and g^♯ injective on the stalks at points of `g^{-1}D`). Then `g^*[K(D)] = [K(g^{-1}D)]` in `K₀^{g^{-1}D}(X′)`, where K(D) = [𝒪_X(−D) → 𝒪_X] is the Koszul class, and `h(g^*[K(D)]) = [O_{g^{-1}D}]` in `K′₀(g^{-1}D)`: `Tor₁^{𝒪_X}(O_D, O_{X′}) = 0`. Without the nonzerodivisor condition, `h(g^*[K(D)]) = [O_{g^{-1}D}] − [Tor₁^{𝒪_X}(O_D, O_{X′})]`. (LIZHANG22, arXiv v3 Lemma 10.4.2, p. 67; LIZHANG22 lines 2942–2959).

The nonzerodivisor condition on X′ is essential.

Without the Cartier inverse-image hypothesis, the pulled-back line bundle is g*O(−D); writing O(−g⁻¹D) would presume that the inverse-image ideal remained invertible. The correction formula uses the actual pulled-back two-term complex.

*Proof route.* Pull back the two-term locally free Cartier complex. Its H₁ is the kernel of multiplication by the pulled-back equation, with the pulled-back line-bundle coefficient, and its H₀ is the quotient structure sheaf. The nonzerodivisor hypothesis kills H₁. If both formal schemes are regular and the local ring maps are injective, regular-local domains ensure that a nonzero equation stays a nonzerodivisor. Without that condition retain the Tor₁ term and the actual pulled-back line bundle.

*Needs:* §0.5; §0.6 (inverse images); §0.3; §1.4; §1.6; §1.3; §0.7.

**Checks.**

- For nonempty D, pulling D back along its own inclusion D → X: the local equation becomes 0, Tor₁ = O_D(−D) ≠ 0, and h(i^*[K(D)]) = [O_D] − [O_D(−D)].
- For g the identity, the equation t is unchanged and H₁ = 0.
- For the finite nonflat inclusion V(p) → Spf ℤ_p⟦t⟧, the equation t remains a nonzerodivisor in 𝔽_p⟦t⟧, and the pulled-back Cartier class is [k].

### Examples

For the node R = k⟦x,y⟧/(xy), the overlap point maps by zero to either component's G₀ = ℤ, since 0 → k⟦t⟧ →ₜ k⟦t⟧ → k → 0 has alternating rank zero. The union cokernel is ℤ², identified with the two component cokernels. In Spf ℤ_p⟦t⟧ the equations t and t−p satisfy expected codimension 2 and have no positive Tor. Pulling the t-Cartier complex to V(t) itself gives [O →₀ O] and retains Tor₁ = O; its homology class is 1 − 1 = 0, fixing the same sign as Layer 1 (§§3.1–3.4).

### Dependencies

Layers 0–2; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §E1.5; SchemeAndStackFoundations §§0.16–0.18.

## Layer 4: Euler degree and derived intersection numbers

### 4.1 Schemes proper over Spf A live over a thickening

Let A be a noetherian adic ring with ideal of definition I (for example a complete discrete valuation ring with uniformiser ϖ, I = (ϖ)) and π : W → Spf A a morphism of formal schemes with W a quasi-compact scheme. Then π factors through Spec(A/I^n) ↪ Spf A for some n ≥ 1, π is proper in the sense of EGA III (3.4.1) iff W → Spec(A/I^n) is proper for one (equivalently every) such n, and, assuming π proper, for coherent E on W the higher direct images along W → Spec(A/I^n) are finite A/I^n-modules, independent of n. If A is a complete discrete valuation ring, they have finite length. (ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372; EGA-III1, (3.4.1)–(3.4.4), pp. 119–120; EGA-III1 lines 4444–4507).

W a quasi-compact scheme (discretely ringed), not merely a formal scheme. A noetherian adic. For the cohomology and finiteness conclusions π is proper. Factoring a quasi-compact scheme through a thickening alone does not give finite cohomology. Proper uses EGA’s adic finite-type hypothesis as well as proper reductions. Properness of the induced reduced map alone is insufficient.

*Proof route.* On every affine open of the scheme W, continuity into its discrete structure sheaf kills some Iⁿ; quasi-compactness gives one exponent for W. Properness is then equivalent to scheme properness over a factorising thickening. Scheme proper coherent cohomology gives finite modules and a finite cohomological bound; changing the exponent composes with a closed immersion, preserving the underlying A-modules. For a DVR these torsion finite modules have finite A-length.

*Needs:* AdicSpacesPartIII §F0.2 (spf-morphism-correspondence); AdicSpacesPartIII §F0.3 (scheme embedding); AdicSpacesPartIII §F0.4; SchemeAndStackFoundations §2.6 (bound over an affine base); JacobianChallenge Layer C (finite A-modules Hᵠ(X, F) for X proper over noetherian A); Mathlib `Module.length`.

**Checks.**

- `P¹_{𝔽_p} → Spf ℤ_p` is proper and factors through Spec 𝔽_p; Spec ℤ/p^3 → Spf ℤ_p factors through n = 3.
- Spf ℤ_p itself is not a scheme, and its global sections ℤ_p have infinite length.
- W = A¹_k over Spf A factors through Spec k but H^0(W,O_W) = k[t] has infinite A-length; the cohomology claim must require properness.

### 4.2 The Euler degree of a scheme proper over Spf A

Let A be a complete discrete valuation ring and π : W → Spf A proper with W a noetherian scheme. The Euler degree is deg_W : K′₀(W) → ℤ, [E] ↦ Σ_i (−1)^i length_A H^i(W, E) = Σ_i (−1)^i length_A R^iπ_*E; equivalently deg_W = length_A ∘ π_*, where π_* : K′₀(W) → K′₀(Spec A/ϖ^n) ≅ ℤ for a factorising exponent n ≥ 1 (§4.1). It is additive, independent of n, and extends to classes of coherent modules on a formal scheme X formally supported on W (via K₀(Coh_W(X)) ≅ K′₀(W), §1.2). (ZHANG21, Appendix B.1, p. 973; ZHANG21 lines 4576–4583; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

W a scheme; the degree is not defined for formal W such as Spf A, whose cohomology has infinite length. Lengths over A, so a closed point with residue field k′ contributes [k′ : k].

The API consists of these facts under the hypotheses above.

- For a noetherian scheme W proper over Spf A, degree is a homomorphism K′₀(W) → ℤ whose value on E is the alternating sum of its finite A-length cohomology.
- It is length after the scheme G₀ proper pushforward to Spec(A/ϖⁿ), and does not depend on the factorising exponent n.
- Closed pushforward W′ → W preserves the degree, with the same A-structure.
- For a coherent module on a formal scheme formally supported on W, its dévissage class in K′₀(W) has a degree; an ambient cohomological interpretation requires the compatible A-structure specified in §4.3.

*Proof route.* Use the factorising proper scheme morphism from §4.1. Coherent cohomology is bounded and has finite A-length. The long exact cohomology sequence proves additivity, and Leray for the closed immersion between two thickenings proves independence of the exponent. Coherent dévissage extends the map to formally supported classes.

*Needs:* §4.1; §1.1; §1.2; SchemeKTheoryOperations §2.3 (proper pushforward on G₀); Mathlib `Module.length`.

**Checks.**

- For W = Spec A/ϖ^n, degree [O_W] = n (the degree of a torsion module over the discrete valuation ring). At n = 0 this is the empty scheme with K′₀ = 0 and degree 0; the target identification K′₀(Spec A/ϖⁿ) ≅ ℤ uses n ≥ 1.
- For W = P¹_k, degree [O(m)] = m + 1.
- For W = Spec k′ with [k′ : k] = f, degree [O_W] = f.
- For W = ∅, degree = 0.
- For W = Spf A (formal, not a scheme) H^0 = A has infinite length over A: the hypothesis that W be a scheme cannot be dropped.
- On P¹_k, O(−2) has H⁰ = 0 and H¹ = k, so its degree as a coherent class is −1; this is distinct from the line-bundle degree −2.

### 4.3 The derived Euler–Poincaré pairing χ(X, F ⊗ᴸ G) (B.4)

Let A be a complete discrete valuation ring, X a regular locally noetherian formal scheme of finite dimension with a noetherian exhaustion, and Y, Z ⊆ X closed formal subschemes such that W := Y ∩ Z is a scheme with a proper morphism π : W → Spf A. For coherent sheaves F on Y and G on Z, the Tor sheaves `T_j := Torⱼ^{𝒪_X}(i_{Y*}F,i_{Z*}G)` are annihilated by 𝒥_Y + 𝒥_Z, so are coherent O_W-modules. Define `χ(X,F ⊗^L G) := Σ_{i,j}(−1)^{i+j} length_A Hⁱ(W,T_j) = deg_W([F] ·^L [G])`. This gives a symmetric biadditive pairing K′₀(Y) × K′₀(Z) → ℤ, and through h a pairing K₀^Y(X) × K₀^Z(X) → ℤ given by deg_W h(a ∪ b). It is computed on any noetherian open containing W. Here i_Y and i_Z are the two closed immersions into X. For merely formally supported sheaves, define the pairing of their dévissage classes in these groups; the displayed π_* formula does not directly apply to those sheaves. If X is over Spf A compatibly with π, the extension also equals the Euler characteristic of the ambient derived tensor on a proper nilpotent thickening of W. Write ⟨Y,Z⟩_X for the pairing of the structure sheaves. By §2.4, on affine regular X of pure dimension n the Euler characteristic of a cup product of classes in `F^{r_i}_ℚ` with Σr_i ≥ n depends only on their `Gr^{r_i}` images, whenever the common support is a proper scheme. (ZHANG21, (B.4)–(B.5), p. 973; ZHANG21 lines 4576–4603; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

X regular (finitely many nonzero Tor sheaves). W = Y ∩ Z a scheme proper over Spf A; if W is only a formal scheme (e.g. Y = Z = V(t) in Spf ℤ_p⟦t⟧, W = Spf ℤ_p) the pairing is not defined. The cohomology formula takes F ∈ Coh Y and G ∈ Coh Z, not merely F ∈ Coh_Y(X), G ∈ Coh_Z(X). For the latter use dévissage. Ambient cohomology for power-annihilated sheaves additionally uses X → Spf A extending the given base map on W.

The API consists of these facts under the hypotheses above.

- For F on Y and G on Z, their pairing is the finite double alternating sum of A-lengths of Hⁱ(W, Torⱼ(F,G)), with W = Y ∩ Z a proper scheme over Spf A.
- Equivalently it is degree after the Tor pairing; this specifies a biadditive map K′₀(Y) × K′₀(Z) → ℤ.
- The pairing is symmetric, and degree of h(a ∪ b) is the pairing of h(a) and h(b).
- The value is computed on any noetherian open neighbourhood of W.
- If all positive Tor sheaves vanish, the structure-sheaf pairing is deg_W[O_W].
- For power-annihilated inputs, pair their dévissage classes. If X is compatibly over Spf A, this equals the ambient derived Euler characteristic on a proper nilpotent thickening of W.

*Proof route.* For actual 𝒪_Y and O_Z modules both annihilator ideals act by zero on Tor, so each Tor sheaf is an O_W-module. Finite dimension bounds Tor and proper scheme cohomology bounds cohomological degree. Symmetry and biadditivity follow from §1.8; compatibility with cup follows from its global spectral-sequence identity. For power-annihilated inputs first use dévissage. When X has the compatible A-structure, the Tor sheaves live on a proper nilpotent thickening of W; filtering by its ideal proves agreement with the ambient Euler sum. On affine pure-dimensional X, changing a factor in Fʳ by Fʳ⁺¹ changes the product by `F^{Σr+1}`, which is zero if Σr ≥ dim X. Thus the Euler characteristic depends only on the indicated graded images. For integer indices, replace negative indices by zero when applying §2.4: the filtration terms are unchanged and the sum of indices only increases, both before and after raising one index by one.

*Needs:* §1.8; §4.2; §0.7; §1.6; §1.7; §2.5; §0.3; §2.4; §4.1; §1.2.

**Checks.**

- On Spf ℤ_p⟦t⟧ over ℤ_p, for n ∈ ℕ the value ⟨V(t), V(t − pⁿ)⟩ is n; at n = 0 the second equation is a unit and both sides are zero.
- On Spf ℤ_p⟦t⟧, ⟨V(p, t), V(t)⟩ = 0 although Tor₁ ≅ 𝔽_p ≠ 0 (excess intersection retaining Tor).
- For Z = X and F with the proper scheme support required here, pairing [F] with [𝒪_X] gives deg[F]; for F = k at one closed point both values are 1.
- On Spf ℤ_p⟦t⟧, Y = Z = V(t) gives Y ∩ Z = Spf ℤ_p, not a scheme; the lengths are infinite and the pairing is undefined, so the scheme hypothesis on Y ∩ Z is needed.
- On X = Spf A and W = Spec k = V(ϖ), F = A/ϖ² is formally supported on W but is not an O_W-module. With G = 𝒪_X, its extended Euler degree is 2, computed on Spec(A/ϖ²) or by dévissage; applying π_* to F as an O_W-module is ill-typed.

### 4.4 Functoriality and base change of the Euler degree

(a) For a proper morphism g : W_1 → W_2 of schemes proper over Spf A, `deg_{W_2}(g_*a) = deg_{W_1}(a)` for a ∈ K′₀(W_1). (b) Let A → A′ be a finite extension of complete discrete valuation rings with ramification index e and residue degree f. If W is a scheme proper over Spf A′, hence over Spf A, then `deg_{W/A} = f · deg_{W/A′}`. (c) More generally let A → A′ be any flat local map of complete discrete valuation rings with `ϖ_A A′ = (ϖ_{A′}^e)` with e ≥ 1, allowing an infinite residue-field extension. If W is a scheme proper over Spf A and `W′ := W ×_{Spf A} Spf A′` (a scheme proper over Spf A′), then `deg_{W′/A′}(a_{A′}) = e · deg_{W/A}(a)`, where `a_{A′}` is the flat pullback of a. In particular unramified extensions such as O_F → O_F̆ multiply degrees by 1 under base change. (STACKS, coherent, Tag 02KH; STACKS line 478 (478–491); ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603).

Part (b) assumes a finite extension of complete discrete valuation rings, with finite residue degree f. Part (c) only assumes a flat local map with finite ramification index e; finiteness of A′ over A is not required.

*Proof route.* For proper scheme maps use the bounded Leray spectral sequence. For a finite DVR extension, a composition series over A′ shows `length_A M = f length_{A′} M`. For a flat local map A → A′, flat scheme cohomology base change on a finite thickening identifies the new cohomology with the old tensor A′. A composition series over A gives `length_{A′}(M ⊗ A′) = e length_A M` because A′/ϖ_A A′ has length e. Neither formula requires separability; the flat formula allows an infinite residue-field extension.

*Needs:* §4.2; SchemeKTheoryOperations §2.2 (flat pullback on G₀); SchemeKTheoryOperations §2.3 (composition of proper pushforwards); SchemeKTheoryOperations §2.4 (Tor-independent base change of G-transfers); Mathlib `Module.length`.

**Checks.**

- W = Spec k: over `A′ = A[ϖ^{1/2}]` (e = 2, f = 1), W′ = Spec(A′/ϖA′) has degree 2 = e · 1.
- W = Spec k′ with [k′ : k] = f regarded over A has degree f, over A′ unramified with residue field k′ degree 1.
- For A′ = the completion of the maximal unramified extension of A, e = 1 and base change preserves Euler degree; part (b) does not assert restriction-of-scalars finiteness for this infinite extension.

### 4.5 Pairing with zero-dimensional classes: length times generic rank

Let A be a complete discrete valuation ring with residue field k, X a regular locally noetherian formal scheme over Spf A, F a coherent 𝒪_X-module formally supported on a zero-dimensional scheme W_F proper over Spf A (so F has finite length and is supported at finitely many closed points x), and G any coherent 𝒪_X-module. Here `χ(X, F ⊗^L G) := Σ_j (−1)^j deg_{W_F}[Torⱼ^{𝒪_X}(F, G)]`, computed on a noetherian open neighbourhood of W_F: each Tor sheaf is formally supported on W_F (§0.7) and is read in K′₀(W_F) through dévissage (§1.2), and the sum is finite because Torⱼ(F, G) vanishes for j larger than the maximum of `dim 𝒪_{X,x}` over the finitely many points x of W_F; no global dimension bound or exhaustion is assumed. When X also satisfies the hypotheses of §4.3, with Y = W_F and Z = X, this is that section's pairing. Then `χ(X, F ⊗^L G) = Σ_x length_{𝒪_{X,x}}(F_x) · [k(x) : k] · rk(G_x)`, where rk(G_x) is the rank of G_x over the domain `𝒪_{X,x}` (the alternating sum of the ranks in a finite free resolution). In particular χ(X, F ⊗^L G) = 0 whenever G is formally supported in codimension ≥ 1 (for example G = O_D for an effective Cartier divisor D), and χ(X, F ⊗^L ·) on K₀^Z(X) factors through Gr^0. This is the case 'some r_i = dim X' of (B.3), proved without Adams operations. (LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372; ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; STACKS, algebra, Tag 00O7; STACKS line 12478 (12478–12503); STACKS, algebra, Tag 00NP; STACKS line 11920 (11920–11933)).

X regular, so stalks are regular local domains of finite global dimension. F of finite length at closed points with residue fields finite over k (automatic for W_F proper over Spf A).

*Proof route.* A composition series reduces F to k(x). Its Tor sheaves are skyscraper modules, and their A-length is [k(x):k] times their residue-field dimension. Tensor a finite free resolution of Gₓ with k(x); its Euler dimension is the alternating free rank, which is the generic rank of Gₓ over the regular local domain `𝒪_{X,x}`. Sum over the finitely many x with their lengths in F. This only needs the finitely many local Tor bounds near the support, even if X has no global dimension bound. A module with positive-codimension formal support has rank zero at those stalks, giving the filtration-zero conclusion.

*Needs:* §4.2; §1.2; §0.7; §0.3; §2.2; Mathlib `IsRegularLocalRing`; Mathlib `Module.length`.

**Checks.**

- On Spf ℤ_p⟦t⟧: ⟨V(p, t), V(t)⟩ = 1 · 1 · rk(O/(t)) = 0, and ⟨V(p, t), X⟩ = 1.
- For F = k(x) and G = 𝒪_X^r with r = 0,1,2 and [k(x):k] = 2, the two sides are 0,2,4.
- On `X = ⊔_{n≥1} Spf ℤ_p⟦t_1, …, t_n⟧`, regular and locally noetherian of infinite dimension, so outside §4.3, let F = 𝔽_p at the closed point of the n = 2 component (stalk dimension 3). For G = 𝒪_X the sum stops at j = 0 and χ = 1 = 1 · 1 · 1; for G = 𝒪_X/(t_1) on that component and 𝒪_X elsewhere, Tor₀ = Tor₁ = 𝔽_p there and χ = 1 − 1 = 0, the generic rank of `ℤ_p⟦t_1, t_2⟧/(t_1)` over `ℤ_p⟦t_1, t_2⟧`.

### 4.6 Pairing with an effective Cartier divisor

Let A be a complete discrete valuation ring, X a locally noetherian formal scheme over Spf A, D ⊆ X an effective Cartier divisor, and F a coherent 𝒪_X-module formally supported on a scheme W proper over Spf A. Define the Euler characteristic for this pair using the finite two-term Cartier resolution and its proper supported cohomology. Prove χ(X, F ⊗ᴸ O_D) = deg_W[F] − deg_W[F ⊗ 𝒪_X(−D)], with no hypothesis on the position of D relative to W. When X satisfies the regularity, finite-dimension and exhaustion hypotheses of §4.3 this agrees with that section’s pairing. If moreover ϖF = 0 and F = O_C for a proper curve C over k (a closed formal subscheme which is a proper scheme of dimension ≤ 1 over the residue field), then χ(X, O_C ⊗^L O_D) = deg_C(𝒪_X(D)|_C), the degree of an invertible module on a proper curve (χ(C, L) − χ(C, O_C)), whether or not C ⊆ D. (LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372; ZHANG21, Appendix B.1, pp. 971–973; ZHANG21 lines 4511–4603; STACKS, varieties, Tag 0AYR; STACKS line 4401 (4401–4409); STACKS, varieties, Tag 0AYX; STACKS line 4509 (4509–4513)).

The Cartier input has Tor amplitude contained in degrees 0 and 1 on any such X; regularity is not needed for this two-term formula. The morphism W → Spf A is the restriction of the specified morphism on X.

For power-annihilated F, the two displayed degree terms mean its classes under coherent dévissage; neither term requires F itself to be an O_W-module. The ambient A-structure is fixed. On a noetherian neighbourhood of the quasi-compact W, a power of its ideal kills F; the relevant nilpotent thickening is a proper scheme over Spf A, so both two-term cohomology groups have finite A-length.

*Proof route.* Tensor the Cartier resolution with F to obtain [F(−D) → F], so the Euler value is deg_W[F] − deg_W[F(−D)], interpreting the two terms through dévissage when necessary. When F = O_C and ϖF = 0, this is χ(O_C) − χ(L⁻¹) for L = O(D)|_C. SchemeAndStackFoundations §3.3 gives deg L⁻¹ = −deg L on every proper scheme of dimension at most one, so the value is deg L without smoothness, reducedness or a proper-intersection condition.

*Needs:* §4.2; §1.2; §0.5; §0.7; SchemeAndStackFoundations §3.3; §4.3 for agreement under its additional hypotheses.

**Checks.**

- If D meets the proper curve C ⊄ D transversally in r k-rational points, the pairing is r.
- Let X be the completion of the total space of O(a) over `P¹_{ℤ_p}` along the zero section of the special fibre, D the zero section (a Cartier divisor) and `C = P¹_{𝔽_p} ⊆ D`: 𝒪_X(D)|_C ≅ O(a), so the pairing is a although C ⊆ D. For a = −1, 0, 1 the Euler differences χ(O_C) − χ(O_C(−a)) = 1 − (1 − a) are −1, 0, 1.
- For the singular X = Spf(ℤ_p⟦x,y⟧/(xy)), D = V(p) is Cartier and F = 𝔽_p at its closed point has a zero pulled-back differential. The formula gives 1 − 1 = 0 although X is not regular; the perfect Cartier input supplies the finite Tor bound.

### 4.7 Proper pushforward on K′₀ of formal schemes and the projection formula

Let p : X′ → X be adic, of finite type and proper between noetherian formal schemes. Construct p_* : K′₀(X′) → K′₀(X) by [F] ↦ Σ_q (−1)ᵠ[Rᵠp_*F], proving coherence and a uniform finite bound before forming the sum. Prove functoriality and agreement with closed pushforward. If the schemes are compatibly over Spf A, Y′ is a closed scheme proper over Spf A, and a closed proper scheme support W ⊆ X contains p(Y′), prove `deg_W(p_*a) = deg_{Y′}(a)` for a ∈ K′₀(Y′), using supported dévissage. If X and X′ are regular of finite dimension, define Lp* : K′₀(Y) → K′₀(p⁻¹Y) by the finite alternating relative Tor sum and prove p_*(Lp*a ·ᴸ b) = a ·ᴸ p_*b in K′₀(Y ∩ p(Z′)) for a ∈ K′₀(Y), b ∈ K′₀(Z′). Here p(Z′) is the closed formal subscheme defined by `ker(𝒪_X → p_*O_{Z′})`, and pushforward of classes with formal support is taken through dévissage. For finite flat p of constant degree d and a supported on a zero-dimensional proper scheme over Spf A, prove deg(p_*Lp*a) = d deg(a). (EGA-III1, (3.4.1)–(3.4.4), pp. 119–120; EGA-III1 lines 4444–4507; LIZHANG22, arXiv v3 §1.8, p. 9; LIZHANG22 lines 336–372).

p proper in EGA’s sense: adic, of finite type, with proper reductions. A proper reduced map alone is insufficient. The projection formula needs the regularity of X (finite Tor dimension) to define Lp^*. Support degree identities use compatible A-structures and a proper scheme target support W containing p(Y′). For the projection formula, p_* of a supported coherent class is taken by supported dévissage; the result lies in K′₀(Y ∩ p(Z′)).

*Proof route.* The general formal coherent-direct-image supplier contract gives coherence of Rᵠp_*F and its inverse-limit comparison. Cover X by finitely many affine formal opens and each proper preimage by finitely many affine formal opens. The preimage is separated over the affine base, so their intersections are affine. On each such intersection coherent modules have no positive-degree cohomology; this affine acyclicity is the identity case of AdicSpacesPartIII's algebraic/formal direct-image comparison recorded in the supplier contracts, not part of the requested contract. Leray's acyclic-cover theorem then gives vanishing in every degree at least the number of opens in the cover, a bound independent of F and of reduction level. The finite long exact sequence defines the G₀ homomorphism, and Leray proves composition. For the projection formula construct the global derived transformation from the ringed adjunction. For a locally perfect first input it is an isomorphism: check on opens with a bounded finite free representative and use the derived composition and tensor identifications. The finite global Euler identities descend to the supported coherent groups. This local test proves invertibility of a derived morphism, not equality of K₀ classes by an affine cover. For finite flat p, tensor by the rank-d locally free `p_*O_{X′}`; near the finite support it is free of rank d, giving the degree scaling.

*Needs:* §0.6 (inverse images, flat morphisms); §1.1; §1.8; §4.4; §4.2; AdicSpacesPartIII §F0.4; AdicSpacesPartIII §§F0.1–F0.8; the proper formal coherent-direct-image contract; AdicSpacesPartIII §F0.6 (formal-direct-image-comparison at the identity of Spec B, associated-formal-module, affine-coherent-equivalence) and SchemeAndStackFoundations §§2.2, 2.6 (Leray's acyclic-cover theorem, affine acyclicity) for affine formal acyclicity and the Čech bound; SchemeKTheoryOperations §6.1; SchemeKTheoryOperations §2.2; EnhancedDerivedSheaves §0.4 (projection transformation); EnhancedDerivedSheaves §E1.4.

**Checks.**

- p = the identity: p_* = id and Lp^* = id.
- The finite flat map Spf ℤ_p⟦s⟧ → Spf ℤ_p⟦t⟧, t ↦ s² (degree 2): for a = [𝔽_p] at the closed point, deg p_*Lp^*a = deg[𝔽_p⟦s⟧/(s²)] = 2.
- The map Spf k⟦t⟧ → Spec k has a proper reduced map (a point to a point), but its direct image of O has sections k⟦t⟧, not a finite k-module. It is not adic finite type and is outside this pushforward theorem.

### Examples

On Spf ℤ_p⟦t⟧ over ℤ_p, the two sections t = 0 and t = pⁿ have intersection ℤ_p/pⁿ and degree n for n ≥ 1. At n = 0 the second equation is t−1, a unit, so the intersection is empty and the degree is 0; at the self-intersection the common support is formal and the numerical pairing is not defined. Ramified quadratic base change takes the degree of Spec k from 1 to 2, whereas restriction from a residue-degree-two extension takes a degree-one closed point to degree 2. On a proper curve, the Cartier sign is χ(O_C) − χ(O_C(−D)) = deg O_C(D), including when C lies in D (§§4.2–4.7).

### Dependencies

Layers 0–3; AdicSpacesPartIII §§F0.2–F0.4, §F0.6 (formal-direct-image-comparison, associated-formal-module, affine-coherent-equivalence) and the proper formal coherent-direct-image contract; SchemeAndStackFoundations §§2.2, 2.6, 3.3; JacobianChallenge Layer C; EnhancedDerivedSheaves §§0.4, E1.4; SchemeKTheoryOperations §§2.2–2.4, 6.1.

## Downstream consumers

GrossZagierAndArithmeticHeightsPartII uses formal support and products (§§0.6, 1.7–1.8), regular comparison (§2.1), horizontal/vertical component cokernels and expected-dimension vanishing (§§3.1–3.2), and Euler and Cartier pairings (§§4.2–4.7). Its horizontal and vertical special-cycle classes are inputs to this theory, not definitions of this roadmap. Zhang's arithmetic fundamental lemma intersections use §3.2 for expected-dimension vanishing and §4.5 for zero-dimensional cancellation; Kudla–Rapoport and arithmetic inner-product constructions use the same supported and numerical interfaces (ZHANG21 Lemma 4.4 and Proposition 5.2; LIZHANG22 Definitions 2.4.1–2.4.2 and 5.2.1).

The affine rational filtration product (§2.4) and zero-dimensional numerical result (§4.5) are the precise formal cases supplied. A consumer requiring a non-affine support-filtration product must supply a theorem in that generality; it cannot infer one from the affine comparison or from numerical vanishing.

The acceptance file is `TauCetiRoadmap/SchemeKTheoryOperationsPartII/Suggested.lean`. Its module docstring lists the headline results and the missing formal carriers which prevent stating them at the pins. The roadmap and its complete API and Checks are this document.

## References

- **ZHANG21:** Wei Zhang, [Weil representation and arithmetic fundamental lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), Annals of Mathematics 193 (2021), 863–978. Appendix B, pp. 971–975, is cited with journal pagination: formal support at ZHANG21 line 4511, groups and filtrations at line 4525, exhaustion at line 4563, Euler pairing at line 4576, Lemmas B.1–B.2 at lines 4607 and 4629. The strict comparison here carries the finite-dimension and resolution hypotheses required by its global complex model.
- **LIZHANG22:** Chao Li and Wei Zhang, [Kudla–Rapoport cycles and derivatives of local densities, arXiv:1908.01701v3](https://arxiv.org/abs/1908.01701v3), published in JAMS 35 (2022). Locators use the preprint's numbering: §1.8 p. 9 (LIZHANG22 line 336), Definitions 2.4.1–2.4.2 p. 11, Definition 5.2.1 p. 24 (line 965), Remark 6.4.11 p. 43 (line 1811), Lemma 10.4.2 p. 67 (line 2942), and the finite-flat degree application in the proof of Theorem 10.5.1 p. 71. The coherent pushforward hypothesis is EGA properness, as in §4.7.
- **EGA-I:** A. Grothendieck with J. Dieudonné, [Éléments de géométrie algébrique I](https://www.numdam.org/item/PMIHES_1960__4__5_0/), Publ. Math. IHÉS 4 (1960). Ch. 0 §7.6 pp. 74–75 (EGA-I line 2849); Ch. I §10.1 p. 182 (line 7294), §10.10 pp. 201–203 (line 8098).
- **EGA-III1:** A. Grothendieck with J. Dieudonné, [Éléments de géométrie algébrique III, première partie](https://www.numdam.org/item/PMIHES_1961__11__5_0/), Publ. Math. IHÉS 11 (1961), (3.4.1)–(3.4.4), pp. 119–120 (EGA-III1 lines 4444–4507).
- **STACKS:** [The Stacks Project](https://stacks.math.columbia.edu), Tags 00KW, 0BBZ, 00L6, 00M0, 00M3, 05GI, 02JN, 00NA, 00NP, 00O7 and 0AFS in *Commutative Algebra*; 062F, 07NV, 07NX, 07NY in *More on Algebra*; 02KH in *Cohomology of Schemes*; 0AYR and 0AYX in *Varieties*. Extraction locators specify the chapter as well as STACKS line N because the work has several chapter extractions.
