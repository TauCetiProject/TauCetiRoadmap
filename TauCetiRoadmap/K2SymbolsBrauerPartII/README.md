# Roadmap: K₂ symbols and Brauer groups, part II

**Summary.** Relate classical K₂ to the tensor-valued Galois symbol, explicit symbol algebras, arithmetic norm-residue symbols and finite étale Chern classes. Starting from K2SymbolsBrauer's Matsumoto presentation and KTheoryFiniteLocalFields §3.0a's degree-two norm-residue comparison, build the coefficient dictionaries that identify the actual maps in these descriptions. The main outputs are the Brauer class of a symbol algebra without an irreducibility assumption, the signed local invariant formula, reciprocity on every K₂ class, and compatibility with Tate's arithmetic comparison and integral reduction in finite K-theory.

## Scope and ownership

This roadmap follows K2SymbolsBrauer, Layers 0–13. The base roadmap constructs the classical field presentation in §0.4, symbols, residues, norms and the classical-to-Quillen comparison; §§10.32a–10.32b also construct prime-degree local and global function-field cyclic comparisons. Layer 2 extends §10.32a’s symbol presentation from prime-degree local function fields to every field and every invertible degree, including reducible radical polynomials, on the same generators wherever the domains overlap. The base global function-field pairing and reciprocity of §10.32b retain their owner. Part II owns the native field-cohomology bridge, the arbitrary-DVR Galois/localization residue comparison, the adic Tate symbol and its coefficient diagram, the conditional and global adic torsion theorems, and the global-field Picard sequence. It also owns primitive-root bases in finite twists, the tensor factorization of the root pairing, the Brauer-valued K₂ dictionary, the specified degree-m symbol algebra and its matrix corner, a total conic presentation, and comparisons with the supplied local, Tate and Chern maps.

K2SymbolsBrauer supplies the presentation and normalization adapters on AlgebraicKTheory A1–A3 and A5’s shared classical carriers, together with transfers, tame symbols, localization and the classical-to-Quillen comparison. The transitive classical-carrier prerequisite keeps AlgebraicKTheory’s ownership. K2SymbolsBrauer §12.5 owns the real K₂ sign homomorphism, and §§8.1–8.3 fix the product sign used here. KTheoryFiniteLocalFields §3.0a owns the all-field norm-residue comparison, §§3.1–3.3 the local K₂ norm-residue map and full-root splitting, §7.3 the finite-place completion transports, §1.1 finite K-theory coefficients and exactness, and §1.8 the early finite étale Chern operations. This roadmap identifies these specified maps after the classical/Milnor transports; it does not construct a second local factorization, section or finite-coefficient theory.

EtaleCohomologyFoundations §F.0.3 owns finite twists and §§F.4.1–F.4.2 their adic realization. SchemeAndStackFoundations §§2.11, 2.15 owns Kummer and the field étale/Galois comparison. ArithmeticKTheory §§5.2, 6.1 and 6.3 owns the number-field S-integer comparisons, their coefficient limits and localization maps, including the real dyadic degree-two row. Part II compares those specified maps with Tate's field symbol and finite reduction. Part II constructs the all-exponent coefficient reduction from these adic comparisons in §5.0e; §§5.0a–5.0d construct the field and global Tate results used by the dictionaries.

ClassFieldTheory owns local reciprocity, normalized Brauer invariants and the number-field Brauer sum. QuadraticFormInvariants §§6C, 6E and 7B owns the unit-input Hilbert symbol, its cohomological comparison and the algebraic/cohomological Brauer equivalence. ClassicalArithmeticCompletion §§1.14, 1.25 and 1.52 owns the arithmetic scalar pairing and its all-place law; §1.44 owns its scalar invariant comparison and sign determination. Part II transports that comparison to K₂. GeneralAlgebraicKTheory §§1.7–1.8, Layer 5 and §§7.4–7.5 supplies stable cofibers, the K-spectrum and integral products.

The field-level constructions use every field and every positive coefficient invertible in that field. A primitive root in the field is required exactly for the root-dependent constructions. Local results include equal characteristic with coefficients prime to the characteristic and mixed characteristic with residue-characteristic coefficients. The Tate comparisons include all primes allowed by their field or ring hypotheses, including 2 and real places. The all-place construction in Layer 4 is for number fields; the global function-field Tate comparison and the global-field Picard sequence are constructed in §§5.0c–5.0d. No number-field reciprocity theorem is used as a function-field theorem.

## Conventions

Write K₂ᶜˡ(F) additively and denote its Matsumoto symbol by {a,b}, where a,b∈Fˣ. For an abelian group A, A/m means A/mA and A[m] means the kernel of multiplication by m. These are different from the homotopy groups of a spectrum with finite coefficients. Brauer groups are written additively even when the library carrier uses a multiplicative type tag. Fields and separable closures use the universes of the pinned APIs; the conic signatures allow arbitrary universe levels. A field embedding is a unital map, and scalar extension uses its induced algebra structure and the compatible scalar tower.

Unless a subsection says otherwise, F is a field, m≥1 and `IsUnit (m : F)` holds. In positive characteristic p this means p∤m. Put G_F=Gal(Fˢ/F). Write μ_m for the additive discrete G_F-module of m-th roots of unity in the separable closure, and Z/m(j) for its supplied finite Tate twist. Thus Z/m(1)=μ_m and `Z/m(2)=μ_m⊗_{Z/m}μ_m`. Weight zero is Z/m; negative weights use duals. All tensor maps below are maps of G_F-modules. Their triviality as representations requires a hypothesis, not merely an abstract cyclic-group isomorphism.

For a∈Fˣ choose α∈(Fˢ)ˣ with α^m=a. The additive Kummer class κ_m(a) has cocycle g↦g(α)/α in multiplicative root notation. It corresponds to `Multiplicative.toAdd (TauCeti.kummerMap F m hm a)`. Cups have the first input first: a (1,1) cochain cup is (g,h)↦κ(a)(g)⊗gκ(b)(h). The imported Galois symbol `h_{F,m}` sends {a,b} to κ_m(a)∪κ_m(b) in H²(F,Z/m(2)). Field étale and continuous Galois models are related by the specified cup-compatible supplier equivalence.

If ζ∈F is primitive of order m, `τ_{ζ,j}:Z/m≃Z/m(j)` denotes the tensor or dual basis with `τ_{ζ,1}(1)=ζ`. The contraction c_ζ:μ_m⊗μ_m→μ_m sends ζ^i⊗ζ^j to `ζ^{ij}`; it is not multiplication of roots. The root-dependent Brauer symbol β_ζ is h followed by H²(c_ζ) and the Kummer inclusion into Br(F)[m]. Changing ζ to ζ^u multiplies `τ_{ζ,j}` by u^j, its inverse in weight two by `u^{-2}`, and c_ζ and β_ζ by `u^{-1}`. Negative powers of u are taken in (Z/m)ˣ. For m=1 all these modules and coordinates are zero.

The symbol algebra has relations X^m=a, Y^m=b and **YX=ζXY**. A crossed product has u_σ x=σ(x)u_σ and `u_σu_τ=d(σ,τ)u_{στ}`. With these choices the class of the symbol algebra is the contracted **ordered** cup. Reversing either the commutation relation or the order of the cup changes its sign.

The arithmetic local Artin map sends a uniformizer to arithmetic Frobenius. Define the scalar convention by `H_m(a,b)=Art_F(a)(b^{1/m})/b^{1/m}`. Thus the Artin argument is first. If inv_F is the normalized local Brauer invariant and e_m:(Q/Z)[m]≃Z/m sends [k/m] to k, then

```text
H_m(a,b) = ζ^{-e_m(inv_F(β_ζ{a,b}))},
H_m(b,a) = ζ^{ e_m(inv_F(β_ζ{a,b}))}.
```

The notation e_m never means multiplication by m inside Q/Z, which is zero on this subgroup. The arithmetic sign is visible for m=3 over Q₇ in §3.5. At m=2 it is invisible.

The tame symbol imported from K2SymbolsBrauer has the uniformizer last: ∂ᴹ{u,π}=ū. The cohomological residue has ∂κ_m(π)=1 and the degree-one left-factor sign. Consequently ∂h=-κ_m∂ᴹ. This statement requires m invertible in the residue field. In mixed characteristic, invertibility in F alone does not permit this residue formula. Tate's tame calculation uses the uniformizer-last convention; a source with the inverse tame convention must be transported before comparing signs.

Let θ₂ be K2SymbolsBrauer's raw Hurewicz comparison. Its torus computation has ε=-1, and θ₂♮=θ₂∘(ε·) is the product-normalized comparison: θ₂♮{a,b}=[a]·[b], in that order. The finite Chern comparison is `c_{2,2}` red_m `θ₂♮=-h_{F,m}`. For θ₂ itself it is -εh=+h. This sign concerns a different comparison from the arithmetic Artin sign. Both are tested independently on a cubic class.

## Exact supplier contracts

### From Mathlib

Use `rootsOfUnity m F` for the subgroup of Fˣ with m-th power one. For a primitive root in a commutative group, `IsPrimitiveRoot.zmodEquivZPowers` identifies ZMod m additively with the powers of that root. Over an integral domain and nonzero m, `IsPrimitiveRoot.zpowers_eq` identifies those powers with `rootsOfUnity m F`. The weight-one basis below extends these maps; it does not replace them. Use existing tensor products, finite free modules, matrices, units, algebra maps, finite-dimensional linear algebra and quotient abelian groups in their usual scopes. In particular, the monomial construction uses an actual basis indexed by `Fin m × Fin m` and scalar extension uses the existing tensor-product algebra.

### From Tau Ceti

At the pins Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, `TauCeti.KummerCoeff F m` is `Additive (rootsOfUnity m (SeparableClosure F))` with its discrete continuous G_F-action. `TauCeti.kummerMap` is defined under `IsUnit (m : F)` and lands in the multiplicative tag of H¹. `TauCeti.kummerMap_eq_kummerCocycleClass` fixes its cocycle to gα/α. `TauCeti.ker_kummerMap` and `TauCeti.kummerMap_eq_one_iff` identify its kernel with m-th powers. These declarations supply the actual coefficient object and actual map for the dictionary.

`TauCeti.ContCohomology.explicitCup11` accepts a jointly continuous equivariant biadditive coefficient pairing and gives the biadditive H¹×H¹→H² cup. `TauCeti.ContCohomology.explicitCup11_eq_neg_flip` compares it with the negative cup for the flipped pairing. Both the additive type tags and the flipped coefficient map are retained when using this theorem.

The same Tau Ceti pin supplies the following arithmetic objects. In `NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean`, `TauCeti.ClassFieldTheory.h2MuEquivZMod` and `toRatAddCircle_h2MuEquivZMod` give the normalized H²(F,μ_m) coordinate characterized by [k/m]↔k. They require m invertible in the local field, including the mixed-characteristic wild case. `kummerCupPairing` in `ClassFieldTheory/Local/Symbol.lean` is the existing root pairing whose tensor factorization is constructed below.

`TauCeti.brauerCohomologyEquiv` in `Algebra/CrossedProduct/Comparison.lean` sends an algebraic Brauer class to continuous H² with units coefficients; `brauerCohomologyEquiv_crossedProductClass` characterizes it by inflation of the actual crossed-product cocycle. `brauerCohomologyEquiv_quaternionClass` in `Algebra/CrossedProduct/CupProduct.lean` identifies the quaternion class with the ordered mod-two Kummer cup. `TauCeti.hilbertSymbol` is the generic unit-input norm-equation sign. Its symmetry, square rescaling and norm criterion, the local bimultiplicativity theorems, dyadic formulas, real formula, and `TauCeti.hilbertSymbol_eq_cohomological` are consumed through QuadraticFormInvariants. The only new conic object has arbitrary field elements as inputs, including zero.

The acceptance file imports `TauCeti.NumberTheory.HilbertSymbol.Basic` for the field-generic conic/Hilbert comparison. The Kummer coefficient map `TauCeti.ClassFieldTheory.h2MuToBr` in `NumberTheory/ClassFieldTheory/Brauer/Torsion.lean` sends H²(F,μ_m) to Br(F); its injectivity and m-torsion image hold when m is invertible in F.

### From K2SymbolsBrauer

Consume §§5.1–5.2's universal Steinberg-pairing presentation and §§7.1–7.3's symbol-preserving, field-natural equivalence with classical K₂, using the classical field presentation constructed in K2SymbolsBrauer §0.4. Consume §§5.13–5.15’s divisibility and real-decomposition statements for the archimedean finite quotients. Consume §12.5's `realSignSymbol` on K₂(R), including its symbol values and surjectivity. Consume the tame, transfer and number-ring localization maps of Layers 1–13 with ∂ᴹ{u,π}=ū. Consume §§8.1–8.3's raw θ₂, the computed ε=-1, and θ₂♮ with its ordered unit-product formula. Only the equality after these specified transports is a target here. Consume §10.32c’s finite generation of the function-field tame kernel and characteristic-prime divisibility, and §§11.2, 12.2–12.3’s global-field tame localization. Consume §10.32a’s prime-degree local function-field symbol-algebra presentation with the same X, Y and ζ, and §10.32b’s function-field reciprocity in that scope. The Layer 2 extension identifies its generators with this presentation on the common domain. No raw comparison may be chosen afresh to absorb a sign.

### From EtaleCohomologyFoundations and SchemeAndStackFoundations

Consume EtaleCohomologyFoundations §F.0.3's finite twists in every integer weight with tensor, dual, evaluation, pullback and coefficient coherence; §§F.4.1–F.4.2 realizes their normalized adic systems using derived inverse limits with Milnor terms. Consume SchemeAndStackFoundations §2.11's Kummer sequence and §2.15's field étale/Galois equivalence on discrete modules.

Consume EtaleCohomologyFoundations §0.7's support-localization triangle and §F.3a's henselian-trait inertia and positive tame character. Section 1.1 constructs their comparison with the native Kummer module and ordered continuous cup, including coefficient triangles and transfer. Section 1.6 constructs the arbitrary-DVR residue bridge; its residue-field invertibility hypothesis is separate from invertibility in F.

### From LefschetzPencilsAndVanishingCycles

Consume §0.10's absolute purity for regular closed immersions between regular noetherian schemes with invertible coefficients, including fundamental classes, transverse pullback and composition. Apply it to the closed point of every DVR, without a smoothness, excellence or completeness restriction. Section 1.6 compares this supplied purity/localization map with the independently constructed Galois residue, preserving its positive uniformizer normalization.

### From KTheoryFiniteLocalFields

Consume §3.0a's `merkurjevSuslin` on its common Milnor carrier for every field F and m≥1 invertible in F, preserving the ordered Kummer cup, field restriction, coefficient changes, finite-extension norms and localization. Transport its degree-two carrier through K2SymbolsBrauer §§7.1–7.3. Consume §§3.1–3.3's `normResidueMap`, exponent projections and full-root section, and §7.3's finite-place completion transports. For w=#μ(F), the m-symbol is the full map raised to w/m, not the primary-component projection.

