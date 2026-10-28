# Roadmap: algebraic modular forms and Serre weights

**Summary.** This roadmap builds geometric modular forms in every integer weight, integral q-expansion and coherent Hecke comparisons, characteristic-`p` Hasse and theta operations, the extension-sensitive local Serre weight, Deligne–Serre eigenvalue lifting over arbitrary discrete valuation rings, classical Galois attachments in weights at least one, and place-sensitive residual modularity witnesses. It connects the analytic modular-form theory to sections on compactified modular stacks, preserving the weight-one, torsion and small-prime distinctions needed to state the classical weight, conductor and character target. Representative statements appear in `Suggested.lean`.

A complex eigenform has an integral system of Hecke eigenvalues, and reducing those eigenvalues at a coefficient prime gives a residual Galois representation. Over a field of positive characteristic there is another source of forms: sections of powers of the Hodge line on a compactified modular curve. These two constructions meet through integral section spaces and their q-expansions. Their meeting is delicate in weight one, at small levels, with torsion coefficients and at the small residual primes. This roadmap develops the geometric comparison, the characteristic-`p` weight operations, the local weight recipe and the algebraic lifting argument needed to pass between them.

The resulting interfaces serve three purposes. They let a geometric eigenform carry a precisely specified integral reduction witness. They compute the classical Serre weight of a residual representation from its local representation, including the extension class in the wild case. They express residual modularity by a coefficient reduction and good-prime trace and determinant identities, with integral-model witnesses supplied by a comparison theorem. In particular, the final target asks for weight `k(ρ̄)`, conductor level `N(ρ̄)` and determinant character `ε(ρ̄)`; this roadmap defines that classical target and proves the stated conditional comparisons. Universal residual modularity and weight/level minimality are outside its scope.

## Scope and ownership

The [ModularForms roadmap](../ModularForms/README.md) supplies the analytic theory. Its Layer 0 supplies all integer weights, diamonds, character spaces and Eisenstein series; Layer 4 supplies full eigenforms, oldforms, newforms and primitive associates; Layer 8 supplies the integral Hecke algebra and coefficient fields through its modular-symbol lattice; Layer 8W supplies the separately justified weight-one integral all-cusp lattice. This roadmap constructs the higher-weight geometric all-cusp lattice and its comparison with that rational structure. Layer 10C supplies the analytic automorphy line and the stabilizer and cusp conventions. Those constructions are used here through their specified interfaces. The addition is the comparison with geometric sections and the positive-characteristic and local arithmetic operations.