Consume §1.1's `coeff`, `coeffGroup`, `reduce`, `bockstein` and `coeff_exact`, including all-degree short exactness, ring/coefficient naturality and CRT. In degree two its actual maps give the sequence and image in §5.4. Consume §1.8's `earlyChern`, Kummer normalization, comparison with integral operations and mixed integral/coefficient product formulas. At even coefficients in degree two, retain its Bockstein correction on arbitrary finite classes; only the integral-reduction image is used in §5.5. Composite coefficients use the supplied CRT maps, without extending the allowed finite-by-finite product range.

### From ArithmeticKTheory

Consume §§5.2, 6.1 and 6.3's arithmetic descent and adic degree-two comparisons at i=1 for every number field F and prime ℓ and finite S containing the archimedean places and those above ℓ. Use their coefficient-compatible finite and adic maps, coefficient limits, restriction/corestriction and localization squares. Section 6.1 supplies the degree-two comparison for odd ℓ or totally imaginary F; §6.3's n=2 row retains ordinary H² and the real places at ℓ=2. Consume §6.1's finiteness of positive even K-groups and §6.3's ordinary degree-two dyadic comparison. Section 5.0e proves reduction from continuous H² to every finite exponent, and §5.3 identifies the resulting finite map and the supplied adic map on generic restriction using the product-normalized classical-to-Quillen adapter.

### From ArithmeticGaloisDuality

Consume §§R02.1.2–R02.1.3's continuous coefficient triangles, Milnor sequence and absence of nonzero ℓ-divisible subgroups in lattice cohomology. Consume §R02.4.4's finite-coefficient arithmetic cohomology finiteness and high-degree restriction to real places, including the dyadic case. Together with the derived coefficient systems of EtaleCohomologyFoundations §§F.4.1–F.4.2, these give §5.0e's weight-two H³ vanishing and coefficient-reduction theorem. For the function-field Picard argument use §R02.3.2's global Brauer invariant-sum sequence; the prime-degree Milnor realization and its completion maps remain K2SymbolsBrauer §10.32b's.

### From SelmerIwasawaCohomology

Consume §3.15's finite and lattice étale/Galois comparisons on Spec O_(F,S) for every number field and every finite S containing the archimedean places and those above the coefficient prime. They retain ordinary cohomology at real places, identify the actual finite twists and coefficient triangles, and commute with restriction and transfer. Section 5.0e applies these supplied comparisons to weight two; it constructs no second arithmetic-site comparison.

### From GeneralAlgebraicKTheory

Consume §§1.7–1.8's stable derived cofibers, homotopy exact sequence and suspension sign; Layer 5's connective K-spectrum; §§7.4–7.5's external and internal products, naturality, associativity and graded commutativity. KTheoryFiniteLocalFields §1.1 constructs the finite-coefficient cofiber and supplies its degree-two exact segment used in §5.4. The integral K₁ product survives reduction without any choice of multiplication on the coefficient spectrum.

### From ClassFieldTheory and QuadraticFormInvariants

ClassFieldTheory Layer 5 supplies cup compatibility, `invMap` and the coordinate e_m; Layer 6 supplies the arithmetic-Frobenius Artin map and its character formula χ(Art_F(a))=inv(a∪δχ) (Milne, III.3, Proposition 3.6, p.109). The Kummer form inv(χ∪κ(b))=χ(Art_F(b)) involves the convention transport of Milne III.4, Steps 1–3, pp.111–112; it is used here through ClassicalArithmeticCompletion §1.44's sign determination. These statements include coefficients invertible in F even when the residue characteristic divides them. Layer 10 supplies completion maps, finite support of local invariants and `sumLocalInv_eq_zero` for number fields, with real invariant 1/2 and complex invariant zero. Layer 14 supplies the quadratic all-place product law.

QuadraticFormInvariants §7B supplies the generic algebraic/cohomological Brauer equivalence, the crossed-product convention stated above, its naturality and the quaternion formula. Its §6C supplies the unit-input Hilbert symbol, local norm criterion, bilinearity and explicit formulas. Its §6E supplies `hilbertSymbol_eq_cohomological` and the compatibility with the normalized invariant. These are the imported comparisons at m=2. The present work adds an arbitrary-degree algebra presentation and comparisons of the supplied K₂ maps, not a new quadratic comparison.

### From ClassicalArithmeticCompletion

Consume §§1.14 and 1.25's H_m on every nonarchimedean local field F with μ_m⊂F and m invertible in F. It is Art_arith(a) acting on `b^{1/m}`, independent of that root, bimultiplicative, skew symmetric, Steinberg and perfect on `Fˣ/F^{×m}`. This includes all mixed-characteristic coefficients, not just tame ones or completions of a single number field. Consume §§1.24 and 1.52's place factors and degree-m Hilbert reciprocity over a number field, including the explicit real and complex conventions. Consume §1.44's `normResidueSymbol_eq_localSymbol`, including the normalized invariant coordinate, specified coefficient pairing and convention comparison that determines the universal sign with the cubic witness. Layers 1 and 3 transport that scalar identity to K₂ by symbol generation.

## How to read the build

Layer 1 compares coefficient models and fixes every root and residue transport. Layer 2 realizes the resulting Brauer symbol by a finite free algebra, retaining its degree when the radical polynomial factors. Layer 3 transports the supplied local K₂ maps and scalar invariant comparison to the Brauer and conic dictionaries. Layer 4 assembles those maps at every place and proves the K₂ form of reciprocity. Layer 5 first constructs the adic Tate symbol, its torsion and Picard theorems, and number-field coefficient reduction; it then identifies the same maps in the local, global and S-integer comparisons and in finite étale Chern theory. The README is the specification of all five layers. `Suggested.lean` states the field-generic conic/Hilbert equality and total real criterion, with the conic definition they need; its module docstring identifies the unavailable carriers for the other headlines.

## Layer 1: coefficient models and Brauer symbols

### 1.1 The ordered Kummer-cup dictionary

Construct the field-cohomology bridge for every F and m under the standing hypotheses: identify EtaleCohomologyFoundations §F.0.3's weight-one coefficient with the native Kummer module through SchemeAndStackFoundations §2.15's field étale/Galois equivalence. Prove that the induced H¹ identification carries the Kummer connecting class to gα/α, and that the induced H² identification carries the ordered tensor cup to the native explicit continuous cup. Prove compatibility with coefficient triangles, restriction and finite-extension transfer. For inseparable extensions retain topological invariance together with the degree multiplier on transfer, rather than identifying transfer with inverse restriction. The proof compares the actual connecting cocycles and the tensor pairings; derived naturality supplies the coefficient diagrams. (Weibel, III.6.10.1–6.10.3, pp.242–243; Tate, Lemma 3.2 and Diagram 3.3, pp.263–264.)

For every F and m under the standing hypotheses, prove the ordered Kummer-cup dictionary: after the field étale/Galois comparison, `h_(F,m)({a,b} mod m)` equals `explicitCup11` applied to the additive Kummer classes of a and b, for the canonical tensor pairing into Z/m(2). This is an equality involving the imported h, not a new construction of it. It requires no primitive root in F. (Weibel, III.6.10.2–6.10.3, pp.242–243; KTheoryFiniteLocalFields §3.0a; §1.1’s field-cohomology bridge.)

Use the weight-one dictionary to identify the Kummer class with gα/α and the cup-compatible field comparison just constructed to identify the tensor coefficient map. The diagonal Galois action makes the tensor pairing equivariant. Its source coefficients are discrete, so the continuity requirement of `explicitCup11` is satisfied. The Matsumoto equivalence preserves {a,b} in this order. Well-definedness, the Steinberg relation and field functoriality are supplied by KTheoryFiniteLocalFields §3.0a; the target is their compatibility with this concrete continuous API.

The dictionary must commute with the supplier's coefficient maps and with a field embedding F→E. The equality is checked on symbols and then on their generated group. Replacing H²(F,μ_m⊗μ_m) by H²(F,μ_m) before choosing a root would change the problem: even their Galois actions can differ.

*Needs:* K2SymbolsBrauer §§5.1–5.2, 7.1–7.3; KTheoryFiniteLocalFields §3.0a; SchemeAndStackFoundations §2.15; EtaleCohomologyFoundations §§F.0.3, F.4.1–F.4.2; native Kummer and explicit continuous cups.

**Checks.**

- If a and 1-a are units, h{a,1-a}=0. For instance, over R modulo 2 the symbol {-1,2} vanishes since 2 is a square; this does not kill {-1,-1}.
- An m-th power in either slot has zero image, since its Kummer class is zero. In particular a slot equal to 1 gives zero, including m=1.
- For F=F₂(t), E=F₂(s) with s²=t and m=3, restriction sends κ₃(t) to 2κ₃(s), and transfer sends κ₃(s) to κ₃(t), since N(s)=t. Their composite is multiplication by 2; replacing transfer by inverse restriction gives the wrong scalar.
- Over Q with m=3 the tensor-valued map is defined, although Q has no primitive cube root. A signature requiring a chosen root for this map fails this case.
- Over R with m=2 the two classes κ(-1) have a cup whose Brauer image is Hamilton's class, of invariant 1/2. A dictionary reversing a type tag or replacing the map by zero fails this value.

### 1.2 Primitive-root bases in all integer weights

For ζ∈F primitive of order m and every j∈Z, construct the primitive-root trivialization, the equivariant Z/m-linear equivalence `τ_{ζ,j}:Z/m≃Z/m(j)`. In weight one use the two Mathlib primitive-root identifications and the map into the separable closure. For j>0 take tensor powers; for j<0 take powers of the dual basis. At j=0 use the scalar unit object. The Galois action on every chosen basis is trivial because ζ lies in F. (Weibel, III.6.10, pp.242–243, for the primitive-root coefficient identification; the all-weight construction uses the tensor/dual coherence of EtaleCohomologyFoundations §F.0.3.)

The API must expose the following values and coherence, as maps rather than mere existence assertions:

- The trivialization sends 1 to the specified tensor or dual basis.
- The weight-zero formula identifies `τ_{ζ,0}` with the identity of Z/m.
- The weight-one formula identifies `τ_{ζ,1}` with `zmodEquivZPowers` followed by `zpowers_eq` and the coefficient embedding.
- Tensor coherence identifies `τ_{ζ,i}⊗τ_{ζ,j}` with `τ_{ζ,i+j}`, using the supplied tensor equivalence, for arbitrary integers i,j.

For negative weights the evaluation pairing is part of the assertion: if `t=τ_{ζ,1}(1)` and `t*=τ_{ζ,-1}(1)`, then t*(t)=1∈Z/m. Thus the tensor equation for weights 1 and -1 includes the chosen evaluation, not an arbitrary isomorphism between two cyclic modules. For m=1, ZMod 1 and all the finite twists are zero modules, and the same formulas have their unique meaning.

*Needs:* EtaleCohomologyFoundations §F.0.3; Mathlib `IsPrimitiveRoot.zmodEquivZPowers` and `IsPrimitiveRoot.zpowers_eq`; the native coefficient embedding into the separable closure.

**Checks.**

- At j=0 the map is the identity for every root, including m=1. A construction returning a root-dependent automorphism in weight zero is incorrect.
- At m=5, changing ζ to ζ² changes the weight-one basis by 2 and the weight-two basis by 4. These different factors detect a construction using the same root character in every weight.
- At m=5 the corresponding weight -1 basis changes by 3, since 2·3=1 modulo 5. Evaluation of the new basis against ζ² is still 1.
- At m=2, the only primitive root is -1. The weight-one basis agrees with ClassFieldTheory's existing mod-two identification.
- Over Q, μ₃ has the nontrivial cyclotomic action, while μ₃⊗μ₃ has its square, hence trivial action. There is no equivariant weight-one trivialization over Q. The general tensor-valued h of §1.1 still exists there.

### 1.3 The tensor contraction attached to a root

Construct the root contraction `c_ζ:μ_m⊗_{Z/m}μ_m→μ_m`. In additive module notation it is `id⊗τ_{ζ,1}^{-1}` followed by the scalar unitor. Equivalently, on roots written multiplicatively, `c_ζ(ζ^i⊗ζ^j)=ζ^{ij}`. On the native module `(TauCeti.ClassFieldTheory.muNRep m F).V`, this is `TensorProduct.lift (TauCeti.ClassFieldTheory.kummerCupPairing ζ hζ).bil`, with m≥1 and hζ witnessing primitivity. Its pure-tensor value is exactly the supplied bilinear pairing, and it is equivariant for the diagonal Galois action. (Weibel, III.6.10.1–6.10.3, pp.242–243; Milne, III.4, Step 4, p.113.)

Its API consists of the following statements:

- For all i,j∈Z/m, the image of ζ^i⊗ζ^j is ζ^(ij).
- Precomposition with the pure tensor map and the weight-one dictionary gives the specified native root pairing.
- The contraction is equivariant for the diagonal Galois action.
- Any equivariant linear map with these values on every pure tensor equals c_ζ.

The tensor universal property proves existence and uniqueness; it also ensures that H²(c_ζ) is the coefficient map used in later comparisons. In particular, pointwise multiplication μ_m×μ_m→μ_m cannot be substituted, because multiplication is not additive in each of the two root arguments.

*Needs:* §1.2 for its twist interpretation; Mathlib `TensorProduct.lift`; native `TauCeti.ClassFieldTheory.kummerCupPairing` and its equivariance.

**Checks.**

- At m=5, c_ζ(ζ²⊗ζ³)=ζ⁶=ζ. Multiplication of the two roots instead gives ζ⁵=1. This distinguishes the coefficient pairing before any cohomology is taken.
- The multiplicative root 1 represents additive zero, so c_ζ(1⊗t)=c_ζ(t⊗1)=1 for every t. An operation having t as one of these outputs is not bilinear.
- At m=1 the source and target are zero modules and the contraction is their unique map.
- For m=2 and ζ=-1, the pure-tensor comparison is exactly the existing CFT mod-two root pairing, so its induced cup gives the quaternion normalization used by QuadraticFormInvariants.
- At m=5, changing the chosen root to ζ² sends the value on the fixed tensor ζ²⊗ζ³ from ζ to ζ³. Thus c_(ζ²)=3c_ζ; this is distinct from the factor 4 for the inverse weight-two coordinate. The general change identity is proved in §1.5.

### 1.4 The Brauer-valued symbol

For ζ∈F primitive of order m, define the Brauer symbol β_ζ:K₂ᶜˡ(F)/m→Br(F)[m] by the composite

```text
K₂ᶜˡ(F)/m --h--> H²(F,Z/m(2))
  --H²(c_ζ)--> H²(F,μ_m) --Kummer--> Br(F)[m].
```

Also export its pullback to integral K₂ and its algebraic Brauer class through the existing `brauerCohomologyEquiv`. For a field, the Kummer degree-two inclusion identifies H²(F,μ_m) with Br(F)[m], since Pic(Spec F)=0. This reason does not apply to an arbitrary scheme. (Weibel, III.6.10.1 and Remark 6.10.4, pp.242–243; SchemeAndStackFoundations §2.11; QuadraticFormInvariants §7B.)

Its API consists of the following statements:

- On every symbol {a,b}, its value is the displayed contracted ordered cup.
- For every x in the quotient, mβ_ζ(x)=0.
- The specified Brauer equivalence sends the exported algebraic class to β_ζ(x).
- An additive map on the quotient with the same value on every Matsumoto symbol equals β_ζ.

Uniqueness uses symbol generation, not a general-field norm residue isomorphism. This is the map whose local restrictions and algebra representatives will be identified in the next layers.

*Needs:* §§1.1–1.3; SchemeAndStackFoundations §2.11; QuadraticFormInvariants §7B; K2SymbolsBrauer §§5.1–5.2, 7.1–7.3 for uniqueness.

**Checks.**

- β_ζ{a,1-a}=0 whenever a,1-a∈Fˣ, and β_ζ{a,c^m}=0. Both follow through the actual Kummer map; they are not additional relations imposed on Br(F).
- For m=1 the codomain is Br(F)[1]=0 and β is zero.
- Over R at m=2, β{-1,-1} is Hamilton's class of invariant 1/2; if either argument is positive its class is zero. This tests a nonzero class as well as a split one.
- At m=2 over any field of characteristic different from 2, the symbol formula agrees with the pinned quaternion cup theorem through the fixed Brauer equivalence. A second independently normalized comparison is unnecessary.

### 1.5 Changing the root and extending the field

For ζ∈F primitive of order m, u∈(Z/m)ˣ and all j∈Z, use any integer representative to define ζ^u and prove the root-change formula, the Brauer root-change formula and the coefficient contraction identity:

```text
τ_(ζ^u,j) = τ_(ζ,j) ∘ (u^j ·),
c_(ζ^u) = u^{-1} c_ζ,          β_(ζ^u) = u^{-1} β_ζ.
```

The inverse weight-two coordinate changes by `u^{-2}`. The three scalars have different origins: changing two tensor basis vectors, inverting the weight-two coordinate, and producing a single root after contraction. Check the identities on bases and pure tensors, then pass through h and the Kummer inclusion. (The coefficient description is Weibel, III.6.10, pp.242–243; these scalar formulas follow from the basis specified in §§1.2–1.3.)

For every field embedding f:F→E, prove the field-naturality identity:

```text
res_f(β_ζ(x)) = β_(fζ)(K₂(f)(x)).
```

Use the supplied restriction and coefficient base-change maps and prove the identity and composition laws for these comparisons. The primitive root on E is fζ, so the equivalence does not make an independent root choice. These are equalities of the named maps, not an existence statement about maps with the same source and target.

*Needs:* §§1.2–1.4; KTheoryFiniteLocalFields §3.0a field naturality; SchemeAndStackFoundations §§2.11, 2.15 coefficient and restriction maps.

**Checks.**

- For m=5 and u=2, β_(ζ²)=3β_ζ, while the inverse weight-two coordinate changes by 4. Confusing those two factors fails this example.
- Over Q(μ₃), replacing ζ by ζ² negates β. On an element with a nonzero cubic local invariant this changes 1/3 to -1/3.
- Over Q at m=3, §1.1 is still defined but this root-dependent trivialization is unavailable. Field restriction to Q(μ₃) creates the stated root only after the extension.

### 1.6 Residues in the uniformizer-last convention

For every DVR O with fraction field F, residue field k and m≥1 invertible in k, construct the Galois residue ∂:H²(F,Z/m(2))→H¹(k,μ_m). Restrict to the fraction field of the henselization, use the tame-inertia character from EtaleCohomologyFoundations §F.3a and the Hochschild–Serre edge, and descend its unramified coefficient to k. Use the same construction in degree one to normalize ∂κ_m(π)=1. It is independent of the uniformizer: replacing π by uπ adds an unramified Kummer class, whose degree-one residue is zero.

Prove the localization comparison with the supplied maps. For i:Spec k→Spec O and j:Spec F→Spec O, let δ_up:H²(F,Z/m(2))→H³_k(O,Z/m(2)) be the actual connecting map of the supplied support triangle, and let P_up:H³_k(O,Z/m(2))≃H¹(k,μ_m) be the supplied fundamental-class purity identification. In degree one the corresponding maps satisfy P_up δ_up(κ_m(π))=+1, as specified by the uniformizer class in LefschetzPencilsAndVanishingCycles §0.10. Prove ∂=P_up δ_up in degree two. Compare the spectral sequences of inertia invariants and of j_* using that degree-one identification and the cup action. In particular, the connecting map is compatible with a right unramified cup factor, whereas a degree-one left factor contributes −1: P_up δ_up(κ_m(u)∪κ_m(π))=−κ_m(ū) and P_up δ_up(κ_m(π)∪κ_m(u))=κ_m(ū). Thus the negative ordered-cup value comes from the degree of the left factor, with the supplied purity identification unchanged. No residue is defined using the desired K₂ square. This comparison uses arbitrary DVRs; neither smooth-over-a-field purity nor a local-field restriction replaces it. (EtaleCohomologyFoundations §§0.7, F.3a; LefschetzPencilsAndVanishingCycles §0.10.)

Prove the residue dictionary on the actual maps:

```text
∂ h_(F,m)(x) = -κ_m(∂ᴹx)       in H¹(k,μ_m).
```

For valuation units u,w, the cup κ(u)∪κ(w) has residue zero, while ∂(κ(u)∪κ(π))=−κ(ū) and ∂(κ(π)∪κ(u))=κ(ū). The ramified pair has ∂(κ(π)∪κ(π))=κ(−1); this agrees with −κ(∂ᴹ{π,π}) because κ(−1) is 2-torsion. Bilinearity and the decomposition a=uπⁿ, b=wπᵈ prove the formula on every symbol, including the factor (−1)ⁿᵈ in the tame symbol; symbol generation proves it on all K₂. (Tate, proof of Theorem 6.2, p.270, for the uniformizer-last tame calculation; Weibel, III.6.3, p.234, with the inverse tame convention.)

The residue API includes these statements:

- Its degree-one value on κ_m(π) is 1 and its degree-two ordered unit/uniformizer value is −κ_m(ū).
- Its comparison with the actual support boundary is ∂=P_up δ_up, with P_up δ_up(κ_m(π))=+1 in degree one and the displayed cup-factor signs in degree two.
- Coefficient maps and henselization commute with it; restriction has ramification multiplier e and finite transfer has the residue-field corestrictions described below.

Prove coefficient naturality, invariance under henselization, and the restriction square with ramification multiplier e for a local inclusion of DVRs of ramification index e. For a finite extension with finite normalization, prove the transfer square with the sum of residue-field corestrictions and no extra ramification multiplier. These statements use the coefficient maps on the twists, including the purely inseparable degree in transfer. At wild coefficients the local comparisons still exist, but this residue formula requires m invertible in k.

*Needs:* §1.1; K2SymbolsBrauer §§9.7, 9.11–9.18, 11.1, 11.3, 11.7–11.8; SchemeAndStackFoundations §§0.12–0.14; EtaleCohomologyFoundations §§0.7, F.3a; LefschetzPencilsAndVanishingCycles §0.10.

**Checks.**

- For {u,π}, the two residues are ū and -κ(ū), respectively. Take F=Q₇, m=3 and u=3: 3 is not a cube in F₇ˣ, so κ(3) has order 3 and its negative differs from itself. This detects the sign.
- For O=F₃[t]_(t), m=2, the pair {t,t} has tame value −1=2 and residue κ₂(2)=−κ₂(2), the nonzero element of H¹(F₃,μ₂). Dropping the sign factor in the tame symbol gives zero instead.
- For the ramified inclusion k[[t]]→k[[s]], t=s², at m=3 the residue of {u,t} changes from −κ₃(ū) to −2κ₃(ū). For the unramified quadratic extension of Q₇, the constant unit 3 has residue norm 3²=2 in F₇, so the transferred residue is −κ₃(2)=−2κ₃(3); multiplying it again by the degree would be wrong.
- For O=C[[t]], F=C((t)) and m=3, both ∂κ₃(t) and P_up δ_up(κ₃(t)) are 1∈Z/3, whereas their negatives are 2. This distinguishes the supplied positive normalization from its negative.
- At Q₇,m=3,u=3, both the Galois residue and P_up δ_up on κ₃(3)∪κ₃(7) are −κ₃(3)=2κ₃(3); on the reversed cup both are κ₃(3). These values test the degree-one normalization and degree-two cup compatibility separately.
- For two valuation units u,w, the tame value is 1 and the cohomological residue is zero. This holds independently of whether the full local cup is zero.
- At F=Q₂,m=2, the coefficient is invertible in F but not in its residue field. The residue formula cannot be applied to {-1,-1}; its tame value 1 does not force its Hilbert value to be 1.
- At m=1 all finite cohomology and finite quotient residues vanish. In characteristic p, the assertion excludes a coefficient divisible by p in k.

### Examples

The fifth-root calculation separates three maps already at coefficient level: a weight-two basis changes by 4 under ζ↦ζ², its inverse changes by 4 as well modulo 5, while the Brauer contraction changes by 3. Evaluation in weight -1 changes by 3 so that the paired weight-one basis still evaluates to 1. Over Q, the cube-root action supplies a different check: the tensor symbol exists before a root is available in the base field. For the residue sign, the unramified coefficient at Q₇ with unit 3 and uniformizer 7 distinguishes κ(3) from -κ(3).

### Dependencies

K2SymbolsBrauer §§5.1–5.2, 7.1–7.3 and its tame/localization layers; LefschetzPencilsAndVanishingCycles §0.10 for arbitrary-DVR purity; EtaleCohomologyFoundations §F.0.3; SchemeAndStackFoundations §§2.11, 2.15; KTheoryFiniteLocalFields §3.0a; §1.1’s field-cohomology bridge and §1.6’s purity/residue comparison; native Kummer and explicit continuous cup APIs; Mathlib's primitive-root maps. The Brauer export additionally uses QuadraticFormInvariants §7B, and the coefficient-pairing comparison uses ClassFieldTheory Layer 5. No local or global norm residue isomorphism is required for this layer.

## Layer 2: cyclic symbol algebras

### 2.1 The finite free algebra and its universal property

For a,b∈Fˣ, m≥2 invertible in F, and ζ∈F primitive of order m, construct the cyclic symbol algebra A_ζ(a,b) on the free F-module with basis `e_{i,j}`, 0≤i,j<m. With `X=e_{1,0}`, `Y=e_{0,1}`, prescribe the multiplication

```text
e_(i,j) e_(k,l) = ζ^(jk) a^floor((i+k)/m) b^floor((j+l)/m)
                  · e_((i+k) mod m,(j+l) mod m).
```

The carries and the identity ζ^m=1 give associativity; `e_{0,0}` is the unit. Thus X^m=a, Y^m=b and YX=ζXY. This construction is defined whether or not T^m-a is irreducible. Its carrier has dimension m² before any radical field is selected. On K2SymbolsBrauer §10.32a’s domain, identify the presentations by their named generators, using the same algebra rather than introducing an independent local presentation. (Weibel, III.6.9, pp.240–241, for the generators and relations; the displayed multiplication fixes their finite free realization.)

Its API includes:

- The monomials X^iY^j, for 0≤i,j<m, form the specified F-basis; in particular the dimension is m².
- The generators satisfy X^m=a, Y^m=b and YX=ζXY, and both generators are units.
- Every pair satisfying these relations in a unital F-algebra induces a unique F-algebra homomorphism from A with the specified generator images.
- Scalar extension along every field embedding carries the named basis to the corresponding basis and satisfies the identity and composition laws below.

Prove the universal mapping property: for any unital F-algebra B and x,y∈B with x^m=a·1, y^m=b·1 and yx=ζxy, there is a unique F-algebra homomorphism A_ζ(a,b)→B carrying X to x and Y to y. Normal ordering defines it on `e_{i,j}` by x^iy^j; the relation and carries verify multiplicativity. Conversely, the basis proves uniqueness. Since a,b are units, X and Y are units as consequences of their power relations; they need not be supplied as unrelated invertibility witnesses.

Construct the scalar-extension equivalence for every field embedding f:F→E: scalar extension E⊗_F A_ζ(a,b) is the E-algebra `A_{fζ}(fa,fb)`. Its map takes `1⊗e_{i,j}` to `e_{i,j}`; specify its inverse and the identity and composition laws. Root transport is fζ throughout. This compatibility is needed for completion maps in the arithmetic examples and for the splitting extension, not merely for equality of dimensions.

The presentation with m=1 is used only through its evident convention A₁(a,b)=F when a degree-one corner occurs. The finite free construction above starts at m=2, so it never uses an index 1 in `Fin 1`. The zero coefficient m=0 is outside every assertion.

*Needs:* Mathlib free modules, bases, tensor-product algebras and finite-dimensional linear algebra; the primitive-root power and order identities; K2SymbolsBrauer §10.32a for agreement on its common domain.

**Checks.**

- At m=2, ζ=-1, the universal maps to and from the existing quaternion algebra give an algebra equivalence with (a,b). The anti-commutation relation has the usual quaternion value.
- If a=c^m, the algebra still has m² independent monomials and is eventually Mat_m(F), although F(c)=F has degree one. Defining A using only that radical field gives the wrong carrier.
- At m=4 and a=c² with c nonsquare, the dimension remains 16. The quadratic algebra appearing as a corner in §2.3 has dimension 4 and is a different algebra.
- Multiplying `e_{0,1}` by `e_{1,0}` gives `ζe_{1,1}`, while the reversed product gives `e_{1,1}`. Replacing the exponent jk by il reverses this relation and represents the opposite Brauer convention when the sign is detectable.

### 2.2 A splitting representation and central simplicity

Under §2.1’s hypotheses, prove the splitting equivalence: for every field extension L/F and α∈Lˣ with α^m=a, there is a specified L-algebra equivalence L⊗_F A_ζ(a,b)≃Mat_m(L). On a basis v_i indexed modulo m, use

```text
X v_i = α ζ^(-i) v_i,
Y v_i = v_(i+1)                 for 0≤i<m-1,
Y v_(m-1) = b v_0.
```

Then X^m=a and Y^m=b. For i<m-1, `YXv_i=αζ^{-i}v_{i+1}=ζXYv_i`; at i=m-1 the same equality follows from ζ^m=1 and the wrap factor b. No m-th root of b is required. Distinctness of the eigenvalues uses α≠0 and the order of ζ, so the interpolation denominators are nonzero. Polynomial expressions in X give all diagonal idempotents; their products with powers of the invertible shift Y give all matrix units. Surjectivity and the common dimension m² then give the equivalence. (Weibel, III.6.9 and the split-algebra argument around Lemma 6.9.1, pp.240–241, with the full eigenvalue condition established here.)

Prove central simplicity: A_ζ(a,b) is central simple of degree m over F. Take a finite separable splitting extension containing a root of a; such an extension exists since m is invertible and a is nonzero. Faithfully flat descent detects ideals and the center, giving simplicity and center F. Export its class through the existing Brauer carrier. The proof uses the explicit splitting representation, so it does not assume that every noncentral element satisfying u^m=1 has a full-degree minimal polynomial.

The splitting equivalence has the following API:

- It sends the named generators to the displayed diagonal and shift operators.
- It sends the monomial basis to the corresponding products of these operators, so its inverse is determined on matrix units.
- It is compatible with further scalar extension carrying α to its specified image; the identity extension gives the same representation.

The full-degree eigenvalue condition matters. In Mat₂(D), with D a nonsplit quaternion algebra over a field containing μ₄, diag(1,-1) is noncentral and has fourth power 1, but the ambient degree-four algebra is still nonsplit. Its minimal polynomial has degree 2. In the actual splitting representation above the m distinct eigenvalues are proved, so the analogous interpolation step is justified.