ModularCurvesPartII §§3.1–3.2, 4.1–4.4, 7.1, 9.1–9.3 and 11.1 supply the moduli stack, Hodge line, compactifications, Tate charts, correspondences and Igusa geometry. ModularCurvesPartII §§14.1–14.4a supply the geometric symmetric-power coefficient systems, parabolic images, finite/adic and characteristic-zero comparisons, and level/isogeny/Hecke maps; §14.11 supplies their pairing on its stated coefficient domain. This roadmap defines forms from those objects, proves the elliptic logarithmic Kodaira–Spencer comparison, constructs the auxiliary curve Fricke map and computes its action on Hodge powers. R15.5A.1 constructs the logarithmic de Rham/parabolic filtered comparison, higher-weight Eichler–Shimura decomposition and primitive newspace projector with rank-two multiplicity. FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies the general `BT₁` Hasse determinant, Raynaud theory, Fontaine–Laffaille functor and extension-sensitive local classification. Here those results specialize to the elliptic Hasse section and to the arithmetic Serre recipe. [R15.5A.2](#target-classical-higher-weight-attachment) and [R15.5A.3](#target-classical-weight-one-attachment) construct the classical `λ`-adic and weight-one Artin attachments; R15.6 constructs the residual attachment for the reduction eigensystems used here; ArithmeticGaloisRepresentations supplies conductor, tame characters, finite-field descent and recognition of semisimple representations.

## Conventions

Write `X` for the actual compactified moduli stack or a specified fine modular curve, `ω` for its Hodge line and `C` for the full reduced cusp divisor. An integer power `ω^k` uses the dual line when `k<0`. Set `M_k(K)=H⁰(X,ω^k⊗K)` and `S_k(K)=H⁰(X,ω^k(−C)⊗K)`. When `K` is a base algebra `A`, this agrees with `H⁰(X_A,ω_A^k)` by pullback and the affine projection formula. Coefficient modules need not be flat. A coefficient map is always defined; its being an isomorphism after base change is a separate theorem. Katz sometimes denotes the holomorphic space by `S(K,n,k)`; here `S_k` always means the cusp space, so that those source notations cannot be confused.

The level is invertible on the smooth integral models. Full level `n≥3` gives a fine scheme. Levels one and two use a stack or rigidifying descent, with stabilizers retained. The Hodge line need not descend to the coarse `j`-line. A cusp condition is restriction to every component of `C`; a single chosen orbit does not describe the entire boundary.

At a full-level Tate chart write `E=Tate(t^n)` and `q=t^n`, with `ω_can` the canonical invariant differential. Expansion in `t` and expansion in `q` have different exponents. In these conventions `KS(ω_can²)=n dt/t`, and the operator normalized by `q d/dq` sends `t^i` to `(i/n)t^i`. A formula `Σm a_m q^m` uses the usual integral-exponent parameter. The bounded-denominator application of Calegari–Dimitrov–Tang uses `q=e^{πiτ}`, so `Δ` starts at `q²` there.

Use `p` for the residual prime, `κ` for a residue field, `O` for a DVR, `ϖ` for a uniformizer and `K` for its fraction field. In the eigenvalue-lifting layer `O` is an arbitrary DVR, and `K` may have positive characteristic. A finite extension `L/K` may be inseparable; a dominating DVR `V` in `L` is required, but finiteness of `V` as an `O`-module is not. In the modularity layer `O` comes from a number-field place over `p` and the characteristic-zero representation is attached to the selected form at that place.

Let `χ̄_p` be the residual cyclotomic character, `I_p` inertia and `P_p` wild inertia. A local residual representation has finite image in `GL₂(𝔽̄_p)`; its semisimplification can describe tame data, but the full extension is retained for the wild weight recipe. Fundamental characters of niveau two occur as `ψ` and `ψ′=ψ^p`. In the reducible wild case `α` is the exponent on the quotient and `β` the exponent on the stable line. The Fontaine–Laffaille convention is the contravariant `U_S` functor, `HT(χ_cyc)=+1` and positive filtration degree `r` contributing `χ̄_p^r`.

For a homogeneous nonzero mod-`p` form, `w(f)` is its least possible weight after removing Hasse factors, equivalently its least weight among equal q-expansions in the appropriate component. Use `w(0)=0` only as an explicit total-function convention. Write `SS_k` for forms on the finite supersingular locus. These sections can be nonzero in negative weight even when global `M_k` vanishes, and `SS_k` is distinct from the cusp space `S_k`.

The star on `T_ℓ^*` follows Edixhoven's normalization. The integral geometric `T_ℓ` follows Katz's quotient-level convention. Hecke comparisons specify both the normalization and the level structure. At `p`, `U` selects coefficients and `V` multiplies their indices; `V` is coefficient-linear and differs from the absolute pth-power map over a field larger than `𝔽_p`. Claims about a theta eigenform require `θf≠0`.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The library inputs are Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. Schemes, module presheaves, linear maps, power series, tensor products and matrix representations provide carrier types. The modular stack, its Hodge line and logarithmic connection, GAGA and the residual witness comparisons require the geometric and Galois interfaces named in the layers.

The following declarations are inputs, with their existing hypotheses retained:

| Declaration | Use and hypothesis |
| --- | --- |
| `Algebra.adjoin_le` | A set contained in a subalgebra generates a subalgebra contained in it; applied to the stabilizer of a line. |
| `Algebra.HasGoingDown.of_flat` | Flat commutative algebras have going down. The finite free operator algebra supplies flatness. |
| `Ideal.exists_ideal_le_liesOver_of_le` | For primes `p≤q` and `Q` over `q`, going down supplies `P≤Q` over `p`; use the zero prime and the DVR maximal ideal. |
| `TauCeti.integralClosure.isDedekindDomain` | Integral closure of a Dedekind domain in a finite extension of its fraction field is Dedekind, without separability. It does not assert module finiteness of the closure. |
| `IsArtinianRing.isNilpotent_jacobson_bot` | The Jacobson radical of an Artinian ring is nilpotent; in the commutative local case it is the maximal ideal. |
| `IsArtinianRing.localization_artinian` | A localization of a commutative Artinian ring is Artinian. |
| `Module.mem_support_iff_of_finite` | For a finite module, a prime is in its support exactly when it contains its annihilator. Faithfulness therefore gives full support. |
| `TensorProduct.AlgebraTensorModule.map_tmul` | The heterobasic tensor map acts on pure tensors by applying the two maps. Use it to compare actions after scalar extension. |

Finiteness of an operator subalgebra, fraction fields of finite domain algebras, lying over, localization of Dedekind domains, flat tensor inclusions, finite free endomorphism base change and coordinate denominator clearing must connect to their existing library statements. The lifting proof below identifies their mathematical roles rather than introducing competing versions of those foundations.

The section and coefficient calculations use Mathlib's existing `PresheafOfModules.obj`, morphism components, `LinearMap.ker`, `LinearMap.range`, `LinearMap.proj`, `LinearMap.pi`, `LinearMap.comp` and `LinearMap.dualMap`. These generic constructions and their extensionality or functoriality laws are consumed directly; the geometric targets identify the actual Hodge sections, boundary restriction, lattice reduction and fibrewise multiplication with them. They do not ask for separate generic kernels, images, products or composition operations.

For `p>0`, coefficient-linear `V` on `PowerSeries A` is Mathlib `PowerSeries.expand p hp`, with `hp : p ≠ 0`. Use `PowerSeries.coeff_expand`, `PowerSeries.coeff_expand_mul`, `PowerSeries.expand_C` and its `AlgHom` linearity. There is no separate `qV` definition or coefficient API. Mathlib `PowerSeries.derivative` supplies the formal derivation used to compare the series operation `q d/dq` with the geometric theta operator.

The generic coefficient-selection API [TauCeti/RingTheory/PowerSeries/Cartier.lean](https://github.com/TauCetiProject/TauCeti/blob/a3a2f35c018d741d724b689c2a90aab4d6eecf68/TauCeti/RingTheory/PowerSeries/Cartier.lean#L32-L47), at `a3a2f35`, is later than the declared pin `a91d3aa`. Its semiring-linear `PowerSeries.cartier A q r` selects coefficient `qn+r`. The coefficient-selection construction must follow the residue-zero specialization `PowerSeries.cartier A p 0` and its coefficient equation `PowerSeries.coeff_cartier`. Geometric preservation and Hecke comparison belong to R15.3.

Tau Ceti `TauCeti.integralClosure.isDedekindDomain` is supplied by `TauCeti.RingTheory.DedekindDomain.IntegralClosure`. It takes a Dedekind domain `O`, a chosen fraction field `K`, a field extension `L` with compatible `O/K` algebra structures and `Module.Finite K L`; no separability or `O`-module finiteness of the normalization is assumed.

### From neighbouring roadmaps

The targets below have concrete mathematical prerequisites. A complete implementation must receive the following interfaces with their hypotheses. Naming a carrier or calculating on a formal series is insufficient to replace them.

| Supplier | Required interface and consuming layers |
| --- | --- |
| ModularCurvesPartII §§4.1–4.4, 7.1 | Hodge line on the compactified stack; full reduced Cartier cusp divisor; `Tate(t^n)` charts, level structures and vanishing-order comparison; finite cusp types and compatibility with diamonds. Used by R15.1–R15.3. |
| ModularCurvesPartII §§2.6–2.7, 3.7, 5.21 | Proper rigidifying covers, effective section descent and coherent finiteness/base change; auxiliary quotient/contraction and differential extension across cusps, compatible with `Δ`. Used for small levels, lattices and `w_x`. |
| ModularCurvesPartII §11.1 | Ordinary Verschiebung-generator cover, its degree, compactification and effective level action. R15.3 builds the tautological Hodge differential, the full unit monodromy modulo `p^m` and the simple-zero elliptic Hasse comparison on this cover, including `p=2,3`. These supply theta, ordinary congruences and supersingular weight reduction. |
| ModularCurvesPartII §§9.1–9.3, 9.9–9.11 | Compactified degeneracy and Hecke correspondences, quotient level structures, universal isogeny Hodge maps, `U_y` and the root-dependent curve map. The auxiliary `w_x` and its square are constructed here. |
| AbelianSchemesAndArithmeticModuli §A4.3; ModularCurvesPartII §§7.1–7.1a; ComplexComparisonPartII C5.6 | Open elliptic de Rham bundle and Hodge line; characteristic-zero normalized KS and canonical logarithmic extension. R15.1 constructs the integral logarithmic de Rham bundle, filtration, connection and cup-product extension, with coefficient base change and Tate formulas, before integral KS. |
| ComplexComparisonPartII §§C−1.2, C1.9, C0.4, C1.7–C1.8, C2.1–C2.2 | Proper coherent GAGA and its projective analytic inputs, for integer Hodge powers and cusp twists, compatible with the finite action and descent. Used by analytic comparison. |
| SchemeAndStackFoundations §§2.19–2.21, 3.3 | Proper adjunction, trace, relative dualising complexes and coherent Serre duality. R15.2 builds the all-prime field correspondence/trace comparison; R15.3 builds its Fricke-twisted field comparison and the separate odd-`p K/O` specialization under finite-free/base-change hypotheses. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2 | Raynaud uniqueness, its boundary case and tame inertia; the general `BT₁ determinant(V*)` and dual-Frobenius compatibility. Used by the local criterion and elliptic Hasse specialization. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3, R07.5, §R07.5.6a | Contravariant residual Fontaine–Laffaille functor and positive-weight inertia dictionary; rank-two extension classification, ordered wild line and scalar Kummer peu/très calculation; odd-prime `IsFiniteFlatResidual` and `finiteFlatKummerCoefficients`, with coefficient extension and unramified descent. This roadmap supplies the all-prime shape-specific peu-ramifiée equivalence, its dyadic coefficient-torsor and maximal-model argument, agreement with the imported API at odd primes, and dyadic tame descent used by R15.4. |
| ArithmeticGaloisRepresentations Layers 1–5 | Fundamental tame characters and Frobenius action; genuine prime-to-`p` Artin conductor; S-type induced-dihedral image identification; finite-field semisimplification, coefficient descent, lattice independence and recognition by characteristic polynomials. Used by R15.4 and R15.6 and boundary localization. |
| ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7 | Coefficient embeddings, stable lattices and semisimple reduction/recognition for the classical attachments constructed in [R15.5A.2](#target-classical-higher-weight-attachment) and [R15.5A.3](#target-classical-weight-one-attachment). R15.6 constructs residual attachment for reduction eigensystems and proves its agreement with these lifts before the witness predicates. |
| ModularCurvesPartII §§14.1–14.4a, 14.11 | Geometric `Sym^(k−2)R¹h_*` systems, support maps and parabolic images, finite/adic comparisons and characteristic-zero scalar extension, with level/isogeny/Hecke transport; coefficient-domain pairing with its dual lattice, adjoint Hecke action and Tate twist. R15.5A.1 constructs the logarithmic de Rham/parabolic filtered comparison, higher-weight Eichler–Shimura decomposition and primitive rank-two newspace summand. |
| EtaleCohomologyFoundations §§0.6, 0.8, 0.11, F.0–F.6; ComplexComparisonPartII §§C6.3–C6.6 | Scheme cohomology, compact support, duality and equivariant Betti–étale comparison used in the classical attachments of R15.5A. |
| [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) Layers 3, 7–8; Chebotarev Layer 10 | Euler-product logarithms, Landau positivity, all-prime normalization and upper Dirichlet-density bounds; Frobenius-class density for finite Galois extensions. R15.5A.2a constructs the classical weight-one Rankin–Selberg specialization used by R15.5A.3. |
| AutomorphicFormsOnReductiveGroups [§5.8](../AutomorphicFormsOnReductiveGroups/README.md#58-residual-and-torsion-hecke-eigenclasses) and [§7.3](../AutomorphicFormsOnReductiveGroups/README.md#73-hecke-and-diamond-normalization-for-gl₂) | Hecke characters, their kernels and arithmetic normalization. R15.6 compares its trace/determinant predicate with agreement of the reduced form system and `galoisAnemicEigenSystem ρ̄`, with `T_ℓ ↦ tr` and `S_ℓ ↦ ℓ⁻¹ det`, away from `Np`. |
| ModularForms Layers 0, 4–5, 8, 8G, 8W, 10C | Existing analytic carriers, character and Eisenstein normalization, full Hecke eigenform normalization, classical multiplicity one and old/new decomposition, coefficient rationality, integral algebra via modular symbols, the weight-one all-cusp lattice, and analytic automorphy and cusp conventions. R15.2 constructs the higher-weight geometric all-cusp lattice and denominator comparison; R15.5A constructs the primitive classical cohomological summand and its Galois attachments. |
| ModularCurves Layers 5, 10; JacobianChallenge Layers A–B | Universal elliptic curves and compactification; coherent cohomology and Serre duality on smooth proper geometrically connected curves over a field, used by R15.5A.1. |
| ArithmeticGaloisRepresentations §2.3 | Two separate statements on characters of `G_ℚ`. The direct construction composes a Dirichlet character `ε` mod `N` with the cyclotomic isomorphism `Gal(ℚ(ζ_N)/ℚ) ≅ (ℤ/N)ˣ`, so arithmetic Frobenius at `q∤N` maps to `ε(q)`; R15.5A.2–R15.5A.3 use it for the Eisenstein branches and the determinant. The converse classification (Kronecker–Weber, owned there) identifies every finite-order continuous character of `G_ℚ` with a Dirichlet character; only the reducible case of R15.5A.3 uses it. |
| EllipticCurves Layers 1, 3–5 | Relative Frobenius, Verschiebung and their differential actions (Layer 1), supersingularity (Layer 3), Galois-equivariant Tate uniformisation `L^×/q^ℤ ≅ E_q(L)` (Layer 4), semistability (Layer 4.5a) and quadratic/unramified twists (Layer 5). R15.4 derives the torsion extension, Kummer parameter and peu/très criterion from this uniformisation. |

Several proof obligations need more than the named geometric carrier. Q-expansion vanishing uses filtered-colimit cohomology, faithfully flat noetherian completion, formal functions, Krull intersection and the Artin-base depth argument. Fine-level base change uses proper coherent finiteness, curve degree and duality vanishing, with the `n≤11` weight-one cusp calculation. The strong principle also uses a reduction from coefficient modules to the Artin-local argument and positive-weight constant-expansion vanishing in characteristic zero. These are foundational proof inputs for the stated q-expansion results.

Integral cusp comparison needs the exact `H¹`-torsion and integral character-projector criterion. Its Hasse shift must land in that specific image, with character and level retained. The all-prime denominator target builds the integral form lattice at primes dividing the level and its geometric model comparison. Eisenstein congruences and Deligne–Serre shifts need the Bernoulli valuation and coefficient-integrality input, including the even shifts at `p=2,3`. None of these follows from holomorphic fine-level base change alone.

Weight-one `T_p` over `O/ϖ^m` uses ModularCurvesPartII §9.11 `coherentHecke` and `coherentHecke_baseChange` on the actual section space; R15.3 compares its normalization with Gross's operator and constructs the high-weight shift, socle identification and injective doubling map. Theta cycles need their filtration drop and cycle proof input, and the exceptional level-one `p=2,3` reduction needs Serre's Astérisque theorem. Supersingular weight reduction needs simple Hasse zeros and support preservation under field duality over the finite operator-image algebra. The local comparisons need the extension-sensitive Fontaine–Laffaille classification, dyadic tame descent and the induced-dihedral image input cited to Ribet. These obligations retain the precise supplier boundaries of their targets.

### Local finite-flat and coefficient-descent contracts

<a id="target-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction"></a>

#### The Raynaud input and its boundary

Use the Raynaud statements supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1 for a mixed-characteristic DVR `R`, residue characteristic `p` and absolute ramification `e`. For a finite extension `F/𝔽_p` of order `q=p^r`, put `K=Frac R`. For a `K`-scheme in `F`-vector spaces of rank `q` admitting a finite flat model, prove here that the maximal model is characterized by `v(δ_i)≤p−1` for all `i` and strict inequality for at least one `i`, in Raynaud coordinates `X_i^p=δ_i X_(i+1)`, taken étale locally to split the `F×` characters, with normalized valuation `v(ϖ)=1` and `0≤v(δ_i)≤e`. Extend the generic `F`-action functorially to the maximal model. This maximal-model criterion is constructed here from Raynaud Propositions 3.3.1–3.3.2; it is separate from the supplied uniqueness, boundary and tame-inertia statements. If `e<p−1` the model is unique and retains the `F`-action. At `e=p−1`, with simple generic fibre and henselian `R`, either the model is unique or there are exactly two, one étale and one multiplicative; the `F`-action remains in either case.

Under `e<p−1` every commutative `p`-power-torsion finite generic-fibre group scheme has at most one finite flat model. For commutative finite flat group schemes killed by a power of `p`, generic-fibre morphisms extend uniquely; their kernels and cokernels are flat and the corresponding Ext map is injective. Over a strictly henselian mixed-characteristic DVR, the tame-character classification expresses a prolongable character as a product of fundamental characters with exponents `0≤n_j≤e`; the Jordan–Hölder factors of a prolongable `p`-power group have this form. At `e≥p−1` that numerical bound supplies no restrictive classification.

For the maximal unramified base at `p`, `e=1`. Thus odd `p` lies in the uniqueness range, but `p=2` lies exactly on the boundary `e=p−1`. Tame prolongation over the strict henselian base does not by uniqueness alone descend to `ℤ₂`. Raynaud's relevant tame prolongation theorem is 3.4.3; the reference to 2.4.3 in Serre's proof has the wrong number. The uniqueness, boundary and tame-inertia statements remain owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1. The maximal-model target above supplies the additional criterion used in the weight comparison.

**Checks.**

- For `R=ℤ₃`, a rank-three model has `v(δ)∈{0,1}`; both values satisfy the maximal-model criterion, consistently with uniqueness for each generic fibre.
- Over `ℤ₂`, the constant model has `v(δ)=0` and is maximal. The multiplicative model has `v(δ)=1=p−1` and fails the strict inequality, although its generic fibre is isomorphic to the constant one.
- For `p>2` and `e≥p`, the rank-`p` equation with `v(δ)=p` fails the bound. Rescaling its generic coordinate by the inverse uniformizer gives a larger model with parameter valuation `p−(p−1)=1`, which satisfies it.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.24 for maximal prolongation; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.28 for Raynaud coordinates; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.30; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.31; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.32.

([Raynaud](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Propositions 3.3.1–3.3.2, parts 1–3 of the latter, printed pp.265–267; [Raynaud](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Corollary 3.4.4, printed p. 270; [Raynaud](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Corollary 3.3.6, printed p. 268; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proof of Proposition 4, printed p. 190; [Raynaud](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Theorem 3.3.3 and Remarks 3.3.4-3.3.5, printed p. 268; [Raynaud](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Remark 3.4.6, printed p. 271.)

<a id="target-finite-at-p-equals-peu-ramifie"></a>

#### Finite flatness and peu ramifiée extensions

Let `F/𝔽_p` be finite and consider the actual upper-triangular representation with diagonal `(χ̄_pε₂,ε₁)`, where `ε₁` and `ε₂` are unramified. Let `D` be the integral closure of `ℤ_p` in the maximal unramified extension. For every `p`, including 2, the following conditions are equivalent: the extension is peu ramifiée; its generic-fibre `F`-vector-space scheme has a finite flat `F`-vector-space model over `D`; it has one over `ℤ_p`; its underlying group scheme has a finite flat model over `D`; it has one over `ℤ_p`. For odd `p`, import `IsFiniteFlatResidual` and `finiteFlatKummerCoefficients` from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.6a, including coefficient extension, the coefficientwise unit-Kummer comparison and unramified descent. The coefficient-torsor construction here supplies the dyadic case of this equivalence and agrees with the imported API at odd primes. Over `D` choose an `𝔽_p`-basis of `F` to identify extensions of the constant `F` by its Cartier dual with a product of unit Kummer torsors; the `F`-action is reconstructed by the torsor equivalence of Edixhoven Lemma 8.3. Compare an arbitrary underlying finite flat model with its maximal prolongation: the coefficient action and unramified Galois descent data extend functorially to that model, and effective descent gives a model over `ℤ_p`. This uses maximality, not uniqueness at `e=p−1`. At `p=2` the comparison with the prescribed extension shape also uses functoriality of Ext and the nonzero map from the constant `F`-scheme to its Cartier dual, as in the end of Edixhoven §8.3. Prove compatibility with coefficient extension, the unramified diagonal twists and Frobenius on the Kummer parameters.

The Frobenius compatibility of the Kummer classes forces either all valuation parameters `α_(i,j)` to vanish, giving the peu case, or the quotient character `ε₁ε₂⁻¹` to be trivial. In particular très ramifiée forces `ε₁=ε₂`. For `p>2` the explicit peu classification sets `λ=(ε₁ε₂⁻¹)(Frob_p)`, `s=[𝔽_p(λ):𝔽_p]`, `n=ord(λ)`, and `f` the minimal polynomial of `λ`. Its unit-class parameter `y` satisfies `f(Frob_p)y=0`; the `p^s` solutions lie in `𝔽_(p^n)`, and their conjugate Kummer classes recover precisely the peu representations. The explicit unit calculation has `p>2` as a hypothesis even though the finite-flat equivalence itself is valid at `p=2`.

**Checks.**

- For `F=𝔽_p` and trivial unramified twists the bridge recovers the scalar unit-class criterion: the class of `1+p` has a finite flat model, while the class of `p` does not. At odd primes this comparison and its finite coefficient extensions agree with `finiteFlatKummerCoefficients` and `IsFiniteFlatResidual`.
- For `p=2` and `F=𝔽₄`, scalar extension of the unit class `−1` retains its `F`-action and finite flatness; the class of 2 remains nonfinite after forgetting that action.
- Unramified twists with `ε₁≠ε₂` force all valuation parameters to vanish by Frobenius compatibility; allowing a nonzero valuation would contradict the descent equations. At `p=2` the descent construction still applies although the constant rank-two generic group has both étale and multiplicative models.

*Needs:* [The extension-sensitive wild weight table](#target-peu-et-tres-ramifie-and-the-wild-case-weight); [The Raynaud input and its boundary](#target-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24, R07.5.6, R07.5.6a; ModularCurves Layer 0E (effective finite-flat descent).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 8.1 and Proposition 8.2, p. 26 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 8.4, equations 8.4.3, p. 28 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), End of 8.3, p. 27 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition 8.6 and (8.5.1), author DVI p.28.)

<a id="target-realizability-over-the-field-of-characteristic-polynomials"></a>

#### Descent to characteristic-polynomial coefficients

Use ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7 for the following descent statement. If `φ:G→GL_n(k′)` is semisimple, `k′` is a finite field, and `k⊂k′` contains every coefficient of `det(1−φ(g)T)` for all `g∈G`, then `φ` is realizable over `k`. Semisimple characteristic-polynomial recognition compares `φ` with each conjugate, and the trivial Brauer obstruction over a finite field supplies descent. Traces alone are not the hypothesis. In the modular-form application the field generated by eigenvalues and residual character values contains these characteristic-polynomial coefficients through Frobenius recognition. The general representation-theoretic theorem remains the supplier's construction.

*Needs:* ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7.

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.13 with proof, printed p. 523; [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Proof of Lemme 6.13, printed p. 523.)

## How to read the build

The geometric and residual layers have arithmetic identifiers R15.1–R15.6; R15.5A constructs the classical attachments before R15.6 consumes them. ComplexComparisonPartII §§C−1.2, C1.9 supply the analytic carrier and proper coherent GAGA used in R15.1. The strong q-expansion consequence in R15.2 is proved after the ordinary weight congruences of R15.3; integral Hecke preservation uses the ordinary q-expansion principle, not that later consequence. The integral section comparison in R15.2 supports the lifting application in R15.5. The theta and supersingular arguments in R15.3 support controlled weight changes. R15.4 depends on local Galois and finite-flat theory and supplies the numerical invariant used in R15.6. The abstract algebra of R15.5 can be developed independently of the geometry. R15.5A constructs the filtered de Rham comparison, primitive classical parabolic summand and higher-weight and weight-one attachments using ModularCurvesPartII §§14.1–14.4a, 14.11, the earlier form interfaces and R15.5 lifting. The final witness definitions use those attachments, independently of the final modularity predicate.

| Layer | Main objects and results | Principal inputs |
| --- | --- | --- |
| R15.1 | Sections, cusp spaces, coefficient maps, analytic comparison, logarithmic Kodaira–Spencer | Modular curves, de Rham bundles, logarithmic connections, GAGA |
| R15.2 | q-expansion, integral comparison, coherent Hecke and Fricke, boundary eigensystems | R15.1, proper coherent cohomology, Tate charts, analytic integral lattice |
| R15.3 | Hasse, theta, `U` and `V`, Igusa weights, supersingular periodicity and duality | R15.1–R15.2, Igusa geometry, elliptic Frobenius, relative duality |
| R15.4 | Complete local recipe and local comparisons | Tame inertia, actual extension classes, Raynaud and Fontaine–Laffaille |
| R15.5 | Deligne–Serre lifting and controlled eigenform application | Existing algebra APIs; R15.2–R15.3 for forms |
| R15.5A | Filtered de Rham comparison, primitive classical parabolic summand, higher-weight `λ`-adic and weight-one Artin attachments | R15.1, R15.5, ModularCurvesPartII §§14.1–14.4a, 14.11, scheme cohomology and comparison, classical old/new theory, ArithmeticDirichletSeries and Chebotarev |
| R15.6 | Place-sensitive residual witnesses and classical target | R15.4–R15.5A, conductor and semisimple recognition |

<a id="layer-r15-1"></a>

## Layer R15.1 — Geometric forms and comparison

This layer constructs form spaces from the supplied moduli geometry. All integer weights and all cusps enter at the definition stage, so that later cohomology and duality use the same Hodge line. The fine-level section construction precedes small-level descent; the latter's base-change result uses the integral theorem in R15.2. The analytic comparison and logarithmic Kodaira–Spencer map specify the normalizations subsequently used by Hecke and theta.

### Section spaces and small levels

<a id="target-hodge-bundle-with-tate-curve-normalization"></a>

#### Geometric modular forms

For the compactified moduli family supplied by ModularCurvesPartII, define the section modules

`M_k(X_A)=H⁰(X_A,ω_A^k)`,  `M_k(K)=H⁰(X,ω^k⊗K)`,  `k∈ℤ`.

Here `A` is a base algebra and `K` a module over the integral base. Pullback and the affine projection formula identify the two conventions when `K=A`. Negative powers use `ω∨`, and every section is required to extend across `C`. Full level `n≥3`, with `n` invertible on the base, gives the fine-scheme construction; `Γ₁(N)` and small levels use the moduli stack or its effective descent presentation. Evaluating at a Tate curve with `ω_can` produces the expansion. The construction takes place on that actual stack: a line on the coarse `j`-line would discard the stabilizer action and give the wrong odd-weight spaces.

Required objects and properties:

- `M_k(K)=H⁰(X,ω^k⊗K)`, with `ω` supplied by the modular-curve owner.

- `M_k(K)` has its section-module structure; restriction and coefficient maps are linear.

- Two forms are equal when their sections agree on a cover of the moduli stack.

**Checks.**

- On a geometrically connected compactified modular curve over an algebraically closed field, weight-zero forms are precisely constants.

- Over an algebraically closed field of characteristic prime to the level, `M_k=0` for `k<0`.

- At level 1 or 2 with 2 invertible, odd-weight forms vanish because `−1` acts as `(−1)^k` on the Hodge power.

*Needs:* ModularCurvesPartII §§4.4, 7.1–7.1a; ModularCurvesPartII §§4.1–4.4; ModularCurvesPartII §5.21.

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed pp.82–83 (Katz running mark Ka-14/15); [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4.)

<a id="target-cusp-ideal-section-forms"></a>

#### Cusp forms and the cusp ideal

Define the cusp module by `S_k(K)=H⁰(X,ω^k(−C)⊗K)`. Equivalently it is the kernel of restriction from `M_k(K)` to `H⁰(C,ω^k|_C⊗K)`, using the full reduced Cartier divisor supplied by the modular-curve geometry. The equivalence uses the exact cusp-ideal sequence, and vanishing at a Tate cusp means zero constant coefficient in its normalized expansion. Inclusion into `M_k` is linear and injective. This kernel description does not assert that restriction to `C` is surjective: its cokernel is governed by the subsequent `H¹` term.

Required objects and properties:

- `S_k=H⁰(ω^k(−C))`.

- The cusp ideal inclusion induces an injective linear map `S_k→M_k`.

- A form is cuspidal iff its restriction to the entire cusp divisor is zero.

**Checks.**

- `S_0=0` on a connected proper geometric curve with a nonempty cusp divisor.

- At level 1, `Δ` is a weight-12 cusp form with leading coefficient 1 and order one at the cusp.

- `E₄` at level 1 has constant term 1, so is not a cusp form over `ℂ`.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); ModularCurvesPartII §§4.1–4.4.

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed pp.82–83 (Katz running mark Ka-14/15); [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4.)

<a id="target-coefficient-maps"></a>

#### Functorial coefficient maps

An `O`-linear map `u:K→L` induces the `O`-linear section map `H⁰(id⊗u):M_k(K)→M_k(L)`, and the same construction preserves cusp spaces. It respects identity and composition and carries each Tate coefficient through `u`. For an `O`-algebra `B` there is consequently a canonical `B`-linear map `B⊗_O M_k(O)→M_k(B)`. Define it without a flatness hypothesis; identify it as an isomorphism only under the appropriate base-change theorem. In particular, the weight-one level-one map in characteristic two need not be onto.

Required objects and properties:

- The map on sections induced by a linear coefficient map.

- `M_k(id)=id`.

- `M_k(v∘u)=M_k(v)∘M_k(u)`.

**Checks.**

- The zero coefficient map induces the zero map.

- Every `q` coefficient is sent by the coefficient map.

- Reduction at level 1 from `ℤ` to `𝔽₂` is not surjective in weight 1; the Hasse invariant has no lift.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Cusp forms and the cusp ideal](#target-cusp-ideal-section-forms).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed pp.82–83 (Katz running mark Ka-14/15).)

<a id="target-level-one-and-two-by-descent-with-explicit-inverted-primes"></a>

#### Level-one and level-two descent

At level two use invariants of the level-four section space under `ker(GL₂(ℤ/4)→GL₂(ℤ/2))`. At level one use the fibre product of `M_k(3,K[1/3])^{GL₂(ℤ/3)}` and `M_k(4,K[1/2])^{GL₂(ℤ/4)}`, with equality of their pullbacks in `M_k(12,K[1/6])`. Retain these invariants even when the overlap is zero; the coefficient localizations are part of the transition maps. These are rigidifying descent constructions of sections, not sections of a presumed coarse-space Hodge line.

For `k≥1`, level-two base change is an isomorphism for every algebra in which 2 is a unit. Its integral source is naturally over `ℤ[1/2]`. For level one and `k≥1`, base change is an isomorphism when both 2 and 3 are units, passing through `ℤ[1/6]`. The relevant group orders are 16 for the level-four mod-two kernel, 96 for `GL₂(ℤ/4)`, and 48 for `GL₂(ℤ/3)`; averaging is used only with the requisite orders invertible. The rigid fine-level base-change theorem of R15.2 provides the input. The automorphism `−1` forces odd-weight level-two forms to vanish when 2 is invertible.

The level-one assertion fails without excluding 2 and 3. The Hasse section has weight one in characteristic two and weight two in characteristic three although the corresponding characteristic-zero level-one spaces vanish; multiplying by `Δ` gives cusp examples in weights 13 and 14. This identifies the stated level-one limitation and makes no corresponding blanket failure assertion for level two.

Required objects and properties:

- `M(K,2,k)` is the level-four holomorphic section module invariant under the mod-two kernel in `GL₂(ℤ/4)`.

- `M(K,1,k)` is the fibre product of the `GL₂(ℤ/3)`-invariant level-three and `GL₂(ℤ/4)`-invariant level-four holomorphic modules, localized as above, with equal pullbacks at level twelve.

- `M(ℤ[1/2],2,k)⊗R₀≃M(R₀,2,k)` for `k≥1` and 2 invertible in `R₀`.

- `M(ℤ,1,k)⊗R₀≃M(R₀,1,k)` for `k≥1` and both 2 and 3 invertible in `R₀`.

**Checks.**

- `E₄=1+240Σσ₃(m)q^m` belongs to the holomorphic module `M(ℤ[1/6],1,4)`.

- Remark 1.8.2.2: over `𝔽₂` or `𝔽₃` there are level-one forms that are not reductions of forms over `ℤ` (the Hasse invariant of weight 1 over `𝔽₂`, weight 2 over `𝔽₃`), so Theorem 1.8.2 fails without inverting 2 and 3.

- A level-one form is determined by its stabilizer-invariant images at levels 3 and 4 agreeing at level 12. Over `𝔽̄₂` the level-four term and overlap are zero, but invariance at level three is still required: on a fixed-pairing `X(3)`, `dim M₁(3)=2`, while `dim M₁(1)=1`.

**Checks (level two).**

- Over `ℂ`, `M₂` at full level two has dimension 2, whereas level-one `M₂` is zero.
- At full level two over `ℂ`, `S₂=0` and `dim S₆=1`: `ω²` descends to `O(1)` on the `λ`-line and the three cusps impose `O(−3)`.
- Odd weights vanish when 2 is invertible, while `dim M₂` over `𝔽₃` is still 2.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Holomorphic base change](#target-base-change-for-spaces-of-forms-and-the-weight-one-boundary).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.8.1 and its proof, printed pp. 85-86 (Katz running mark Ka-17/18); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Remark 1.8.2.2, printed p. 87 (Katz running mark Ka-19); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.8.2 and its proof, printed pp. 86-87 (Katz running mark Ka-18/19); §1.10, printed p.89 (Katz running mark Ka-21), for the level-two `λ`-line and `ω²=O(1)`.)

### Analytic and differential comparisons

<a id="target-all-weight-analytic-comparison"></a>

#### All-weight analytic comparison

Over `ℂ` identify sections of every integer Hodge power on the algebraic moduli stack with the existing analytic space of holomorphic modular forms. Identify `ω^k(−C)` with analytic cusp forms, and identify the `ε` diamond eigenspace with the analytic nebentypus space. The construction combines uniformization and the Hodge automorphy factor with projective coherent GAGA and equivariant descent through a rigidifying cover. Use ModularForms Layer 0 and Layer 10C for the actual analytic carriers and their stabilizer conventions, ComplexComparisonPartII §§C−1.2, C1.9 for the analytic carrier and proper coherent GAGA, and ComplexComparisonPartII §§C0.4, C1.7–C1.8, C2.1–C2.2 for its analytic inputs and bundle compatibilities. The comparison commutes with coefficients and Tate expansions. In negative weight both spaces vanish; in weight zero on a connected compactified component they consist of constants. Small-level stabilizers remain in the comparison.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Cusp forms and the cusp ideal](#target-cusp-ideal-section-forms); ComplexComparisonPartII §§C−1.2, C1.9, C0.4, C1.7–C1.8, C2.1–C2.2; ModularCurvesPartII §§4.4, 7.1–7.1a; [ModularForms Layer 0](../ModularForms/README.md#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus); [ModularForms Layer 10](../ModularForms/README.md#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed pp.82–83 (Katz running mark Ka-14/15); [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4.)

<a id="target-integral-elliptic-logarithmic-de-rham-extension"></a>

#### Integral elliptic logarithmic de Rham extension

On the compactified fine level-`N` models over `ℤ[1/N]`, `N≥3`, construct the rank-two logarithmic de Rham bundle `D` extending `H¹_dR` of the elliptic open. Extend its Hodge sequence `0→ω→D→ω⁻¹→0`, integrable relative logarithmic connection and perfect alternating cup product, with `det(D)≃O_X`. Use the Hodge line of ModularCurvesPartII §7.1. Construct the logarithmic connection over `ℤ[1/N]`, including its restriction to the open, rather than deriving an integral connection from a complex one. On each width-`n` Tate chart give a symplectic basis `(ω_can,η)` with `∇ω_can=η⊗n dt/t` and `∇η=0`. Prove coefficient base change for the bundle, filtration and pairing, and base change of the relative connection, together with prime-to-level isogeny compatibility and effective stack descent. In the isogeny comparison the cup product scales by the degree.

Compare its complex specialization with ComplexComparisonPartII C5.6 CanonicalLogExtension in the zero-exponent unipotent convention, and its induced characteristic-zero Kodaira–Spencer map with ModularCurvesPartII §7.1a. The integral Tate lattice and these gluing compatibilities are targets here.

**Checks.**

- At a width-`n` cusp the residue sends `ω_can` to `nη` and `η` to zero, so it is nilpotent; since `n` is a unit on the prime-to-level model this remains a rank-one residue in every residual characteristic of that model.
- Restriction to the smooth elliptic open gives the supplied Hodge sequence and Gauss–Manin connection, without a boundary residue term.
- At `p=2` and `p=3` with `p∤N`, the base-changed sequence remains locally free of ranks `1,2,1` and its cup product remains perfect; over `ℂ` the residue eigenvalues are both zero and the extension agrees with the canonical unipotent extension.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); AbelianSchemesAndArithmeticModuli §A4.3; ModularCurvesPartII §§4.4, 7.1–7.1a; ComplexComparisonPartII C5.6.

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), §1.5, printed pp.82–83, A1.3.16–A1.3.18, pp.168–169, and A2.3.6, pp.178–179, for the Tate logarithmic lattice and connection; [Deligne 1970](https://www.numdam.org/item/SLN_1970__163__1_0/), II.5.3–5.6, pp.93–96, for the complex canonical extension.)

<a id="target-logarithmic-kodaira-spencer"></a>

#### Logarithmic Kodaira–Spencer

Let `D` be the rank-two relative de Rham bundle of the universal elliptic family, with logarithmic extension, Hodge filtration, Gauss–Manin connection and cup product. The composite

`ω → D → D⊗Ω¹(log C) → (D/ω)⊗Ω¹(log C)`

is `O_X`-linear and gives the elliptic Kodaira–Spencer isomorphism. Before trivializing the determinant its consequence is `Ω¹(log C)≃det(D)⁻¹⊗ω²`. Only the supplied cup-product trivialization then identifies `Ω¹(log C)` with `ω²` and `Ω¹` with `ω²(−C)`. On `Tate(t^n)` the chosen normalization is `KS(ω_can²)=n dt/t`. The isogeny compatibility includes the degree scalar and the correct source and target level structures. The integral logarithmic extension, its Hodge sequence, connection, cup product, coefficient base change and Tate normalization are supplied by [Integral elliptic logarithmic de Rham extension](#target-integral-elliptic-logarithmic-de-rham-extension). Prove the integral and positive-characteristic isomorphism on the fine prime-to-level models and its stack descent; compare the characteristic-zero specialization with ModularCurvesPartII §7.1a.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Integral elliptic logarithmic de Rham extension](#target-integral-elliptic-logarithmic-de-rham-extension); ModularCurvesPartII §7.1a.

([Pan](https://arxiv.org/pdf/2209.06366v1), 4.1.2, preprint p.34; [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), A1.3.17–A1.3.18, printed p.169 (Katz running mark Ka-101), and 1.5, pp.82–83; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Lemma 7.4, author DVI p.25.)

### Examples

On a connected geometric component `M₀` is the coefficient field while `S₀=0` because the cusp divisor is nonempty. At level one `E₄` has expansion `1+240q+2160q²+⋯` and `Δ` starts `q−24q²+⋯`. An odd-weight form at level one or two vanishes when 2 is invertible; the characteristic-two weight-one Hasse section demonstrates why that hypothesis matters.

### Dependencies

ModularCurvesPartII §§3.1–3.2, 4.1–4.4, 5.21, 7.1; AbelianSchemesAndArithmeticModuli §A4.3; ComplexComparisonPartII C5.6; ComplexComparisonPartII §§C0.4, C1.7–C1.8, C2.1–C2.2; ModularForms Layers 0 and 10C.

<a id="layer-r15-2"></a>

## Layer R15.2 — Integral q-expansion and coherent Hecke theory

The q-expansion map detects geometric sections and descends their coefficients. It does not by itself identify every positive-characteristic section with an integral classical reduction. Finite generation, base change, cusp cohomology and integral character projectors supply the precise comparison. Coherent Hecke operations then act on arbitrary coefficient modules, including torsion. Their action on the whole cusp divisor is calculated by cusp type.

### Detection, coefficient descent and base change

<a id="target-q-expansion-principle-and-its-vanishing-theorem"></a>

#### The q-expansion principle

For full level `n≥3` and any `ℤ[1/n]`-module `K`, a form is zero if its expansion is zero at one cusp on each geometric connected component. There are `φ(n)` such components after adjoining `ζ_n`, so one arbitrary cusp cannot silently replace the required family. If `L⊂K` is a coefficient submodule and those expansions have all coefficients in `L⊗ℤ[1/n,ζ_n]`, then the form comes from `L`. No flatness of `L` or `K/L` is required. At levels one and two the rigidifying descent descriptions give the corresponding principle with a single cusp.

The proof passes from arbitrary modules through filtered colimits to noetherian data, uses faithful flatness of completion and formal functions at the cusp, and then uses Krull intersection and the depth-zero support argument on the smooth curve over an Artin base. Those exact completion and coherent-cohomology interfaces belong to the foundational input. The result is geometric; the existing analytic injectivity theorem over `ℂ` is its comparison specialization.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Level-one and level-two descent](#target-level-one-and-two-by-descent-with-explicit-inverted-primes).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.6.1 and Corollary 1.6.2, printed pp. 83-84 (Katz running mark Ka-15/16); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Corollary 1.9.1, printed p. 88 (Katz running mark Ka-20); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Proof of Theorem 1.6.1, printed pp. 84-85 (Katz running mark Ka-16/17).)

<a id="target-strong-q-expansion-principle-with-its-divisibility-hypothesis"></a>

#### The strong q-expansion principle

Let `n,k≥1`, and let `K` be a `ℤ[1/n]`-module on which multiplication by each prime `p` satisfying `(p−1)∣k` is injective. A weight-`k` form whose expansion at every cusp is a polynomial is zero. Let `a` be the product of those finitely many primes. If `K` is a `ℤ[1/an]`-module and `L⊂K` is a submodule over that ring, then expansions whose coefficients lie in `L` at all cusps except for finitely many coefficients already define a form with coefficients in `L`.

The weight-dependent injectivity assumption is essential. In characteristic `p` the Hasse section supplies a nonzero constant expansion when its weight `p−1` divides the weight in question. The proof needs the ordinary-tower statement that a positive-weight constant expansion vanishes when `(p−1)` does not divide its weight; it also needs characteristic-zero constant-expansion vanishing, obtained by finite-data descent to a field embeddable in `ℂ` and the analytic comparison. The reduction of arbitrary coefficient modules to the Artin-local field argument is part of this proof. Polynomiality is required at every cusp.

*Needs:* [The q-expansion principle](#target-q-expansion-principle-and-its-vanishing-theorem); [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions); [Finite section modules](#target-finite-generation-of-geometric-sections); [Ordinary weight congruences](#target-weight-congruences-on-the-ordinary-tower); [All-weight analytic comparison](#target-all-weight-analytic-comparison).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.12.1, printed p. 94 (Katz running mark Ka-26); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Corollary 1.12.2, printed p. 95 (Katz running mark Ka-27); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.12, Result 1.12.0, printed p. 93 (Katz running mark Ka-25) and p. 94 (Katz running mark Ka-26); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 4.4.1, printed p.151 (Katz running mark Ka-83).)

<a id="target-base-change-for-spaces-of-forms-and-the-weight-one-boundary"></a>

#### Holomorphic base change

For full level `n≥3` the canonical coefficient map is an isomorphism for `k≥2` and arbitrary coefficient modules. It is also an isomorphism in weight one when `3≤n≤11`. The proof uses proper coherent base change and `H¹(ω^k)=0`, deduced from the curve degree inequality `deg(ω^k)>2g−2` and Serre duality; the low-level weight-one range requires the cusp-count and degree calculation. For `n≥12` this theorem supplies no general weight-one isomorphism. Cusp twists and character projectors have their own cohomology and integrality conditions, so they do not follow automatically from holomorphic fine-level base change.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer); [Finite section modules](#target-finite-generation-of-geometric-sections).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.7.1 and the following Remark, printed p. 85 (Katz running mark Ka-17); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Remark following Theorem 1.7.1, printed p. 85 (Katz running mark Ka-17).)

<a id="target-finite-generation-of-geometric-sections"></a>

#### Finite section modules

On a proper fine modular curve over a noetherian base, the coherent Hodge-power section module is finite. Over a DVR with `X` flat, the section module of the invertible Hodge sheaf is torsion-free; finite generation then makes it finite free. Rigidifying descent gives the stack and small-level module as the relevant equalizer or invariant module. A flat coefficient extension has the expected `H⁰` base-change comparison. These conclusions use proper coherent finiteness and the specified descent data and do not imply an arbitrary nonflat base-change isomorphism.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Cusp forms and the cusp ideal](#target-cusp-ideal-section-forms); ModularCurvesPartII §5.21.

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed pp.82–83 (Katz running mark Ka-14/15); [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4.)

### Hecke operators and the classical integral lattice

<a id="target-integral-hecke-operators-from-q-expansions"></a>

#### Integral geometric Hecke operators

The formal coefficient model acts on `PowerSeries A`, over a commutative ring `A`, with nth coefficient `a_(ℓn)+c d a_(n/ℓ)` when `ℓ` divides `n` and `a_(ℓn)` otherwise. Here `c=ℓ^(k−1)` and `d` is the diamond scalar for a character space. Require this coefficient formula and compatibility with any ring homomorphism on coefficients. This arithmetic definition has no moduli-preservation assertion; the geometric target below retains the two Tate level structures. (Katz 1973, Formula 1.11.1, printed p.92.)

**Checks.**

- For `Δ` with `a₂=−24` and `ℓ=2`, coefficient one is `−24`, independently of the second summand.
- On the zero series every coefficient is zero.
- For `f=q`, `ℓ=2` and `c=1`, coefficient two is `d`; `d=−1` gives `−1` and `d=1` gives 1.

For a prime `ℓ∤n` that is a unit on the initial base, define Katz's geometric operator by summing over the `ℓ+1` subgroups `H` of order `ℓ`:

`(T_ℓf)(E,ω,α)=ℓ^(k−1) Σ_H f(E/H,π̌*ω,π(α))`.

Use the quotient level structure `π(α)`, characterized by `π∘α=π(α)∘π`. The other natural level structure obtained using the dual isogeny differs by multiplication by `ℓ` and gives a diamond twist. If the expansion at a full-level Tate chart is `Σa_i(α)t^i`, its coefficients after `T_ℓ` are

`b_i(α)=ℓ^(k−1)a_(i/ℓ)(α′)+a_(ℓi)(α″)`,

with the first coefficient zero when `ℓ∤i`. The first level structure `α′` is obtained through the `μ_ℓ` quotient and `t↦t^ℓ`; the second `α″` comes from the cyclic quotient over `t^(1/ℓ)`, followed by the scalar extension returning to the Tate chart. The two level structures must remain visible rather than being replaced by a single arbitrary series.

The operator preserves holomorphy, cusp forms and polynomial expansions. The q-expansion principle and base change extend it uniquely to every `ℤ[1/n]`-module `K` when (`n≥2` and `k≥2`) or (`3≤n≤11` and `k≥1`), for all primes `ℓ∤n`, including residue-characteristic `ℓ`. At level one the same extension is valid for `k≥2` and any `ℤ`-module `K`. A prime dividing the level is outside this particular quotient formula; the relevant `U` correspondence has its own supplied definition.

Required objects and properties:

- `T_l` for `l ∤ n` invertible in `R`, by (1.11.0.2): `l^{k−1} ∑_H f(E/H, π̌^*ω, π(α_n))`.

- `b_i(α_n) = l^{k−1} a_{i/l}(α′_n) + a_{li}(α″_n)` (Formula 1.11.1).

- For `ℓ` prime to `n`, the operator extends to every `ℤ[1/n]`-coefficient module when `n≥2,k≥2` or `3≤n≤11,k≥1` (Proposition 1.11.3); at level one it extends to every `ℤ`-module for `k≥2` (Corollary 1.11.4).

**Checks.**

- For `Δ` and `l = 2`: `b₁ = a₂ = τ(2) = −24`, so `T₂Δ = −24Δ`.

- Using the level structure `α_n ∘ π̌ = l·π(α_n)` instead of `π(α_n)` gives the operator twisted by the diamond operator `⟨l⟩`, not `T_l`.

- For `l | n` the formula is not defined (`l` must be prime to the level); `U_l` is a different operator.

*Needs:* [The q-expansion principle](#target-q-expansion-principle-and-its-vanishing-theorem); [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); ModularCurvesPartII §§9.1–9.3, 9.9–9.11; [Holomorphic base change](#target-base-change-for-spaces-of-forms-and-the-weight-one-boundary).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Formula 1.11.1 (1.11.1.2), printed p. 92 (Katz running mark Ka-24); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Corollary 1.11.4, printed p. 93 (Katz running mark Ka-25); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.11.0.0-1.11.0.2, printed p. 90 (Katz running mark Ka-22).)

<a id="target-generation-of-the-integral-hecke-algebra"></a>

#### Comparison of integral Hecke algebras

Compare the geometric operators on the finite integral lattice with the integral analytic Hecke algebra of ModularForms Layer 8, using the all-weight analytic and all-cusp integral comparisons. Import its generators and finiteness, with the separate Layer 8W lattice in weight one. DDT Lemma 4.1 is used only in its weight-two `Γ_H(N)` setting; its branch (b) requires the parameter `D` to be odd or 2 to be a unit in `R`. That lemma's hypotheses do not give a new unrestricted algebra construction for all weights. The comparison transfers the owned algebra, rather than rebuilding its analytic foundations.

*Needs:* [All-weight analytic comparison](#target-all-weight-analytic-comparison); [The integral cusp lattice and its reduction image](#target-integral-lattice-and-reduction-image); [ModularForms Layer 8](../ModularForms/README.md#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields).

([Darmon–Diamond–Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §4.1, Lemma 4.1, p. 107 (revision of 9 September 2007).)

<a id="target-ring-valued-eigensequences"></a>

#### Ring-valued eigensequences and coefficient realization

For any commutative ring `R` and sequences `e,a:ℕ→R`, define the normalized Hecke eigensequence predicate by `a(1)=1` and, for every prime `ℓ` and every `n≥0`,

`a(ℓn)+e(ℓ)·(if ℓ∣n then a(n/ℓ) else 0)=a(ℓ)a(n)`.

Here `e(ℓ)` is the second Euler coefficient. Mapping both sequences through any unital ring homomorphism preserves the predicate, including reduction to rings with nilpotents. In a complex character space set `e(ℓ)=χ(ℓ)ℓ^(k−1)`, with `χ` extended by zero. Identify this predicate for the q-expansion of a cusp form with `a₁=1` with the pinned full `HeckeRing.GL2.Eigenform` coefficient characterization. It includes the bad-prime `U_ℓ` equations; it does not assert newness.

Define coefficient realization to mean that `b` is the q-expansion, through the specified ring map `ι:R→ℂ`, of a cusp form of integer weight `k` on `Γ₁(N)`, with `N≥1`. This imposes neither eigen-ness nor a character; a use in a character space carries that membership separately. Transport realization along `φ:R→S` and `j:S→ℂ` with `j∘φ=ι`. Q-expansion injectivity makes the realizing form unique. The ring-valued coefficient interface follows the design of the Imperial College London FLT project.

**Checks.**

- Mapping a characteristic-zero eigen-sequence to a residue field maps `e` as well as `a`; the determinant term remains part of the recurrence in characteristic two.
- At `ℓ∣N`, `χ(ℓ)=0` gives `a(ℓn)=a(ℓ)a(n)`, the bad-prime equation. Omitting those primes characterizes only good eigenforms.
- The zero sequence fails `a(1)=1` over a nonzero ring. The zero sequence is nevertheless realized by the zero cusp form; realization alone is not a normalized eigensystem.

*Needs:* ModularForms Layers 2 and 4; the pinned `HeckeRing.GL2.Eigenform.exists_toCuspForm_eq_and_χ_eq_iff_ne_zero_and_forall_prime_qExpansion_coeff_prime_mul` in `TauCeti.NumberTheory.ModularForms.Newforms.Coefficient`.

(Diamond–Shurman, *A First Course in Modular Forms*, §5.8, Proposition 5.8.5; [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §1.6, p.509.)

<a id="target-integral-lattice-and-reduction-image"></a>

#### The integral cusp lattice and its reduction image

For a number field `K⊂ℂ`, let `S_k(Γ₀(N),K)` be the coefficient-rational cusp space, `N≥1` and `k≥2`, and let `O=O_(K,λ)` at any finite place, including places dividing `N`. The q-integral submodule `L_q={f : a_n(f)∈O for every n}` is finite free over `O`, spans this `K`-space and is stable under every `T_n`, including `U_ℓ` at level primes. Obtain these properties from ModularForms Layer 8's finite integral Hecke algebra and the coefficient pairing `⟨T,f⟩=a₁(Tf)`, together with Layer 8G's rational structure. They are properties of the actual coefficient submodule, not conditions in a lattice constructor. The analogous statement in weight one uses Layer 8W. For a fixed nebentypus the coefficient field contains its values and the same argument uses its full integral Hecke action. Reduction mod `λ` means the image of this lattice; it does not mean all Katz forms. The formulation of this interface follows the Imperial College London FLT project.

At primes away from `N` compare this coefficient lattice with the geometric lattice as follows. Let `O` be the localization of a number-field integer ring at a place `λ` over `p`, with `p∤N`. Choose an integral lift of the diamond character, and assume that its projector is integral. Take the character part of `L=H⁰(X_O,ω^k(−C))`; compare it with the analytic all-cusp integral lattice through the actual moduli family and Tate trivializations. Define the reduction space as

`S_red=im(L/λL → S_k(X_κ))`.

Its definition retains the map from the lattice, rather than identifying its image with every Katz cusp form. If `H¹` of the cusp sheaf has no `λ`-torsion, reduction is onto in the setting with the stated integral character projector. Fine-level holomorphic base change in `k≥2`, or `k=1` with `3≤n≤11`, does not establish that claim for every cusp twist, stabilizer invariant or nonintegral character projector. The weight-13 characteristic-two form `AΔ` gives a concrete level-one obstruction to a universal same-weight assertion.

Required objects and properties:

- `S_red` is the image of the integral cusp lattice reduction map.

- Membership means a preimage in `L/λL`.

- Scalar extension maps the reduction image to the reduction image of the extended lattice.

**Checks.**

- The reduction image of a zero cusp lattice is zero.

- At level 1, `AΔ` has weight 13 in characteristic 2 and is a nonzero Katz cusp form although the characteristic-zero weight-13 space is zero.

- At any residue characteristic, integral `Δ` reduces to a nonzero series with coefficient `a₁=1`.

- At a prime dividing `N`, the q-integral lattice is still Hecke-stable and spanning; its existence asserts no smooth prime-to-level geometric base-change theorem.

*Needs:* ModularForms Layers 8, 8G and 8W; [Finite section modules](#target-finite-generation-of-geometric-sections); [All-weight analytic comparison](#target-all-weight-analytic-comparison); [Functorial coefficient maps](#target-coefficient-maps); [The q-expansion principle](#target-q-expansion-principle-and-its-vanishing-theorem).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.7.1, printed p.85 (Katz running mark Ka-17); [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 2.6–2.7, printed pp.511–512.)

<a id="target-bounded-denominators-congruence-application"></a>

#### All-prime bounded denominators

A holomorphic congruence modular form with rational Fourier coefficients admits one integer `D≥1` clearing every coefficient denominator, including denominators at primes dividing its level. Prove the all-prime bounded-denominator theorem here by constructing the all-cusp integral form lattice on the compact integral level models and comparing its rational structure with ModularForms Layer 8. The comparison includes primes dividing the level, using the generalized-curve compactification and its finite proper rigidifying covers from ModularCurvesPartII §§3.2, 5.21. The symbol-side lattice alone does not supply this integral form lattice. The smooth `ℤ[1/N]` model alone cannot control the power of a denominator prime dividing `N`.

The milestone `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.KatzModularForms.boundedDenominators` uses the existing analytic `ModularForm` carrier for any subgroup containing `Γ(N)`, with `N≥1` and integer weight. For rational coefficients `a_n` in its width-`N` expansion, it asserts `∃D≥1, ∀n, D a_n∈ℤ`.

For a modular function `f` holomorphic on `Y(2N)`, choose `m` so `fΔ^m` is holomorphic at all cusps, clear that holomorphic form's denominators, and multiply its expansion by the integral Laurent series `Δ⁻m`. In the parameter `q=e^{πiτ}` used in the application, `Δ⁻¹=q⁻²∏_(j≥1)(1−q^(2j))⁻²⁴`. This yields the single denominator bound for `f` as a Laurent series. The input includes the level-prime integral comparison; it is not deduced merely by inverting those primes.

**Checks.**

- The integral expansion of `Δ` permits `D=1` at every level obtained by pullback.
- At level 11 the form `Δ/11` requires a denominator divisible by 11 because its first nonzero coefficient is `1/11`; level primes remain in the denominator assertion.
- Multiplication by the integral Laurent series `Δ⁻m` preserves a single denominator bound, even though the resulting modular function may have a pole at a cusp.

*Needs:* [All-weight analytic comparison](#target-all-weight-analytic-comparison); [The integral cusp lattice and its reduction image](#target-integral-lattice-and-reduction-image); [ModularForms Layer 8](../ModularForms/README.md#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields).

([Calegari–Dimitrov–Tang](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.2, printed p.655.)

### Diamonds, correspondences and Fricke maps

<a id="target-diamond-cohomology-action"></a>

#### Diamonds on coherent cohomology

For the supplied compactified fine auxiliary curve, the actual level action defines diamonds on `H^i(X,ω^n⊗A)`, `H^i(X,ω^n(−C)⊗A)` and the boundary, for `n∈ℤ`, `i=0,1` and any `O`-module `A`. They satisfy the group law, commute with coefficient maps and preserve the cusp sequence. Their action at `i=0` compares with the analytic diamonds. The element `−1` acts by `(−1)^n`; thus parity belongs to the Hodge action, including negative powers and torsion coefficients.

Required objects and properties:

- The diamond endomorphism on each listed cohomology group.

- `⟨1⟩=id`.

- `⟨ab⟩=⟨a⟩∘⟨b⟩`.

**Checks.**

- Restriction to the cusp divisor commutes with diamonds.

- Reduction of `⟨a⟩` modulo `ϖ^m` agrees with its coefficient action there.

- `⟨−1⟩` on a weight-`n` form is multiplication by `(−1)^n`.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Cusp forms and the cusp ideal](#target-cusp-ideal-section-forms); ModularCurvesPartII §9.2.

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.313–316.)

<a id="target-field-coherent-hecke-action"></a>

#### All-prime field coherent Hecke and trace duality

Let `p` be any prime, `N≥5` with `p∤N`, `κ` a field of characteristic `p`, and `X=X₁(N)_κ` the smooth proper fine curve with full cusp divisor `C`. For every integer `n`, `L=ω^n` or `ω^n(−C)`, and `i=0,1`, construct the good-prime operators on `H^i(X,L⊗_κ A)`, for every `κ`-vector space `A`. For a prime `ℓ∤pN`, the compactified finite-flat correspondence and its invertible Hodge isogeny map `ξ` give

`ℓT_ℓ^*=tr(π₁)∘ξ^n∘π₂*`.

Negative powers use the inverse of `ξ`. Fix Edixhoven's normalization and compare its section action with the quotient-level geometric operator, retaining the transported diamonds. Prove commutation with diamonds, coefficients and field extension, and equivariance of cusp inclusion, restriction and connecting maps. Restrict the same correspondences to the Hasse zero divisor and prove equivariance of the Hasse sequence, including its `H¹` term. The trace and pullback are adjoint under coherent Serre duality, with the coefficient transport transposed and the two legs reversed. Combining this comparison with `Ω¹_X≃ω²(−C)` supplies the untwisted duality input; the root-dependent Fricke transport and its scalar are specified in [Twisted duality and the supersingular boundary](#target-twisted-serre-duality-hecke). For finite-dimensional `A` use its `κ`-linear dual in the perfect pairing. Finite coefficient fields and their extensions are included; no oddness assumption or division by `p` occurs.

**Checks.**

- At `p=2,N=5,ℓ=3`, the operator acts on `H⁰` and `H¹` of every integer Hodge power; restriction to the supersingular divisor and the Hasse connecting map commute with it.
- On `H¹(X,ω^(−1))`, duality pairs with `H⁰(X,ω³(−C))`; the adjoint reverses the correspondence legs even in characteristic two.
- For a finite field extension `κ′/κ`, the operator and connecting map after extension agree with scalar extension of the `κ`-maps; the zero coefficient space has zero operators.
- At `N=5`, `ℓ=5` is excluded from `T_ℓ^*`: its level correspondence has a different degree. No bad-level `U` identity is inferred from this good-prime formula.

*Needs:* [Diamonds on coherent cohomology](#target-diamond-cohomology-action); [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer); [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions); [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); ModularCurvesPartII §§9.1–9.2; SchemeAndStackFoundations §§2.19–2.21, 3.3.

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), §7.1 and (7.1.1), author DVI p.23, and proof of Proposition7.3 and Lemma7.4, pp.24–25.)

<a id="target-torsion-cohomology-hecke-action"></a>

#### Hecke on torsion coherent cohomology

Work in the Calegari–Geraghty fine-curve setting: `p` is odd, `N≥5`, `p∤N`, `Q` is squarefree with `p∤NQ`, and `X_Δ(Q)` is the specified fine quotient over a DVR `O` of residue characteristic `p`. For a prime `x∤pNQ` and `L=ω^n` or `ω^n(−C)`, `n∈ℤ`, define on `H^i(X,L⊗A)`, `i=0,1` and every `O`-module `A`,

`xT_x=tr(π₁)∘(φ*)^⊗n∘π₂*`.

The inverse Hodge isogeny map supplies negative powers, since `x` is a unit. For `y∣Q` use the analogous `U_y` correspondence with the forbidden subgroup omitted. The compactified projections, isogeny maps and trace belong to ModularCurvesPartII. The operators recover section and analytic Hecke at `i=0`, commute with coefficient maps, diamonds and one another, and yield the corresponding `O[group]`-polynomial algebra action. Torsion coefficients remain legitimate; no assertion that the operator image is torsion-free is used. This odd-`p` integral package is distinct from the all-prime field package above.

Required objects and properties:

- `T_x` on the specified coherent cohomology, with integral invertible-`x` normalization.

- Coefficient maps intertwine `T_x` and `U_y`.

- The allowed `T_x,U_y` and diamonds commute.

**Checks.**

- At `i=0` the operator is the geometric q-expansion Hecke operator.

- A nonzero boundary common eigenvector supported on the diamond orbit of `∞`, with character `ε`, has `T_x`-eigenvalue `1+ε(x)x^{n−1}`. The unrestricted all-cusp assertion is false; see the two-character boundary calculation below.

- Zero coefficient module has zero cohomology and zero operator.

*Needs:* [Diamonds on coherent cohomology](#target-diamond-cohomology-action); [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer); ModularCurvesPartII §9.1; [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions).

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.313–316.)

<a id="target-curve-fricke-map"></a>

#### The auxiliary curve Fricke map

On the auxiliary curve with `Γ₀(x)` data, construct the map on elliptic tuples

`w_x(E,α,C_x)=(E/C_x,π∘α,E[x]/C_x)`.

The quotient/contraction interface of ModularCurvesPartII §§2.6–2.7, 3.7 extends it across compactification and the compatible `Δ` quotient. If `π₁,π₂` are the degeneracy maps, prove `π₁∘w_x=π₂` and `w_x²=⟨x⟩`. The double quotient sends the level structure through multiplication by `x`; omitting that change would incorrectly call `w_x` an involution. A generic `N=5,x=2` point with `2P≠±P` tests the distinction. The supplier provides the extension of the quotient geometry; this layer constructs `w_x` and proves these identities.

Required objects and properties:

- The compactified map `w_x` induced by quotienting the auxiliary subgroup.

- `w_x` composed twice is the curve diamond map `⟨x⟩`.

- `π₁∘w_x=π₂`.

**Checks.**

- For an ordinary geometric point `(E,α,C_x)`, forgetting the subgroup after `w_x` gives `(E/C_x,π∘α)`, the second projection.

- For the same point, quotienting twice gives `(E,xα,C_x)` under `E/E[x]≅E`; the subgroup and level structure must both be tracked.

- On a fine level with a geometric point moved by `⟨x⟩`, `w_x²` is not identity. For example take `N=5`, `Q=1`, `Δ` trivial, `x=2` and a generic elliptic curve with only `±1` automorphisms: 2P is neither `P` nor `−P` for `P` of order5.

*Needs:* ModularCurvesPartII §9.1; ModularCurvesPartII §9.2; ModularCurvesPartII §§2.6–2.7, 3.7; ModularCurvesPartII §§3.1–3.2, 3.9.

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed p.314, preceding the definition of `W_x`.)

<a id="target-fricke-hodge-action"></a>

#### Fricke on Hodge powers

Pull back along `w_x` and combine it with the quotient isogeny's differential map to define `W_x` on each integer Hodge-power cohomology module with arbitrary coefficients. The square relation is

`W_x²=x^n⟨x⟩` on weight `n`.

The diamond comes from the curve square, and `x^n` comes from the double-isogeny differential [x] on `ω`. This accounts for positive, zero and negative weights, and the action is natural in coefficients. The weight-zero square is the diamond alone; weight one adds `x`. At weight two with trivial diamond action, `x>1` and a nonzero characteristic-zero module, the scalar `x²` obstructs involutivity.

Required objects and properties:

- The Hodge-power operator `W_x` induced by the constructed curve map `w_x`.

- `W_x²=x^n⟨x⟩`.

- `W_x` commutes with coefficient maps.

**Checks.**

- At `n=0`, `W_x²=⟨x⟩`.

- At `n=1`, `W_x²=x⟨x⟩`.

- At weight 2, `x>1` and trivial diamond character, on a nonzero characteristic-zero cohomology module `W_x²=x² id≠id`. On the zero module the two endomorphisms coincide; for example the genus-zero `X₁(5;2)` has zero weight-two cusp `H⁰`.

*Needs:* [Diamonds on coherent cohomology](#target-diamond-cohomology-action); [The auxiliary curve Fricke map](#target-curve-fricke-map).

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.313–316.)

### Cuspidal cohomology and boundary eigenvalues

<a id="target-cuspidal-exact-sequence-equivariance"></a>

#### The equivariant cuspidal sequence

Start from `0→ω^n(−C)→ω^n→ω^n|_C→0`. In the fine integral curve setting the cusp quotient is `O`-flat, so tensoring with any `O`-module `A` gives the required exact sequence and its coherent-cohomology long exact sequence. Diamonds and allowed Hecke correspondences commute with inclusion, restriction and the connecting maps, using their actual cusp-preserving geometry and trace. This permits localization of the entire sequence at a common eigensystem; it does not require restriction in degree zero to be onto.

*Needs:* [Hecke on torsion coherent cohomology](#target-torsion-cohomology-hecke-action); [Diamonds on coherent cohomology](#target-diamond-cohomology-action); [Cusp forms and the cusp ideal](#target-cusp-ideal-section-forms).

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.313–316.)

<a id="target-boundary-eigensystems-are-eisenstein"></a>

#### Eisenstein boundary eigensystems

In the fine auxiliary-curve setting of the torsion coherent Hecke action, pass to the residue field and consider a simultaneous good-prime Hecke and diamond eigensystem on `H⁰(C,ω^n|_C)`. Its eigenvalues have the form

`a_x=ψ₁(x)+ψ₂(x)x^(n−1)`,  `ψ₁ψ₂=ε`,

where `ψ₁` and `ψ₂` are finite-order prime-to-`p` characters and `ε` is the diamond character. The associated semisimple representation is `ψ₁⊕ψ₂χ̄_p^(n−1)`. Compute this with the full finite cusp-type decomposition and its actual Tate level structures. On the diamond orbit of infinity the formula specializes to `1+ε(x)x^(n−1)`; over zero it is `ε(x)+x^(n−1)`. Other cusp types can have both characters nontrivial, and an eigenvector can be zero on entire other orbits.

Consequently the boundary term vanishes upon localization at an absolutely irreducible residual eigensystem, using semisimple characteristic-polynomial recognition. The unrestricted single-orbit formula in CG18 Remark 3.4 is insufficient for the full boundary. The conclusion uses the character decomposition, not diamond transitivity on all cusps.

*Needs:* [The equivariant cuspidal sequence](#target-cuspidal-exact-sequence-equivariance); [Diamonds on coherent cohomology](#target-diamond-cohomology-action); ModularCurvesPartII §§4.1–4.4; ArithmeticGaloisRepresentations §§5.1, 5.7.

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Remark3.4, printed p.316; full-boundary character calculation as stated here.)

### Examples

For `Δ`, `T₂` has first coefficient `−24`. At level one in characteristic two the form `AΔ` has weight 13 and is nonzero, but the characteristic-zero odd-weight cusp lattice is zero, so its reduction image is zero. For a weight-three boundary character `ε(3)=−1` modulo 5, the infinity eigenvalue is `1−3²=2` while the zero-cusp eigenvalue is `−1+3²=3`.

### Dependencies

R15.1; ModularCurvesPartII §§5.21, 9.1–9.3, 9.9–9.11; SchemeAndStackFoundations §§2.19–2.21, 4.8–4.9; ModularForms Layers 4, 8 and 8W; ArithmeticGaloisRepresentations §§5.1, 5.7. The strong principle additionally uses the ordinary congruence target of R15.3.

<a id="layer-r15-3"></a>

## Layer R15.3 — Hasse, theta and weight operations

In characteristic `p` the Hasse section changes weight without changing its q-expansion, while theta changes Hecke eigenvalues by a cyclotomic factor. The Igusa interpretation fixes their geometric meaning. Weight reduction uses finite supersingular sections, their twisted periodicity and the cohomological boundary map; no semisimplicity of the Hecke action is assumed. Small-prime tables and torsion weight-one operators are stated separately from the generic case.

### The Hasse section and differential operations

<a id="target-hasse-invariant-as-a-form-of-weight-p-minus-one"></a>

#### The elliptic Hasse invariant

For an elliptic curve in characteristic `p`, choose an invariant differential `ω` and the Serre-dual basis `η` of `H¹(O_E)`. Absolute Frobenius acts `p`-linearly by `F(η)=A(E,ω)η`. Replacing `ω` by `λω` multiplies that scalar by `λ^(1−p)`, so it defines a section `A` of `ω^(p−1)`. The Tate expansion is 1. The rank-one scalar calculation gives `λF(λ⁻¹)=λ^(1−p)F(1)` for a Frobenius-semilinear map `F:A→A` over a commutative characteristic-`p` ring and a unit `λ`. Compare this elliptic section with the imported general `BT₁ determinant(V*)` construction, keeping the determinant-line and dual-Frobenius conventions. The general Hasse determinant remains owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.21. The mod-five `E₄` expansion, the failure of a level-one characteristic-two weight-one lift, and filtration zero of the expansion 1 test the specialization.

Required objects and properties:

- `A(E, ω) ∈ R` defined by `F_abs(η) = A(E, ω)η`, `η` dual to `ω`, for `E` over an `𝔽_p`-algebra `R`.

- `A(E, λω) = λ^{1−p}A(E, ω)`: `A` is a level-one form of weight `p − 1` over `𝔽_p`.

- `A(Tate(q), ω_can) = 1`.

**Checks.**

- At `p=5` the weight-four Hasse section equals `E₄` modulo 5 by the q-expansion principle; its coefficient check is `5∣240`.

- In characteristic two `A` has no holomorphic level-one lift over `ℚ∩ℤ₂` in weight one. Fine-level lifting in odd `3≤n≤11` and its pullbacks to multiples are stated separately above.

- `A` has q-expansion 1, the q-expansion of the constant form of weight 0, so its filtration is `w(A) = 0`.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Level-one and level-two descent](#target-level-one-and-two-by-descent-with-explicit-inverted-primes); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.21.

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.0, printed p. 97 (Katz running mark Ka-29); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.0, printed pp. 97-98 (Katz running mark Ka-29/30).)

<a id="target-deligne-congruence-and-the-explicit-p-equals-2-3-liftings"></a>

#### Deligne congruence and small-prime lifts

Use the analytic normalized Eisenstein series `E_k=1−(2k/B_k)Σ_(m≥1)σ_(k−1)(m)q^m` for even `k≥4`. For `p≥5` the coefficient multiplier `−2(p−1)/B_(p−1)` has `p`-adic valuation one. Thus `E_(p−1)` is `p`-integral and reduces to the Hasse section `A` by equality of weight and q-expansion. The Bernoulli integrality input is required independently of geometric base change.

For `p=2` or 3 the Hasse section has no holomorphic level-one characteristic-zero lift in its own weight. In characteristic two, fine-level weight-one base change produces lifts for odd `3≤n≤11`; pullback supplies levels divisible by `3,5,7` or 11. This statement makes no general lifting claim for the other odd levels. In characteristic three, weight-two lifts exist for all `n≥2` prime to 3, with `n=2` using the level-two theorem. The level-one integral `E₄` instead lifts `A⁴` at `p=2` and `A²` at `p=3`. The powers, weights and level hypotheses remain distinct.

*Needs:* [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); [The q-expansion principle](#target-q-expansion-principle-and-its-vanishing-theorem); [Holomorphic base change](#target-base-change-for-spaces-of-forms-and-the-weight-one-boundary); [ModularForms Layer 0](../ModularForms/README.md#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus); [Level-one and level-two descent](#target-level-one-and-two-by-descent-with-explicit-inverted-primes).

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.1, printed p. 98 (Katz running mark Ka-30); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.1, printed pp. 98-99 (Katz running mark Ka-30/31); [Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Remark in 2.1, printed p. 99 (Katz running mark Ka-31).)

<a id="target-theta-operator-filtration-and-hecke-commutation"></a>

#### Theta and filtration

Define the series operation `Θ` on `PowerSeries A` by coefficient `n` equal to `n a_n` for a commutative ring `A`. Require the coefficient formula, the derivation law, vanishing on pth powers in characteristic `p`, and the formal weight-shifted Hecke relation: over every commutative coefficient ring, `T_(ℓ,ℓ²c,d)(Θf)=ℓ Θ(T_(ℓ,c,d)f)`, with the formal coefficient model of R15.2. The series operator agrees with `q` times Mathlib's formal derivative and is distinct from the geometric form operator with degree `p+1`. For the geometric Hecke comparison, the shift from `ℓ^(k−1)` to `ℓ^(k+p)` equals multiplication by `ℓ²` in characteristic `p`, for prime `p` and `ℓ≠p`. Vanishing on pth powers carries prime `p` and `CharP A p` as hypotheses. (Katz 1977, §II, pp.55–56; Edixhoven §3.1, author DVI p.7.)

**Checks.**

- On `q²` over `ℤ` its value is `2q²`. With `ℓ=2,c=d=1`, the formal Hecke/theta identity has both sides `2q+8q⁴`, exhibiting its characteristic-zero case.
- On 1 its value is zero, although 1 is nonzero over a field.
- In characteristic `p` it kills `q^p`; on `Δ` modulo 5 its coefficient two is 2.

Let `M(N)=⊕_(k≥0)M_k(N,𝔽̄_p)`, with `p∤N`. For nonzero homogeneous `f` of weight `k` define `w(f)` as the least weight `k−i(p−1)` for which `f` is divisible by `A^i`. Equivalently it is the smallest weight admitting the same expansion on the relevant component; this uses the graded expansion kernel `(A−1)` and the componentwise q-expansion principle. Use the total convention `w(0)=0`. The API proves minimality of `w(f)`, `w(f)≤k`, equality `w(f)=k` when `A` does not divide `f`, and invariance under multiplication by `A` when expansions are compared. As filtration Checks: `w(1)=0`; `w(A)=0` despite its positive Hodge weight; and `Δ` modulo 5 has filtration 12 since it is nonzero at the supersingular points, so removing an `A` factor is impossible.

Construct a derivation `θ` of degree `p+1` whose normalized expansion is `q d/dq`. If `w(f)=k` and `p∤k`, then `w(θf)=k+p+1`. If `f` has weight `pk` and `θf=0`, then `f=g^p` for a unique weight-`k` form `g` over `𝔽̄_p`. On `Tate(t^n)`, `θ(t^i)=(i/n)t^i`, agreeing with `KS(ω_can²)=n dt/t`; this does not identify the parameters `t` and `q`.

In Edixhoven's normalization `T_ℓ^*θ=ℓθT_ℓ^*`, including `T_p^*θ=0`. For `θf≠0`, an eigenform of type `(N,k,ε)` with eigenvalues `a_ℓ` becomes one of type `(N,k+p+1,ε)` with eigenvalues `ℓa_ℓ`. Once the representations have been attached by [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems), semisimple recognition gives `ρ_(θf)≃ρ_f⊗χ̄_p`. Attachment is needed for this consequence, not for constructing `θ`.

Required objects and properties:

- `w(f) = min{k − i(p − 1) : f ∈ A^i M(N, k − i(p − 1))}`.

- The derivation `θ : M(N) → M(N)` of degree `p + 1` acting by `q d/dq` on every q-expansion.

- If `w(f) = k` and `p ∤ k` then `w(θf) = k + p + 1`.

- `T_l^*(θf) = l θ(T_l^* f)`; for an eigenform `f` with `θf≠0` and residual attachments satisfying the reduction-image or justified-shift hypotheses, `ρ_{θf} = ρ_f ⊗ χ`.

**Checks.**

- `θ(∑a_nq^n) = ∑ n a_n q^n`; for `Δ` mod 5 the coefficient of `q²` in `θΔ` is `2·τ(2) = −48 ≡ 2`.

- `θ(g^p) = 0` although `g^p ≠ 0`: `θ` is not injective, and the kernel in weight `pk` consists of `p`-th powers.

- `θA = 0`, as `A` has constant q-expansion 1.

*Needs:* [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions); [The q-expansion principle](#target-q-expansion-principle-and-its-vanishing-theorem); [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer). For the representation consequence only: [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 3.1, p. 7 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 3.1, p. 7 of the DVI.)

<a id="target-frobenius-verschiebung-on-expansions"></a>

#### Coefficient-linear `U` and `V`

On expansions use the coefficient-linear `V` of the exact Mathlib supplier contract and the residue-zero Cartier specialization `U(Σa_mq^m)=Σa_(pm)q^m`. For every commutative ring `A`, this is an `A`-linear map on `PowerSeries A`, with the same coefficient equation as the residue-zero case of the later `PowerSeries.coeff_cartier`. Then `UV=1` for `p>0`. The formal weight-one identity is `T_(p,1,d)(f)=U(f)+dV(f)`. Absolute Frobenius instead sends `f` to `f^p`, with coefficients `a_m^p`. These maps coincide only under the appropriate coefficient restriction; the field `𝔽₂(t)` distinguishes them immediately. The geometric meaning of the form operations uses relative Frobenius and Verschiebung of elliptic curves and the actual modular correspondence.

Prove `Θ(V(f))=p V(Θ(f))` over every commutative coefficient ring for `p>0`, where `Θ` is the series operator `q d/dq`. Its characteristic-`p` specialization gives `Θ(V(f))=0`. The scalar `p` cannot be dropped for torsion coefficients.

The Hecke formula is `T_p=U+p^(k−1)⟨p⟩V`. In characteristic `p` it reduces to `U` for `k≥2`, while in weight one it remains `U+⟨p⟩V`. Defining `U` on arbitrary series is not a proof that it preserves a specified geometric form space; that assertion uses its correspondence or the weight-one construction.

Required objects and properties:

- The residue-zero Cartier linear map on formal power series.

- `U(V(f))=f` for `p>0`, with `V` supplied by `PowerSeries.expand`.

**Checks.**

- `V(q)=q^p` and `U(q^p)=q`.

- Over `𝔽₂(t)`, `V(tq)=tq²` while `(tq)²=t²q²`.

- Over `ℤ/9` with `p=3`, `Θ(V(q))=3q³≠0`, whereas over `𝔽₃` it is zero.

- Over `ℤ`, `V(q²)=q^(2p)` and `Θ(V(q²))=2p q^(2p)=p V(Θ(q²))`; the identity holds for arbitrary series coefficient by coefficient.

- For `p>0`, `U` and `V` fix constants. For `p≥2`, `U(q)=0` although `q≠0` over a nonzero ring, so `U` is not injective.

- At `p=0`, every coefficient of `U₀(f)` equals the constant coefficient of `f`, as for the general Cartier operator at modulus zero; the expansion and left-inverse identities require `p>0`.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions); [EllipticCurves Layer 3](../EllipticCurves/README.md#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1).

([Katz 1977](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), II, Theorem and Corollaries, printed pp.55–56; [Calegari–Geraghty 2020](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Lemma 8.14, local p.66 (final p.866).)

<a id="target-igusa-interpretation-of-hasse-and-theta"></a>

#### The Igusa interpretation

On the ordinary Igusa cover the tautological invariant differential a trivializes `ω` and satisfies `a^(p−1)=A`. A weight-`k` form divided by `a^k` has the inverse kth-power deck character. The unit-root splitting of de Rham cohomology and the normalized Kodaira–Spencer map define the ordinary differential operator. Multiplication by `A` extends it across the Hasse divisor to `θ` on the compactified form spaces. ModularCurvesPartII §11.1 supplies the Verschiebung-generator cover and its compactification. This target constructs its tautological differential, identifies the full unit-group deck action and proves the form and deck-character comparisons. For the tower modulo `p^m`, build the full unit monodromy comparison used by ordinary weight congruences, retaining auxiliary rigidifying level before effective stabilizer quotients. The small-prime construction uses that geometry and does not divide by 6.

The API includes `a^(p−1)=A` on the ordinary locus; the deck action of `𝔽_pˣ`, with `u` acting by `a↦ua`, and the resulting character `u↦u^(−k)` on `f/a^k` for weight-`k` forms `f`; the identification of the ordinary differential operator times `A` with `θ` on q-expansions; and, modulo `p^m`, the full unit monodromy `(ℤ/p^m)ˣ` on the tower.

**Checks.**

- At `p=5` the deck element `u=2` sends `f/a` to `2⁻¹f/a=3f/a` for weight-one `f`; the direct character `u↦u` would give `2f/a`.
- At `p=3` the nontrivial deck element `u=−1` sends `a↦−a` and `f/a↦−f/a`, while `a²=A` is fixed.
- At `p=5`, `a⁴=A` is deck-invariant because `2⁴=16≡1`, consistent with `A` descending to the base.
- In characteristic 2 on a width-three Tate chart, `θ(t)=(1/3)t=t`, since `3≡1`; the construction uses no inverse of 2 or 3.

*Needs:* [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer); ModularCurvesPartII §11.1.

([Katz 1977](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), II, Theorem and Corollaries, printed pp.55–56.)

### Ordinary weight congruences and weight one

<a id="target-weight-congruences-on-the-ordinary-tower"></a>

#### Ordinary weight congruences

Define the ordinary weight divisor `D_(p,m)` by the following displayed formulas for primes `p` and `m≥1`; the total arithmetic function uses the same expressions outside that range without a geometric interpretation. Compute the odd-prime and three dyadic branches and identify the divisor with the exponent of `(ℤ/p^m)×`. (Katz 1973, §§4.4.1–4.4.2, pp.151–152.)

Identify it with Mathlib's `Monoid.exponent (ZMod (p^m))ˣ` for prime `p` and `m≥1`.

**Checks.**

- At `p=5,m=2` the divisor is 20.
- At `p=2,m=1` it is 1; at `m=2` and `m=3` it is 2 in both cases.
- At `p=2,m=4` it is 4; substituting 2 in the odd-prime formula would incorrectly give 8.

On the ordinary tower modulo `p^m`, `m≥1`, a weight-`k` form with expansion 1 is horizontal exactly when `D_(p,m)` divides `k`, where

`D_(p,m)=(p−1)p^(m−1)` for odd `p`,

`D_(2,1)=1`, `D_(2,2)=2`, `D_(2,m)=2^(m−2)` for `m≥3`.

If two weights give congruent expansions and at least one coefficient is nonzero modulo `p`, their weights are congruent modulo this divisor. After identifying the horizontal section, the equality is checked on every component through a tested cusp. Use the full unit-group monodromy of the ordinary Igusa tower. In particular the dyadic exponent is not obtained by substituting `p=2` in the odd-prime formula.

*Needs:* [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); ModularCurvesPartII §11.1.

([Katz 1973](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 4.4.1–4.4.2, printed pp.151–152 (Katz running mark Ka-83/84).)

<a id="target-torsion-section-socles"></a>

#### Socles of torsion section modules

Prove the following socle criterion: for a commutative ring `O`, an element `ϖ`, an `O`-module `M` with `Module.IsTorsion' M (Submonoid.powers ϖ)`, and an `O`-linear map `F:M→P`, injectivity on `M[ϖ]` implies injectivity on `M`. No torsion assumption on `P` is needed. Indeed, a nonzero kernel element killed by a least power `ϖ^r` yields a nonzero kernel element `ϖ^(r−1)x` killed by `ϖ`.

For a DVR `O` with residue field `κ`, a flat fine modular curve `X/O`, an invertible sheaf `L=ω^n` or `ω^n(−C)`, and `m≥1`, identify

`H⁰(X,L⊗O/ϖ^m)[ϖ] ≃ H⁰(X_κ,L_κ)`.

The coefficient injection `κ→O/ϖ^m` is multiplication by `ϖ^(m−1)`. Flatness of `L` over `O` identifies the sheaf kernel of multiplication by `ϖ` with `L_κ` through this injection; left exactness of `H⁰` gives the section-space identification. This is not reduction of integral sections and does not require `H¹(L)[ϖ]=0` or weight-one liftability. It commutes with coefficient-linear integral Hecke maps and diamonds, and with direct sums used in doubling.

**Checks.**

- For `m=1` the identification is the identity on special-fibre sections.
- For `O=ℤ₃,m=2,L=O_X`, the coefficient socle is `3ℤ/9≃𝔽₃` through `a↦3a`; reduction modulo 3 of that socle is zero.
- A special-fibre weight-one section need not lift integrally, but still gives a socle section by this injection.
- Without power torsion the criterion fails: the zero map `K→0` has zero source socle and is not injective, where `K` is the fraction field of a DVR.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [Functorial coefficient maps](#target-coefficient-maps); [Hecke on torsion coherent cohomology](#target-torsion-cohomology-hecke-action).

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), proof of Theorem3.11, printed pp.327–328, socle reduction; the coefficient-kernel and least-power arguments above.)

<a id="target-weight-one-tp-with-torsion-coefficients"></a>

#### Weight-one `T_p` with torsion coefficients

Take `p≥3`, `N≥5` with `p∤N`, a DVR `O` of residue characteristic `p`, and coefficients `O/ϖ^m` with `m≥1`. Import ModularCurvesPartII §9.11 `coherentHecke` and `coherentHecke_baseChange` for the weight-one `T_p` on the actual `Γ₁(N)` section space, including these torsion coefficients, and compare its normalization with Gross's operator: its expansion is `U+⟨p⟩V`. Choose an integral Hasse power `A_m` congruent to 1 modulo `ϖ^m` and high enough to reach weight `k′` for which `p^(k′−1)` and the required cyclotomic-power differences vanish modulo `ϖ^m`. Multiplication gives `φ` into that one high-weight space. The two doubling maps are `φ` and `φT_p−U_highφ`; the second has expansion `⟨p⟩Vf`, and both maps have the same target Hodge weight.

Prove that `ψ(f,g)=φf+(φT_p−U_highφ)g` is injective by restricting its kernel to the source `ϖ`-torsion and using [Socles of torsion section modules](#target-torsion-section-socles). Identify that socle with two copies of the characteristic-`p` weight-one section space. On their expansions `φ` is the identity, so a kernel relation becomes `f+⟨p⟩Vg=0`. Only here does theta kill the `V` term. Katz theta is injective in weights 1 through `p−2`, hence `f=0`; coefficient selection `UV=1` and the invertible diamond give `g=0`. The torsion-module criterion then proves injectivity over `O/ϖ^m`. This uses neither a geometric theta operator on `O/ϖ^m` nor vanishing of the formal theta of `V` there. Section preservation, level and coefficient compatibility come from the integral coherent Hecke supplier.

**Checks.**

- At `p=3` the socle argument uses the injective weight-one theta map, since `1=p−2`.
- At `m=1` the entire doubling source is the characteristic-`p` section space, and theta kills its `V` contribution directly.
- At `O=ℤ₃,m=2`, formal theta sends `V(q)` to `3q³≠0`; injectivity is instead tested on the socle and then extended to the whole source.

*Needs:* [Socles of torsion section modules](#target-torsion-section-socles); ModularCurvesPartII §9.11; [Coefficient-linear U and V](#target-frobenius-verschiebung-on-expansions); [Theta and filtration](#target-theta-operator-filtration-and-hecke-commutation); [Deligne congruence and small-prime lifts](#target-deligne-congruence-and-the-explicit-p-equals-2-3-liftings); [Hecke on torsion coherent cohomology](#target-torsion-cohomology-hecke-action).

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Proof of Theorem3.11, printed pp.327–328; [Calegari–Geraghty 2020](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Lemma 8.14, local p.66; [Katz 1977](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), II, Theorem and Corollaries, printed pp.55–56.)

### Supersingular sections, Fricke and duality

<a id="target-supersingular-section-space"></a>

#### Supersingular section spaces

Let `p∤N`, `N≥5`, and work over `𝔽̄_p`. The elliptic Hasse zero locus `Z⊂X₁(N)` is finite and reduced, with each zero simple; prime-to-`p` isogenies preserve it. For every `k∈ℤ` define

`SS_k=H⁰(Z,ω^k|_Z)≃⊕_(z∈Z)ω_z^k`.

Evaluation at each point gives extensionality. Restriction of global forms and the fibrewise tensor-product identifications define the restriction and multiplication maps. For primes `ℓ∤pN`, the `T_ℓ^*` action is induced from the restricted good-prime correspondences. The exact sheaf sequence is `0→ω^(k−p+1)→ω^k→ω^k|_Z→0`, with the first map multiplication by `A`. The full supersingular locus here is nonempty. For a general empty finite locus the section space is zero; on this supersingular locus negative-weight fibres still have sections, and weight-zero sections are arbitrary functions on `Z` rather than only constants. Prove the simple-zero assertion for the elliptic Hasse section using the supplied local Igusa geometry and its deformation parameters; a direct-sum description alone does not prove it.

Required objects and properties:

- `SS_k` is the section module of `ω^k` on the actual finite reduced supersingular locus, with evaluation at each point.

- The `K`-linear evaluation `SS_k→ω_x^k` is the `x`-component of its finite direct-sum description.

- Two supersingular sections are equal iff their values at every supersingular point agree.

- Restricting a global modular form evaluates it on the actual Hodge fibres at all supersingular points; the map is linear.

- Pointwise tensor product gives `SS_a×SS_b→SS_(a+b)` using the Hodge-power identifications; multiplication by a fixed section is linear and detected on every fibre.

**Checks.**

- At `p=2,N=5` the supersingular locus on `X₁(5)` has one point, so `dim SS_k=1` for every integer `k`, including `k<0`. The unique supersingular elliptic isomorphism class has 24 automorphisms acting freely on its 24 points of exact order 5.

- At weight zero, two distinct supersingular points allow different values; the space is all functions on the finite set, not just constants.

- On a nonempty finite supersingular locus every Hodge power, including negative weights, has a nonzero section after fibre trivializations; this contrasts with global negative-weight forms.

*Needs:* [Geometric modular forms](#target-hodge-bundle-with-tate-curve-normalization); [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); [All-prime field coherent Hecke and trace duality](#target-field-coherent-hecke-action); ModularCurvesPartII §11.1.

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 7.1, equation7.1.1, author DVI p.23.)

<a id="target-supersingular-hecke-twisted-periodicity"></a>

#### Twisted supersingular periodicity

Differentiate the Hasse section to first order at its simple zero divisor and use Kodaira–Spencer to obtain a nowhere-zero `B∈SS_(p+1)`. Multiplication by `B` identifies `SS_k` with `SS_(k+p+1)` for every integer `k`, and satisfies

`T_ℓ^*(Bf)=ℓ B T_ℓ^*(f)`,  `ℓ` prime and `ℓ∤pN`.

Hence multiplication by `B^(p−1)` gives a good-prime Hecke-equivariant period `p²−1`. The weight-`(p+1)` comparison has a Hecke twist, and `B` is a section only on the supersingular points; no global form with constant expansion 1 is asserted. The construction uses the simple Hasse divisor, its restricted line and the isogeny compatibility of KS. This target is on `X₁(N)`, with no auxiliary `Q` or `U` operators.

**Checks.**

- At `p=2,N=5,ℓ=3`, `B` has weight3 and `T₃^*(Bf)=B T₃^*(f)`, since `3=1` in characteristic two.
- At `p=5` four multiplications give weight period24 and remove the twist because `ℓ⁴=1` in characteristic five for every good prime `ℓ`.
- At `N=5` the displayed `T_ℓ^*` identity excludes `ℓ=5`; it makes no assertion about the bad-level `U₅` correspondence.

*Needs:* [Supersingular section spaces](#target-supersingular-section-space); [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer); [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one); [All-prime field coherent Hecke and trace duality](#target-field-coherent-hecke-action).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition7.2 and its second proof, author DVI pp.23–24.)

<a id="target-edixhoven-root-fricke-operator"></a>

#### The root-dependent Hodge Fricke operator

Over a field of any characteristic prime to NQ containing `ζ_(NQ)`, or after extending `O` to contain `ζ_(NQ)` with NQ a unit in `O`, use the supplied root-dependent curve map `w_ζ` and its universal NQ-isogeny. Combine curve pullback with the isogeny differential on integer Hodge powers to define `W_ζ` on the actual cohomology modules, respecting the `Δ` quotient. It is natural in all coefficient modules, including `O/ϖ^m` and `K/O`, and has a dual action by precomposition `λ↦λ∘W_ζ`. At weight zero the Hodge factor is the identity and the operation is curve pullback. Its dual evaluation identity fixes the convention needed by the twisted duality below. Replacing `ζ` by `ζ⁻¹` negates the dual-kernel generator; the resulting `−1` isomorphism acts by `−1` on `ω`, so `W_(ζ⁻¹)=(−1)^n W_ζ` in weight `n` even though the coarse curve maps coincide. The curve construction is imported; this target supplies the Hodge and coefficient-module action.

Required objects and properties:

- Section pullback by `w_ζ` followed by the universal isogeny map on `ω^n`.

- `W_ζ` commutes with natural maps of coefficient modules.

- The action on a functional `λ` is `λ∘W_ζ`.

- `W_ζ^∨λ(f)=λ(W_ζ f)`, the evaluation formula for precomposition.

**Checks.**

- At weight0 the isogeny map on the trivial line is identity, so `W_ζ` is curve pullback.

- The coefficient square commutes after `O→O/ϖ^m` and after `O→K/O`; flatness of these coefficient modules is not assumed.

- At weight one `W_(ζ⁻¹)=−W_ζ` although the coarse curve maps coincide. Over a field of characteristic different from two, `λ(W_ζ f)≠0` implies `λ(W_(ζ⁻¹)f)≠λ(W_ζ f)`, detecting the Hodge sign in the dual action.

*Needs:* ModularCurvesPartII §9.3; [Functorial coefficient maps](#target-coefficient-maps); [Fricke on Hodge powers](#target-fricke-hodge-action).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), §7, between (7.2.1) and Proposition7.3, author DVI p.24; [Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.4, printed pp.322–323.)

<a id="target-twisted-serre-duality-hecke"></a>

#### Twisted duality and the supersingular boundary

For the odd-`p` torsion package on the fine `X_Δ(Q)`, enlarge `O` to contain `ζ_(NQ)`. Under the relative coherent Serre-duality and finite-free/base-change hypotheses, combine duality with KS and the dual Hodge action `W_ζ` to obtain

`Φ:H¹(X,ω^(2−n)(−C)⊗K/O) ≃ Hom_O(H⁰(X,ω^n),K/O)`.

For good primes `x∤pNQ` its twisted Hecke identity is `ΦT_x=x^(1−n)T_x∨Φ`. Separately, for the selected auxiliary primes `y∣Q` it satisfies `ΦU_y=y^(1−n)U_y∨Φ`, and `Φ⟨a⟩=⟨a⟩∨Φ` in this convention. The scalar is 1 when `n=1`. Bare Serre duality does not supply these identities. SchemeAndStackFoundations §§2.19–2.21 supply proper adjunction, trace and relative duality. This target also builds their `K/O`-coefficient specialization and finite-flat correspondence comparison under the stated finite-free and base-change hypotheses; field-only duality is insufficient.

Separately, let `p` be any prime, `N≥5` with `p∤N`, and `X=X₁(N)` over `𝔽̄_p`, with a chosen primitive Nth root `ζ`. For every `n∈ℤ`, field Serre duality, KS and the dual root-Fricke action give

`Φ_n:H¹(X,ω^(2−n)(−C))≃Hom_𝔽̄_p(M_n,𝔽̄_p)`,

with `Φ_n T_ℓ^*=ℓ^(1−n)(T_ℓ^*)∨Φ_n` for primes `ℓ∤pN` and the transported diamond identity. Prove this using the field correspondence/trace adjunction above and the Hodge isogeny scaling; it requires no integral `K/O` comparison. The same construction with the cusp twist exchanged gives `H¹(X,ω^(2−n))≃S_n∨` and the same Hecke scalar. Both comparisons commute with field extension.

For the Hasse sequence, take `n=p+1−k`. Its connecting map followed by the second comparison gives `Φ:SS_k→S_(p+1−k)∨` and an exact sequence `M_k→SS_k→S_(p+1−k)∨`. Here the cusp twist belongs on the dual target, and `Φ` need not be an isomorphism. For primes `ℓ∤pN` the relation is `ΦT_ℓ^*=ℓ^(k−1)(T_ℓ^*)∨Φ`, since `ℓ^(−p)=ℓ^(−1)` in characteristic `p`. This all-prime field sequence is the supersingular boundary input to weight reduction.

**Checks.**

- At `p=2,N=5,ℓ=3`, supersingular restriction, the Hasse connecting map and `Φ` are defined; `ΦT₃^*=(T₃^*)∨Φ` because every integer power of 3 is 1 in `𝔽̄₂`.
- For `n=1` the duality scalar is 1, both in the field comparison and in the odd-`p K/O` comparison.
- If `k>p+1`, the dual cusp space has negative weight and vanishes, so the exact sequence makes `M_k→SS_k` surjective; it does not make `Φ` an isomorphism.
- At an auxiliary prime `y∣Q` only the separately constructed `U_y` identity in the odd-`p` integral package applies; the field `X₁(N)` statement uses good primes only.

*Needs:* [Hecke on torsion coherent cohomology](#target-torsion-cohomology-hecke-action) for the odd-`p K/O` assertion; [Logarithmic Kodaira–Spencer](#target-logarithmic-kodaira-spencer); [All-prime field coherent Hecke and trace duality](#target-field-coherent-hecke-action); [The root-dependent Hodge Fricke operator](#target-edixhoven-root-fricke-operator); SchemeAndStackFoundations §2.19; SchemeAndStackFoundations §§2.19–2.21; SchemeAndStackFoundations §§2.20–2.21, 3.3; [Supersingular section spaces](#target-supersingular-section-space); [Cusp forms and the cusp ideal](#target-cusp-ideal-section-forms); SchemeAndStackFoundations §2.20.

([Calegari–Geraghty 2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.4, after Lemma3.7, printed pp.322–323; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition7.3 and Lemma7.4, author DVI pp.24–25.)

### Theta cycles and weight reduction

<a id="target-theta-cycles-and-the-small-characteristic-tables"></a>

#### Theta cycles

Define the finite arithmetic theta-cycle tables below, indexed by prime, weight and ordinarity. Rows outside their displayed admissible ranges are absent. Prove the small-prime boundary values and the length statement: for `p>3` prime, `1≤k≤p+1` and an admissible ordinarity row, the list exists and has length `p−1`. The geometric cycle theorem identifies this arithmetic list with actual filtrations; the tables themselves do not classify a representation or construct theta. (Edixhoven Proposition 3.3, author DVI pp.8–9.)

**Checks.**

- The `p=2,k=3` nonordinary row is absent, while the ordinary row is `[6]`.
- At `p=3,k=2` the nonordinary row is `[6,2]`, and `k=3` nonordinary gives `[3,3]`.
- At `p=3,k=1` both rows give `[5,9]`, with two entries rather than an extrapolated `p>3` formula.
- For `p=5,k=2` nonordinary the large table gives `[8,14,20,2]`, with four entries.
- For `p=5,k=2` ordinary it gives `[8,14,20,10]`, distinguishing the final drop from the nonordinary row.
- The large-table nonordinary `k=p+1` row is absent; no witness is obtained from that input.
- The large table returns `none` at `p=2,k=1` ordinary and at `p=0,k=1` ordinary: its domain requires `p` prime and `p>3`.

For homogeneous `f` with `θf≠0`, define its theta cycle as `(w(θf),…,w(θ^(p−1)f))`. For `p>3` the general shapes, up to cyclic permutation, are

* `(h,h+(p+1),…,h+(p−2)(p+1))`, with `h≡2 mod p`;
* `(h,h+(p+1),…,h+(p−h₀)(p+1),h₁,h₁+(p+1),…,h₁+(h₀−3)(p+1))`, with `h≡h₀ mod p`, `3≤h₀≤(p+3)/2` and `h₁=h+p+3−2h₀`.

For `p=2` the single entry is even. For `p=3` the possible shapes are `(h,h+4)` with `h≡2 mod 3` or `(h,h)` with `h≡0 mod 3`. These are separate small-prime statements.

For a cuspidal eigenform of type `(N,k,ε)`, require `1≤k≤p+1`, `w(f)=k` and `θf≠0`. The following table gives the full `p>3` cycle. Write `P(a,r)=(a,a+(p+1),…,a+(r−1)(p+1))`, interpreting `r=0` as the empty list, and use concatenation in the entries.

| `a_p` | `k` | Cycle |
| --- | --- | --- |
| 0 | 1 | `P(p+2,p−1)` |
| 0 | 2 | `P(p+3,p−2)`, then 2 |
| 0 | `3≤k≤p−1` | `P(k+p+1,p−k)`, then `P(p+3−k,k−2)`, then `k` |
| 0 | `p` | `P(3,p−2)`, then `p` |
| 0 | `p+1` | Does not occur under these hypotheses |
| nonzero | 1 or `p` | `P(p+2,p−1)` |
| nonzero | `2≤k≤p−1` | `P(k+p+1,p−k)`, then `P(2p+2−k,k−1)` |
| nonzero | `p+1` | `P(2p+2,p−1)` |

The explicit small-characteristic eigenform tables are:

| `p` | `k` | `a_p=0` | `a_p≠0` |
| --- | --- | --- | --- |
| 2 | 1 | `(4)` | `(4)` |
| 2 | 2 | `(2)` | `(4)` |
| 2 | 3 | Does not occur | `(6)` |
| 3 | 1 | `(5,9)` | `(5,9)` |
| 3 | 2 | `(6,2)` | `(6,6)` |
| 3 | 3 | `(3,3)` | `(5,9)` |
| 3 | 4 | Does not occur | `(8,12)` |

The proof interface includes the general theta-cycle argument (Jochnowitz 1982, §7) and the filtration drop calculation, in addition to the geometric theta construction. Evaluating a finite list of integers alone does not prove that an actual eigenform has that cycle.

*Needs:* [Theta and filtration](#target-theta-operator-filtration-and-hecke-commutation).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 3.2, p. 8 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition 3.3 and its proof, pp. 8-9 of the DVI.)

<a id="target-weight-reduction-to-at-most-p-plus-one"></a>

#### Weight reduction to at most `p+1`

For an eigenform `f` of type `(N,k,ε)`, with `p∤N`, find an eigenform `g` of type `(N,k′,ε)` and an integer `0≤i≤p−1` such that `k′≤p+1` and `f` and `θ^ig` have the same `T_ℓ^*` eigenvalues for primes `ℓ∤pN`. The claim controls that good-prime eigensystem, not its `T_p` eigenvalue.

At `N≥5` the proof uses the Hasse cohomology sequence, the weight-`(p+1)` supersingular periodicity with its Hecke twist and the boundary comparison `SS_k→S_(p+1−k)∨`. To extract eigenvectors, use support over the finite-dimensional commutative image algebra and its preservation by field duality; a semisimple Hecke action is unnecessary. Smaller levels are obtained through rigidifying covers and `G`-invariants only when `p∤#G`. The exceptional `N=1,p=2,3` cases require Serre's level-one weight reduction (Serre 1975, Théorème 3, printed p.114), as an additional source input. These form-theoretic operations do not themselves prove universal residual modularity or optimize the classical target.

Prove this support comparison for a finite-dimensional commutative `κ`-algebra acting on a finite-dimensional `κ`-space and its field dual. The dual action is specified by transposing each operator.

**Checks.**

- At `p=2,N=5` the field sequence and twisted duality use `T₃^*`, and the reduced weight bound is `k′≤3`; no odd-`p` torsion package is required.
- A nonsemisimple finite Hecke image, such as `κ[t]/(t²)` acting on itself, has the same support as its field dual. The extraction step therefore retains its eigencharacter without assuming diagonalizability.
- At `N=5` the conclusion controls `T_ℓ^*` for `ℓ∤5p` and imposes no `U₅` eigenvalue or `T_p` eigenvalue.

*Needs:* [Theta cycles](#target-theta-cycles-and-the-small-characteristic-tables); [Theta and filtration](#target-theta-operator-filtration-and-hecke-commutation); [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions); [Supersingular section spaces](#target-supersingular-section-space); [Twisted supersingular periodicity](#target-supersingular-hecke-twisted-periodicity); [Twisted duality and the supersingular boundary](#target-twisted-serre-duality-hecke); [The elliptic Hasse invariant](#target-hasse-invariant-as-a-form-of-weight-p-minus-one).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 3.4, p. 9 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 7.5 Proof of Theorem 3.4, p. 25 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 7.5, p. 26 of the DVI.)

### Examples

Over `𝔽₂(t)`, `V(tq)=tq²` and `(tq)²=t²q²` differ. The supersingular weight-`(p+1)` multiplier changes good-prime `T_ℓ^*` eigenvalues by `ℓ`; at `p=5`, four applications have weight period 24 and remove that twist because `ℓ⁴=1`. In the torsion weight-one formula the `V` term survives; theta kills it on the characteristic-`p` socle.

### Dependencies

R15.1–R15.2; ModularCurvesPartII §11.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.21; SchemeAndStackFoundations §§2.19–2.21, 3.3. This layer builds the Hasse simple-zero, ordinary monodromy and `K/O` duality comparisons specified above.

<a id="layer-r15-4"></a>

## Layer R15.4 — The local Serre weight

The local recipe is a function of a continuous two-dimensional representation, with the actual wild extension class preserved. Its arithmetic tables can be expressed on classified data, but obtaining those data and the peu/très predicate comes from local Galois and finite-flat theory. Tame ranges, ordered wild exponents and exceptional classical shifts are part of the definition. The comparisons below specify exactly which local classification and descent results they consume.

### The complete arithmetic recipe

<a id="target-tame-inertia-characters-of-a-local-residual-representation"></a>

#### Tame inertia alternatives

Let `ρ_p:G_(ℚ_p)→GL₂(𝔽̄_p)` be continuous. Its image is finite. On the semisimplified representation wild inertia is trivial, and the tame inertia characters are either both niveau one or a niveau-two pair `ψ^a` and `(ψ^p)^a` exchanged by Frobenius. Use the tame inertia group, its finite-field inverse-limit description, fundamental characters and Frobenius conjugation supplied by ArithmeticGaloisRepresentations §§2.1–2.3 and the classified local data supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.5. This step determines the tame character alternatives; it does not erase the wild extension in the original representation.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.26, R07.5.1–R07.5.3; ArithmeticGaloisRepresentations §§2.1–2.3.

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 1, section 2.1, printed p. 183; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proof of Proposition 1 and 2.2, printed p. 183.)

<a id="target-serre-weight-tame-cases"></a>

#### The tame weight table

The classified arithmetic data have three branches: niveau-one exponents `(a,b)`, niveau-two exponents `(a,b)`, and ordered wild exponents `(α,β)` with the peu/très distinction. Retain the admissible ranges stated below. Obtaining these data and the extension-class test from an actual local representation is a separate mathematical target. Provide tame and wild exponent projections, each absent on the other kind of data, and define the arithmetic weight by the displayed branch formulas. (Serre 1987, §§2.2–2.4, pp.183–187.)

**Checks.**

- Niveau-two data `(1,3)` have tame exponents `(1,3)`, with wild projection absent.
- Très wild data `(3,1)` have wild exponents `(3,1)`, preserving quotient/stable-line order, and its tame projection is absent.
- Niveau-one data `(0,0)` are distinguished from the wild branch with the same integers and receives the unramified classical branch.

The tame projection must compute `(0,1)` for the supersingular niveau-two branch, compute `(0,0)` for the unramified niveau-one branch, and give no result on wild data. The wild projection preserves the ordered pair `(α,β)` and is absent on tame branches. The full classified data retain the peu/très branch and must be passed to the weight table; the projection gives `(0,1)` for both dyadic wild branches even though their weights are 2 and 4.

For the tame niveau-two branch normalize integers `0≤a<b≤p−1` and express the characters using exponent `pa+b`. Define `k=1+pa+b`. For the niveau-one branch normalize `0≤a≤b≤p−2` and define the same expression except that the pair `(0,0)` has classical weight `p` instead of 1. Thus a supersingular elliptic pair has weight 2, and an unramified representation has classical weight `p`.

In niveau two the arithmetic twist relation reads `k(a,b)=k(0,b−a)+a(p+1)` before a change reaches the normalization boundary. A cyclotomic twist of a representation must normalize its characters again and reapply the table; an unrestricted additive weight rule is invalid. The two exponent ranges are different, including at `p=2`.

Required objects and properties:

- The normalised exponents `(a, b)` of Serre 2.2 (level 2, `0 ≤ a < b ≤ p − 1`) or 2.3 (level 1, `0 ≤ a ≤ b ≤ p − 2`) of a tamely ramified `ρ_p`.

- The arithmetic table on classified local data computes `k(ρ_p) = 1 + pa + b` in the tame cases, with `k = p` when `ρ_p` is unramified.

- In the level-2 case, `k(χ^a ⊗ ρ′_p) = k(ρ′_p) + a(p + 1)` (Serre (2.2.5)).

- `k(ρ_p)` depends only on the isomorphism class of `ρ_p ⊗ 𝔽̄_p`.

**Checks.**

- For the `p`-torsion of a supersingular elliptic curve over `ℚ_p` (characters `ψ`, `ψ′` of level 2, `a = 0`, `b = 1`) `k = 2`.

- For `ρ_p` unramified, `(a, b) = (0, 0)` and `k = p`, not the formula's value 1.

- `p = 5`, level 2 with `(a, b) = (1, 3)`: `k = 1 + 5 + 3 = 9 = k′ + a(p + 1)` with `k′ = 1 + (3 − 1) = 3`.

- Using the level-2 range `0 ≤ a < b ≤ p − 1` in the level-1 case would allow `b = p − 1`, whose character `χ^{p−1}` is trivial; the level-1 range stops at `p − 2`.

*Needs:* [Tame inertia alternatives](#target-tame-inertia-characters-of-a-local-residual-representation).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.2, formulas (2.2.1)-(2.2.5), printed pp. 183-184; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.3, Remark 2, printed p. 185.)

<a id="target-peu-et-tres-ramifie-and-the-wild-case-weight"></a>

#### The extension-sensitive wild weight table

When `P_p` acts nontrivially, the fixed line `V^(P_p)` is stable under `G_(ℚ_p)`. Preserve its order: `α∈[0,p−2]` is the quotient exponent and `β∈[1,p−1]` the stable-line exponent. Normally set

`k=1+p min(α,β)+max(α,β)`.

For `β=α+1` the extension class changes the answer. A peu ramifiée extension has `k=2+α(p+1)`. A très ramifiée extension has `k=(α+1)(p+1)` for odd `p` and `k=4` at `p=2`. The peu/très distinction uses the actual Kummer extension class, with the required valuation-divisibility condition, from FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.5; it is not a freely selected Boolean attached only to semisimplification.

The ordered stable line, coefficient extension invariance and representation isomorphism invariance enter the API. Extensions with the same semisimplification can have weights 2 and `p+1`, or 2 and 4 in the dyadic case. In the dyadic très case, Serre's wild parameter is defined by `2^m=[K:K₀]=|ρ(P₂)|`, with `K₀=ℚ₂^nr`, and satisfies `m∈{1,2}`. The Kummer generators can be chosen in `ℚ₂×`; their square classes are generated by `−1,2,5`, and the class of 5 vanishes over `K₀` because `ℚ₂(√5)/ℚ₂` is unramified. Thus their span over `K₀` has dimension at most two. Edixhoven's broader bound `m∈{1,2,3}` does not assert attainment of 3.

Required objects and properties:

- The ordered quotient and stable-line exponents `(α,β)`, with `0≤α≤p−2` and `1≤β≤p−1`, where the stable line is `D=V^(P_p)` for wild inertia `P_p`.

- For prime `p≠2`, the très weight exceeds the peu weight by `p−1` at adjacent exponents `(α,α+1)`. The branch formula itself is the definition.

- For every natural `p`, if `β≠α+1` and `α≠β+1`, exchanging `(α,β)` preserves the generic wild weight.

- Isomorphic wild local representations have the same ordered exponents and peu/très branch, hence the same weight.

**Checks.**

- For odd `p`, two extensions of 1 by `χ` with the same semisimplification, one peu and one très ramifiée, receive weights 2 and `p+1`; at `p=2` they receive weights2 and4.

- `p = 5`, `α = 1`, `β = 3` (`β ≠ α + 1`): `k = 1 + 5·1 + 3 = 9`.

- The generic wild rows at `p=5` with `(α,β)=(1,3)` and `(3,1)` both give 9; neither adjacent exceptional branch occurs. The symmetry concerns the arithmetic table, not an interchange of stable line and quotient in a representation.

- At `p = 2 (α = 0, β = 1)` the très ramifiée correction is `+2`, giving `k = 4`, not `+(p − 1) = +1`.

- For `L=ℚ₂(√−1,√2,√5)`, the total degree is 8 but the ramification degree is 4: `L K₀=K₀(√−1,√2)` has degree 4 over `K₀`, so the wild parameter is `m=2`. The extension `K₀(√2)/K₀` gives `m=1`. Both très branches have classical weight 4.

*Needs:* [Tame inertia alternatives](#target-tame-inertia-characters-of-a-local-residual-representation); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.5.

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.4, (2.4.6)-(2.4.7) and Remarque 1, printed p. 186; 2.4 `(ii_2)`, formula (2.4.9), printed p. 187; 2.6, printed p. 188; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition 8.5, p. 28 of the DVI.)

<a id="target-determinant-parity-and-weight-mod-p-minus-one"></a>

#### Determinant and parity

For every branch of the complete local recipe, `det(ρ_p)|_(I_p)=χ̄_p^(k−1)`. In tame exponents this is the arithmetic congruence `k−1≡a+b` mod `p−1`; the exceptional branches preserve the same determinant congruence. For a global residual representation write `det ρ̄=εχ̄_p^(k−1)`, with the prime-to-`p` character specified accordingly. If it is odd and `p` is odd, then `ε(−1)=(−1)^k`. In characteristic two determinant oddness is automatic for complex conjugation, but this does not require the matrix of complex conjugation to be the identity.

*Needs:* [The tame weight table](#target-serre-weight-tame-cases); [The extension-sensitive wild weight table](#target-peu-et-tres-ramifie-and-the-wild-case-weight).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 2 (2.5.1) with its proof, printed p. 187; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 1.3, (1.3.7)-(1.3.9), printed pp.181–182.)

<a id="target-recipe-well-definedness-and-twisting"></a>

#### Invariance and renormalized twists

Prove that the normalized recipe is invariant under change of basis, unramified twist and coefficient-field extension, with the actual wild extension test transported in each case. Every valid normalized branch gives `k≥2`. A cyclotomic twist first transports the local representation and then renormalizes its inertia data; crossing a boundary can change the branch, so adding one fixed quantity to all weights is not a valid global rule. For `p>2` prove ∃ `i∈ℤ`, `2≤k(ρ_p⊗χ̄_p^i)≤p+1`. For `p=2` prove separately that `k∈{2,4}` and every cyclotomic twist preserves `k`: `χ̄₂` takes values in `𝔽₂×={1}`. Every integer power of a character valued in `𝔽₂×` is trivial. These are local arithmetic conclusions and do not produce a modular form or minimize the weight of an existing modularity witness.

**Checks.**

- At `p=5` the niveau-two data `(1,3)` have weight 9; twisting by `χ̄₅⁻¹` gives normalized data `(0,2)` and weight 3, in [2,6].
- At `p=3` the wild très branch `(0,1)` has weight 4, attaining the odd-prime bound `p+1`.
- At `p=2` the wild très branch `(0,1)` has weight 4 under every cyclotomic twist, so no such twist has classical weight `≤3`. The peu branch retains weight 2 under every twist.

*Needs:* [The tame weight table](#target-serre-weight-tame-cases); [The extension-sensitive wild weight table](#target-peu-et-tres-ramifie-and-the-wild-case-weight); ArithmeticGaloisRepresentations §§2.1–2.3.

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.7–2.9, printed pp.188–191; [Khare–Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, printed p.2, for the odd-prime twist bound and separate dyadic alternatives.)

### Finite-flat comparisons and exceptional primes

<a id="target-dyadic-tame-niveau-two-descent"></a>

#### Dyadic tame niveau-two descent

Let `F/𝔽₂` be finite and `ρ:G_(ℚ₂)→GL₂(F)` continuous and tame, with geometric inertia characters `ψ,ψ²` of niveau two. Construct a finite flat `ℤ₂-model` of its generic-fibre `F`-vector-space scheme, with its coefficient action and the specified Frobenius action. Over the strict henselian unramified base the two characters have Raynaud exponents `(1,0)` and `(0,1)`, so the tame prolongation theorem gives models. After coefficient splitting, form their direct sum and use the maximal prolongation to extend the coefficient action and Frobenius descent datum. Prove the cocycle and continuity/effectivity of descent, descending first through finite unramified data and then to `ℤ₂`. Functoriality of the maximal prolongation replaces a uniqueness-of-model assertion; nonuniqueness at `e=p−1=1` is allowed. The construction also transports unramified twists and descends from a coefficient splitting field.

**Checks.**

- The 2-torsion of the good supersingular curve `y²+y=x³` over `ℤ₂` gives the `𝔽₂` niveau-two instance, with inertia of order 3 and Frobenius exchanging the two geometric inertia characters.
- For `F` containing `𝔽₄`, descending only one `ψ`-eigenline fails: Frobenius sends it to the `ψ²`-eigenline. The paired model retains that interchange and the prescribed Frobenius square.
- The constant `ℚ₂`-group of order 2 has both `ℤ/2` and `μ₂` as models, so descent cannot use uniqueness at `p=2`. An unramified scalar twist of the niveau-two pair still descends with its coefficient action.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24, R07.1.31–R07.1.32; ArithmeticGaloisRepresentations §§2.1–2.3; ModularCurves Layer 0E (effective finite-flat descent).

([Raynaud](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Corollary 2.2.3, pp.260–261, and Theorem 3.4.3, p.270; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), proof of Proposition 8.2, p.26, for functorial maximal-model descent; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 4, pp.189–190.)

<a id="target-weight-two-iff-finite-flat-at-p"></a>

#### The weight-two criterion

The `k=2` rows of the local table are the niveau-two pair `ψ,ψ′` and the triangular inertia type `(χ̄_p,1)` with trivial wild action or a peu extension. For `ρ_p` valued in `GL₂(𝔽_p)`, the finite-flat criterion says

`k(ρ_p)=2 ⇔ det(ρ_p)|_(I_p)=χ̄_p` and `ρ_p` is finite at `p`,

where finite means that its étale generic-fibre group of type (p,p) extends to a finite flat group scheme over `ℤ_p`. For larger finite coefficient fields the statement requires Raynaud `F`-vector-space schemes, rather than merely a group of type (p,p). Combine the odd-prime finite-flat criterion supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.5 with the table; the full dyadic tame branch uses [Dyadic tame niveau-two descent](#target-dyadic-tame-niveau-two-descent). The determinant condition alone is only the congruence `k≡2` mod `p−1` and does not select weight two.

*Needs:* [The tame weight table](#target-serre-weight-tame-cases); [The extension-sensitive wild weight table](#target-peu-et-tres-ramifie-and-the-wild-case-weight); [Determinant and parity](#target-determinant-parity-and-weight-mod-p-minus-one); [The Raynaud input and its boundary](#target-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction); [Finite flatness and peu ramifiée extensions](#target-finite-at-p-equals-peu-ramifie); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.7 (odd `p`); [Dyadic tame niveau-two descent](#target-dyadic-tame-niveau-two-descent).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 4 and its proof, printed pp. 189-190; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proof of Proposition 4, printed p. 190; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.8, before Proposition 4, printed p. 189.)

<a id="target-edixhoven-weight-k-rho-and-its-comparison-with-serre-k"></a>

#### Edixhoven and classical weights

Define Edixhoven's arithmetic weight as follows: on tame branches it is `1+pa+b`; on wild data it is `1+p min(α,β)+max(α,β)`, plus `p−1` exactly when `β=α+1` and the extension is très ramifiée. Compute the normalized branches and the two exceptional comparisons with the classical Serre weight. The local-representation definition composes this table with the actual classification and extension test. (Edixhoven Definition 4.3, author DVI p.10.)

Prove the complete comparison on normalized local data: its value is 1 on unramified niveau-one data, 3 on dyadic très data, and the classical Serre weight on every other branch.

**Checks.**

- Unramified data at `p=5` have Edixhoven weight 1 and classical weight 5.
- At `p=2` the très data `(0,1)` have Edixhoven weight 3 and classical weight 4.
- The supersingular niveau-two data `(0,1)` have weight 2 in both tables; a dyadic peu extension also has weight 2.

Define Edixhoven's local weight through his normalized local table and compare it with the classical Serre weight. The tables agree except for the unramified branch, where Edixhoven uses 1 instead of Serre's `p`, and for the dyadic très branch, where Edixhoven uses 3 instead of Serre's 4. Both differences matter for Katz forms and for theta cycles. Existence of a modular form of the Edixhoven weight and its minimality are outside this roadmap’s scope.

*Needs:* [The tame weight table](#target-serre-weight-tame-cases); [The extension-sensitive wild weight table](#target-peu-et-tres-ramifie-and-the-wild-case-weight); [Finite flatness and peu ramifiée extensions](#target-finite-at-p-equals-peu-ramifie).

([Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Definition 4.3 case 2(b), p. 10 of the DVI; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Remark 4.4.1, p. 10 of the DVI.)

<a id="target-dyadic-weight-two-or-four"></a>

#### The dyadic weight dichotomy

At `p=2` the normalized recipe takes only values 2 and 4. Weight 4 occurs exactly in the wild très ramifiée case. If wild inertia acts trivially, the tame characters are trivial or the niveau-two fundamental pair and the weight is 2. In the wild branch finiteness at 2 is equivalent to peu ramifiée by the extension theorem, and an unramified representation is finite through a finite étale model.

For the unipotent representation whose off-diagonal character cuts out `ℚ₂(√d)`, the cases `d=5,−1,−5` have weight 2, whereas `d=±2,±10` have weight 4. The full equivalence between weight 2 and finite flatness at 2 also needs descent of the tame niveau-two model from `ℤ₂^nr` to `ℤ₂`. At `e=p−1=1` models can fail to be unique; this descent is supplied by [Dyadic tame niveau-two descent](#target-dyadic-tame-niveau-two-descent). The arithmetic dichotomy alone does not supply it.

*Needs:* [The tame weight table](#target-serre-weight-tame-cases); [The extension-sensitive wild weight table](#target-peu-et-tres-ramifie-and-the-wild-case-weight); [Finite flatness and peu ramifiée extensions](#target-finite-at-p-equals-peu-ramifie); [The Raynaud input and its boundary](#target-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction); [Dyadic tame niveau-two descent](#target-dyadic-tame-niveau-two-descent); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.8 (unipotent `𝔽₂` case).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.6, printed p. 188; [Khare–Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 (authors' preprint).)

### Applications of the recipe

<a id="target-fontaine-laffaille-weight-comparison"></a>

#### Fontaine–Laffaille weights

Let `p≥3` and `1≤r≤p−2`. For a rank-two residual Fontaine–Laffaille module over the unramified base `ℤ_p` with labeled weights {0,r}, use the supplier's contravariant `U_S` functor and convention `HT(χ_cyc)=+1`. Its rank-two extension-sensitive classification supplies either reducible inertia with semisimplification `χ̄_p^r⊕1` and ordered wild exponents `α=0,β=r`, or niveau-two characters `ψ^r,ψ′^r`. In the `r=1` extension branch the finite/peu assertion is part of that supplier classification.

Applying the local recipe gives `k=r+1`. A semisimplification alone would not determine the ordered wild line or the finite/peu case, so those are indispensable hypotheses. The case `r=0` instead permits unramified classical weight `p`; `r=p−1` and `p=2` lie outside this comparison. This calculation uses the existing functor and local classification, independently of any modular-form existence theorem.

The arithmetic comparison covers the tame and ordered wild rows; the wild row retains the peu hypothesis when `r=1`.

**Checks.**

- At `p=5,r=2`, the tame rows `(0,2)` and the ordered wild row `(0,2)` all give weight 3.
- At `r=1` the peu wild row has weight 2; the très row has weight `p+1` for odd `p`, so omitting the peu condition would make the comparison false.
- At `r=0` unramified data have classical weight `p`; at `p=2` the interval `1≤r≤p−2` is empty. Neither input asserts a Fontaine–Laffaille weight `r+1` here.

*Needs:* [Invariance and renormalized twists](#target-recipe-well-definedness-and-twisting); [The weight-two criterion](#target-weight-two-iff-finite-flat-at-p); FiniteFlatGroupsAndIntegralPadicHodgeTheory Layers R07.5 and R07.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11.

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.7–2.9, printed pp.188–191; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorems2.5–2.6 and Definition4.3, author DVI pp.5–6,10.)

<a id="target-semistable-elliptic-torsion-weight"></a>

#### Semistable elliptic torsion

For semistable elliptic `E/ℚ_p`, the residual representation `E[p]` has weight 2 in the good-reduction case, using its finite flat model and the local inertia classification. In the multiplicative case its Tate parameter `q_E` determines the actual extension class. For odd `p` its weight is 2 if `p∣v_p(j(E))` and `p+1` otherwise. At `p=2` the same divisible case has weight 2 and the other case has weight 4. Nonsplit multiplicative reduction is the unramified quadratic twist of the Tate case. Derive the exact sequence `0→μ_p→E_q[p]→ℤ/pℤ→0` and its Kummer class `[q_E]∈ℚ_p×/ℚ_p×p` from the Galois-equivariant Tate uniformisation of EllipticCurves Layer 4, then transport it through the unramified quadratic twist. Use the finite-flat local criterion from FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.5; the numerical weights follow from the full recipe.

The numerical comparison specializes the wild table to `(α,β)=(0,1)`; the torsion-sequence and Kummer identification above provide its arithmetic input.

**Checks.**

- For the Tate curve with `q_E=p^p(1+p)` at odd `p`, the valuation is divisible by `p`, its class is a unit class modulo pth powers and the weight is 2.
- For `q_E=p`, the valuation is not divisible by `p`: the weight is `p+1` at odd `p` and 4 at `p=2`.
- An unramified quadratic twist preserves the inertia extension class and these weights; it changes the unramified diagonal characters in the nonsplit multiplicative case.

*Needs:* [Invariance and renormalized twists](#target-recipe-well-definedness-and-twisting); [The weight-two criterion](#target-weight-two-iff-finite-flat-at-p); [The dyadic weight dichotomy](#target-dyadic-weight-two-or-four); FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.5; [EllipticCurves Layer 4](../EllipticCurves/README.md#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.9 Proposition5 and its proof, printed p.191.)

<a id="target-bad-dihedral-normalized-weight-application"></a>

#### The normalized bad-dihedral constraint

Let `p≥3` and let an S-type residual representation be normalized by a cyclotomic twist so that `2≤k≤p+1`. If its restriction to `G_(ℚ(μ_p))` is reducible, then `k=(p+1)/2` or `(p+3)/2`. The local niveau-one case gives `p=2k−1` and the niveau-two case gives `p=2k−3`. ArithmeticGaloisRepresentations §4.6 supplies the induced-dihedral identification through `ℚ(√p*)`, `p*=(-1)^((p−1)/2)p`, and the projective inertia information. The local calculation uses that image result and the normalized recipe; it cannot be applied to an arbitrary unnormalized weight. The proof input includes Ribet's Proposition 2.2 as cited by the modularity argument, together with the fuller niveau calculation in Dieulefait–Pacetti.

*Needs:* [Invariance and renormalized twists](#target-recipe-well-definedness-and-twisting); ArithmeticGaloisRepresentations §4.6.

([Khare–Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma6.2(ii), preprint p.11; [Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2), Lemma1.14 and proof, pp.8–9.)

### Examples

At `p=5` the niveau-two data `(1,3)` give weight 9. The peu and très extensions of 1 by `χ̄₅` have the same semisimplification but weights 2 and 6. At `p=2` the très correction gives classical weight 4, while Edixhoven's table gives 3.

### Dependencies

ArithmeticGaloisRepresentations §§2.1–2.3, 4.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.26, R07.1.30–R07.1.32, R07.3.7, R07.5.1–R07.5.11; EllipticCurves Layers 1, 3–5. The classification feeds the arithmetic tables before any modularity witness is defined.

<a id="layer-r15-5"></a>

## Layer R15.5 — Deligne–Serre eigenvalue lifting

The abstract argument lifts the eigencharacter of a residual line in a finite free module. A prime over the generic point and a dominating DVR lift the character; faithful support and a local socle produce an eigenvector realizing it. The lifted eigenvalues have the prescribed residues. A chosen residual vector need not be the reduction of any lifted eigenvector. The modular-form application therefore starts with an actual integral reduction witness and records the full operator family being preserved.

### The eigencharacter and its valuation lift

<a id="target-adjoin-invariant-line"></a>

#### The generated algebra and an invariant line

Let `O` be a ring, `k` an `O`-algebra field and `M` a `k`-module. If every operator in an arbitrary family of `k`-linear operators preserves the line `kf`, then the `O`-subalgebra generated by the family also preserves `kf`. Apply the existing adjoin universal property to the stabilizer subalgebra. This preservation result needs neither a finite family nor pairwise commutativity, and permits `f=0`. The later construction of a unique scalar-valued character requires `f≠0`.

*Needs:* `Algebra.adjoin_le` (Mathlib); `TensorProduct.AlgebraTensorModule.map_tmul` (Mathlib).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-eigencharacter-of-invariant-line"></a>

#### The invariant-line eigencharacter

Let `H` be an `O`-algebra acting on the `k`-vector space `M` by an `O`-algebra homomorphism `r:H→End_k(M)`, with the compatible scalar tower. If `f≠0` and each `h∈H` sends `f` into `kf`, the unique scalar `χ(h)` in `hf=χ(h)f` defines an `O`-algebra homomorphism `χ:H→k`. Use the existing `AlgHom` carrier and prove existence and uniqueness with the displayed eigenvector equation. Nonzero `f` gives uniqueness of each scalar and hence compatibility with addition, multiplication and `O`-scalars. Rescaling by a nonzero scalar leaves `χ` unchanged. Commutativity of `H` is unnecessary for this invariant-line construction, though the lifting argument subsequently uses a commutative operator algebra.

Required objects and properties:

- For every `h`, `r(h)f=eigencharacter(r,f)(h) f`.

- Any `R`-algebra map `ψ` with `r(h)f=ψ(h)f` for every `h` equals `eigencharacter(r,f)`.

- Replacing `f` by `u f` for a nonzero `u` in `k`, with the induced stability witness, does not change the character.

**Checks.**

- For `H=k` and a scalar action `r(a)x=a x` on `V=k`, the character obtained from `f=1` evaluates at `a` as `a`.

- Every nilpotent `h` in `H` maps to zero under the constructed character, including when `r(h)` is a nonzero nilpotent operator.

- For `H=k x k` acting diagonally on `V=k x k`, the lines through `(1,0)` and `(0,1)` produce different characters: at `(1,0)` their values are 1 and 0. The constructor must retain the chosen line.

*Needs:* Mathlib algebra homomorphisms and module actions, with the stated `O/k` scalar tower and scalar commutation.

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-horizontal-prime"></a>

#### A horizontal prime

Let `H` be a finite free commutative `O`-algebra over a DVR, and `χ:H→κ` a character over the residue map. Its kernel `Q` lies above the maximal ideal of `O`. Flat going down supplies a prime `P⊂Q` with `P∩O=0`. Thus `H/P` is a domain whose generic fibre is a finite field extension of `Frac(O)`. Use the existing flat going-down instance and prime lifting lemma. The prime is selected below the residual kernel so that the later integral character retains that residue.

*Needs:* `Algebra.HasGoingDown.of_flat` (Mathlib); `Ideal.exists_ideal_le_liesOver_of_le` (Mathlib).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-character-valuation-lift"></a>

#### A character valued in a dominating DVR

With the finite free commutative DVR algebra and residual character just specified, choose a finite extension `L` of `K=Frac(O)`, a DVR `V⊂L` dominating `O`, an embedding `j:κ→κ_V` and an `O`-algebra homomorphism `ψ:H→V` such that `ψ` reduced modulo the maximal ideal of `V` equals `j∘χ`. Choose the horizontal prime, take the fraction field of `H/P`, pass to the integral closure of `O` and localize at a prime whose residue realizes the chosen character.

Tau Ceti's integral-closure theorem supplies Dedekindness for any finite fraction-field extension. Separability is not imposed, and the integral closure or `V` need not be finite as an `O`-module. Lying over, the nonzero-prime localization and residue-field compatibility enter through the existing commutative-algebra APIs.

*Needs:* [A horizontal prime](#target-horizontal-prime); `TauCeti.integralClosure.isDedekindDomain` (Tau Ceti).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

### Support, socles and generic eigenvectors

<a id="target-nilpotent-ideal-socle"></a>

#### A socle for a nilpotent ideal

For a commutative ring `A`, a nonzero `A`-module `V` and a nilpotent ideal `I`, there is a nonzero `v∈V` with `Iv=0`. Take the last nonzero term before the action of an ideal power becomes zero, and choose a nonzero vector in it. No finiteness of `V` is needed. This is the elementary socle input when the maximal ideal of a local Artinian algebra is nilpotent.

*Needs:* Mathlib ideals, their powers and the module action over a commutative ring.

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-localized-socle-descent"></a>

#### Descent of a localized socle

Let `A` be noetherian, `I` maximal, `A_I` Artinian, and `V` an `A`-module with `V_I≠0`. The nilpotent-maximal-ideal argument in `A_I` gives a nonzero localized vector killed by `I`. Since `I` has finitely many generators, clear a common denominator for their annihilation equations to obtain a nonzero vector of `V` killed by `I` itself. Keep the denominator outside `I` so the resulting vector remains nonzero after localization. The module `V` need not be finite; noetherianity supplies finite generation of the ideal used in the descent.

*Needs:* [A socle for a nilpotent ideal](#target-nilpotent-ideal-socle); `IsArtinianRing.isNilpotent_jacobson_bot` (Mathlib).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-faithful-character-occurrence"></a>

#### Occurrence of every character in a faithful module

Let `k` be a field, `H` a finite-dimensional commutative `k`-algebra and `V` a finite-dimensional faithful `H`-module. Every `k`-algebra character `χ:H→k` occurs on a nonzero common eigenvector in `V`. Put `I=ker χ`. Faithfulness makes the annihilator zero, so the finite-module support theorem gives `V_I≠0`. The localized algebra is Artinian; its nilpotent radical yields a socle vector, which descends as above. This proves occurrence without a semisimple `H`-action. Faithfulness is essential, as the two-factor algebra test below demonstrates.

*Needs:* [Descent of a localized socle](#target-localized-socle-descent); `Module.mem_support_iff_of_finite` (Mathlib); `IsArtinianRing.localization_artinian` (Mathlib).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-generic-action-faithfulness"></a>

#### Faithfulness of the generic action

Let `O` be a domain, `M` a finite free `O`-module and `H⊂End_O(M)` the actual operator subalgebra. For a flat `O`-algebra `L` the action map `L⊗_O H→End_L(L⊗_O M)` is injective. Combine the flat tensor inclusion of `H` into `End_O(M)` with the finite free endomorphism base-change comparison, checking the action on pure tensors. Apply this with a fraction-field extension to obtain a faithful generic action. Torsion-freeness or finiteness of `H` alone would not replace that comparison of endomorphisms.

*Needs:* `TensorProduct.AlgebraTensorModule.map_tmul` (Mathlib).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-integral-eigenvector"></a>

#### Integral representatives of eigenlines

Let `M` be a finite free `O`-module over a domain, `K` its fraction field, and suppose a nonzero vector in `K⊗M` is a common eigenvector for an arbitrary integral operator family with eigenvalues in `O`. Clear its finitely many coordinates by one nonzero denominator to obtain a nonzero integral eigenvector with the same eigenvalues. Use a finite basis and the existing fraction-field and module localization APIs. This operation chooses an integral representative of a generic eigenline and does not control its reduction as a prescribed vector.

*Needs:* Mathlib finite free modules, fraction fields, localization and finite-coordinate denominator clearing.

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

### The lifting lemma and its sharp limits

<a id="target-deligne-serre-eigenvalue-lifting-lemma"></a>

#### Deligne–Serre eigenvalue lifting

Let `O` be a DVR with fraction field `K` and residue `κ`, let `M` be finite free over `O`, and let an arbitrary family `(T_i)` of pairwise commuting `O`-linear endomorphisms act on it. Suppose `f∈M/ϖM` is nonzero and `T_if=a_if` for scalars `a_i∈κ`. Then there are a finite extension `L/K`, a DVR `V` in `L` dominating `O`, a residue-field embedding `j:κ→κ_V`, scalars `b_i∈V` and a nonzero common eigenvector `f′∈V⊗_O M` such that `T_if′=b_if′` and `b_i` reduces to `j(a_i)` for every `i`.

The headline `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.EigenvalueLifting.deligneSerreEigenvalueLifting` states this result on finite free modules, tensor products and valuation subrings, with the scalar and residue maps explicit.

Generate the commutative operator algebra `H⊂End_O(M)`. Because `O` is a DVR and `M` finite free, `H` is finite and torsion-free, hence free, even when the chosen family is infinite. The residual line gives `χ`; a horizontal prime and integral closure lift it to `ψ`. Flat scalar extension preserves faithfulness. The occurrence theorem produces a generic eigenvector with that character, and coordinate clearing makes it integral. The conclusion preserves the residual eigenvalues. It does not prescribe the reduction of `f′`, nor assume separability of `L/K` or module finiteness of `V` over `O`.

*Needs:* [The generated algebra and an invariant line](#target-adjoin-invariant-line); [The invariant-line eigencharacter](#target-eigencharacter-of-invariant-line); [A character valued in a dominating DVR](#target-character-valuation-lift); [Occurrence of every character in a faithful module](#target-faithful-character-occurrence); [Faithfulness of the generic action](#target-generic-action-faithfulness); [Integral representatives of eigenlines](#target-integral-eigenvector).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-nilpotent-eigenvector-nonlifting"></a>

#### Failure of prescribed eigenvector lifting

On `O²` consider `T=[[0,ϖ],[0,0]]`. Reduction makes `T` zero, so the residual vector `e₂` is an eigenvector with eigenvalue zero. Over any dominating domain the zero-eigenvector equation forces the second coordinate to vanish. Thus no zero-eigenvector reducing to `e₂` exists, although the same residual eigenvalue lifts on `e₁`. This tests the exact eigenvalue conclusion of Deligne–Serre and rules out a prescribed-vector lifting statement.

*Needs:* [Deligne–Serre eigenvalue lifting](#target-deligne-serre-eigenvalue-lifting-lemma).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-ramified-eigenvalue-example"></a>

#### Necessity of a fraction-field extension

The operator `[[0,ϖ],[1,0]]` satisfies `T²=ϖ·id`. Its residual eigenvalue is zero, but a generic eigenvalue must satisfy `λ²=ϖ`. Such a root need not lie in `K`, so a fraction-field extension is necessary. When `K` has characteristic two the extension can be inseparable; the character-lift formulation must allow that possibility. This example also tests the valuation-ring output rather than requiring an unramified coefficient extension.

Prove that a uniformizer has no square root in the DVR fraction field and that this companion operator has no nonzero eigenvector over that field.

**Checks.**

- The valuation of a square in `K×` is even, whereas `v(ϖ)=1`; hence the eigenvalue cannot lie in `K`.
- After adjoining `α` with `α²=ϖ`, the vector `(α,1)` has eigenvalue `α`, realizing the required extension.
- For `O=𝔽₂[[t]]`, adjoining a root of `X²−t` is purely inseparable; separability would exclude this lifting instance.

*Needs:* [Deligne–Serre eigenvalue lifting](#target-deligne-serre-eigenvalue-lifting-lemma).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

<a id="target-nonfaithful-character-nonoccurrence"></a>

#### Failure of occurrence for a nonfaithful action

Let `H=k×k` act on `k` through the first projection. The second-projection character cannot occur on a nonzero vector in that module. This finite commutative example has a character and an action but lacks faithfulness, and tests why the occurrence theorem and the generic operator-algebra argument include that hypothesis.

*Needs:* [Occurrence of every character in a faithful module](#target-faithful-character-occurrence).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522.)

### Application to modular forms

<a id="target-reduction-to-weight-at-least-two-and-to-a-true-eigenform"></a>

#### Controlled eigenform lifting and weight shifts

Fix a finite free integral cusp lattice `L` over a DVR `O` at a characteristic-zero coefficient place, with residue characteristic `p`, weight `k`, `p∤N`, integral character `ε` and a specified commuting family of integral Hecke and diamond operators. Start with a nonzero residual eigenvector actually in `L/ϖL`. If the input is a Katz form, require its witness in that reduction image. Deligne–Serre lifts this eigenvalue family to characteristic zero after a finite fraction-field extension and a dominating DVR, preserving weight, level and those specified eigenvalues.

A common eigenvector for the full analytic `T_n` and `U_ℓ` family has `a₁≠0` by the owned coefficient identities, and scales uniquely to `a₁=1`. Normalization gives `a₁((a₁(f))⁻¹f)=1` for a linear coefficient functional over a field with `a₁(f)≠0`. A primitive newform conclusion then invokes the old/new theorem of ModularForms Layer 4 and records its level dividing `N` and the precise character and bad-prime data. A good-prime eigenvector alone does not certify a full normalized eigenform at level `N`.

For a low-weight reduction form, Deligne–Serre's shift multiplies by a level-one `E_n` with `n≥4` even, `(p−1)∣n` and `E_n≡1` mod `p`. It reaches weight `k+n≥2` with unchanged level and character and congruent good-prime eigenvalues and determinant powers. The Eisenstein integrality is an input. A Katz form outside the integral reduction image instead needs a Hasse-power shift into a range where the exact cusp `H¹` and character-projector conditions make reduction surjective. No universal same-weight lift of arbitrary Katz forms is asserted.

*Needs:* [The integral cusp lattice and its reduction image](#target-integral-lattice-and-reduction-image); [Finite section modules](#target-finite-generation-of-geometric-sections); [Deligne–Serre eigenvalue lifting](#target-deligne-serre-eigenvalue-lifting-lemma); [Deligne congruence and small-prime lifts](#target-deligne-congruence-and-the-explicit-p-equals-2-3-liftings); [ModularForms Layer 4](../ModularForms/README.md#layer-4-eigenforms-newforms-primitive-forms-the-conductor); [Integral geometric Hecke operators](#target-integral-hecke-operators-from-q-expansions).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.9–6.11, printed p.522.)

<a id="target-weight-one-three-weight-two"></a>

#### Weight one to weight two at three

Write `χ₋₃(n)=0,1,−1` for `n≡0,1,2 mod 3`. Construct the holomorphic Eisenstein form `E₁(χ₋₃)∈M₁(Γ₀(3),χ₋₃)` with expansion `1+6Σ_(n≥1)(Σ_(d∣n)χ₋₃(d))q^n`. In particular its coefficients are integers and `E₁(χ₋₃)≡1 mod 3`. For a weight-one form of level `N` and character `χ`, multiplication gives weight two at `M=lcm(N,3)` with character the product of the inflated `χ` and `χ₋₃`; cuspidality is preserved. If `3∣N` and `χ=χ₋₃` inflated to level `N`, this is a weight-two form on `Γ₀(N)` with trivial character.

For a normalized integral weight-one eigenform at a number-field place over 3, the product has the same reduced q-expansion. Away from `3N`, its second Euler coefficients agree with the original ones modulo that place, since `χ₋₃(ℓ)≡ℓ mod 3`. Apply R15.5 eigenvalue lifting to the weight-two integral coefficient lattice at that place to obtain a characteristic-zero weight-two eigenform with congruent eigenvalues and the product character. For holomorphic input use the holomorphic coefficient lattice, whose finite-free and spanning properties follow from the all-prime denominator target and coefficient rationality; for cuspidal input use the cusp lattice and obtain a cusp eigenform. If `3∣N`, the bad-prime `U` equations also agree. Apply lifting to the full Hecke family and normalize the lifted eigenform: all its positive-index Fourier coefficients are congruent to those of the weight-one form in a common residue field. Thus character `χ₋₃` gives a normalized weight-two eigenform on `Γ₀(N)` congruent modulo 3, with cuspidality retained for cusp input. No congruence of constant terms is inferred from eigenvalue lifting for noncuspidal input. A primitive cusp associate has level dividing `M` and retains the away-`3N` congruence. The integral analytic lattice is used even though 3 divides `M`; the smooth prime-to-level geometric lifting theorem is not invoked at 3. This weight-change interface follows the Imperial College London FLT project.

**Checks.**

- The first coefficients of `E₁(χ₋₃)` are `1+6q+0q²+6q³+6q⁴+⋯`; reducing its full divisor-sum expansion modulo 3 gives the constant series 1.
- For `3∣N` and character `χ₋₃`, the product has trivial character and weight two at level `N`. Its determinant at `ℓ∤3N` reduces to `ℓ=χ₋₃(ℓ)`, as required by the weight-one determinant.
- If `3∤N`, the asserted product level is `3N`. Arbitrary character `χ` gives product character `χχ₋₃`, and no trivial-character conclusion is asserted.
- A nonzero reduction is essential for lifting; normalization `a₁=1` ensures it. Multiplication does not itself make the characteristic-zero product a Hecke eigenform.

*Needs:* ModularForms Layer 0 for character Eisenstein series; [The integral cusp lattice and its reduction image](#target-integral-lattice-and-reduction-image); [All-prime bounded denominators](#target-bounded-denominators-congruence-application); [Deligne–Serre eigenvalue lifting](#target-deligne-serre-eigenvalue-lifting-lemma); [Controlled eigenform lifting](#target-reduction-to-weight-at-least-two-and-to-a-true-eigenform).

([Buzzard, Weight one Eisenstein series](https://www.ma.imperial.ac.uk/~buzzard/maths/research/notes/weight_one_eisenstein_series.pdf), pp.1–2, especially the conductor-three example on p.2; [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §§6.10–6.11, p.522.)

### Examples

The matrix `[[0,ϖ],[0,0]]` has residual eigenvector `e₂` with eigenvalue zero, but every nonzero generic eigenvector lies on `e₁`. The matrix `[[0,ϖ],[1,0]]` requires a coefficient root `λ²=ϖ` and permits an inseparable extension in characteristic two. Both satisfy the eigenvalue-lifting conclusion with its exact residue square.

### Dependencies

The exact Mathlib and Tau Ceti commutative-algebra suppliers; R15.2's actual integral reduction image and R15.3's justified weight shift for the modular-form application; ModularForms Layer 4 for full eigenforms and primitive associates.

<a id="layer-r15-5a"></a>

## Layer R15.5A — Classical Galois attachments

The geometric parabolic coefficient realization and pairing supplied by ModularCurvesPartII §§14.1–14.4a, 14.11 support the filtered de Rham comparison and primitive rank-two summand constructed here for higher-weight Galois attachment. Deligne–Serre lifting and the classical prime moments of [R15.5A.2a](#target-classical-weight-one-prime-moments) then construct the finite-image weight-one attachment. These constructions retain coefficient fields, places and stable lattices for the residual witnesses of R15.6.

Throughout this layer, `λ_p(f)` denotes the good-prime Hecke eigenvalue, defined by `T_p f=λ_p(f)f` for prime `p∤N`; `a_n(f)` denotes a Fourier coefficient. In the cuspidal interface use `HeckeRing.GL2.EigenformAwayFromLevel.eigenvalue` with its `Nat.Coprime` hypothesis. The supplied `HeckeRing.GL2.EigenformAwayFromLevel.qExpansion_coeff_eq_eigenvalue_mul_coeff_one` gives `a_n(f)=λ_n(f)a₁(f)` for `(n,N)=1`, and `HeckeRing.GL2.EigenformAwayFromLevel.qExpansion_coeff_eq_eigenvalue` identifies them when `a₁(f)=1`. For holomorphic forms including Eisenstein forms the same comparison follows from the coefficient formula of ModularForms Layer 2. Attachments use the eigensystem, allowing arbitrary nonzero scaling and good-prime oldvectors with `a₁=0`; their coefficient field contains eigenvalues and character values, without requiring the Fourier coefficients of an arbitrary scaling to be algebraic.

<a id="target-classical-parabolic-realization"></a>

### R15.5A.1 The classical rank-two cohomological summand

For integer weight `k≥2`, any prime `ℓ` and neat full level `m≥3`, use ModularCurvesPartII §§14.1–14.4a for the geometric coefficient system `V_k=Sym^(k−2)R¹h_*ℚ_ℓ` of the universal elliptic curve `h:E→Y(m)`, the support map and its parabolic image `H¹_par=image(H¹_c→H¹)`, the finite/adic comparisons and characteristic-zero scalar extension, and the level/isogeny/Hecke pullback/trace maps. Construct these over `ℚ` and their integral-base comparisons over `Spec ℤ[1/(mℓ)]`, allowing `ℓ|m`; finite étale coefficients require `ℓ` invertible on that base. Good-fibre specialization and Frobenius comparisons apply at `q∤mℓ`. Use its §14.11 pairing on the stated coefficient domain, retaining the dual lattice, adjoint Hecke action and Tate twist; integral perfection retains its factorial and vanishing hypotheses. The filtered logarithmic de Rham comparison below gives the higher-weight decomposition `S_k⊕overline(S_k)`, with character components. For a normalized cuspidal primitive classical eigenform `f` of level `N`, choose `m` with `N|m` and construct the exact-level classical newspace Hecke eigenprojector over every coefficient completion `K_λ`, `λ|ℓ`, including `ℓ|N`. Its primitive `f`-isotypical summand has dimension two, one holomorphic and one antiholomorphic contribution. Transport and descend that summand to level `N` through auxiliary full levels using classical old/new decomposition and the level pullback/trace maps over the coefficient field. Identify the primitive multiplicities at any two such levels through a common multiple, for the same `λ`; the extra oldvector copies at larger levels do not enlarge its primitive rank-two multiplicity. All these maps allow `ℓ` to divide the levels.

Use [Integral elliptic logarithmic de Rham extension](#target-integral-elliptic-logarithmic-de-rham-extension) for `H¹_dR(E/Y)`, its connection, Hodge sequence and logarithmic lattice. Construct its characteristic-zero symmetric coefficient bundle `E_k=Sym^(k−2)H¹_dR(E/Y)` with the induced connection and logarithmic extension at the cusp divisor `D`.
Its coefficient complex is `[E_k→E_k⊗Ω¹_X(log D)]`. Construct compact-support and middle
(parabolic) realizations, with parabolic hypercohomology the image of compact-support into
ordinary hypercohomology. Prove comparison with the image of Betti `H¹_c→H¹` for the same
local system, and hence with the supplied étale comparison. All maps commute with coefficient
extension and the Hecke pullback/trace correspondences. For the trivial coefficient on a smooth
proper characteristic-zero curve construct the Hodge sequence
`0→H⁰(Ω¹)→H¹_dR→H¹(O)→0`. For `E_k` construct the induced parabolic filtration: the differential
map identifies its holomorphic piece with `S_k`, and the coefficient pairing and Serre duality
identify the quotient with the dual cusp piece for the contragredient coefficients. Over `ℂ`
this is the holomorphic and antiholomorphic Eichler–Shimura decomposition. Carry `k≥2` through
all coefficient complexes and comparisons.

Proof: The coefficient de Rham resolution maps cusp forms to vector-valued differentials. Hodge filtration and Serre duality identify their holomorphic and conjugate subspaces with all `H¹_par` (Deligne2.10); taking the image `H¹_c→H¹` removes the boundary. Use the supplied ModularCurvesPartII §§14.1–14.4a comparisons and Hecke transport, and its §14.11 coefficient-domain pairing. The classical multiplicity-one and old/new decomposition of ModularForms Layers 4–5 and 8G extract the primitive rank-two multiplicity. Compact quaternionic `H¹` is a different carrier.

The API includes Parabolic realization commutes with extension of coefficient fields; the Hecke projector commutes with Galois and level maps for all `λ|ℓ`; transport and descent to level `N` allow `ℓ|N`; the primitive multiplicity has dimension two independent of the auxiliary full level, without a coprimality restriction at `ℓ`; pullback is adjoint to trace under the coefficient pairing.

**Checks.**

- For `k=2` the coefficient is constant and `H¹_par` is the Jacobian realization.
- For `k=2` the Hodge sequence `0→H⁰(Ω¹)→H¹_dR→H¹(O)→0` has dimensions `g, 2g, g`. On `X(1)≅ℙ¹` these are `0, 0, 0`, since `dim H⁰(O)=1` and `dim H¹(O)=0`; on the genus-one curve `X₀(11)` they are `1, 2, 1`, with `H⁰(Ω¹)=S₂(Γ₀(11))`.
- For the weight-twelve level-one cusp form the primitive classical summand has dimension two despite a larger full-level cohomology space.
- An Eisenstein boundary class maps to zero in the cuspidal projector.
- Weight `k=1` is excluded because the prescribed symmetric power would have exponent `−1`.
- The weight-two level-11 newform at `λ|11` is realized at `m=11` over `Spec ℤ[1/11]`; specialization at `q=2` is permitted, while `q=11` is excluded.
- For that same `λ`, levels `m=11` and `m=33` give the same primitive rank-two multiplicity. The level-11 model supplies good specialization at `q=3`, which is excluded from the level-33 comparison base.

*Needs:* [Integral elliptic logarithmic de Rham extension](#target-integral-elliptic-logarithmic-de-rham-extension); ModularCurvesPartII §§14.1–14.4a for the geometric `Sym^(k−2)R¹h_*` system, parabolic image, finite/adic and characteristic-zero comparisons, and level/isogeny/Hecke maps, and §14.11 for the pairing on its stated coefficient domain; ModularCurves Layers 5 and 10 for universal elliptic curves and compactification; EtaleCohomologyFoundations §§0.6, 0.8, 0.11, F.0–F.6 for scheme cohomology, compact support and duality; ComplexComparisonPartII §§C6.3–C6.6 for equivariant Betti–étale comparison; JacobianChallenge Layers A–B for coherent cohomology and Serre duality on smooth proper geometrically connected curves over a field; SchemeAndStackFoundations §§2.19–2.21, 3.3 for proper adjunction, trace and relative coherent duality over the integral bases; ModularForms Layers 4–5 and 8G for classical multiplicity one and old/new decomposition; Tau Ceti `TauCeti.symPowerRep`. The logarithmic de Rham/parabolic filtered comparison, higher-weight Eichler–Shimura decomposition, primitive classical projector and rank-two multiplicity are constructions here.

*Source:* [Deligne 1969](https://www.numdam.org/article/SB_1968-1969__11__139_0.pdf), §§1–2, Theorem 2.10, pp.141–148; Definition 3.9 and (3.10)–(3.12), pp.153–154; Propositions 3.18–19 and pairing (3.20), pp.158–159; §4, p.161, for the base `Spec ℤ[1/m,1/ℓ]` and unramifiedness outside `mℓ`.

<a id="target-classical-higher-weight-attachment"></a>

### R15.5A.2 Classical eigenforms of weight at least two

For a nonzero holomorphic form `f` of weight `k≥2`, level `N≥1` and character `ε` that is an eigenvector for every `T_p` with `p∤N`, a coefficient number field `K` containing `λ_p(f)` and `ε(p)`, and a place `λ|ℓ`, construct a continuous semisimple `ρ_{f,λ}:G_ℚ→GL₂(K_λ)`, unramified outside `Nℓ`, with arithmetic Frobenius polynomial `X²−λ_p(f)X+ε(p)p^(k−1)` at `p∤Nℓ`. Its image is compact and need not be finite. Good-place semisimple recognition proves uniqueness. For an Eisenstein eigensystem with `λ_p(f)=ψ₁(p)+ψ₂(p)p^(k−1)`, construct `ψ₁⊕ψ₂χ_cyc^(k−1)` directly from the cyclotomic Dirichlet-character construction of ArithmeticGaloisRepresentations §2.3; no reciprocity law enters.

The milestone `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.ClassicalModularGalois.higherWeight_attachment` states this existence, continuity, semisimplicity, unramifiedness and Frobenius polynomial on the pinned holomorphic character space, `Representation`, number-field adic completion and `AlgHom.IsArithFrobAt` carriers. It retains the coefficient-field embedding and permits `ℓ|N`.

For cusp forms pass to the normalized primitive associate with the same good-prime eigensystem and dualize its primitive cohomological multiplicity from R15.5A.1, allowing `ℓ|N`. At an auxiliary full level `m` divisible by `N`, use good-fibre specialization only at primes `q∤mℓ`. The q-isogeny correspondence gives `T_q=F+ε(q)V` and `FV=VF=q^(k−1)`, with `F` geometric Frobenius. On the primitive rank-two multiplicity construct a nondegenerate alternating pairing `B_f` from the coefficient pairing with the adjoint character block and root-dependent Fricke transport, extending coefficients to contain the required level roots. Its target is the one-dimensional Galois character `ε⁻¹χ_cyc^(1−k)`, whose geometric Frobenius at `q` acts by `ε(q)q^(k−1)`. Prove alternation using the isogeny adjoint and Fricke-square identities, including odd `k`; the natural cup pairing alone need not pair a character block with itself. Carry the transpose identity to this pairing as `B_f(Fx,y)=B_f(x,ε(q)Vy)`.

Derive the rank-two Frobenius polynomial from this pairing. Writing `c=q^(k−1)`, the transpose identity gives `B_f(Fx,Fy)=ε(q)c B_f(x,y)`, so the induced action on the top exterior power gives `det F=ε(q)c`. For an alternating pairing in dimension two the adjoint of `F` is `(tr F)I−F`. Thus `F+ε(q)V=λ_q(f)I` gives tr `F=λ_q(f)`, and `det(1−FT)=1−λ_q(f)T+ε(q)cT²`. This argument also covers scalar `F`. The dual has this polynomial at arithmetic Frobenius. For each `q∤Nℓ` choose a dominating full level `m` with `q∤m` and use auxiliary-level independence to obtain the polynomial and unramifiedness at `q`. Proper/parabolic specialization and tame cusps apply over `Spec ℤ[1/(mℓ)]`; no fibre at `ℓ` is required. Descent to `K_λ` uses the trace algebra of degree `≤2`: the rank-one idempotent `(1+c_∞)/2` for complex conjugation `c_∞` splits its possible central simple obstruction. In the reducible case, traces of `g` and `c_∞g` recover the two character values, so they descend too. This constructs a model, beyond equality of rationality fields.

The API includes Good-place trace `λ_p(f)` and determinant; determinant `εχ_cyc^(k−1)`; coefficient embeddings and auxiliary-level independence; uniqueness of semisimple attachments; invariance under nonzero rescaling and passage to the same primitive good-prime eigensystem; finite generation of a compact-image stable lattice over the coefficient valuation ring.

**Checks.**

- For `E₄=1+240q+2160q²+…`, `λ₂=1+2³=9` while `a₂(E₄)=2160=9a₁(E₄)`. Its attachment `1⊕χ_cyc³` has trace 9 at 2 when `ℓ≠2` and infinite image.
- For a normalized newform `g` and `c∈ℂˣ`, `λ_p(cg)=λ_p(g)` while `a_p(cg)=cλ_p(g)`. Thus `2Δ` has `a₂=−48` but `λ₂=−24` and the same attachment as `Δ` at each fixed coefficient place.
- The good-prime oldform `Δ(q³)` at level 3 has `a₁=a₂=0` but `λ₂=−24`; its attachment is that of `Δ`, with polynomial `X²+24X+2¹¹` at 2 for `ℓ≠2`.
- The weight-twelve level-one cusp form has polynomial `X²−τ(p)X+p¹¹`.
- A weight-two form has determinant `εχ_cyc`.
- Replacing arithmetic Frobenius by geometric Frobenius in that same polynomial fails the convention.
- For the weight-two level-11 newform at `λ|11`, Frobenius at 2 has polynomial `X²+2X+2` and unramifiedness holds outside 11, using an auxiliary level divisible by 11.
- In characteristic two, take `F=V=I`, `ε=c=1` and the standard alternating pairing. Then the Hecke eigenvalue is zero and the polynomial is `X²+1=(X+1)²`; alternation still gives the adjoint identity.
- Over any field, `F=0`, `ε=c=0`, eigenvalue zero and any `V` satisfy the three operator relations with the standard alternating pairing; the polynomial is `X²`.
- If `F=rI`, the transpose identity forces `ε(q)V=rI`, `λ_q(f)=2r` and `r²=ε(q)q^(k−1)`; the characteristic polynomial is `(X−r)²` even with a repeated root.
- On `ℚ²`, `F=I`, `V=2I` and `T_q=3I` satisfy the two operator relations with `ε(q)=1` and `c=2`, but have characteristic polynomial `(X−1)²` rather than `X²−3X+2`. They fail the nondegenerate pairing's transpose identity.

*Needs:* [R15.5A.1 The classical rank-two cohomological summand](#target-classical-parabolic-realization); [The root-dependent Hodge Fricke operator](#target-edixhoven-root-fricke-operator); ModularCurvesPartII §9.3 for the curve map and its universal isogeny; ArithmeticGaloisRepresentations Layer 1 and ArithmeticGaloisRepresentations Layer 5; ModularForms Layers 0, 4 and 8G; ArithmeticGaloisRepresentations §2.3 for the direct cyclotomic construction of the Dirichlet characters in the Eisenstein branch. The rank-two eigenprojector, alternating pairing with its transpose identity and coefficient descent are part of this attachment.

*Source:* [Deligne 1969](https://www.numdam.org/article/SB_1968-1969__11__139_0.pdf), pairing (3.20), pp.159–160; §4, Theorem 4.1 and Propositions 4.2–8, pp.160–166, especially the transpose identity in Proposition 4.8(ii), p.166; Theorem 4.9, p.167; [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Theorem 6.1 and Remarks 6.2–5, pp.520–521. The latter uses higher-weight attachment as an input.

<a id="target-classical-weight-one-prime-moments"></a>

### R15.5A.2a Classical weight-one prime moments and density

For a nonzero classical cusp form `f` of weight one, level `N≥1` and character `ε`, assume `T_q f=λ_q(f)f` for every prime `q∤N`. Let `K` be a number field containing these eigenvalues and the character values. Prove that `λ_q(f)∈O_K` and that every embedding `σ:K→ℂ` gives a nonzero weight-one cusp eigensystem of level `N` and character `σ∘ε` with eigenvalues `σ(λ_q(f))`. Use the integral Hecke rational structure and its scalar extension, rather than conjugating the values of a holomorphic function pointwise. For every `σ` prove convergence for real `s>1` and the bound

`Σ_{q∤N} |σ(λ_q(f))|²q^(−s) ≤ log(1/(s−1))+O_σ(1)`, as `s→1⁺`.

The representative theorem `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.ClassicalModularGalois.weightOne_primeMoment` states convergence and this inequality for the supplied cuspidal eigenform carrier; applying it to each conjugate gives the displayed bounds.

Construct the classical Rankin–Selberg specialization directly. By classical old/new theory pass to a normalized primitive associate `g` of level `M|N`. With `b_n=a_n(g)`, establish convergence of `Σ|b_n|²n^(−s)` for `Re(s)>1` and the meromorphic extension of `ζ(2s)Σ|b_n|²n^(−s)` by the classical Rankin integral, holomorphic on `Re(s)>1` and with a simple pole of positive residue at `s=1`. This uses unfolding against the classical real-analytic Eisenstein kernel; the kernel, its residue and this unfolding are part of this target. Identify its finite bad-prime correction with the self-pair Euler product `L_g(s)=∏_{q∤M}det(1−(Φ_q⊗overline(Φ_q))q^(−s))⁻¹`, where `Φ_q` is semisimple with trace `λ_q(g)` and determinant `ε(q)`. Prove that correction holomorphic and nonzero at 1 using the classical bad-prime bounds, and that `L_g(s)` is holomorphic and positive along the real interval `s>1`. For large real `s` the logarithm is `Σ_{q∤M}Σ_{r≥1}|tr(Φ_q^r)|²q^(−rs)/r`. Its coefficients are nonnegative, so Landau positivity extends convergence to `s>1`; the simple pole bounds its `r=1` part by `log(1/(s−1))+O(1)`. Discarding the finitely many additional primes dividing `N` preserves the upper bound. This construction uses neither the weight-one Artin attachment nor a pointwise Ramanujan bound. General adelic Rankin–Selberg constructions belong to AutomorphicLFunctionsAndLocalFactors AL.3.

For `B>0` put `Y_B={a∈O_K : |σ(a)|≤B for every σ:K→ℂ}` and `X_B={q∤N : λ_q(f)∉Y_B}`. Prove `Y_B` finite and an upper Dirichlet-density bound `[K:ℚ]/B²` for `X_B` by summing the conjugate moment inequalities. Interpret the bound using the supplied `NumberField.Set.IsUpperDirichletDensityBound` on rational prime ideals. Its denominator is the all-prime sum; ArithmeticDirichletSeries §7.2 identifies it asymptotically with `log(1/(s−1))`. Equivalently the limsup of `Σ_{q∈X_B}q^(−s)/log(1/(s−1))` is at most `[K:ℚ]/B²`. Thus for every `η>0` there are a finite `Y⊂O_K` and an exceptional prime set of upper Dirichlet density at most `η`, outside which every good eigenvalue lies in `Y`. Adding primes dividing `N` preserves this bound.

The milestone `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.ClassicalModularGalois.weightOne_finiteEigenvalues` states the resulting finite-set assertion on the pinned cuspidal eigenform carrier. For every `η>0` it gives a finite set of complex eigenvalues whose exceptional good primes satisfy `Σq^(−s)≤(η+ε)log(1/(s−1))` for every `ε>0` and all `s>1` sufficiently near 1.

For a nontrivial finite Dirichlet character `χ`, deduce `Σ_q χ(q)q^(−s)=O(1)` near `s=1` from its Euler logarithm and Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`. Consequently two distinct finite Dirichlet characters have trace prime moment `2log(1/(s−1))+O(1)`, the comparison used for irreducibility in R15.5A.3.

Use this same density convention in R15.5A.3: for a finite residual image `G`, Chebotarev identifies the density of a conjugacy-stable subset with its cardinality divided by `|G|`. If the complement of the polynomial fibres indexed by `Y` is contained in the exceptional set, those fibres occupy at least `(1−η)|G|` elements.

**Checks.**

- For `[K:ℚ]=2` and `B=4` the upper bound is `1/8`; enlarging `K` requires summing over its embeddings, rather than keeping the degree-one bound.
- The oldform `g(q^d)`, `d>1`, can have `a₁=0` while retaining the primitive associate's good eigenvalues; the moment statement concerns those eigenvalues and does not divide by `a₁` of the oldform.
- For the weight-one Eisenstein eigensystem `λ_q=1+χ_{−3}(q)`, the prime moment is `2log(1/(s−1))+O(1)`, since `λ_q=2` on `q≡1` mod 3 and 0 on `q≡2` mod 3. Cuspidality is indispensable for the coefficient 1.
- Removing or adding the finitely many primes dividing `N` changes no upper density; a bound on the limsup does not assert existence of the exceptional set's density.
- A conjugacy-stable residual subset whose complement has density at most `η` has at least `(1−η)|G|` elements, supplying the density input to the uniform image bound.

*Needs:* ModularForms Layers 0, 4–5, 8G and 8W for classical cusp forms, primitive associates, coefficient rationality and the integral weight-one Hecke module; [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) Layers 3, 7–8 for Euler-product logarithms, all-prime normalization, finite-error density bounds and Landau positivity; Chebotarev Layer 10 for finite-image Frobenius densities; Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero` for the nontrivial-character prime sums. The classical Rankin integral, its self-pair comparison and the conjugate prime-moment/density specialization are constructions here.

*Source:* [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Proposition 2.7(3–4), p.512; Proposition 5.1, equation (5.1.1) and proof 5.2, pp.518–519; §5.4 and Proposition 5.5, pp.519–520; §8.2 and §8.7, pp.525–527.

<a id="target-classical-weight-one-attachment"></a>

### R15.5A.3 The Artin representation of a classical weight-one form

For a nonzero holomorphic form `f` of weight one, level `N≥1` and odd Dirichlet character `ε` that is an eigenvector for every `T_p` with `p∤N`, construct a continuous finite-image semisimple `ρ_f:G_ℚ→GL₂(ℂ)`, unramified outside `N`. At arithmetic Frobenius `p∤N` its polynomial is `X²−λ_p(f)X+ε(p)`, with `λ_p(f)` the Hecke eigenvalue. It is unique up to isomorphism, irreducible exactly when `f` is cuspidal, has determinant `ε`, and complex conjugation has eigenvalues `1,−1`. Reductions specify a number field, coefficient place, residue embedding and stable lattice.

The milestone `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.ClassicalModularGalois.weightOne_attachment` states existence of the continuous finite-image semisimple representation, its unramifiedness, its arithmetic Frobenius polynomial and the equivalence between irreducibility and cuspidality for the pinned holomorphic character-space carrier, including Eisenstein forms and arbitrary nonzero scaling.

Proof: Eisenstein forms give their two Dirichlet characters. For cusp forms, [R15.5A.2a](#target-classical-weight-one-prime-moments) puts `λ_p(f)` in a fixed finite set outside a set of arbitrarily small upper Dirichlet density. At infinitely many split `ℓ`, multiply by an Eisenstein form `≡1`, then apply DS lifting and higher-weight attachment. Chebotarev transfers that same polynomial-density bound to the finite residual image, as specified in R15.5A.2a. DS7.2 bounds its order uniformly: torus fibres have at most two elements, a torus normalizer has index two, exceptional projective groups and their determinant-controlled scalar kernels are bounded, and `SL₂` polynomial fibres have at most `ℓ²+ℓ` elements, forcing `ℓ` bounded in that branch.

Adjoin roots of unity of orders `≤A`, the image-order bound. Their finite polynomial set `Y` contains every good polynomial of `f`, by infinitely many reductions. Choose `ℓ>A` preserving distinct elements of `Y`. Prime-to-order Maschke averaging kills deformation obstructions at successive complete-DVR levels and lifts the residual finite-group representation; a number-field splitting realization supplies its integral model. Injectivity on `Y` identifies the characteristic-zero polynomials. This permits icosahedral images and uses no Fong–Swan assumption. Recognition with a second `ℓ` removes the extra `ℓ-ramification`. Reducibility gives two finite-order continuous characters of `G_ℚ`; the converse classification of ArithmeticGaloisRepresentations §2.3 identifies them with Dirichlet characters `χ₁,χ₂`, and determinant recognition gives `χ₁χ₂=ε`. They are distinct since `ε` is odd, so their trace has prime moment `2log(1/(s−1))+O(1)`, contradicting the cusp bound of R15.5A.2a. Determinant recognition gives `ε` and oddness.

The API includes Good-prime trace `λ_p(f)` and determinant; cusp iff irreducible; uniqueness and invariance under nonzero rescaling; realization over a number field and lattice reduction; no regular-algebraic coefficient or finiteness assertion is imported from higher-weight cohomology.

**Checks.**

- A weight-one Eisenstein eigensystem gives the sum of its two finite Dirichlet characters.
- Every cuspidal weight-one attachment is irreducible and finite-image.
- Complex conjugation has trace zero and determinant `−1`, excluding the scalar involution.
- For `ε=χ_(−3)` the direct construction sends arithmetic Frobenius at 2 to `χ_(−3)(2)=−1`. The weight-one Eisenstein attachment `1⊕χ_(−3)` then has trace `0` and determinant `−1` at 2, matching `λ₂=1+χ_(−3)(2)=0` and `ε(2)=−1`.
- Let `χ` be the odd character mod 5 with `χ(2)=i`. The Eisenstein attachment `1⊕χ` has arithmetic Frobenius trace `1+i=λ₂` at 2; the geometric Frobenius convention would give `1−i`.
- For a normalized cuspidal weight-one newform `g`, 2g has Fourier coefficient `a_p(2g)=2λ_p(g)`, while its trace is `λ_p(g)` and `ρ_{2g}≃ρ_g`. At every good prime with `λ_p(g)≠0` these numbers differ.

Ramified factors require the separate local comparison.

*Needs:* [R15.5A.2 Classical eigenforms of weight at least two](#target-classical-higher-weight-attachment); [R15.5A.2a Classical weight-one prime moments and density](#target-classical-weight-one-prime-moments); [Deligne–Serre eigenvalue lifting](#target-deligne-serre-eigenvalue-lifting-lemma); ArithmeticGaloisRepresentations Layer 4 finite-image classification and ArithmeticGaloisRepresentations Layer 5 recognition; ArithmeticGaloisRepresentations §2.3 for the direct cyclotomic construction of Dirichlet Galois characters (Eisenstein branch and determinant) and, separately, for the converse classification of finite-order characters of `G_ℚ` (reducible case); ModularForms Layers 0, 4, 8G and 8W; Chebotarev Layer 10. The uniform finite-image bound and prime-to-order integral lifting are the key finite-group steps here.

*Source:* [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Theorem 4.1, Corollary 4.2 and Remarks 4.4–5, pp.513–515; Propositions 5.1 and 5.5, pp.517–520; Proposition 6.7 and Lemmas 6.11–13, pp.521–523; Proposition 7.2, pp.524–525; §8.1–7, pp.525–527.

### Examples

The weight-twelve level-one cusp form has a rank-two `λ`-adic attachment with polynomial `X²−τ(p)X+p¹¹` and infinite image. The weight-one Eisenstein eigensystem of character `χ_(−3)` gives the reducible finite-image attachment `1⊕χ_(−3)`, with trace 0 and determinant `−1` at 2. The weight-one cusp form `η(τ)η(23τ)` of level 23 and character `χ_(−23)` gives an irreducible attachment with image `S₃` whose complex conjugation has trace 0 and determinant `−1`.

### Dependencies

R15.1 and R15.5; ModularCurvesPartII §§9.3, 14.1–14.4a, 14.11; ModularCurves Layers 5 and 10; JacobianChallenge Layers A–B; SchemeAndStackFoundations §§2.19–2.21, 3.3; EtaleCohomologyFoundations §§0.6, 0.8, 0.11, F.0–F.6; ComplexComparisonPartII §§C6.3–C6.6; ArithmeticGaloisRepresentations Layers 1, 4 and 5 and §2.3; ModularForms Layers 0, 4–5, 8G and 8W; ArithmeticDirichletSeries Layers 3, 7–8; Chebotarev Layer 10.

<a id="layer-r15-6"></a>

## Layer R15.6 — Residual modularity and the classical target

The coefficient field, place, stable lattice and residual semisimplification are explicit parts of a modularity witness. Lattice independence compares witnesses at the same place and attached representation; coefficient conjugation transports the place as well. The local recipe and conductor then define the classical target. Comparisons with geometric mod-`p` forms use the integral reduction or justified Hasse-shift hypotheses from R15.5.

### Reduction spaces and residual witnesses

<a id="target-residual-modularity-with-a-chosen-place-and-coefficient-field"></a>

#### Classical reduction and Katz forms

Serre's historical mod-`p` cusp space consists of expansions obtained by reducing the integral analytic lattice of type `(N,k,ε₀)` at a chosen coefficient place, with `p∤N` and `k≥2`. It is the reduction-image subspace `S_red` from R15.2. Its inclusion into Katz's section space is Hecke-compatible, and equality uses the precise surjectivity and character-lattice hypotheses rather than a dimension count alone.

The classical convention imposes `ε(−1)=(−1)^k` and requires even `k` at `p=2`. That historical convention does not restrict all Katz weights: geometric weight one, including characteristic-two odd weights, is permitted. The `k≥2` condition makes `T_p` reduce to `U_p`. If level `p` is introduced in the historical formulation, its removal can raise weight; no level-`p` integral comparison is supplied merely by the smooth prime-to-`p` model. The chosen place remains part of the reduction data.

*Needs:* [The integral cusp lattice and its reduction image](#target-integral-lattice-and-reduction-image); [Deligne congruence and small-prime lifts](#target-deligne-congruence-and-the-explicit-p-equals-2-3-liftings).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.1, (3.1.3), printed p. 194; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.1, (3.1.6), printed pp. 194-195; [Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 4.2 and the paragraph following it, pp. 9-10 of the DVI; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.2, Remark `(6)` and footnote 2, printed p. 197.)

<a id="target-residual-attachment-for-reduction-eigensystems"></a>

#### Residual attachment for reduction eigensystems

Use [R15.5A.2](#target-classical-higher-weight-attachment) for the `λ`-adic attachment of normalized `weight≥2` newforms and [R15.5A.3](#target-classical-weight-one-attachment) for the Artin attachment of normalized weight-one newforms. Retain their good-prime polynomial `X²−a_ℓX+ε(ℓ)ℓ^(k−1)`, determinant `εχ_cyc^(k−1)`, coefficient embeddings and compact-image stable lattices. For a nonzero reduction eigensystem actually in the integral lattice image of R15.2, construct its semisimple residual representation by reducing an attached lift from R15.5. A Katz eigensystem requires the stated justified Hasse shift into that image. Prove agreement with every such lift from its good-prime characteristic polynomials and semisimple recognition. This defines residual attachment independently of the final modularity predicates and makes no claim that an arbitrary Katz form lifts in its original weight.

Prove lattice independence at a fixed place, coefficient extension and transport under coefficient conjugation with the place and residue embedding transported. A permitted shift by a multiple of `p−1` preserves the residual determinant exponent; compare only lifts with the same residual good-prime eigenvalues and character.

The headline `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.ResidualModularity.residual_attachment` states the classical reduction-eigensystem result on pinned carriers. Let `O` be a DVR in a coefficient number field `K`, with a chosen embedding `K→ℂ` and residue map `red:O→κ` into a finite field of characteristic `p`, with kernel the maximal ideal. For a holomorphic form of integer weight `k≥1`, level `N≥1` and character valued in `Oˣ`, require an `O`-valued q-expansion with nonzero reduction and the good-prime coefficient equations `a_(qn)+ε(q)q^(k−1)a_(n/q)=λ_q a_n` after reduction, where the second term is zero for `q∤n`. The theorem gives a continuous semisimple representation over `κ`, unramified outside `Np`, with polynomial `X²−λ_qX+red(ε(q))q^(k−1)` at arithmetic Frobenius `q∤Np`. It allows `p|N` and does not assume that the original characteristic-zero form is itself a Hecke eigenform. The full witness and its invariant weight and conductor remain the targets below.

**Checks.**

- The weight-twelve level-one form has residual good-prime polynomial `X²−τ(ℓ)X+ℓ¹¹` at `ℓ≠p`, including determinant transport under the chosen residue map.
- A weight-one attachment has finite image and determinant `ε`; its reduction retains the second Hecke term, so it is not obtained by dropping `V` from `T_p`.
- Two stable lattices in the same attachment at the same place give isomorphic semisimple reductions. Conjugating coefficients transports that place; an unrelated place with an untransported residue embedding is not identified by this comparison.

*Needs:* [R15.5A.2 Classical eigenforms of weight at least two](#target-classical-higher-weight-attachment); [R15.5A.3 The Artin representation of a classical weight-one form](#target-classical-weight-one-attachment); ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7; [Controlled eigenform lifting and weight shifts](#target-reduction-to-weight-at-least-two-and-to-a-true-eigenform); [The integral cusp lattice and its reduction image](#target-integral-lattice-and-reduction-image).

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Theorem 6.1, pp.520–521, Proposition 6.7, p.521, and §§6.9–6.13, pp.522–523.)

<a id="target-residual-modularity-witness"></a>

#### A residual modularity witness

An integral-model residual modularity witness for `ρ̄` includes a normalized eigenform `f` with its actual weight and level, its coefficient number field `K_f`, a place `λ∣p`, the corresponding coefficient and residue embeddings, an attached `λ`-adic representation, a chosen stable rank-two integral lattice and an isomorphism from its semisimple reduction to `ρ̄^ss` after passage to a common finite residue field. Each attachment and reduction is the actual one supplied by [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems) and ArithmeticGaloisRepresentations §§1.6–1.9, 5.7, rather than an unrelated matrix representation stored in the same record.

Expose the form, weight, level, coefficient field and place projections. Brauer–Nesbitt gives independence of the stable lattice at the same place and attached characteristic-zero representation. Scalar extension preserves the witness. For a coefficient-field isomorphism `σ:K_f≃K′`, simultaneously transport `f` to `σf`, `λ` to `σ(λ)`, and the lattice and attachment along `σ`. The induced residue-field isomorphism `σ̄` satisfies `σ̄ ∘ red_λ = red_σ(λ) ∘ σ`; for a residue embedding `ι`, use `ι′=ι ∘ σ̄⁻¹` at the transported place. This does not assert that all unrelated coefficient places give the same fixed residual representation. Good-prime characteristic polynomials must match those of the chosen form, excluding unrelated valid representations as well. The intended signature is `Witness (ρ̄)` with projections to the normalized form, its coefficient field and place, the stable lattice, its attached representation and the residual semisimplification isomorphism; every compatibility listed here is part of the witness.

This is auxiliary witness data for the comparison with the coefficient-defined `ArisesFrom` below. For a general residual representation the isomorphism compares its semisimplification; an isomorphism to the given representation requires semisimplicity, in particular absolute irreducibility.

Required objects and properties:

- A witness contains the eigenform, field, place, stable lattice and residual semisimplification comparison.

- The weight of its characteristic-zero normalized eigenform.

- The level of its normalized eigenform.

- Replacing the stable lattice preserves the residual semisimplification.

**Checks.**

- The 11a1 weight-two newform at `p=3` cannot witness the trivial rank-two representation. Counting `E(𝔽₂)` gives 5 points, so at Frobenius 2 its reduction has trace `−2=1` and determinant 2 in `𝔽₃`, whereas the trivial representation has trace 2 and determinant 1; their characteristic polynomials differ.

- A witness extends to a larger finite residue field with the same weight and level.

- Simultaneous transport of the form, place and residue embedding gives `aₗ(σf) mod σ(λ) = σ(aₗ(f)) mod σ(λ) = σ̄(aₗ(f) mod λ)`. Applying `ι′=ι ∘ σ̄⁻¹` recovers `ι(aₗ(f) mod λ)`.

- For the weight-one form `47.1.b.a`, set `a=a₂(f)=(√5−1)/2`, so `a²+a−1=0`. At 11, let `λ=(11,a−3)` and `σ(a)=−1−a`, giving `σ(λ)=(11,a−7)`. The residue fields are `𝔽₁₁` and `σ̄` is the identity. Reducing the unchanged coefficient at the other place gives `7≠3`; conjugating it gives `σ(a) mod σ(λ)=−1−7=3`, as required.

*Needs:* [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems); ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7.

([Khare–Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Introduction, preprint pp.1–2; [Horawa](https://people.maths.ox.ac.uk/horawa/Hilbert.pdf), “Weight one form of level 47”, printed p.57.)

The coefficient-defined predicate below is the shared interface for the consumers [SerreWeightAndLevelOptimisation](../SerreWeightAndLevelOptimisation/README.md) §1.4, [EllipticCurveModularity](../EllipticCurveModularity/README.md) R29.2, [ClassicalSerreModularity](../ClassicalSerreModularity/README.md), [OrdinaryAutomorphicFormsAndModularityLifting](../OrdinaryAutomorphicFormsAndModularityLifting/README.md), [GL2ModularityLifting](../GL2ModularityLifting/README.md) and [GL2AutomorphicRepresentationsAndTransfer](../GL2AutomorphicRepresentationsAndTransfer/README.md) R17.5. Curve-level and Frey-level formulations use abbreviations of this predicate. The characteristic-three weight comparison in R15.5 supplies the weight-two realization needed by the last consumer.

### Modularity predicates and their comparisons

<a id="target-s-type-arises-from-and-modular"></a>

#### S-type and modularity predicates

For a continuous `ρ̄:G_ℚ→GL₂(𝔽̄_p)`, define S-type to mean absolute irreducibility and odd determinant. In characteristic two the determinant condition for complex conjugation is automatic, while irreducibility remains a separate condition. For a normalized cuspidal full eigenform `f` of positive weight `k` and level `N`, let `A_f⊂ℂ` be the subring generated by all positive-index Hecke eigenvalues and unit nebentypus values. Under first-coefficient normalization these eigenvalues are its Fourier coefficients; extending the character by zero adds no generators. Define `ArisesFrom(f,p,ρ̄)` by the existence of one unital ring map `φ:A_f→F` to the residual coefficient field of characteristic `p`, such that at every prime `ℓ∤Np`, `ρ̄` is unramified and every arithmetic Frobenius lift satisfies `tr ρ̄(Frob_ℓ)=φ(a_ℓ(f))` and `det ρ̄(Frob_ℓ)=φ(χ_f(ℓ))ℓ^(k−1)`. This is the single residual attachment predicate; it applies to normalized full eigenforms and in particular newforms. Define `IsModular(p,ρ̄):=∃ N k f, 1≤k ∧ ArisesFrom(f,p,ρ̄)`, including the nonzero level and full cusp eigenform in the existential. The attachment formulation uses the same characteristic polynomial, with integer weight exponent `k−1`, on `Representation F (Field.absoluteGaloisGroup ℚ) (Fin 2 → F)` for finite `F`; its inertia and Frobenius conditions are imposed at every maximal ideal above each good prime. Continuity is carried by consumers that use it, including the integral-model comparison. Primitive associates give the equivalent newform formulation. Rescaling a full eigenform leaves this coefficient ring and attachment predicate unchanged; normalization gives the stated Fourier-coefficient formulation. The trace/determinant design follows the Imperial College London FLT project.

The integral-model reading is a theorem, not the definition: for continuous absolutely irreducible `ρ̄`, `ArisesFrom(ρ̄,f)` is equivalent to an integral model of the attachment of `f` having semisimple reduction isomorphic to `ρ̄` after compatible coefficient extension. For a general continuous `ρ̄` only its semisimplification is identified; Frobenius polynomials do not recover a nonsplit extension. The coefficient map specifies the place and residue embedding. Equivalently there are a maximal ideal `P` of `integralClosure ℤ ℂ` containing `p` and an embedding of its residue field into `𝔽̄_p` giving the same coefficient and character congruences. For a smaller residual field make this comparison in its algebraic closure. The coefficient-prime formulation is a comparison theorem, not the primary predicate.

Through AutomorphicFormsOnReductiveGroups [§5.8](../AutomorphicFormsOnReductiveGroups/README.md#58-residual-and-torsion-hecke-eigenclasses) and [§7.3](../AutomorphicFormsOnReductiveGroups/README.md#73-hecke-and-diamond-normalization-for-gl₂), the same identities mean agreement of `galoisAnemicEigenSystem ρ̄` and the reduced form eigensystem away from `Np`: the arithmetic coordinates are `T_ℓ=tr` and `S_ℓ=ℓ⁻¹det`. Also prove the maximal-Hecke-ideal reading: in the faithful integral Hecke image on the fixed weight/level/character lattice, there are a maximal ideal `𝔪` containing `p` and an embedding `T/𝔪→𝔽̄_p` matching both coordinates, with `𝔪` containing the kernel of the characteristic-zero eigencharacter of `f`. That containment is required to refer to this specific `f`, rather than an unrelated form of the same weight and level.

Prove coefficient-field invariance using the actual scalar extension, finite-field descent and residue-place transport. The rational elliptic curve 11a1, `y²+y=x³−x²−10x−20`, supplies a test: its residual representation at 3 is S-type with conductor 11, weight 2 and trivial determinant character, and its associated newform gives a witness. At 5 its rational isogeny supplies a proper invariant line, so it fails S-type. At 2 an involution has determinant `−1` in the residue field without requiring the matrix to equal the identity.

Required objects and properties:

- `ρ̄` continuous, absolutely irreducible and odd.

- The subring generated by the full Hecke eigenvalues and unit character values.

- A single coefficient ring map gives unramifiedness and the trace/determinant identities at all primes away from `Np`.

- A full cusp eigenform of positive weight and nonzero level satisfies `ArisesFrom f p ρ̄`.

- IsSType `ρ̄ ↔` IsSType (`ρ̄ ⊗_F F′`).

- For a fixed coefficient map `φ:A_f→F` and an injective field map `F→F′`, the defining identities hold before extension if and only if they hold after extension with the composite map. The existential predicate is invariant between algebraically closed coefficient fields. Descent to a smaller field also requires the reduced full eigensystem to have values in that field.

- For an injective map `ι:F→F′` between finite characteristic-`p` fields and representations whose standard-basis matrices satisfy `ρ′(σ)=map ι (ρ(σ))`, extending coefficients carries the coefficient map and Frobenius polynomials forward. This implication needs no irreducibility.

- If `N∣M`, a form at level `N` gives the same system away from `Mp` on its oldspace at level `M`; there exists a full eigenform `g` of the same positive weight at level `M` with the same prime eigenvalues and character values away from `M`, and attachment to the scalar-extended representation over some finite `F′/F`. A primitive associate still has its actual level dividing `M`; a newform of level `N` is never relabelled as a newform of level `M`.

- For continuous absolutely irreducible residual representations, the coefficient predicate is equivalent to the integral-model witness, with compatible place and residue embeddings.

- The two arithmetic Hecke coordinates agree exactly when the Frobenius trace/determinant identities do.

- The fixed-form predicate is equivalent over `𝔽̄_p` to the maximal-ideal and residue-embedding condition, including containment of the form's characteristic-zero eigenkernel.

- Over `𝔽̄_p`, a coefficient reduction extends to a prime of the algebraic integers in `ℂ`; conversely that prime and its residue embedding give the defining coefficient map.

**Checks for S-type.**

- `E[3]` for 11a1 is of S-type with `N = 11`, `k = 2`, `ε = 1`, and arises from 11a1.

- `E[5]` for 11a1 is reducible, hence not of S-type.

- At `p = 2` oddness is automatic: `det ρ̄(c) = 1 = −1` in `F`.

**Checks for ArisesFrom.**

- `E[3]` for 11a1 arises from its normalized weight-two newform, using its rational coefficient field and the place at 3.

- The trivial rank-two `𝔽₃` representation does not arise from that form: at Frobenius 2 its polynomial is `(X−1)²`, while the form gives `X²−X+2`.

- `E[3]` for 11a1 does not arise from `Δ`. At Frobenius 2 its trace is `−2=1` in `𝔽₃`, whereas `τ(2)=−24` reduces to 0. The different traces give different characteristic polynomials.

- A nonsplit unipotent representation and its semisimplification can have identical Frobenius trace and determinant; the integral-model isomorphism theorem therefore retains absolute irreducibility.

- At level `N∣M`, the oldspace preserves the primes away from `Mp`; the primitive form's exact conductor level need not become `M`.

- A maximal ideal of a full Hecke image not containing the chosen form's eigenkernel may belong to another eigenform and cannot establish attachment to this `f`.

**Checks for IsModular.**

- The weight-two newform of 11a1 supplies a modularity witness for `E[3]`.

- The semisimplification of `E[5]` for 11a1 is modular through the same newform. The rational point `(5,5)` has order 5 and supplies an invariant line, so this representation fails S-type.

- The trivial rank-two `𝔽₃` representation is not modular. Every newform attachment has determinant `−1` at complex conjugation, since `ε(−1)=(−1)^k` and `det ρ_f=εχ_cyc^(k−1)`; reduction and semisimplification preserve this determinant. The trivial representation has determinant `1≠−1` in `𝔽₃`.

*Needs:* AutomorphicFormsOnReductiveGroups §§5.8, 7.3; ModularForms Layers 4, 8, 8G and 8W; [A residual modularity witness](#target-residual-modularity-witness); [Invariance and renormalized twists](#target-recipe-well-definedness-and-twisting); [Determinant and parity](#target-determinant-parity-and-weight-mod-p-minus-one); ArithmeticGaloisRepresentations Layer 3; ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7.

([Khare–Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 (authors' preprint); [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §1.5, pp.508–509, §4.5, p.514, Theorems 6.1 and 6.7, pp.520–522, and §6.10, p.522, for completion to a full eigenform.)

<a id="target-serre-conjecture-target-with-N-k-epsilon"></a>

#### The classical Serre target

For an S-type `ρ̄` define `ClassicalTarget(ρ̄)` to assert a residual modularity witness with normalized eigenform of weight exactly `k(ρ̄)`, level exactly `N(ρ̄)` and residual diamond character `ε(ρ̄)`. Here `N` is the prime-to-`p` Artin conductor from ArithmeticGaloisRepresentations Layer 3, with exponent `dim(V/V^(G₀))+b(V)`, `k` is the complete local recipe and `ε` is determined by `det ρ̄=εχ̄_p^(k−1)`. This defines the target, proves its implication to modularity and its field-transport equivalences, and states the conditional geometric formulation. Universal residual modularity and weight/level minimality are outside this roadmap’s scope.

Serre's bad-prime eigenvalue prediction is a further refinement: `a_ℓ≠0` precisely when the local representation admits the relevant one-dimensional unramified quotient, and then `a_ℓ` is its Frobenius eigenvalue. The `p`-unramified classical weight-`p` situation allows two `p`-eigenvalues with product `ε(p)`. These data distinguish the exact target from a bare good-prime eigensystem. The unramified local branch uses classical weight `p`, and the dyadic très branch uses 4; replacing them by Edixhoven's 1 and 3 would change this predicate.

Required objects and properties:

- Existence of a witness of the invariant level, weight and residual character.

- A classical-target witness is a modularity witness.

- The target is invariant under extending the finite residual field.

**Checks.**

- The requested weight is 2 precisely under the explicit local finite-flat and determinant criterion.

- At odd `p` and unramified local representation the requested classical weight is `p`, rather than Edixhoven’s weight 1.

- At `p=2` a wild très-ramifiée local representation requests weight4, not3.

*Needs:* [A residual modularity witness](#target-residual-modularity-witness); [S-type and modularity predicates](#target-s-type-arises-from-and-modular); ArithmeticGaloisRepresentations Layer 3; [Invariance and renormalized twists](#target-recipe-well-definedness-and-twisting).

([Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.2, (3.2.1)-(3.2.5), printed pp. 195-196; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.2, Remark (5), printed p. 197; [Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 1.2, (1.2.2), printed p. 181.)

<a id="target-modularity-formulations-and-determinant"></a>

#### Geometric and classical modularity formulations

For an absolutely irreducible odd residual representation, compare the existence of a normalized geometric mod-`p` eigensystem giving it with a characteristic-zero residual witness at a controlled shifted weight and level. The forward direction uses R15.5 only after its actual reduction-image hypothesis or justified Hasse shift; [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems) supplies the attached lift and its reduction, and ArithmeticGaloisRepresentations §§5.1, 5.7 recognize its semisimple reduction from Frobenius characteristic polynomials away from pN. The reverse direction uses the integral lattice comparison and reduction. The cusp `H¹` and integral character-projector conditions are part of this equivalence.

The determinant is `det ρ̄=ε̄χ̄_p^(k−1)`, hence `ε̄(−1)=(−1)^k` for odd `p`. A shift `n` divisible by `p−1` preserves its cyclotomic exponent. The weight-two consequence is exactly the finite-flat determinant criterion in its specified coefficient setting, with the dyadic tame descent interface retained. The equivalence compares witnesses and representations; it does not establish minimal weight or conductor level.

*Needs:* [A residual modularity witness](#target-residual-modularity-witness); [Controlled eigenform lifting and weight shifts](#target-reduction-to-weight-at-least-two-and-to-a-true-eigenform); [Determinant and parity](#target-determinant-parity-and-weight-mod-p-minus-one); [The weight-two criterion](#target-weight-two-iff-finite-flat-at-p); [The dyadic weight dichotomy](#target-dyadic-weight-two-or-four); [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems); ArithmeticGaloisRepresentations §§1.6–1.9, 5.1–5.7.

([Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.9–6.11, printed p.522; [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.8 and 6.12–6.13, pp.522–523.)

### Examples

The curve 11a1 gives an S-type representation at 3 and a reducible representation at 5. An unramified local representation requests classical weight `p`, and a dyadic très extension requests weight 4. Changing the coefficient place transports the residue embedding as well as the eigenvalues.

### Dependencies

R15.4–R15.5A; ArithmeticGaloisRepresentations Layers 1, 3 and 5; [Residual attachment for reduction eigensystems](#target-residual-attachment-for-reduction-eigensystems).

## Reading and suggested Lean statements

The [suggested file](Suggested.lean) states seven headline results: the higher-weight and weight-one classical attachments, the weight-one prime-moment and finite-eigenvalue density theorems, residual attachment for reduction eigensystems, Deligne–Serre eigenvalue lifting and all-prime bounded denominators. It is not an exhaustive checklist. Geometric section spaces, coherent correspondences, local Galois classification and the full place-sensitive witness comparisons require objects absent from the library pins; their mathematical targets are specified in the layers above. The compiled statements use the native analytic, representation and commutative-algebra carriers.

The prose Checks distinguish negative global weights from negative supersingular fibres, weight-zero functions from constants, integral reductions from all Katz forms, linear `V` from absolute Frobenius, curve Fricke from its Hodge scalar, full-boundary characters from a single cusp orbit, peu from très with the same semisimplification, and eigenvalue lifting from a prescribed residual vector.

## Sources and pagination

All statements above are mathematical formulations in the conventions of this roadmap. Source citations identify results or proof ingredients, including where a general construction is used through its owner. Journal page numbers and author-file page numbers are distinguished below; the editions are part of the locators.

* Pierre Deligne, [Formes modulaires et représentations ℓ-adiques](https://www.numdam.org/article/SB_1968-1969__11__139_0.pdf), Séminaire Bourbaki, exposé 355 (1969), pp.139–172. §§1–3 construct the parabolic coefficient realization and its pairing; §4 constructs the higher-weight attachment and coefficient descent.
* Pierre Deligne and Jean-Pierre Serre, [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Annales scientifiques de l'ENS, series 4, 7 (1974), pp.507–530. Proposition 2.7 concerns the integral lattice; §6.9 and Lemma 6.11 concern weight shift and eigenvalue lifting, pp.521–523. §§4–8 supply the classical weight-one attachment, second-moment argument, uniform finite-image bound and prime-to-order lifting.
* Jean-Pierre Serre, [Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Duke Mathematical Journal 54 (1987), pp.179–230. §§1–2 give the local invariants and recipe, pp.180–192; §§3.1–3.2 give reduction conventions and the classical formulation, pp.192–198.
* Bas Edixhoven, [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Inventiones 109 (1992), pp.563–594, using the author DVI dated 24 December 1998. All citations marked DVI refer to that file's own pages, especially §§2–4, pp.3–11 and §§7–8, pp.23–28; they are not journal page numbers.
* Michel Raynaud, [Schémas en groupes de type (p,…,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Bulletin de la Société Mathématique de France 102 (1974), pp.241–280, especially §§3.2–3.4, pp.265–271. The tame prolongation input is Theorem 3.4.3.
* Nicholas M. Katz, [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Lecture Notes in Mathematics 350 (1973), pp.69–190. Locators use printed volume pages and, where supplied, the independent Ka-nn running marks. §1 treats sections, q-expansion, descent, base change and Hecke; §2 the Hasse lifts; §4 the ordinary weight congruences; Appendix A1.3 the differential comparison.
* Nicholas M. Katz, [A result on modular forms in characteristic p](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), Lecture Notes in Mathematics 601 (1977), pp.53–61, §§I–IV. Used for the geometric theta and small-characteristic differential input.
* H. Darmon, F. Diamond and R. Taylor, [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), authors' revised version of 9 September 2007. Lemma 4.1, p.107, supplies the specified weight-two integral-Hecke comparison; its hypotheses remain in force.
* Frank Calegari and David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Inventiones 211 (2018), pp.297–433. §3.2.1–3.2.3 supplies the coherent operations, pp.313–318; the duality after Lemma 3.7 is on pp.322–323; the weight-one doubling occurs in the proof of Theorem 3.11, pp.327–328. The full cusp-type boundary statement above retains the two-character calculation required beyond the single-orbit formula of Remark 3.4.
* Frank Calegari and David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), author advance-publication version, DOI 10.1215/00127094-2019-0044; final Duke 169 (2020), pp.801–896. The `GL₂` model in the proof of Lemma 8.14 is cited at local pp.65–67, with the local p.66 passage corresponding to final p.866.
* Frank Calegari, Vesselin Dimitrov and Yunqing Tang, [The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Journal of the AMS 38 (2025), pp.627–702. Lemma 4.2.2, p.655, is the bounded-denominator application with `q=e^{πiτ}`.
* Lue Pan, [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), arXiv:2209.06366v1, §4.1.2, p.34. That version and pagination specify the logarithmic differential input.
* Luis Dieulefait and Ariel Pacetti, [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), arXiv:2108.07577v2, Lemma 1.14, pp.8–9. Used for the normalized bad-dihedral niveau calculation.
* Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), authors' preprint. §1, pp.2–3 supplies the S-type and modularity conventions; §6.2(ii), p.11 gives the normalized bad-dihedral consequence.
* Fred Diamond and Jerry Shurman, *A First Course in Modular Forms*, Graduate Texts in Mathematics 228, Springer, 2005, DOI 10.1007/978-0-387-27226-9. §5.8, Proposition 5.8.5, gives the coefficient recurrence of normalized eigenforms.
* Naomi Jochnowitz, [A study of the local components of the Hecke algebra mod ℓ](https://doi.org/10.1090/S0002-9947-1982-0642340-0), Transactions of the AMS 270 (1982), pp.253–267. §7 supplies the level-one theta-cycle analysis used in Edixhoven §3.2.
* Jean-Pierre Serre, [Valeurs propres des opérateurs de Hecke modulo ℓ](https://www.numdam.org/item/AST_1975__24-25__109_0.pdf), Astérisque 24–25 (1975), pp.109–117. Théorème 3, printed p.114, supplies level-one weight reduction, including `p=2,3`.