*Needs:* §2.1; Mathlib finite separable extensions, matrix units, center and ideal descent; QuadraticFormInvariants §7B for the Brauer export.

**Checks.**

- If a is already an m-th power in F, choose α∈F. The displayed representation splits A over F itself and gives Mat_m(F), for arbitrary b∈Fˣ.
- Over R at m=2 and a=b=-1, A is Hamilton's division algebra. A splitting statement over F without the root-of-a hypothesis would incorrectly split it; extension to C does split it.
- A root of b is unnecessary. For example a=1 and b a non-m-th-power gives a splitting representation over F with wrap factor b unchanged.
- The m=2 matrices give X=diag(α,-α) and Y with forward shift and wrap b. Their product satisfies YX=-XY, fixing the direction in the smallest noncommutative case.

### 2.3 The matrix corner when the radical has smaller degree

Choose α∈Fˢ with α^m=a, let d=[F(α):F] and put s=m/d. Prove the matrix-corner equivalence: d divides m, c=α^d belongs to F, c^s=a, and there is an F-algebra equivalence

```text
A_ζ(a,b) ≃ Mat_s(A_(ζ^s)(c,b)).
```

The notation on the right uses the degree-d symbol algebra, with the degree-one convention F if d=1. The statement is valid for every a,b∈Fˣ under §2.1's hypotheses. It does not assume d=m. (The cyclic-algebra and Galois-symbol comparison in Weibel, III.6.9 and Remark 6.10.4, pp.240–243, requires this reducible case; the following idempotent proof specifies the reduction.)

Because all m-th roots of unity lie in F, F(α)/F is Galois and its automorphisms embed into μ_m via σα/α. The image is its order-d subgroup, generated by ζ^s. Hence α^d is fixed. The étale subalgebra F[X] of A is F[T]/(T^m-a), and its s factors are given by

```text
T^d-cζ^(rd),                   0≤r<s.
```

Each is irreducible of degree d: its roots are the conjugates of αζ^r. The factors are pairwise distinct, since ζ^d has order s. Their primitive idempotents are permuted transitively by conjugation with Y. Choose the idempotent e of T^d=c. Then eAe is generated by eX and eY^s, with powers c and b and relation Y^sX=ζ^sXY^s. Its d² monomials identify it with `A_{ζ^s}(c,b)`. The conjugate idempotents together with powers of the unit Y provide matrix units and an equivalence A≃Mat_s(eAe).

Give eAe its unital F-algebra structure with unit e and scalar map t↦te. Specify its inclusion into A as a multiplicative F-linear map eAe→A, sending eX and eY^s to those same elements. The inclusion sends the corner unit to e and is a unital F-algebra homomorphism only when e=1. The corner and matrix equivalence have the following API:

- The corner has unit e and dimension d², with the displayed generator powers and commutation relation.
- The s conjugate idempotents are orthogonal and sum to 1; the specified powers of Y give the corresponding matrix units.
- The matrix equivalence takes these units to the usual matrix units and identifies the selected diagonal corner with the degree-d symbol algebra.
- The Brauer-class equality agrees with the generic Morita comparison.

No claim that a crossed product of a degree-d field has dimension m² is used. Changing α changes c and the chosen corner; the theorem asserts an equivalence with the corner associated to that specified α, while the original algebra and its Brauer class remain independent of this auxiliary choice.

*Needs:* §§2.1–2.2; Mathlib Galois theory, separable polynomial factorization and the Chinese remainder theorem; QuadraticFormInvariants §7B for Morita comparison.

**Checks.**

- For m=4, a=c² with c nonsquare and ζ a fourth root, choose α²=c. Then d=2,s=2 and `A_ζ(c²,b)≃Mat₂(A_{ζ²}(c,b))`. The respective dimensions are 16 and 4; the inner algebra is quaternion.
- If d=1, the corner is F and A≃Mat_m(F). The formula must include this split radical case.
- If d=m, s=1 and c=a; the matrix formula reduces to the original presentation with a one-by-one matrix factor.
- In the degree-four example T⁴-c²=(T²-c)(T²+c); Y interchanges the two factors and Y² preserves a corner. The corner unit corresponds to diag(1,0) in Mat₂(eAe), whereas the ambient unit corresponds to diag(1,1). Treating the inclusion as unital would identify these unequal matrices. A proof beginning by assuming T⁴-c² irreducible fails precisely this case.

### 2.4 The algebra class is the contracted ordered cup

Prove the algebra/cup comparison: for every a,b∈Fˣ under §2.1's hypotheses, the supplied algebraic/cohomological Brauer comparison identifies [A_ζ(a,b)] with β_ζ{a,b}. The equality is under the fixed comparison map and in the fixed order; it is stronger than having the same order or the same splitting fields. At m=2, the quaternion comparison is the specialization through the existing quaternion theorem. (Weibel, III.6.9.2, p.241, and Remark 6.10.4, p.243; Milne, III.4, Steps 1–2, pp.111–112; QuadraticFormInvariants §7B.)

In the full-degree case L=F(α), take σ(α)=ζα. If i(g)∈{0,…,m-1} records the action on α, the crossed-product cocycle is `d(g,h)=b^{floor((i(g)+i(h))/m)}`. Its algebra has generator Y implementing σ with Y^m=b, hence YX=ζXY. To compare this with the ordered cup, choose γ with γ^m=b and write `κ(b)(g)=ζ^{j(g)}`. For the 1-cochain `f(g)=γ^{i(g)}`, direct computation gives

```text
δf(g,h) = d(g,h) ζ^(j(g)i(h)).
```

Thus [d]=-[c_ζ(κ(b)∪κ(a))]=[c_ζ(κ(a)∪κ(b))], using the pinned negative-flip cup theorem. This calculation fixes both the crossed-product cocycle and the direction of the Brauer equivalence. Merely observing that both constructions are bilinear symbols would leave a scalar ambiguity.

For d<m, the action exponents have the form i(g)=s i_d(g), where σ_d(α)=ζ^sα generates the degree-d radical extension. Their carry cocycle is still b raised to the degree-d carry. The corner in §2.3 has this cocycle, and the same cochain calculation identifies its inflated class with c_ζ(κ(a)∪κ(b)). The matrix factor does not alter the Brauer class. Use `brauerCohomologyEquiv_crossedProductClass` to conclude in the existing algebraic Brauer group and its naturality to compare local restrictions. This covers reducible radical polynomials without inventing a degree-m field extension.

*Needs:* §§1.1–1.4, 2.1–2.3; native crossed-product cocycles, `TauCeti.brauerCohomologyEquiv_crossedProductClass` and `TauCeti.ContCohomology.explicitCup11_eq_neg_flip`; QuadraticFormInvariants §7B.

**Checks.**

- Over Q₇, let m=3 and ζ reduce to 2. The class of A_ζ(3,7) has invariant 1/3, and so does β_ζ{3,7}. Its opposite has invariant -1/3 and is distinguished by this check.
- At m=4,a=c² with c nonsquare, the computed cup agrees with the quaternion corner `A_{ζ²}(c,b)`, including its matrix factor and its Brauer class.
- Over F₇((t)), m=3 and ζ=2, the class of A_ζ(2,t) has invariant 2/3. The arithmetic values are N{2,t}=2 and N{t,2}=4, agreeing with K2SymbolsBrauer §10.32a’s transposed pairing and distinguishing its order from the Q₇ witness.
- For every symbol the equality uses the named Kummer inclusion and Brauer comparison. Replacing either by its negative would fail the cubic value even if group cardinalities and norm kernels were preserved.
- At m=2, the algebra equivalence to the quaternion algebra gives exactly `brauerCohomologyEquiv_quaternionClass`, with no new quadratic normalization.

### Examples

Take a primitive fourth root ζ and a nonsquare c. The algebra with X⁴=c² and Y⁴=b has sixteen basis elements. Its commutative X-subalgebra has two quadratic factors, exchanged by Y. In the corner X²=c, the element Y² anti-commutes with X and has square b; thus that corner is quaternion and the original algebra is its two-by-two matrix algebra. This example tests the full presentation, central simplicity, the corner construction and the cup comparison at once.

For a=1 the diagonal-and-shift construction gives an F-splitting even when b has no m-th root in F. For a=b=-1 over R it instead requires C. For the cubic local example of §3.5, the cyclic generator is arithmetic Frobenius and its cube is 7; the invariant 1/3 detects which of YX=ζXY and XY=ζYX was chosen.

### Dependencies

Layer 1 for root coordinates and β; Mathlib's finite free algebra, matrix and tensor-product tools; QuadraticFormInvariants §7B for existing central-simple/Brauer and crossed-product comparisons. The proof of the comparison uses the explicit negative-flip cup theorem. The cubic check also uses ClassFieldTheory's normalized unramified cyclic invariant. Neither a local reciprocity theorem nor the general-field norm residue isomorphism is a prerequisite of the algebra construction or the field-generic comparison.

## Layer 3: local norm-residue and Hilbert symbols

### 3.1 The arithmetic norm-residue homomorphism on K₂

Let F be a nonarchimedean local field, m≥1 invertible in F and μ_m⊂F. Put w=#μ(F). Transport KTheoryFiniteLocalFields §§3.1–3.3's full norm-residue map through K2SymbolsBrauer §§7.1–7.3 and take its coefficient power map to μ_m(F):

```text
N_(F,m)(x) = normResidueMap(x)^(w/m),
N_(F,m){a,b} = H_m(a,b) = Art_F(a)(b^(1/m))/b^(1/m).
```

Here m divides w. Prove equality of the specified transported map with the scalar-symbol formula; its uniqueness follows from Matsumoto generation. Its supplied quotient factorization, power-slot relations, local-field isomorphism naturality and coefficient changes are retained. No primitive-root choice enters N. This is the coefficient power map, not the primary projection: when w=6 and m=3, a full generator ζ maps to ζ², whereas its 3-primary projection is ζ⁴. (Weibel, III.Example 6.2.3, p.233; Milne, III.4, Remark 4.5, p.114; KTheoryFiniteLocalFields §3.1.)

Complete discrete valuation and finite residue field are the local hypotheses. Mixed-characteristic coefficients may include the residue prime; in equal characteristic p they must be prime to p. The new comparisons are with β and the conic dictionary below; the underlying K₂ factorization belongs to the supplier.

The tame symbol is not the definition. When m is prime to the residue characteristic, the supplier's tame formula computes H_m from the residue of the two units and valuations. At m=2 its inversion under a change of tame convention is invisible. At odd coefficients, the inverse tame convention and the Artin order must both be retained. The dyadic example below shows why a construction that only factors through the base tame symbol is too weak.

*Needs:* KTheoryFiniteLocalFields §§3.1–3.2; K2SymbolsBrauer §§5.1–5.2, 7.1–7.3; ClassicalArithmeticCompletion §§1.14, 1.25.

**Checks.**

- For F=Q₂,m=2, N{-1,-1}=-1. This is the nonsplit Hamilton quaternion value from the dyadic Hilbert formula.
- For F=Q₃,m=2, N{3,-1}=-1. Adjoining √(-1) gives the unramified quadratic extension, whose norms have even valuation; 3 is not such a norm.
- At Q₂ the base tame symbol of {-1,-1} is 1, since both entries are valuation units, while N is -1. Thus this wild norm-residue map cannot factor through the tame symbol alone.
- For Q_p with p odd and m=2, N is the quadratic residue character of the base tame symbol. In particular N{p,u} is the Legendre value of the unit residue u. This agrees with the imported odd-prime Hilbert formula.
- At m=1, the root group is trivial and every value is 1. Both power-slot relations also have this value.

### 3.2 A section onto the full roots of unity

Suppose μ(F)=μ_m(F). Consume KTheoryFiniteLocalFields §3.3's full-root splitting, transported through the same classical/Milnor equivalence as §3.1. For a primitive ζ, its specified choice a satisfies H_m(ζ,a)=ζ and the section has the formula

```text
s : μ_m(F) → K₂ᶜˡ(F),         s(ζ^i)=i{ζ,a},
N_(F,m) ∘ s = id.
```

This supplies a cyclic summand of order m. The Moore kernel and its divisibility remain with KTheoryFiniteLocalFields §§3.3–3.4. The exact-order calculation is a Check of the supplied section, not another splitting theorem. (Weibel, III.Example 6.2.3, p.233.)

*Needs:* §3.1; KTheoryFiniteLocalFields §3.3; K2SymbolsBrauer §§7.1–7.3. No divisibility theorem about the kernel enters the section.

**Checks.**

- For Q₂ the full root group is μ₂ and H₂(-1,-1)=-1. Thus -1↦{-1,-1} gives the displayed section.
- If ζ^e=t^m, then t^(m²)=1. The full-root hypothesis forces t^m=1, hence m divides e. Thus ζ has order m modulo m-th powers; perfectness gives a character with image of order m and a choice a with H_m(ζ,a)=ζ. Also m{ζ,a}=0, so {ζ,a} has exact order m and the section is well-defined.
- If m=6, a value ζ² is nonidentity but has order 3. It cannot be used to construct the proposed section onto μ₆. The proof must select a primitive value.
- The section by itself does not imply that ker N is divisible or uniquely divisible. Any such conclusion would import the later local K-theory theorem into its own input.

### 3.3 A total conic-solvability sign

For every field F, in every characteristic, and r,s∈F, define `conicSymbol F r s`∈Zˣ to be 1 when there exist x,y∈F with rx²+sy²=1, and -1 otherwise. This is a total sign of solvability, with zero inputs permitted. The definition uses classical decidability of this proposition; it is not a decision algorithm for rational points. (Weibel, III.Example 6.2.2 and Example 6.2.5, pp.233–234, for the local conic criterion; zero inputs and the field-generic API are specified here.)

Its API includes:

- The sign is 1 exactly when the defining equation has a solution, and is -1 exactly when it has none.
- Interchanging r and s preserves the sign, by interchanging x and y.
- At (1,s) the sign is 1, with witness (1,0), for every s∈F.
- At (r,1-r) the sign is 1, with witness (1,1), including zero coefficients.
- Under (2:F)≠0 and r,s∈Fˣ, the norm criterion below identifies the value with the norm-equation sign.
- Over R, `conicSymbol_real_eq_neg_one_iff` gives the total real criterion below.

Prove the norm criterion: if (2:F)≠0 and r,s∈Fˣ, then

```text
conicSymbol F r s = 1  ↔  ∃ x,y∈F, s=x²-r y².
```

For the forward direction, a conic solution (u,v) with v≠0 gives x=1/v and y=u/v. If v=0, then ru²=1, so r is a square and the split norm form represents every s by difference of squares; 2 and a square root of r are nonzero, so all required denominators are invertible. Conversely, a norm solution (x,y) with x≠0 gives the conic solution (y/x,1/x). If x=0, then s=-ry² and y≠0; the resulting split binary form again represents 1. Stating both exceptional-coordinate cases avoids dividing by zero in either implication.

Over R prove `conicSymbol_real_eq_neg_one_iff` for all r,s∈R:

```text
conicSymbol R r s = -1  ↔  r≤0 and s≤0.
```

If both coefficients are nonpositive, every left-hand side rx²+sy² is nonpositive. If one coefficient is positive, set the other variable to zero and use its inverse square root. On nonzero real inputs this is exactly the familiar strict-negative criterion. The total definition does not inherit bilinearity over an arbitrary field. The exact rational counterexample below tests why the local bilinearity hypothesis is necessary. The acceptance headlines are the field-generic conic/Hilbert equality and the total real criterion.

*Needs:* Mathlib fields, units, classical existence and real square roots. The norm bridge uses only (2:F)≠0 and the two nonzero coefficients.

**Checks.**

- At (r,s)=(0,0) over R, the sign is -1 because 0≠1. A criterion using r<0 and s<0 on this total domain is false.
- For nonzero real r,s the sign is -1 exactly when both are negative. For example (-1,-1) has value -1 and (1,-1) has value 1, the latter witnessed by (1,0).
- Over Q₂, conicSymbol(-1,-1)=-1. This is the local Hamilton obstruction, not a vanishing conclusion from both inputs being valuation units.
- On unit inputs in a nonarchimedean local field of characteristic different from 2, the norm bridge identifies this sign with the existing QFI Hilbert symbol. Their domains still differ at zero.
- Over Q the values at (3,-1), (7,-1) and (21,-1) are all -1. Thus the value at (3·7,-1) differs from the product of the first two values. Clearing denominators and reducing modulo 3 or 7 proves the three failures of solvability, as worked out below.
- Over any field, (1,s) has value 1 with witness (1,0), and (r,1-r) has value 1 with witness (1,1). Over F₂ the pairs (0,1) and (1,0) both give 1.
- The norm bridge requires characteristic different from 2: over F₂(t), the conic at (1,t) has point (1,0), but x²−y²=(x+y)² never equals t. Thus the conic value is 1 and the unit-input norm-equation Hilbert value is −1.

### 3.4 Quadratic Hilbert homomorphisms on K₂

Let F be a nonarchimedean local field with (2:F)≠0. Use N at m=2, transported by μ₂(F)≃Zˣ, as the Hilbert homomorphism on K₂ᶜˡ(F). KTheoryFiniteLocalFields §3.1 supplies its equality with the unit-input Hilbert pairing. First prove `conicSymbol_eq_hilbertSymbol` for every field F with (2:F)≠0 and all r,s∈Fˣ, using §3.3's norm criterion and `TauCeti.hilbertSymbol_eq_one_iff`. Its local specialization gives the conic formula here. Then prove the Hilbert symbol formula:

```text
hilbertK2{r,s} = hilbertSymbol r s = conicSymbol F r s.
```

The supplied map already has the symbol property; the conic witness (1,1) verifies its Steinberg value whenever r and 1-r are units. This step does not assert bilinearity for a generic field. (Weibel, III.Examples 6.2.1–6.2.2, pp.232–233, and 6.2.5, p.234; QuadraticFormInvariants §6C.)

Use the supplied `realSignSymbol` over R, writing the real Hilbert homomorphism for that same map in this dictionary. The new comparison identifies its unit-symbol values with `conicSymbol`: the value is -1 exactly when both inputs are negative, and otherwise 1. This follows from §3.3's weak real criterion after restricting to units; it does not reconstruct the sign homomorphism of K2SymbolsBrauer §12.5. Complex symbol values are all 1. The real comparison is separate from the nonarchimedean instances. (Weibel, III.Example 6.2.1, p.232; K2SymbolsBrauer §12.5.)

The Hilbert homomorphism API includes:

- It sends sums of K₂ classes to products of signs and sends the zero class to 1.
- On every unit symbol it has the Hilbert and conic values displayed above; on real symbols it has the stated negative-quadrant values.
- In either the local or real setting, a homomorphism with these values on every symbol equals the specified map.

Prove the quadratic norm-residue equality for the nonarchimedean map at m=2 under the canonical group equivalence μ₂(F)≃Zˣ sending -1 to -1. Use the existing arithmetic norm criterion or QFI §6E's cohomological theorem, together with the symbol formula. Prove uniqueness on local and real symbols for the local and real maps from their prescribed values on symbols. Since both groups have two sign values, agreement on the solvable norm cases and their complements fixes the value; at higher m, a norm-kernel argument alone would not determine a scalar.

*Needs:* §§3.1, 3.3; native `TauCeti.hilbertSymbol_eq_one_iff`; QuadraticFormInvariants §§6C, 6E; K2SymbolsBrauer §12.5 for the real map and §§5.1–5.2 for uniqueness.

**Checks.**

- Over Q₂, hilbertK2{-1,-1}=-1, agreeing with `N_{Q₂,2}` and the total conic sign.
- Over R, two negative unit arguments give -1; a positive argument gives 1. This agrees with the base real Steinberg symbol on its nonzero domain.
- The total conic value at (0,0) is not an evaluation of a Hilbert symbol on Fˣ. There is no unit with underlying value zero to which the factorization could be applied.
- For r,1-r∈Fˣ the value on {r,1-r} is 1, as required by the K₂ relation. The same conic witness exists even for excluded zero inputs, but does not create a K₂ symbol with those inputs.

### 3.5 The arithmetic invariant formula and its cubic witness

For a nonarchimedean local field F, m≥1 invertible in F, all μ_m in F and a specified primitive ζ, prove the K₂ invariant comparison as an identity of homomorphisms on K₂ᶜˡ(F):

```text
N_(F,m)(x) = ζ^{-e_m(inv_F(β_ζ(x mod m)))}.
```

Here e_m is the existing normalized torsion coordinate. Prove also the transposed positive-invariant formula: for a,b∈Fˣ the positive exponent of inv β_ζ{a,b} gives H_m(b,a). No assumption that m is prime to the residue characteristic is made. (Milne, III.3, Proposition 3.6, p.109; III.4, Steps 2–4 and Remark 4.5, pp.112–114; ClassFieldTheory Layers 5–6; ClassicalArithmeticCompletion §1.44.)

Consume ClassicalArithmeticCompletion §1.44's scalar equality and convention comparison. Identify its concrete Kummer cup with H²(c_ζ) applied to the tensor cup by §§1.1–1.4. That supplied sign determination, using the same cubic witness, gives the negative exponent in the Artin-first order and the positive exponent in the transposed order. Equality on symbols extends to K₂ by generation. Layer 2 supplies its algebra interpretation; no second proof of the scalar Artin/cup comparison is required. (Milne, III.4, Steps 1–3, pp.111–112, and Remark 4.5, p.114.)

Compute a witness that distinguishes the two signs. Set F=Q₇, m=3 and choose ζ reducing to 2∈F₇. The cubes in F₇ˣ are 1 and 6, so T³-3 is irreducible modulo 7 and L=F(α), α³=3, is unramified cubic. Arithmetic Frobenius satisfies Frob(α)/α≡α⁶=9≡2 modulo 7; this ratio is ζ in the local field. The statement is an equality of roots after reduction and lifting, not the false equality ζ=2 in Q₇. Therefore H₃(7,3)=ζ. With Yα=ζαY and Y³=7, the algebra A_ζ(3,7) has invariant 1/3 by the normalized unramified cyclic invariant. By §2.4 this is inv β_ζ{3,7}. Consequently `H₃(3,7)=ζ^{-1}`. Both the exponent and the Artin direction are visible in one example.

Changing ζ to ζ^u changes β by `u^{-1}`; the product `u·u^{-1}` cancels in the final root value. The same applies to the negative exponent. At m=2 the sign becomes invisible and this theorem specializes to the supplied cohomological Hilbert comparison. At m=1 both expressions are the unique root 1, with zero invariant coordinate.

*Needs:* §§1.1–1.4, 3.1; ClassicalArithmeticCompletion §1.44; ClassFieldTheory Layers 5–6. Section 2.4 supplies the algebra interpretation, without entering the scalar proof.

**Checks.**

- At Q₇ with the root just fixed, inv β{3,7}=1/3, `N{3,7}=ζ^{-1}`, and N{7,3}=ζ. A positive exponent for N{3,7} fails.
- Under ζ↦ζ^u, the Brauer coordinate is multiplied by `u^{-1}`, while exponentiation uses ζ^u. The final H_m value is unchanged. At m=3, root inversion negates the invariant coordinate but preserves the scalar symbol.
- At m=1 the formula gives 1. At m=2 its positive and negative exponents coincide and it agrees with QFI §6E, including the dyadic case.
- Multiplication by m in Q/Z sends 1/m to zero, so using it as e_m would trivialize the cubic value. Similarly, multiplying an invariant coordinate by a unit can preserve norm kernels while changing nonzero cubic values; equality of kernels is not this comparison theorem.

### Examples

For the conic counterexample over Q, clear denominators in rx²-y²=1 to obtain rA²=B²+C² with primitive integers A,B,C. For r=3 or 21, reduction modulo 3 forces B and C divisible by 3 because -1 is a nonsquare modulo 3. Substitution then forces A divisible by 3, contradicting primitivity. For r=7, the same argument modulo 7 applies since -1 is a nonsquare there. Thus all three signs are -1, whereas (-1)(-1)=1. This is a failure of multiplicativity over a field, even with nonzero inputs and characteristic zero. Locality in §3.4 cannot be omitted.

For the full-root section, the equation t^m=ζ^e forces t to be a root of unity before perfectness is used. This is stronger than showing that ζ itself is not an m-th power: its class must have order m, and that exact order is what produces a primitive pairing value. At Q₂ the section is represented by {-1,-1}. The same class has tame value 1, displaying the difference between a wild local factor and a residue invariant.

The cubic example fixes two orders simultaneously: the cup has κ(3) first and κ(7) second, while arithmetic Artin at 7 acts on the root of 3. Its positive invariant is 1/3. The scalar with Artin at 3 acting on the root of 7 is the inverse. A quadratic example alone cannot distinguish them.

### Dependencies

Layers 1–2 for coefficient transport, β and its algebra representative; K2SymbolsBrauer's Matsumoto universal property and real sign symbol; KTheoryFiniteLocalFields §§3.1–3.3 for the transported local map and section; ClassicalArithmeticCompletion §§1.14, 1.25 for the scalar pairing and §1.44 for the scalar invariant comparison; QuadraticFormInvariants §§6C–6E for the quadratic Hilbert pairing and cohomological comparison; ClassFieldTheory Layers 5–6 for the normalized invariant and arithmetic Artin evaluation. The conic definition and its field-generic elementary API need only fields, units and classical existence; no local theorem is used to claim global bilinearity.

## Layer 4: all-place reciprocity on K₂

### 4.1 The local-factor homomorphisms with a common target

Let F be a number field and m≥1 with all μ_m contained in F. For every place v construct the place-factor homomorphism `λ_{v,m}:K₂ᶜˡ(F)→μ_m(F)`. At a finite place, consume KTheoryFiniteLocalFields §7.3's completion transport: the actual K₂ map for F→F_v followed by `N_{F_v,m}` and the inverse of μ_m(F)→μ_m(F_v). This last map is an isomorphism: the embedding is injective, and both groups consist of the m distinct roots already generated by a global primitive root. The family can be defined independently of choosing a coordinate root. (Milne, V.5, Proposition 5.2, p.178, and Example 5.4, p.179; ClassicalArithmeticCompletion §1.24.)

At a complex place define the factor to be 1. At a real place, root containment forces m=1 or 2. Define the m=1 factor to be 1, and the m=2 factor by the real Hilbert homomorphism of §3.4, transported from Zˣ to μ₂(F). In particular, a real quadratic sign must not be inserted for m=1. A field with a primitive root of order m>2 has no real embedding, so the nonexistent real case requires no artificial value.

The place-factor API is:

- At every finite place it is the specified completion map, local norm-residue map and inverse root transport in that order.
- At a real place it has the stated m=1 or m=2 value; at a complex place it is the constant homomorphism 1.
- On every Matsumoto symbol {a,b}, it equals ClassicalArithmeticCompletion's scalar place factor.
- The factor sends 0 to 1 and sums to products, with all values in the one global root group μ_m(F).

For β_ζ, transport ζ through the same completion embedding as in Layer 1. The comparison with the local invariant is §3.5 at finite places, the real sign/invariant 1/2 comparison at real places, and zero at complex places. This gives one compatible family of roots, not values in unrelated completion types.

*Needs:* §§1.5, 3.1, 3.4; KTheoryFiniteLocalFields §7.3; ClassicalArithmeticCompletion §1.24; ClassFieldTheory Layer 10 completion maps.

**Checks.**

- For F=Q,m=1 and x={-1,-1}, every factor, including the real one, is 1. A real value -1 would be outside the target μ₁.
- For F=Q,m=2 and the same x, the factors at 2 and ∞ are -1 and the factors at every odd prime are 1.
- If m>2 and a primitive m-th root lies in F, there is no real place. The local-factor construction never adds a real quadratic sign in that case.
- For F=Q(μ₃) and v over 7 with ζ reducing to 2, the completion root map sends ζ to the lift of 2 and its inverse sends that lift back to ζ. At the conjugate place the lift of 4 instead returns to ζ. Both transports recover the same global root; multiplying raw residue values 2 and 4 would lose the specified global target.

### 4.2 Finite support on every K₂ class

Prove finite support: for every x∈K₂ᶜˡ(F), the set of places v with `λ_{v,m}(x)≠1` is finite. For any named primitive ζ, prove also that the places with inv_v(res_v β_ζ(x mod m))≠0 are finite and that these two supports agree. The latter equality uses the injective coordinate and the local comparison, with the separate archimedean formulas. (Milne, V.5, Proposition 5.2, p.178; VII.8.1, p.221; ClassFieldTheory Layer 10.)

For a single symbol {a,b}, include all archimedean places, every finite place above m, and the finite places where a or b has nonzero valuation in a finite exceptional set. Outside it both arguments are valuation units and m is prime to the residue characteristic. The tame local norm-residue formula gives value 1. Equivalently, use the supplier's finite-support theorem for its scalar factors. Neither argument discards the places above m.

Every x has a finite presentation as a sum of Matsumoto symbols. Since λ_v is a homomorphism, the support of that sum is contained in the finite union of their supports. In particular, support(x+y)⊆support(x)∪support(y), but equality is not asserted: cancellation can remove places. Independence of the chosen presentation follows from having already defined each λ_v on K₂. The local invariant formula identifies the support of β with the same set; at m=2 a real invariant 1/2 is exactly the real factor -1, and at m=1 both supports are empty.

*Needs:* §4.1; §3.5 and the real invariant comparison for support equality; K2SymbolsBrauer symbol generation; ClassicalArithmeticCompletion §1.24 and ClassFieldTheory Layer 10 finite support.

**Checks.**

- At m=1 the multiplicative support is empty for every x, not merely finite.
- For Q,m=2 and {-1,-1}, support is exactly {2,∞}. It contains a dyadic place despite both symbol entries being units there.
- A bound on support that includes only primes dividing a or b misses that example; the exceptional set must also allow primes above m and archimedean places.
- For x+y the support is contained in the union. Taking y=-x gives an empty support even when x has a nonempty one, so the union formula cannot be an equality in general.

### 4.3 The product law and the sum of Brauer invariants

For every x∈K₂ᶜˡ(F), prove the K₂ product law and the Brauer-invariant sum:

```text
∏_v λ_(v,m)(x) = 1,
Σ_v inv_v(res_v β_ζ(x mod m)) = 0       in Q/Z.
```

The hypotheses are those of §4.1; the second expression additionally names a primitive ζ. Both operations range over all finite and archimedean places and use the finite support proved in §4.2. Prove the product/sum equivalence, identifying these assertions through the common negative invariant coordinate. (Milne, V.5, Theorem 5.3 and Example 5.4, p.179; VII.8.1(b), p.221; ClassicalArithmeticCompletion §1.52 and ClassFieldTheory Layers 10, 14.)

On {a,b}, the multiplicative law is the imported degree-m Hilbert product formula in the arithmetic Artin order. A finite sum of symbols gives a product of finitely supported families. Interchanging those finite products shows the resulting map on K₂ is 1 on every generator and hence on every x. At m=2 compare it also with ClassFieldTheory's quadratic product law through the imported Hilbert/cohomological dictionary. This is transport of the existing reciprocity theorem, not another arithmetic proof of it.

Independently apply the supplied all-place Brauer law to the particular global class β_ζ(x mod m). Every local invariant is killed by m, so e_m is defined on each term and on their sum. The product of local factors is ζ raised to the negative of the sum of their coordinates. The map k↦ζ^k from Z/m to μ_m(F) is injective, as is e_m on (Q/Z)[m]. Thus the product is 1 if and only if the Brauer-invariant sum is zero. Real invariants of 1/2 enter exactly when m=2; complex terms vanish. At m=1 the two zero groups give the same equivalence.

*Needs:* §§4.1–4.2 and 3.5; ClassicalArithmeticCompletion §1.52; ClassFieldTheory Layers 10, 14; K2SymbolsBrauer symbol generation.

**Checks.**

- For Q,m=2 and {-1,-1}, the two nontrivial local factors give `(-1) * (-1) = 1`, and every odd-prime factor is 1. The two nonzero invariants are 1/2 and 1/2, whose sum is 0 in Q/Z. Omitting either 2 or ∞ breaks the law.
- For the same class at m=1, every factor is 1 and every invariant is zero; a quadratic real factor has no role.
- If x is a sum or difference of two symbols, the statement is the product of the corresponding finitely supported families. The theorem is quantified over the entire K₂ group, not just the two-unit symbol function.
- Take F=Q(μ₃), a primitive ζ, and the place v over 7 where ζ reduces to 2. For x={3,7}, the product over the single place {v} is ζ⁻¹ and the Brauer-invariant sum over {v} is 1/3. The negative-coordinate formula gives ζ⁻¹; inverting every local factor instead gives ζ and fails. Both all-place products remain 1, so those alone cannot test map compatibility. (The cubic computation is §3.5; Milne, III.4, Remark 4.5, p.114.)

### Examples

The rational Hamilton class simultaneously tests the target transport, finite support and both versions of reciprocity. At odd primes, two valuation-unit entries give tame quadratic value 1. At Q₂, the dyadic Hilbert formula gives -1; at R, two negative entries give -1. Their product is 1, and their Brauer invariants sum to 1=0 in Q/Z. The class has empty support at m=1 and support {2,∞} at m=2. This change of coefficient tests the real definition independently of the finite-place formulas.

For x and -x, all local factors cancel. A support proof through a selected symbol presentation may produce a larger exceptional set than the actual support; that is legitimate, whereas declaring the exceptional set equal to the support is not. The finite product is independent of that choice because all additional factors equal 1.

### Dependencies

Layer 3 for N and the separate real map; Layer 1 for β and field naturality; K2SymbolsBrauer's functorial K₂ and symbol generation; ClassicalArithmeticCompletion §§1.24, 1.52 for scalar factors and their all-place law; ClassFieldTheory Layers 10, 14 for the actual number-field completion maps and Brauer/quadratic reciprocity; QuadraticFormInvariants §6E for the quadratic transport. Function-field reciprocity is not inferred in this layer.

## Layer 5: Tate and finite Chern comparisons

### 5.0a The adic Tate symbol and coefficient diagram

For every field F and prime ℓ≠char F, construct the adic Tate symbol h_F:K₂ᶜˡ(F)→H²_cont(F,Z_ℓ(2)) from the ordered cup of the adic Kummer classes. Prove the Steinberg relation in continuous cohomology, so that it descends through the supplied Matsumoto presentation. Use Tate's transfer argument: the subgroup generated by transferred Steinberg cups is ℓ-divisible, and the compact-coefficient cohomology has no nonzero ℓ-divisible subgroup. This constructs a continuous-cohomology class, not merely an element of the inverse limit of finite H². (Tate, Theorem 3.1 and proof, pp.262–263; Proposition 2.1, pp.259–260.)

Its API consists of these equalities of actual maps:

- On {a,b}, the value is the ordered adic Kummer cup.
- For every r≥1, reduction of h_F(x) is h_(F,ℓ^r)(x mod ℓ^r).
- Restriction commutes with h_F, and finite-extension transfer commutes with the supplied K₂ norm, with the inseparable degree retained.
- At every DVR where ℓ is invertible in the residue field, the residue square is the continuous version of §1.6, with its finite reductions at every r.
- Construct Tate's coefficient diagram for 0→Z_ℓ(2)→Z_ℓ(2)→μ_ℓ^⊗2→0: its top maps are multiplication by ℓ, quotient, and the root-symbol map γ. When μ_ℓ⊂F, γ(ζ⊗a)={ζ,a}; otherwise descend from F(μ_ℓ) using restriction and transfer of degree prime to ℓ. Identify H¹(F,μ_ℓ^⊗2) with the coinvariant root/unit source of γ, and prove that its coefficient connecting map equals h_Fγ. This is the left square as well as the finite-symbol square of Tate's diagram.

For all exponents the reduction square follows from the actual coefficient triangle and the ordered cup. Establish the projection formula first, as in Tate's Lemma 3.2. Purely inseparable extensions are handled by topological invariance and their degree on norms. (Tate, Lemma 3.2, Diagram 3.3 and its verification, pp.263–264.)

*Needs:* §1.1; §1.6; K2SymbolsBrauer §§5.1–5.2, 7.1–7.3 and 10.7–10.9; KTheoryFiniteLocalFields §3.0a; EtaleCohomologyFoundations §§F.4.1–F.4.2; ArithmeticGaloisDuality §§R02.1.2–R02.1.3 for continuous cups, coefficient triangles, the Milnor sequence and the no-divisibility input.

**Checks.**

- At Q₇,ℓ=3, reduction of h_F{3,7} has contracted invariant 1/3 and residue −κ₃(3). Negating h_F changes both values.
- At F=R,ℓ=2, h_F{-1,-1} generates H²(C₂,Z₂(2))=C₂, and every finite reduction is its nonzero class. The construction retains the real place.
- At F=C, continuous H² and every finite degree-two target are zero. For a symbol with a slot 1 the finite and adic cups are zero over every field.
- At F=F₂(t), ℓ=3, restriction along t=s² and transfer have composite multiplication by 2. A degree-free inseparable transfer fails this coefficient diagram.

### 5.0b Conditional torsion and maximal divisibility

For every field F and prime ℓ≠char F, assuming injectivity of h_(F,ℓ), prove that the map of §5.0a induces K₂ᶜˡ(F){ℓ}/D≃H²_cont(F,Z_ℓ(2)){ℓ}, where D is the maximal divisible subgroup of K₂ᶜˡ(F){ℓ}. Prove also Tate's kernel and cokernel statements: the kernel on integral K₂ is its maximal ℓ-divisible subgroup and the cokernel has no ℓ-torsion. Chase the coefficient diagram of §5.0a using the compact-coefficient no-divisibility theorem; split divisible abelian groups to obtain the primary-torsion quotient. The quotient is canonical through h_F, while a complementary subgroup need not be. The all-field finite theorem supplies the injectivity hypothesis when this target is applied. (Tate, Theorem 3.5(a)–(b) and corollary, p.265.)

*Needs:* §5.0a's entire coefficient diagram, including its left square; KTheoryFiniteLocalFields §3.0a for the applications; divisible abelian-group and primary-torsion theory.

**Checks.**

- At R,ℓ=2, the primary torsion maps to C₂ and its maximal divisible subgroup is zero; the quotient sends {-1,-1} to 1 in C₂.
- At a separably closed field the finite and adic H² groups are zero, so the quotient by D is zero. It does not follow that integral K₂ is zero.
- The group-theoretic model C_(ℓ^∞)⊕C_ℓ→C_ℓ has kernel D=C_(ℓ^∞) and quotient C_ℓ. Replacing the quotient by the entire source is not injective.

### 5.0c Global torsion and its adic identification

For every global field F and prime ℓ≠char F, prove that K₂ᶜˡ(F) is torsion and contains no nonzero divisible subgroup; deduce through §5.0b that h_F identifies K₂ᶜˡ(F){ℓ} with H²_cont(F,Z_ℓ(2)){ℓ}. Use the global tame localization of K2SymbolsBrauer §§11.2, 12.2–12.3. Its S-integral kernel is finite: in number fields use ArithmeticKTheory §§6.1, 6.3's degree-two finiteness; in function fields use K2SymbolsBrauer §10.32c's finite generation of the tame kernel and p-divisibility of K₂(F), where p=char F. The residue unit groups have orders prime to p, so that kernel is also p-divisible; finite generation makes it finite of order prime to p. Thus K₂(F) is an extension of a direct sum of finite residue unit groups by a finite group. It is torsion. A divisible subgroup maps to zero in the direct sum, whose individual coordinates are finite, and then to zero in the finite kernel. (Tate, Equation 5.3 and Theorem 5.4 with proof, pp.269–270; Weibel, VI.6.1–6.2, pp.502–503, for the function-field finiteness calculation.)

Prove the completion, finite-extension norm and residue compatibilities on this same h_F using §5.0a; no identification of global K₂ with a tensor-product completion is asserted. The function-field statement excludes only ℓ=char F and retains every place.

*Needs:* §§5.0a–5.0b; K2SymbolsBrauer §§10.32c, 11.2, 12.2–12.3; ArithmeticKTheory §§6.1, 6.3; KTheoryFiniteLocalFields §3.0a.

**Checks.**

- For F=F₃(t), the tame localization at F₃[t] has zero kernel and gives K₂(F)≃⊕_(P monic irreducible) F_(3^deg P)ˣ. Every summand is finite of order prime to 3 and there is no divisible subgroup; the degree-one summands already contain C₂.
- For Q, the residue summands at odd primes yield infinitely many C₂ quotients modulo 2. Torsion and absence of divisible subgroups do not imply that K₂(Q)/2 is finite.
- A Prüfer group C_(ℓ^∞) is torsion but divisible. The finite-kernel and finite-coordinate argument, rather than torsion alone, excludes this wrong model.

### 5.0d The global-field Picard sequence and its injection

Let F be any global field, ℓ≠char F a prime with μ_ℓ⊂F, and S a finite nonempty set containing the archimedean places and, in the number-field case, all places above ℓ. Put O=O_(F,S). Construct and prove exact the sequence

```text
0 → μ_ℓ ⊗_Z Pic(O) --ι_S--> K₂(O)/ℓ
  → (⊕_(v∈S, v noncomplex) μ_ℓ)_(sum=0) → 0.
```

First prove root-symbol surjectivity under these hypotheses: γ:μ_ℓ⊗_Z Fˣ→K₂ᶜˡ(F)[ℓ], γ(ζ⊗a)={ζ,a}, is onto. Through §5.0a’s identification of its source with H¹(F,μ_ℓ^⊗2), coefficient exactness gives H²_cont(F,Z_ℓ(2))[ℓ]=im δ=h_F(im γ). For x∈K₂ᶜˡ(F)[ℓ], choose y with h_F(x)=h_F(γy). Both x and γy are ℓ-torsion, so §5.0c’s injectivity on the global ℓ-primary subgroup gives x=γy. (Tate, Theorem 6.1, p.270.)

The middle group is Quillen K₂. Its v-coordinate on the right is ζ^e, where e=e_ℓ(inv_v β_ζ(loc_cl x)); this is independent of the chosen primitive ζ and equals the inverse of the Artin-first scalar N_(F_v,ℓ). Write loc_cl=(θ₂♮)⁻¹loc_Q for its map to classical field K₂. Construct ι_S by the connecting map of tame localization after reduction modulo ℓ: the snake lemma identifies the generic-restriction kernel with coker(K₂ᶜˡ(F)[ℓ]→⊕_(v∉S)k(v)ˣ[ℓ]). Root-symbol surjectivity replaces the image in this cokernel by the tame residues of γ. Reduction identifies μ_ℓ(F) with each k(v)ˣ[ℓ], since ℓ is invertible outside S. The divisor sequence Fˣ→⊕_(v∉S)Z→Pic(O)→0 identifies this cokernel with μ_ℓ⊗Pic(O). The identity ∂ᴹ{ζ,a}=ζ^v(a) proves the left square. The finite-coefficient field norm-residue comparison and Brauer invariant-sum exactness identify the right square and the sum-zero image. For function fields use K2SymbolsBrauer §10.32b's normalized degree-ℓ global comparison and ArithmeticGaloisDuality §R02.3.2's Brauer sequence; for number fields use ClassFieldTheory Layer 10. This constructs the Picard injection; it is not inferred from generic restriction being injective on integral K₂. (Tate, Theorem 6.2 and proof, pp.270–271.)

The Picard injection and sequence have the following API:

- Every element of K₂ᶜˡ(F)[ℓ] lies in the image of γ, including at ℓ=2 and for global function fields.
- The injection identifies μ_ℓ⊗Pic(O) with the kernel of generic restriction on K₂(O)/ℓ through the stated snake-lemma cokernel.
- The local-coordinate map is onto the sum-zero subgroup, with the displayed positive-cup normalization.
- S-enlargement commutes with the injection, localization and the zero-insertion map on local coordinates, with the Quillen/tame sign specified below.

Prove naturality for S⊂S′, with Picard map induced by O→O′ and target map inserting zero coordinates at the newly allowed places. Prove the localization square using the actual Quillen boundary B_Q and K2SymbolsBrauer §11.8's formula det B_Q θ₂♮=(∂ᴹ)⁻¹. Thus loc_cl and the negative of det B_Q form the tame sequence; with the same root coordinates its connecting Picard injection is the negative of the one formed directly with det B_Q. By §1.6 the supplied purity boundary of h_F equals −κ∂ᴹ=κ det B_Q θ₂♮, so the same tame-coordinate sign gives the Picard column in the cohomological diagram. Keep this sign in the coefficient, residue and S-enlargement diagrams. Real coordinates occur exactly at ℓ=2; no archimedean coordinate is inserted for a function field.

*Needs:* §§1.1, 1.6, 5.0a, 5.0c; K2SymbolsBrauer §§8.1–8.3, 10.32b, 11.2, 11.8, 12.2–12.3; KTheoryFiniteLocalFields §3.0a; ClassFieldTheory Layer 10; ArithmeticGaloisDuality §R02.3.2; SchemeAndStackFoundations §3.4's Picard/divisor dictionary.

**Checks.**

- For F=F₃(t), ℓ=2, γ((-1)⊗t)={-1,t} has tame value −1=2 at t=0. It is a nonzero element of order 2, detecting a zero root-symbol map.
- For F=Q(μ₃), ℓ=3 and ζ reducing to 2 at a place over 7, γ(ζ⊗7) has tame value 2 of order 3 and the supplied purity boundary of its cup is −κ₃(2). Thus 3γ(ζ⊗7)=0 while γ(ζ⊗7)≠0; a quadratic test alone would not detect inversion.
- For Q, S={2,∞}, ℓ=2, Pic(Z[1/2])=0 and the target is {(0,0),(1,1)}≃C₂. The class {-1,-1} maps to the nonzero pair.
- For F₃(t), S={∞}, ℓ=2, Pic(F₃[t])=0 and the single-coordinate sum-zero target is zero; the sequence is 0→0→0→0.
- For F₃(t), S={0,∞}, ℓ=2, O=F₃[t,t⁻¹] has Pic(O)=0 and K₂(O)/2=C₂, generated by {-1,t}. The two coordinates are both nonzero and sum to zero. This distinguishes a two-place sequence from the zero one-place sequence.
- If Pic(O)/ℓ=C_ℓ, then μ_ℓ⊗Pic(O)=C_ℓ and ι_S embeds this group with generic image zero. For Pic(O)=C_(ℓ²) with generator g, the class ℓg has order ℓ but ζ⊗ℓg=0; the nonzero tensor is ζ⊗g. An order-ℓ class alone need not survive the tensor product.

### 5.0e Reduction of the number-field ring comparison

For every number field F, prime ℓ and finite S containing the archimedean places and the places above ℓ, let O=O_(F,S). Prove H³_cont(O,Z_ℓ(2))=0 and, for every r≥1, the coefficient-reduction isomorphism

```text
H²_cont(O,Z_ℓ(2))/ℓ^r ≃ H²_et(O,μ_(ℓ^r)^⊗2).
```

Use SelmerIwasawaCohomology §3.15 to identify the arithmetic-site and restricted-ramification cohomology with their actual coefficient triangles. The exact segment has cokernel H³_cont(O,Z_ℓ(2))[ℓ^r]. For odd ℓ or totally imaginary F, arithmetic cohomological dimension and the finite H² towers give vanishing, including the derived-limit term. In the real dyadic case use high-degree restriction to real places and the finite-tower Milnor sequence. The real action on Z₂(2) is trivial; the C₂ resolution alternates 0 and 2, giving H³(C₂,Z₂(2))=0. At finite level H³(C₂,Z/2^r(2))=C₂, but reduction from r+1 to r sends its element 2^r to zero. The finite H² towers are Mittag–Leffler, so their lim¹ is zero. Thus the continuous H³ vanishes even though ordinary finite-coefficient H³ need not vanish. (Weibel, VI.8.2–8.3, pp.513–514; VI.9.1.3–9.2, p.518; ArithmeticGaloisDuality §R02.4.4.)

Define the finite arithmetic map as reduction of the supplied adic arithmetic comparison through this isomorphism. Finiteness of K₂(O) identifies (K₂(O)⊗Z_ℓ)/ℓ^r with K₂(O)/ℓ^r. The finite arithmetic map has the following API:

- Its reduction square with the adic comparison commutes for every r≥1.
- Generic restriction and finite-extension transfer commute with it under the actual coefficient maps.
- The S-enlargement squares compose to the square for the combined localization.

Prove that it agrees with ArithmeticKTheory §5.2's degree-two edge on integral reduction, using its coefficient-compatible descent map, rather than replacing finite spectrum coefficients by this quotient. Prove compatibility with generic restriction, finite-extension transfer, S-enlargement and the actual localization connecting maps by naturality of coefficient triangles. (ArithmeticKTheory §§5.2, 6.1, 6.3.)

*Needs:* EtaleCohomologyFoundations §§F.4.1–F.4.2; ArithmeticGaloisDuality §R02.4.4; ArithmeticKTheory §§5.2, 6.1, 6.3; SelmerIwasawaCohomology §3.15's finite and lattice arithmetic-site comparisons.

**Checks.**

- For O=Z[1/2], H²_cont(O,Z₂(2))=C₂ and its quotient by 2^r is C₂ for every r≥1. The finite map preserves {-1,-1}, including at r=2; it is not a vanishing claim for real H².
- For trivial C₂-action, H³(C₂,Z₂)=ker(2:Z₂→Z₂)=0, while H²(C₂,Z₂)=Z₂/2=C₂. At finite level the H³ generator 2^r modulo 2^(r+1) reduces to 0 modulo 2^r; the nonzero finite H³ groups therefore have zero inverse limit.
- For O=Z[1/3], ℓ=3, Pic(O)=0 and the single finite-place invariant-sum kernel is zero. Both degree-two sides are zero for every r; no real 3-primary summand appears.
- For the odd real twist Z₂(1), H³(C₂,Z₂(1))=Z₂/2=C₂. The weight-two argument cannot be reused in that twist; the Bockstein cokernel there is nonzero.

### 5.1 Local Tate maps in the concrete coefficient models

For every nondiscrete locally compact Hausdorff topological field F, prime ℓ≠char F and r≥1, identify the supplier's Tate isomorphism

```text
h_(F,ℓ^r) : K₂ᶜˡ(F)/ℓ^r ≃ H²(F,μ_(ℓ^r)^⊗2)
```

with the concrete cup map of §1.1. Denote this compatibility by the local Tate dictionary. The local scope includes R and C as separate archimedean cases. For a nonarchimedean F whose residue characteristic differs from ℓ, prove the local residue dictionary for the actual residue maps in §1.6. At mixed-characteristic residue prime ℓ, retain the isomorphism without asserting that tame residue formula. (Tate, Proposition 4.5 and its corollary, pp.267–268; Diagram 3.3, pp.263–264, and Theorem 3.5, p.265, for the coefficient-diagram argument; KTheoryFiniteLocalFields §3.0a and §5.0a’s adic Tate symbol and coefficient diagram.)

The isomorphism is the supplier's h, not a choice of an abstract equivalence between two groups. Its equality with the cup on {a,b} is §1.1 and determines it by symbol generation. If a primitive ℓ^r-th root lies in F, the Brauer realization of the same map is β_ζ from Layer 1 and its scalar local realization is the negative invariant formula of §3.5. Without that root, the target remains the tensor-twisted module; no scalar Hilbert coordinate is required for the theorem.

The prime-power passage uses the actual coefficient diagram, not an unjustified injection between successive K₂ quotients. The archimedean cases follow by applying the finite symbol isomorphism to the real decomposition and complex divisibility in K2SymbolsBrauer §§5.13–5.15. At R, the nonzero quadratic symbol remains in every even prime-power quotient in its appropriate coefficient realization; at odd ℓ the degree-two target is zero. At C all the finite degree-two targets vanish. This is compatible with treating these as local fields while keeping their topology and residue behavior distinct from a DVR.

*Needs:* §§1.1, 1.6; KTheoryFiniteLocalFields §3.0a; §5.0a’s adic Tate symbol and coefficient diagram; K2SymbolsBrauer §§5.13–5.15 for the archimedean computations. Sections 1.4 and 3.5 enter only its root-dependent realizations.

**Checks.**

- For Q₇,ℓ=3,r=1, the class {3,7} maps to the ordered cup whose contracted invariant is 1/3 in §3.5. Equality with a different scalar multiple of h fails this value.
- For Q₂,ℓ=2, the theorem still applies. Invertibility in Q₂ suffices for Kummer theory there; invertibility in the residue field is required only for the tame square and does not hold.
- At R and ℓ=2, {-1,-1} has nonzero image. At C, both the finite K₂ quotient and H² vanish. Removing archimedean fields or forcing them into a nonarchimedean residue statement loses these cases.
- In characteristic p, the assertion excludes ℓ=p. For example F₂((t)) is allowed at ℓ=3; its degree-two target is zero since there are no nontrivial cube roots in the field. It is not allowed at ℓ=2 under an étale μ₂ Kummer formulation.

### 5.2 Global Tate maps, completion and adic torsion

For every global field F, prime ℓ≠char F and r≥1, prove the global Tate dictionary: the imported isomorphism `h_{F,ℓ^r}` agrees with §1.1 and its actual field restriction maps. In particular the square with K₂(F)→K₂(F_v) above and cohomological restriction below commutes for each completion. At every DVR place where ℓ is invertible in the residue field, its residue square is §1.6. The number-field statement includes ℓ=2 and real places. The finite isomorphism is KTheoryFiniteLocalFields §3.0a's all-field theorem; its arithmetic adic extension uses the constructions and theorems of §§5.0a–5.0c. (Tate, Theorem 5.1, pp.268–269; Theorem 5.4, p.270; Diagram 3.3, pp.263–264.)

Prove the global adic dictionary for the map induced by the same adic symbol h_F:K₂ᶜˡ(F)→H²(F,Z_ℓ(2)). In the general coefficient-diagram formulation, assume the mod-ℓ map h_ℓ of §1.1 is injective; then its restriction to ℓ-primary torsion identifies the quotient by the maximal divisible subgroup with the torsion of H²(F,Z_ℓ(2)). Tate's Theorem 3.5(b) and its corollary, p.265, require that injectivity; for a global field it is Theorem 5.1, p.268 (also a consequence of the supplied all-field finite comparison). Section 5.0c proves more: K₂(F) is torsion with no nonzero divisible subgroup. Thus in this case the actual ℓ-primary part itself is identified with that cohomological torsion group. Both formulations use Tate's map and Diagram 3.3; the divisible quotient is not a new completion of K₂. (Tate, Theorem 3.5 and its corollary, p.265, and Theorem 5.4, p.270; KTheoryFiniteLocalFields §3.0a and §§5.0a–5.0c.)

Keep the coefficient triangles, restriction and finite-extension transfer maps in the transported statements. The cup dictionary and the supplier's projection formula identify them, so an arbitrary isomorphism with the same finite-coefficient source and target groups, which can be infinite for global fields, would not meet the target. The global construction has two arithmetic cases: in characteristic p only ℓ≠p occurs here, with no inference about characteristic-p differential or logarithmic symbols. Those belong to the characteristic-p symbol owners.

*Needs:* §§1.1, 1.6; KTheoryFiniteLocalFields §3.0a; §§5.0a–5.0c; field completion restriction maps.

**Checks.**

- For a number field with a real place, the ℓ=2 completion square remains part of the theorem. Adding an odd-prime or totally imaginary hypothesis would weaken the target.
- For F=F_q(t) and ℓ≠char F, retain the global comparison and its completion/residue maps. The adic arithmetic statement uses §5.0c, including the function-field tame-kernel inputs.
- The completion square sends an actual symbol {a,b} to {a_v,b_v}, and restriction sends its cup to κ(a_v)∪κ(b_v). This pins the map, whereas agreement of group orders would not.
- For Q and m=2, tame localization gives a surjection K₂(Q)/2→⊕_(p odd) F_pˣ/(F_pˣ)². Each summand has order 2, so both K₂(Q)/2 and its Galois-symbol target are infinite. Finite coefficients do not mean finite groups. (Tate, Equation 5.3, p.269.)
- At a characteristic-p global field, no μ_p étale Kummer comparison is claimed. The quotient by maximal divisibility in the general adic statement becomes a zero-kernel quotient for global K₂; it is not used to introduce a nonexistent divisible summand.

### 5.3 S-integers, localization and the Picard terms

Let F be a global field, ℓ a prime different from char F, S a finite nonempty set of places containing all archimedean places and, for a number field, all places above ℓ, `O=O_{F,S}`, and r≥1. For number fields use ArithmeticKTheory §§5.2, 6.1 and 6.3's adic comparison and §5.0e's coefficient reduction to obtain the two ring comparisons, and prove their S-integer dictionary with Tate's field maps:

```text
K₂(O) ⊗ Z_ℓ ≃ H²_cont(O,Z_ℓ(2)),
K₂(O)/ℓ^r ≃ H²_et(O,μ_(ℓ^r)^⊗2).
```

For every x∈K₂(O), prove the equalities of actual generic-restriction maps

```text
res(arith(x ⊗ 1)) = h_F((θ₂♮)⁻¹(loc_Q(x))),
res(arith_r(x mod ℓ^r)) = h_(F,ℓ^r)((θ₂♮)⁻¹(loc_Q(x)) mod ℓ^r).
```

Here loc_Q:K₂(O)→K₂(F) is Quillen localization, θ₂♮ is the specified product-normalized classical-to-Quillen comparison, and arith_r is the reduction map constructed in §5.0e. Prove the finite-reduction square for every r≥1 by the actual coefficient-triangle maps. Identify the arithmetic edge with the ordered K₁ product via KTheoryFiniteLocalFields §3.0a's motivic diagonal and K2SymbolsBrauer §8.3, hence with θ₂♮ rather than the raw θ₂. The targets use ordinary degree-two cohomology, retaining real places at ℓ=2. (Tate, Diagram 3.3, pp.263–264, and Theorems 5.4, 6.2, pp.270–271; Weibel, VI.8.2–8.3, pp.513–514; ArithmeticKTheory §§5.2, 6.1, 6.3.)

The square for O→F has the actual localization K₂ map on top, actual étale generic restriction below, and the specified symbols vertically. The remaining columns use det B_Q θ₂♮=(∂ᴹ)⁻¹, hence ∂h_F(θ₂♮)⁻¹=κ det B_Q after finite reduction. The supplied purity/localization composite P_up δ_up of §1.6 equals this same ∂, so P_up δ_up h_F(θ₂♮)⁻¹=κ det B_Q after finite reduction. Its degree-one uniformizer value is +1. For the Picard injection of §5.0d, the tame sequence uses −det B_Q, so its residue coordinates are the negatives of these cohomological coordinates and its connecting injection is the negative of the one formed directly with det B_Q. Carry this fixed sign through the S-enlargement diagrams. When S is enlarged in two steps, the squares compose to the square for the combined localization. Inverse limits and finite reduction use the supplier's continuous coefficient machinery; pointwise isomorphisms alone are insufficient to identify those maps. In particular, integral injectivity K₂(O)→K₂(F) does not imply injectivity after quotienting by ℓ^r.

Preserve the ideal-class contribution explicitly. If μ_ℓ⊂F, use §5.0d's constructed Tate exact sequence

```text
0 → μ_ℓ ⊗_Z Pic(O) → K₂(O)/ℓ
  → (⊕_(v∈S, v noncomplex) μ_ℓ)_(sum=0) → 0.
```

The last map is the field symbol followed by the normalized local maps; a uniform global sign changes all target coordinates together but not their sum-zero condition. Real summands occur only for ℓ=2. This sequence contains the kernel of generic restriction and must be transported with its actual Picard map, not reconstructed by a uniqueness claim over F. This sequence and its localization square hold for every global field (Tate, Theorem 6.2, pp.270–271); the two ring isomorphisms above keep their number-field scope (Soulé, §2.2.4.4, pp.53–55). Separately retain the weight-one Kummer sequence

```text
0 → Pic(O)/ℓ^r → H²_et(O,μ_(ℓ^r)) → Br(O)[ℓ^r] → 0.
```

This is not the weight-two ring comparison: a root-dependent contraction may relate the coefficients when available, but it does not remove Pic(O)/ℓ^r. The vanishing of Pic(Spec F) that justified the field Brauer dictionary does not hold for a general O. (Weibel, III.6.10.1, p.242, for the field contrast; Soulé, §2.2.4.4, pp.54–55, for the ring comparison and its class-group kernel under his root-containment hypothesis; SchemeAndStackFoundations §2.11 for Kummer, ArithmeticKTheory §§5.2, 6.1, 6.3 for the ring comparisons, and §5.0d for Tate's sequence over every global field.)

*Needs:* §§1.1, 1.6, 5.0d–5.0e, 5.2; K2SymbolsBrauer §§8.1–8.3, 11.8; ArithmeticKTheory §§5.2, 6.1, 6.3; SchemeAndStackFoundations §2.11; K2SymbolsBrauer localization.

**Checks.**

- For the Quillen product [3]·[7] over Q₇ at m=3, (θ₂♮)⁻¹ gives {3,7}, with invariant 1/3 and tame value 3. Raw θ₂⁻¹ gives −{3,7}, with invariant −1/3 and tame value 5 in F₇ˣ. The Quillen boundary has value 5, and κ₃(5)=−κ₃(3), as required by the displayed square.
- For Q, S={2,∞} and ℓ=2, both K₂(Z[1/2])⊗Z₂ and K₂(Z[1/2])/2^r are C₂ for every r≥1, generated by {-1,-1}. The supplied adic and finite comparisons send this generator to the nonzero class, and finite reduction preserves it. At r=1 its two local signs at 2 and ∞ are -1 and -1. Omitting the real dyadic row would lose this generator.
- For F=F₃(t), ℓ=2 and S={∞}, O=F₃[t] has Pic(O)=0; Bass–Tate and finite-field K₂ vanishing give K₂(O)=0. The sum-zero subgroup of the single μ₂ summand is zero, so the global-function-field Picard sequence reads 0→0→0→0. No archimedean place is being inserted.
- If Pic(O)/ℓ is nonzero and μ_ℓ⊂F, the Picard term survives as the generic-restriction kernel. Deleting it because the field comparison is an isomorphism gives the wrong ring statement.
- For Q and S={2,∞}⊂S′={2,3,∞}⊂S″={2,3,5,∞}, the class {-1,-1} has tame values 1 and cohomological residues 0 at both added primes, by either composite localization square. The nonzero sign control is at Q₇ with m=3: {3,7} has tame value 3 and cohomological residue -κ₃(3), distinct from +κ₃(3) because κ₃(3) has order 3.
- If a place above ℓ is left outside S, the coefficient is not invertible on O. The stated finite étale μ_(ℓ^r) comparison on that ring is then outside these hypotheses.
- No step identifies H² of an arbitrary scheme with H² of its function field. A nonzero Picard kernel is already a counterexample to such a replacement within this arithmetic setting.

### 5.4 Integral reduction and the Bockstein boundary

For a field F and every integer m≥1, use the supplied finite-coefficient spectrum K(F;Z/m)=cofib(m:K(F)→K(F)). The cofiber inclusion gives integral reduction red_m, and its connecting map gives the Bockstein. Consume KTheoryFiniteLocalFields §1.1's `coeff_exact` at n=2 with its actual `reduce` and `bockstein` maps:

```text
0 → K₂(F)/m --red_m--> K₂(F;Z/m) --∂_m--> K₁(F)[m] → 0,
im(red_m : K₂(F)→K₂(F;Z/m)) = ker ∂_m.
```

The first arrow denotes the map factored through the quotient, not a claim that red_m on integral K₂ is injective. These statements require no invertibility of m in F; the following étale comparison does. (Soulé, §2.2.3.1, pp.45–46; GeneralAlgebraicKTheory §§1.7, 7.4 and KTheoryFiniteLocalFields §§1.1, 1.8.)

The supplied cofiber exactness identifies the integral-reduction image with the Bockstein kernel. Its ring-map, coefficient and CRT diagrams, including the distinct multipliers for inclusion and reduction, are used directly. No new finite-coefficient exactness target is owned here.

For a field, K₁(F)=Fˣ and K₁(F)[m]=μ_m(F). Thus the additional quotient is often nonzero, even where the degree-two Galois symbol is an isomorphism on K₂(F)/m. There is no canonical identification of the entire finite-coefficient group with that quotient. No splitting of this extension or choice of a lift of μ_m is needed for the Chern comparison. Reduction of an integral K₁ product is defined from the K-spectrum map and is sufficient; a binary product on arbitrary finite K-classes is not an input to the result below.

*Needs:* GeneralAlgebraicKTheory §§1.7–1.8 and Layer 5; KTheoryFiniteLocalFields §1.1; the field identification K₁(F)=Fˣ from K2SymbolsBrauer §0.2.

**Checks.**

- If μ_m(F) is nontrivial, the right-hand term is nonzero. For F=R,m=2 it is μ₂, so replacing the whole finite K₂ group by K₂(F)/2 erases a nonzero quotient.
- At m=1 the cofiber of the identity is zero and all three terms of the displayed short exact sequence vanish.
- For F=F₅, integral K₂(F)=0, so the Bockstein identifies K₂(F;Z/6) with μ₆(F)=C₂. The nonzero class has boundary -1 and CRT components the nonzero mod-two class and the zero mod-three class, since μ₂(F)=C₂ and μ₃(F)=1. This tests the actual boundary with no finite-by-finite multiplication.

### 5.5 The product-normalized finite étale Chern comparison

For every field F, m≥1 invertible in F and x∈K₂ᶜˡ(F), prove the product-normalized Chern comparison:

```text
c_(2,2)(red_m(θ₂♮ x)) = -h_(F,m)(x mod m)
                            in H²_et(F,μ_m^⊗2).
```

Here θ₂♮ is the actual product-normalized map from K2SymbolsBrauer §8.3, not a newly chosen sign of an isomorphism. Prove the Chern symbol formula on {a,b} first. Prove the raw-Hurewicz Chern comparison for the raw θ₂ with scalar -ε; the supplied ε=-1 makes that scalar +1. The statement concerns precisely the image of integral reduction in §5.4. It gives no formula on an arbitrary lift of the extra K₁(F)[m] quotient. (Soulé, Proposition 2.2.2.3 and proof, pp.42–44; §2.2.3.2 and Lemma 2.2.3.2.1, pp.47–48; the explicit degree-two specialization in §2.2.4.4, p.53; KTheoryFiniteLocalFields §§1.1, 1.8.)

For prime-power coefficients, the supplier's finite Chern operation factors the integral Chern operation through red_m. On integral K₁ classes [a] and [b], the degree-one Chern classes are κ_m(a) and κ_m(b). In Soulé's product formula the degree-two component of their external product has coefficient

```text
-(i+j-1)! / ((i-1)!(j-1)!) = -1          at i=j=1.
```

On the integral-reduction image the two Bocksteins are zero, so the even-coefficient degree-two correction from KTheoryFiniteLocalFields §1.8 vanishes; in particular the finite Chern operation is additive on this image. The uniqueness condition in the integral product component holds because the only positive weights with i+j=2 are i=j=1 and the cohomological degrees are both 1. No factorial is inverted modulo the coefficient: 0!=1 and the integer coefficient is -1. Pullback along the diagonal gives -κ_m(a)∪κ_m(b) for the internal product. The product-normalized comparison sends {a,b} to exactly this ordered product. The dictionary in §1.1 identifies the resulting cup with h. Symbol generation and additivity prove the equality on every integral classical K₂ class.

For arbitrary m, compare with each prime-power factor through the supplier's coefficient and CRT maps. At m=1 both sides vanish. The deduction includes powers of 2 because it uses integral products followed by reduction. It does not assert a product formula on two arbitrary finite-coefficient classes: such a multiplication has coefficient-range restrictions and is not supplied by the integral formula. Soulé's warning after Proposition 2.2.3.3, p.49, explicitly distinguishes that question. The finite Chern map itself is used with its already specified integral-reduction normalization.

Finally θ₂♮=θ₂∘(ε·), so applying the intrinsic identity to εx gives `c_{2,2}red_m` θ₂(x)=-εh(x mod m). Replacing the raw comparison by its negative also changes ε; θ₂♮ and the intrinsic formula stay fixed. Consequently the raw-map corollary depends on the base torus computation, while the product-normalized identity has an intrinsic meaning once the unit product is fixed.

*Needs:* §§1.1, 5.4; K2SymbolsBrauer §§8.1–8.3; GeneralAlgebraicKTheory §§7.4–7.5; KTheoryFiniteLocalFields §§1.1, 1.8; §1.1’s field-cohomology bridge.

**Checks.**

- For Q₇,m=3 and {3,7}, the contracted cup has invariant 1/3. The product-normalized Chern class has contracted invariant -1/3. This detects the Chern sign independently of the Artin-order sign in §3.5.
- In a Z/6 coordinate a cup value 1 gives Chern value -1=5. Its reductions are 1 modulo 2 and 2 modulo 3; CRT recovers 5. A quadratic check alone cannot select the sign.
- The external product and its pullback to the internal field product both have coefficient -1. Changing the diagonal pullback cannot remove the integer coefficient.
- Changing θ₂ to -θ₂ changes ε to -ε and leaves θ₂♮ unchanged. The intrinsic equality remains -h, while the raw-map coefficient changes accordingly.
- If μ_m(F) is nonzero, §5.4 has a nonzero Bockstein quotient. No equality on all finite-coefficient K₂ follows from equality on its integral-reduction image.
- At m=1 the finite K-group and finite cohomology target vanish. Neither formula requires a primitive root in F; the root is used only to compute the contracted cubic invariant as a check.

### Examples

For the arithmetic ring Z[1/2], the class {-1,-1} has the two local obstructions at 2 and ∞ and gives the nonzero element of K₂(Z[1/2])/2. This example detects real and dyadic contributions in the ring comparison. For a ring with nonzero Pic(O)/ℓ, the generic-restriction kernel instead tests the necessity of the Picard column, which the field theorem alone cannot see.

For finite coefficients, the two boundaries have different purposes. The residue map lowers the twist and records ramification; the K-theory Bockstein maps K₂(F;Z/m) to K₁(F)[m]. The Chern formula is proved on the kernel of the latter, using integral reduction. Confusing these maps would erase the additional root-of-unity quotient. At composite coefficients, the Z/6 calculation tests that the same minus sign is used in all prime-primary components.

The Q₇ example gives a further independent consistency check. The ordered cup and algebra class have invariant 1/3, the arithmetic scalar in the original order is `ζ^{-1}`, and the product-normalized Chern class has invariant -1/3. The two minus signs belong to distinct maps: one exchanges Artin variables, the other comes from the Chern product coefficient. Neither is chosen to make the other comparison hold.

### Dependencies

Layer 1 for the cup and residue dictionaries; Layers 2–3 for the Brauer and local scalar interpretations; ArithmeticGaloisDuality §§R02.1.2–R02.1.3, R02.3.2, R02.4.4 and SelmerIwasawaCohomology §3.15 for compact coefficients, global Brauer exactness and arithmetic-site comparison; EtaleCohomologyFoundations §§F.0.3, F.4.1–F.4.2 and SchemeAndStackFoundations §§2.11, 2.15; §1.1’s field-cohomology bridge and §1.6’s purity/residue comparison; §§5.0a–5.0c for §5.2; ArithmeticKTheory §§5.2, 6.1, 6.3 and §5.0d for §5.3; KTheoryFiniteLocalFields §§1.1, 1.8, 3.0a for finite coefficients, early Chern operations and the finite field symbol. GeneralAlgebraicKTheory supplies spectrum exactness and integral external/internal products. K2SymbolsBrauer §§8.1–8.3 supplies θ₂, ε and θ₂♮. Sections 5.0a–5.0e supply the constructions and reduction lemmas before their dictionaries; Layer 4 is a compatibility check for number-field local factors and is not needed for the torsion proof.

## Downstream consumers

The global and S-integer squares, including the Picard and real-place terms and the distinction between finite coefficient groups and quotients, are stated for arithmetic roadmaps later in the merge order. RefinedTraceMethods can use the actual Brauer symbol and its symbol-algebra representative. EllipticKTheory can use the finite Chern and local/global dictionaries with their specified twists and products. These consumers can cite the appropriate layer without reconstructing a coefficient convention.

K2SymbolsBrauer, KTheoryFiniteLocalFields and ArithmeticKTheory are suppliers. The classical symbol, local norm-residue map and section, field norm-residue comparison, finite-coefficient exactness and early Chern operations are supplied before their comparisons here. The field-cohomology and arbitrary-DVR bridges are constructed in §§1.1, 1.6; the adic and global Tate inputs are constructed in §§5.0a–5.0d; coefficient reduction is §5.0e. These constructions use the stated suppliers and do not require the downstream dictionaries.

## References

- Charles A. Weibel, [*The K-book: An Introduction to Algebraic K-theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), author's text dated 29 August 2013. III.6.2, pp.232–234, supplies real, local and norm-residue examples; III.6.9–6.10, pp.240–243, supplies symbol algebras and the Galois-symbol dictionary. VI.6.1–6.2, pp.502–503, gives function-field finiteness; VI.8.2–8.3, pp.513–514, and VI.9.1.3–9.2, p.518, give the arithmetic and real coefficient inputs. VI.8.6, p.515, records the finite S-integer comparison in its discussion of Birch–Tate; that discussion is not used for a special-value target. In the split-algebra argument around III.Lemma 6.9.1, use the full eigenvalue/minimal-polynomial hypothesis proved in §2.2. In III.Example 6.2.3, the section requires a primitive pairing value, justified in §3.2.
- John Tate, [*Relations between K₂ and Galois cohomology*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), Inventiones mathematicae **36** (1976), 257–274. Theorem 3.1 and Lemma 3.2, pp.262–263; Diagram 3.3 and Theorem 3.5, pp.263–265; Proposition 4.5 and its corollary, pp.267–268; Theorems 5.1, 5.4, 6.1 and 6.2, pp.268–271. These locate the adic symbol, coefficient diagram, torsion and Picard targets constructed in §§5.0a–5.0d.
- J. S. Milne, [*Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), version 4.03, 6 August 2020. III.3, Proposition 3.6, p.109, and III.4, pp.111–114, fix the character/cup/invariant comparison and the transpose between Milne's Hilbert order and H_m here. V.5, pp.178–179, and VII.8.1, p.221, supply the all-place reciprocity laws. The generator relation here is YX=ζXY; an algebra presentation with XY=ζYX must be converted before comparison.
- Christophe Soulé, [*Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres*](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), 1978 thesis, author's transcription. Proposition 2.2.2.3, pp.42–44, and §2.2.4.4, p.53, give the integral degree-two Chern sign. §§2.2.3.1–2.2.3.2, pp.45–48, give finite coefficients and factorization through reduction; the remark after Proposition 2.2.3.3, p.49, limits the finite-product inference. The S-integer argument in §2.2.4.4, pp.54–55, retains the class-group kernel under its root-containment assumptions. In the general product coefficient read the factorial as (i-1)!, as in Proposition 2.2.2.3; the transcription's (1-i)! in Proposition 2.2.3.3 does not define a general coefficient. At i=1 both readings give 0!=1, so the degree-two calculation is unaffected.
