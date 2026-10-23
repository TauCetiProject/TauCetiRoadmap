# Roadmap: Euler systems, Kolyvagin systems and higher-rank descent

**Summary.** This roadmap takes arithmetic Euler classes to Selmer bounds through rank-one systems, bounded-error descent, self-dual structure, higher-rank Stark and Kolyvagin systems, and Iwasawa specialization. The construction uses the coefficient and local-condition interfaces of SelmerIwasawaCohomology §§2.1–2.19, 3.0–3.7; its applications take arithmetic class families and their norm and congruence relations as explicit hypotheses. Nonzero bottom classes give bounds; primitivity is an additional hypothesis for equality.

## Scope and ownership

This roadmap owns Euler-system and Kolyvagin-system carriers, their derivative and regulator maps, and the conditional Selmer bounds. Distinguished arithmetic systems and their geometric hypotheses are explicit inputs to its application theorems. Cyclotomic, Kato and Rubin–Stark applications supply their own classes and reciprocity laws. An Euler-system carrier alone does not construct a Beilinson–Flach family.

Existing Mathlib exterior powers, duals, module length and torsion decompositions are consumed directly. Tau Ceti supplies discrete continuous cohomology, Shapiro, corestriction, class groups and generic Fitting-ideal theory: `TauCeti/RingTheory/FittingIdeal/Basic.lean` (`TauCeti.fittingIdeal`, `fittingIdeal_monotone`, `fittingIdeal_quotient_zero`), and `BaseChange.lean` (`fittingIdeal_baseChange`). These Fitting declarations are consumed directly at the pin. The arithmetic exterior-bidual lattice and system-level Fitting bounds below add Selmer and regulator structure to these existing operations. Self-injectivity is an explicit coefficient hypothesis in the higher-rank branch. PadicMeasuresIwasawaAlgebras Layer 6 supplies character rings, involutions and Fitting algebra; it asserts no Gorenstein or exact-duality theorem for an arbitrary character quotient. The arithmetic comparison with finite Cartier duality is constructed in Layer 0.2 below. IntegralIwasawaTheory §12.6 supplies the shared exterior-bidual and finite-CM Rubin-lattice core; Layers 6–7 add its finite-projective and Selmer comparisons, contractions, coefficient change and integral transfer; compact-coefficient duality and control belong to SelmerIwasawaCohomology and ArithmeticGaloisDuality.

Tau Ceti's `RepresentationTheory/Coinduced.lean` supplies exact subgroup coinduction and its coextension-of-scalars comparison (`Representation.coextendScalarsEquivCoind`), and discrete inflation–restriction is consumed from the continuous cohomology interface. `RepresentationTheory/Unipotent/PowerOrder.lean` also supplies `Representation.IsIrreducible.eq_trivial_of_isPGroup` and `.finrank_eq_one_of_isPGroup`. These generic constructions and the modular `p`-group theorem are consumed, not restated. The addition in 3.16 is the `χ`-semidirect Euler presentation and its arithmetic cochain descent. Mathlib's `Polynomial.dvd_iff_isRoot` and monic division supply each linear-factor step; over `O/M` the distinct roots must also have unit differences before the factors are multiplied.

For the algebraic input to the local-order argument, Tau Ceti supplies `TauCeti.IsSemisimpleRing.finiteWedderburnAlgebraPresentation` in `RingTheory/Semisimple/Wedderburn/Presentation.lean`: a finite semisimple algebra has a chosen finite product of matrix algebras over finite-dimensional division algebras. Its `RingTheory/Semisimple/MatrixDivisionRing.lean` supplies `TauCeti.Matrix.mulOppositeRingEquivEnd`, identifying the endomorphism ring of a nonzero matrix column module with the opposite division ring. These existing algebraic statements are inputs, rather than targets. The addition in 4.8 is their integral local-field refinement: maximal division orders, lattice stabilizers on both sides, rectangular lattice normal forms and uniform central conductors.

The rank-one Iwasawa layer consumes Layer 5 directly. Higher-rank Layers 6–7 have their own application branch; a higher-rank Iwasawa extension would consume both that branch and Layer 8. The maximal-order evaluation pairing and its local lattice inputs belong to Layer 4 here; ClassicalArithmeticCompletion §§7.4, 7.21 and 7.56 supply the order carrier, maximality and maximal-order existence under the nondegenerate regular-trace hypothesis. The CM-point application takes the displayed curve, abelian variety, point and norm/congruence data as hypotheses. The geometric construction of such data is outside the generic descent theorem; its precise norm and congruence hypotheses are part of the application statement.

Selected ring-class descent is compared with the cyclic cochain before localization, using one restriction bound for all intermediate ring-class fields. The local relation uses divided Frobenius operators and pairs the two character twists. These inputs supply the general-character rational descent route. At the coefficient prime, the higher-weight integral bound uses finite-character unramified `μ`-vanishing and two ordinary Poitou–Tate comparisons; it does not discard a rank-dependent specialization error. The exact arithmetic and local suppliers are stated below. The classical square-index bound with a constant independent of the imaginary quadratic field is a further application contract: the uniform annihilator-exponent theorem below does not itself establish that length formula.

### Prerequisites and boundaries: Selmer propagation and finite global duality

The field-linear results `LinearMap.IsFrobeniusFunctional.isPerfPair`, `LinearMap.isFrobeniusFunctional_iff_bijective`, and `LinearMap.IsFrobeniusFunctional.moduleInjective_self` in Tau Ceti’s `Algebra/Algebra/Frobenius/Basic.lean` are already present at the pin. They supply the finite-dimensional algebra specialization over a field; the additive-character comparison for mixed-characteristic finite `R` is the addition in Layer 0.2. Tau Ceti also supplies the principal-ring Baer argument as `Module.Baer.zmod_self` in `Algebra/Module/ZMod/Injective.lean`. The principal-ring Check consumes that fact rather than scheduling its proof again.

**Propagation commutes with local duality.** Let `F` be a local condition on `T` at `v` and `I` an ideal of `R`. The two local conditions induced on `T^*[I] = (T/IT)^*` agree: the orthogonal complement of the condition propagated to the quotient `T/IT`, and the condition propagated to the submodule `T^*[I]` from the orthogonal complement `F^*` on `T^*`. Consequently, for a Selmer structure `F, (F on T/IT)^* = (F^* on T^*[I])`, and the same holds for the passages `T → V` and `V → V/T` of a lattice in its rational representation.

The precise hypotheses are `T` a compact coefficient module over a coefficient ring (finite type, `m`-adic topology, continuous action), so that local Tate duality pairs `H¹(K_v,T)` and `H¹(K_v,T^*)` perfectly with `T^* = Hom(T, μ_{p^∞})` discrete of cofinite type.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Example 1.3.3, p. 12). The square relating propagation and orthogonal complements.

The local pairings for `T/IT × T^*[I]` and `T × T^*` are compatible with `T → T/IT` and `T^*[I] → T^*` (ArithmeticGaloisDuality §D7.7.2 (Compatibility of the local pairings for `T, V, W` and `W_M`)).

Apply the image/inverse-image rule for orthogonal complements (`orthogonal_map_eq_comap` of ArithmeticGaloisDuality §D7.7.1 (Perfect pairings and dual local conditions)): `(image of L)^⊥ =` inverse image of `L^⊥`.

The lattice case `T ⊆ V` and `W = V/T` is SelmerIwasawaCohomology §2.6 (From `V` to `T` and `W`; saturation) together with SelmerIwasawaCohomology §2.17 (Local duality for the finite conditions on `T` and `W_M`).

For `F` strict on `T` both constructions give the relaxed condition on `T^*[I]`. For `F` relaxed on `T` they give the kernel of `H¹(K_v,T^*[I]) → H¹(K_v,T^*)`; this is strict precisely when that map is injective, equivalently when `H¹(K_v,T) → H¹(K_v,T/IT)` is surjective under the perfect finite/compact-discrete pairing.

The condition on a quotient remembers `T: H¹_{F_can}(ℚ_p, T/IT)` is the image of `H¹(ℚ_p, T)`, which can be smaller than `H¹(ℚ_p, T/IT)` (Mazur–Rubin 2004, Definition 3.2.1 and Lemma A.1).

*Needs:* `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`.

**The Euler characteristic formula for Selmer modules.** Let `T` be a finite `R[[G_K]]`-module and `F` a Selmer structure on `T`. Then `length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = length H⁰(K, T) − length H⁰(K, T^*) − Σ_{v ∈ Σ(F)} (length H⁰(K_v, T) − length H¹_F(K_v, T))`, all lengths over `R`.

The precise hypotheses are `T` finite; lengths taken over `R` (for `R = ℤ/p^k` these are `p`-adic valuations of orders); `T` and `T^*` lie in the arithmetic coefficient category over a coefficient ring; the Selmer structure records this and `Σ(F) ⊇ S_p ∪ S_∞`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Proposition 2.3.5, p. 17). The finite-level Euler characteristic formula.

This is the finite Greenberg–Wiles formula supplied by ArithmeticGaloisDuality R02.5.1 and SelmerIwasawaCohomology Layer 2 for `M = T, L_v = H¹_F(K_v, T)`, rewritten additively.

To pass from orders to `R`-lengths apply the formula to `T` as an `R`-module: every group in it is an `R`-module of finite length and `#B = (#k)^{length_R B}`; the factors at `v ∉ Σ(F)` are 1 because `#H¹_ur(K_v, T) = #H⁰(K_v, T)`.

Mazur–Rubin state it over `ℚ` and include `p = 2`; the archimedean term uses ordinary `H⁰(K_v, T)`.

For `K = ℚ, R = 𝔽_p, T = μ_p` with the relaxed condition at `p` and strict at `∞` (`p` odd), the left side is `dim (ℤ[1/p]^×/p) − dim H¹_{F^*}(ℚ, ℤ/p) = 1 − 0` and the right side is `0 − 1 − ((0 − 2) + (0 − 0)) = 1`: the term at `p` is `length H⁰(ℚ_p, μ_p) − length H¹(ℚ_p, μ_p) = 0 − 2` and the term at `∞` is `0 − 0`.

*Needs:* `SelmerIwasawaCohomology Layer 2`; `Module.length`.

## Conventions

Each target specifies its coefficient ring and topology. Compact lattices, finite quotients and discrete Cartier duals have different cohomology interfaces. Pinned Tau Ceti `H¹` is an additive group; the `R`-linear coefficient and Selmer adapters come from SelmerIwasawaCohomology Layer 2. Discrete Shapiro and corestriction require an inverse-limit comparison before use on compact coefficients.

Frobenius is arithmetic unless a formula explicitly takes its inverse. Nekovář’s CM-point manuscript §1.1, p.2 normalizes Artin reciprocity by geometric Frobenius; transport that convention by inversion before using its norm and local formulas here. Rubin uses the dual Euler polynomial `det(1−Fr⁻¹X|T*)`; Mazur–Rubin use `det(1−FrX|T)`. A comparison transports both the coefficient and polynomial conventions. Finite/unramified and singular local groups remain distinct.

For truncated coefficients `R/m^k`, divisibility indices lie between 0 and `k` and the zero class has index `k`. Stable divisibility comes from a limit, rather than equality of every finite-level index. An annihilator exponent, a module length and a square-index formula are different invariants. An ordinary filtration on a self-dually twisted higher-weight representation retains the twist on the quotient; it is not assumed unramified.

Every use of the MR16 hypotheses below means the corrected field contract in Layer 1.13. The auxiliary field `L` is finite Galois in `K̄`, and the residual `H¹`-vanishing is imposed over `L·H_M(T)`. Both clauses are necessary for the local and global arguments. Finite coefficient levels use the compatible Frobenius refinements constructed there.

Transverse self-duality, and with it `(F_a^b(c))^* = (F^*)_b^a(c)` for `c ≠ 1`, holds under the hypothesis of Layer 1.10: the coefficient residue characteristic `p` is odd, or `p = 2` and `(|𝔽_q^×|/2)·T = 0` at every prime `q | c`. Every target below that dualizes a transverse local condition (Selmer lengths across edges, core vertices, Kolyvagin, Stark and self-dual systems) carries this hypothesis. Where a source admits `p = 2` through a nonself-duality branch, that branch is covered only under the same condition; Layer 1.10 records the excluded `ℚ₃` example.

## Exact supplier contracts

From Mathlib use `Module.length`, `Module.equiv_directSum_of_isTorsion`, `IsDiscreteValuationRing`, polynomial division by `X−C a`, exterior powers and linear duals, with their finite-generation and ring hypotheses. From Tau Ceti use `TauCeti.ContCohomology.H1`, `TauCeti.coind`, `TauCeti.ContCohomology.explicitShapiro1`, the discrete coefficient category and the named cohomology maps. `Suggested.lean` imports `Mathlib` and contains no theorem declarations: the headline results require arithmetic Selmer and system carriers absent at the pins. Discrete arithmetic cohomology is consumed by the targets below, with its coefficient adapters as specified. The pinned revisions are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

### From IntegralIwasawaTheory §12.6

Use the common `TauCeti.StarkSystems.exteriorBidual` and `toExteriorBidual`, determinant evaluation and naturality, and the rational determinant-integral lattice comparison for finite abelian group rings. Use `TauCeti.RubinStark.rubinStarkUnitLattice`, `rubinOrderMap` and `rubinLattice` for finite abelian CM extensions with ordered split-place data and torsion-free `T`-modified units; integral functionals are taken before minus projection. Layers 6.1 and 6.4 retain these carriers. Here `modifiedUnits` and `ordG` are adapters, and the finite-projective comparison, general semisimple-order rationalization, Selmer specialization, contractions, coefficient change and system theory are extensions of this core.

### From Mathlib and Tau Ceti at the pins

Mathlib's `LinearMap.charpoly`, `LinearMap.charpoly_monic` and `LinearMap.aeval_self_charpoly` apply to endomorphisms of finite free modules over a commutative ring. `Matrix.charpolyRev` is already `det(1 − X A)` and `Matrix.reverse_charpoly` identifies it with the reverse characteristic polynomial. The Euler polynomial `eulerPoly` of §2.1 is the coordinate-free endomorphism specialization of those operations; the arithmetic targets specify which Frobenius endomorphism to use. `Polynomial.divByMonic`, `Polynomial.dvd_iff_isRoot` and `Polynomial.mul_divByMonic_eq_iff_isRoot` supply monic linear division. `Module.equiv_directSum_of_isTorsion` supplies finite torsion-module decompositions over a PID, and `Module.length` supplies length. Exterior powers `⋀[R]^n M` and `Module.Dual`, `MonoidAlgebra`, `UnitAddCircle`, `Module.Injective` and `IsDiscreteValuationRing` retain their library meanings and hypotheses.

Tau Ceti's `RepresentationTheory/Homological/ContCohomology/LowDegree.lean` supplies `TauCeti.ContCohomology.H1`; `Coinduced.lean` supplies `TauCeti.coind`; `Shapiro/Basic.lean` supplies `TauCeti.ContCohomology.explicitShapiro1`; `Corestriction/Basic.lean` supplies `TauCeti.ContCohomology.explicitCor1`; and `DeltaNaturality.lean` supplies `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`. These are discrete-coefficient operations. `SmoothDiscrete/Basic.lean` supplies `TauCeti.IsSmoothDiscrete`. ProfiniteCohomology Layers 1–3 supply their comparison with canonical continuous cohomology; ArithmeticGaloisDuality §R02.1.2 supplies the compact-coefficient comparison. No additive-group carrier is silently treated as an `R`-linear Selmer module.

For finite-dimensional algebras over a field, `Algebra/Algebra/Frobenius/Basic.lean` supplies `LinearMap.IsFrobeniusFunctional.isPerfPair`, `LinearMap.isFrobeniusFunctional_iff_bijective` and `LinearMap.IsFrobeniusFunctional.moduleInjective_self`. `Algebra/Module/ZMod/Injective.lean` supplies `Module.Baer.zmod_self`. Layer 0.2 adds the mixed-characteristic additive-character comparison, using DerivedModuleAlgebra §1.M.1's injective hull and Matlis biduality.

`RepresentationTheory/Coinduced.lean` supplies `Representation.coextendScalarsEquivCoind` for subgroup coinduction and coextension of scalars. `RepresentationTheory/Unipotent/PowerOrder.lean` supplies `Representation.IsIrreducible.eq_trivial_of_isPGroup` and `Representation.IsIrreducible.finrank_eq_one_of_isPGroup` for finite-dimensional representations in exponential characteristic `p`. The `χ`-semidirect application uses these results without constructing a second coinduction or modular `p`-group theory.

`RingTheory/Semisimple/Wedderburn/Presentation.lean` supplies `TauCeti.IsSemisimpleRing.finiteWedderburnAlgebraPresentation`; `RingTheory/Semisimple/MatrixDivisionRing.lean` supplies `TauCeti.Matrix.mulOppositeRingEquivEnd` for a nonzero matrix-column module. These give the algebraic semisimple presentation and opposite-endomorphism comparison in §4.8, whose local-order refinements are additional targets.

`RingTheory/FittingIdeal/Basic.lean` supplies `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_monotone` and `TauCeti.fittingIdeal_quotient_zero` for finitely generated modules over a commutative ring; `RingTheory/FittingIdeal/BaseChange.lean` supplies `TauCeti.fittingIdeal_baseChange`. `RingTheory/Morita/Corner.lean` supplies `IsIdempotentElem.cornerEquivalence` and `IsIdempotentElem.moritaEquivalenceCorner` when the idempotent is full. Layer 4.8 proves fullness in its lattice application before using the corner equivalence. The Fitting bounds in Layers 6–7 add arithmetic content to the supplied ideals.

DerivedModuleAlgebra §1.T.1 supplies towers, `lim`, `lim¹`, their six-term exact sequence, the Mittag–Leffler criterion and the Milnor sequence. Section 1.M.1 supplies the injective hull of the finite residue field, exact Matlis duality and biduality on finite-type and cofinite-type modules over a complete noetherian local ring. The finite self-injective trace comparison is the additional construction of §0.2 here.

### From TauCetiRoadmap.Chebotarev Layer 10

The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the unramified primes whose Frobenius lies in a given conjugacy class `C` of the Galois group `G` have density `|C|/|G|`, in particular infinitely many, also after removing a prescribed finite set. Used for primes with Frobenius `τz` in a finite extension cut out by Galois cohomology classes.

This supplies Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 1.15 Existence of abundant tuples under the corrected span hypothesis; Layer 1.16 Residual detection of two classes and classes with prescribed ramification; Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting; Layer 4.7 Rational Kolyvagin descent for ring-class anticyclotomic Euler systems.

### From TauCetiRoadmap.ProfiniteCohomology Layer 11

The discrete torsion coefficient statement `cd_p(Ẑ)=1`, hence `H²(Ẑ,X/p^aX)=0` for each finite quotient. Compact passage is supplied separately by ArithmeticGaloisDuality; no assertion for every profinite coefficient module is inferred from this layer.

This supplies Layer 3.12 Local lifts of an Euler system at a prime and the finite-part theorem.

### From TauCetiRoadmap.ClassFieldTheory Layer 13

Existence and Artin correspondence for ring class fields. Derive the conductor-change kernel in Layer 2.9 from the residue-unit exact sequence and Artin correspondence: `Gal(K_{cℓ}/K_c)` has order `(ℓ+1)/[O_c^×:O_{cℓ}^×]`. The order is `ℓ+1` exactly when `O_c^× = {±1}`, that is when `c > 1` or `|D_K| > 4`. For `c = 1` and `K = ℚ(i)` or `ℚ(√−3)` it is `(ℓ+1)/2` or `(ℓ+1)/3`. The principal inert prime splits in `K_c/K`, and local reciprocity identifies the totally ramified relative extension.

This supplies Layer 2.9 Anticyclotomic Euler systems over ring class fields.

### From TauCetiRoadmap.ClassFieldTheory Layer 13

Existence of the ray class field of `K` modulo a prime `q`, with `Gal(K[q]/K) ≅` the ray class group `Cl_q(K)`, and the description of its ramification; used to define `K(q), K(1)` and `Γ_q`.

This supplies Layer 1.1 The fields `K(q), K(r)` and their Galois groups; Layer 2.4 The conductor-indexed presentations.

### From TauCetiRoadmap.ClassFieldTheory Layer 7

The absolute local Artin map, normalized by arithmetic Frobenius, and its restriction to finite tame extensions, identifying the `p`-primary tame inertia quotient with residue-field units (or the relative residue-unit quotient at Howard’s inert primes). Local Tate duality is supplied separately by Layer 5.

This supplies Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.10 The transverse condition is self-dual.

### From TauCetiRoadmap.Chebotarev Layer 10

The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the primes with a given Frobenius class have density `|C|/|G|`; in particular infinitely many, also after removing a finite set.

This supplies Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 1.21 Simultaneous nonvanishing of localisations; Layer 4.10 Rubin's selection of primes with large localisation; Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples; Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring.

### From PadicMeasuresIwasawaAlgebras Layer 6

Use character group rings, the contragredient action, the sharp involution and Fitting algebra of Layer 6. Do not infer that a character quotient is Gorenstein. A local Gorenstein order, or a finite self-injective local ring, is separately hypothesized wherever used. For an `O`-order the Gorenstein hypothesis means its `O`-dual is invertible over the order; a local such order has a free rank-one dual, and reduction modulo a nonzero `O`-element gives the finite self-injective coefficient ring. The arithmetic use of this dual is Layer 0.2. Exterior powers, linear duals and tensor products use Mathlib carriers. Layers 6.1 and 6.3 build exterior-bidual evaluation, contractions, coefficient-change square and integral-lattice comparisons; Layer 7.2 builds group-ring invariants descent and normalized integral transfer.

### From SelmerIwasawaCohomology §§2.1–2.19

Consume the existing `O`-lattice/rational/discrete Selmer constructions, their quotient/submodule propagation, compact/discrete local Tate pairings and finite Cartier-dual Poitou–Tate sequence. For general finite self-injective `R`, use the arithmetic comparison constructed in Layer 0.2 from ArithmeticGaloisDuality R02.4 and R02.5.1; this is not an unstated extension of the `O`-adic layer. The compact DVR case retains its discrete torsion dual. Also supply the actual cocycle formula for the induced integral local map: its image propagates the lattice canonical condition at `p` and infinity, rather than replacing that image by the full finite-coefficient local `H¹`. Retain the finite-level reflexivity and zero-conductor conditions in the rank-one bidual/ordinary Kolyvagin comparison. Coefficient rings are complete noetherian local with finite residue field of characteristic `p` in the `m`-adic topology; compact coefficients are of finite type with the module topology and jointly continuous action; discrete `m`-power-torsion coefficients are of cofinite type with open stabilisers; Selmer supports contain `S_p ∪ S_∞` and the ramified primes, kept by duality, propagation and modification.

This supplies Layer 0.7 The canonical and the unramified Selmer structures; Layer 0.4 Cartesian local conditions; Layer 0.10 Core rank of the canonical and unramified structures; Layer 0.9 The core rank is independent of the modulus; Layer 0.3 The category of quotients of `T`; the supplier propagation–duality compatibility Propagation commutes with local duality; the supplier finite Greenberg–Wiles formula The Euler characteristic formula for Selmer modules; Layer 0.6 Selmer modules of quotients and torsion submodules; Layer 0.1 Selmer triples and squarefree conductors; Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.3 Exponents, orders and reducibility depth; Layer 1.10 The transverse condition is self-dual; Layer 4.18 Self-dual descent with explicit error constants; Layer 4.17 Rubin's bound with error terms; Layer 4.3 Rubin's hypotheses, index of divisibility and error terms; Layer 4.2 Selmer lengths across an edge; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 5.4 The Kolyvagin-constructed dual Selmer group; Layer 6.3 Selmer contractions and coefficient change; Layer 6.6 Freeness of Stark systems and control of the dual Selmer group; Layer 4.4 Localisation at abundant tuples with bounded loss.

### From SelmerIwasawaCohomology §4.25

Section 4.25 supplies the finite-localization criterion used in LTXZZ Proposition 2.4.6(2), pp.130–131: purity of weight `−1` and conjugate Tate self-duality give vanishing rational local `H¹` away from `ℓ`, bounded integral `H¹` and `H²` torsion, and a depth-independent annihilator of the finite-coefficient localizations of saturated Selmer submodules. Its coefficient long exact sequence retains both torsion losses. This supplies Layer 4.4; it is not part of the `O`-lattice propagation theorem in Layer 2.

### From TauCetiRoadmap.ClassFieldTheory Layer 5

Perfect local Tate pairings for finite `p`-primary unramified coefficients at places of residue characteristic different from `p`, with the cup/invariant normalization, restriction-corestriction adjointness and the exact-annihilator statement used for the transverse condition. Mixed-characteristic `p`-adic lattice/discrete extensions are supplied by SelmerIwasawaCohomology §§2.13, 2.16–2.17.

This supplies Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.10 The transverse condition is self-dual.

### From ClassicalArithmeticCompletion §§7.4, 7.21 and 7.56

ClassicalArithmeticCompletion §§7.4, 7.21 and 7.56 supply orders, maximality and maximal-order existence for an integrally closed noetherian base and a nondegenerate regular-trace pairing; the characteristic-zero semisimple algebras used here satisfy that pairing hypothesis. The additional local division-order, lattice and two-centralizer inputs needed for the pairing are constructed in this package's local maximal-order subsection. They include projectivity, both multiplicities, common central conductors and reduction kernels. Tau Ceti module `TauCeti/RingTheory/Morita/Corner.lean` supplies `IsIdempotentElem.cornerEquivalence` and `moritaEquivalenceCorner` for a full idempotent. Its use here follows a proof of fullness and does not supply maximality or projectivity by itself.

The independent all-prime square-index length boundary in 4.13 is retained. The local order inputs and uniform evaluation annihilator do not prove that statement.

This supplies Layer 4.9 Uniform cokernel bound for a separated pairing over orders.

### Arithmetic hypotheses for the geometric and Rubin–Stark applications

The CM-point bound of Layer 4.13 is conditional on the precise quaternionic Shimura-curve, `GL₂`-type quotient, tensor-variety, CM trace point and polarization data stated there (Nekovář §§3.1, 3.5, 5.19, pp.18–19, 33–34), on the arithmetic image hypotheses (Img₁)–(Img₂) stated there (Nekovář §§6.1–6.2, pp.35–37), and on finite generation (MW) of the Mordell–Weil group `A(H)`. The application assumes these arithmetic inputs and their norm and congruence relations explicitly. The elliptic Kummer dictionary in Layer 1.19 uses the multiplication-by-`p` exact sequence on the Tate module and finite-point module, together with SelmerIwasawaCohomology Layer 2. The ring-class field and inert-prime local dictionary are built from ClassFieldTheory in Layers 1.1, 2.9 and 5.2 here, before a geometric Euler system is supplied.

The archimedean Rubin–Stark conclusion of Layer 7.6 assumes Conjecture `B′` at every finite `LF/K`: a rational family characterized by the ordered logarithmic regulator, integral bidual membership and the norm relations after the character/Kummer transport of Layer 7.7. This roadmap proves the implication from those explicit regulator-element hypotheses. The finite-place CM minus regulator in Layer 6.4 has different parity and is not substituted for that hypothesis.

### From PadicMeasuresIwasawaAlgebras §§4.1–4.6

Sections 4.1–4.3 supply pseudo-null modules, pseudo-isomorphisms, the structure theorem over a two-dimensional regular local ring, and the one-variable regularity and Weierstrass theory of `O⟦T⟧`. Section 4.6 supplies characteristic divisors and ideals over a noetherian normal `UFD`, their multiplicativity, pseudo-isomorphism invariance, and transport under a ring automorphism through a semilinear equivalence. Section 4.4 supplies generator change for Iwasawa invariants. Apply this generic divisor algebra to the multivariable rings of SelmerIwasawaCohomology §3.0; do not infer multivariable regularity from the one-variable theorem. A pseudo-null module need not be finite for `d ≥ 2`.

Section 4.5 supplies the coefficient-compatible one-variable coordinate and comparison with `TauCeti.completedGroupAlgebra`; §1.7 supplies the measure comparison. SelmerIwasawaCohomology §3.0 supplies the multivariable coordinate, regular-local dimension `d + 1` for a DVR and `Γ ≅ ℤ_p^d`, and character twists. Finite projections are compared with the corresponding twisted action; an untwisted quotient by `H ⊆ Γ` is preserved only when the character is trivial on `H`. The twist formulas use PadicMeasuresIwasawaAlgebras §4.6’s semilinear transport. Section 8.18 here proves the perturbation, normalization and length estimates used by §§8.28–8.31.

This supplies the generic commutative algebra used in §§8.14–8.15, 8.18, 8.21, 8.28–8.31 and 8.37; the multivariable algebra is supplied by SelmerIwasawaCohomology §3.0 and the perturbation estimates are targets of §8.18 here.

### From PadicMeasuresIwasawaAlgebras §5.2

Topological Nakayama's lemma over `Λ = O[[Γ]]`: a compact `Λ`-module `X` with `X/𝔐X` (or `X/JX, J` the augmentation ideal) finitely generated over `O` is finitely generated over `Λ`. Used for the finite generation of `X∞` (Rubin, Lemma VII.4.1).

This supplies Layer 8.20 `X∞` is finitely generated over `Λ`.

### From PadicMeasuresIwasawaAlgebras §§1.7, 4.5–4.6

Use the completed-group-algebra comparison and the coefficient-compatible one-variable coordinate of §§1.7 and 4.5. The character automorphisms `Tw_ρ`, their finite projections and the involution used in §§8.1 and 8.9 are supplied by SelmerIwasawaCohomology §3.0, with finite projections interpreted through the corresponding twisted coefficient action; the transport of characteristic ideals uses the generic semilinear equivalence theorem in §4.6.

### From SelmerIwasawaCohomology §3.0

For `O` the ring of integers of a finite extension of `ℚ_p` and `Γ ≅ ℤ_p^d`, use `Λ = O⟦Γ⟧ ≅ O⟦X₁, …, X_d⟧`, a noetherian regular local ring of dimension `d + 1`, hence a `UFD`. The coordinate is an isomorphism of topological `O`-algebras. With the generic characteristic-divisor algebra of PadicMeasuresIwasawaAlgebras §4.6 it supplies the full multivariable scope of Rubin’s Theorems II.3.2–II.3.4 and II.3.8, for every `d ≥ 1`. Pseudo-null modules are supported in codimension at least two; for finitely generated modules this is equivalent to an annihilator ideal of height at least two, and it does not imply finiteness when `d ≥ 2`.

For a continuous character `ρ : Γ → O^×`, use the supplied automorphism `Tw_ρ(γ) = ρ(γ)γ`, its composition law `Tw_ρ ∘ Tw_ρ′ = Tw_{ρρ′}`, and inversion `ι(γ) = γ⁻¹`. Under a semilinear coefficient-twist comparison, `Tw_ρ(char(B ⊗ ρ)) = char(B)` and `Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B)` for a finitely generated torsion `Λ`-module `B`; heights are preserved (Rubin VI.1.2). For finite quotients on which `ρ` factors, these maps agree with the corresponding group-ring twists. For general `ρ`, retain the character in the specialization map as in §8.9, rather than imposing compatibility with an unchanged augmentation quotient.

### From SelmerIwasawaCohomology Layers 2–3 for the coefficient-prime application

For the cyclotomic `ℤ_p`-extension `K∞/K`, odd `p`, `O` the ring of integers of a finite extension of `ℚ_p`, a finite free `O`-lattice `T`, `𝐓=T⊗_OΛ` and `Σ` finite containing `p,∞` and the ramified primes: `H^i(K_Σ/K, 𝐓)` and `H^i(K_v, 𝐓) (v | p)` are finitely generated `Λ`-modules, `H²(K_v, 𝐓)` is `Λ`-torsion, and `H¹(K_Σ/K, 𝐓)` is `Λ`-torsion-free when `T̄^{G_K} = 0` (Mazur–Rubin, Lemmas 5.3.4–5.3.5, after Greenberg and Perrin-Riou); and `H²(K_v,𝐓)/𝔓≅H²(K_v,𝐓/𝔓𝐓)` (cohomological dimension two). SelmerIwasawaCohomology §3.13 supplies local `H²` torsion in this cyclotomic setting. For other towers, finite generation/perfectness uses that supplier’s explicit finite-resolution hypotheses; local `H²` torsion is a separate hypothesis whenever used, including in a generic core-rank computation. Howard’s ordinary anticyclotomic control uses the distinct local hypotheses in §8.22.

This supplies Layer 8.13 The exceptional set `Σ_Λ` of height-one primes; Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.23 The generic core `rank χ(𝐓)` (Mazur–Rubin, Lemma 5.3.16); Layer 8.27 Weak Leopoldt from a `Λ`-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6); Layer 8.19 Mazur–Rubin's principal index `Ind(c)`.

### From SelmerIwasawaCohomology §4.18

Rubin's Corollary I.6.4 in the direction used here: if Leopoldt's conjecture holds for `K` then `S_{Σp}(K, μ_{p^∞})` is finite.

This supplies Layer 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7).

### From TauCetiRoadmap.ClassFieldTheory Layer 12

Global class field theory in the form: the inertia subgroup at a finite prime `v` of the Galois group of an abelian pro-`p` extension of a number field is the image of the pro-`p` completion of `O_v^×`; hence `Z_p^d`-extensions are unramified outside `p`; and the maximal abelian `p`-extension unramified everywhere and split at the primes above `p` of a field corresponds to the `p`-part of its class group modulo those primes.

This supplies Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; Layer 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7).

### From SelmerIwasawaCohomology §3.11

The snake-lemma criterion of §3.11 (classical restriction control with invariants and localization errors): restriction of Selmer groups along a `ℤ_p`-extension has kernel and cokernel controlled by the global invariant terms, the local inertia and decomposition terms and the localization cokernels. The anticyclotomic elliptic comparison built on it, `augmentationControl`, is a target of Layer 8.31.

This supplies Layer 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1).

### From ArithmeticGaloisDuality §R02.1.2 and DerivedModuleAlgebra §1.T.1

ArithmeticGaloisDuality §R02.1.2 supplies continuous cochains into inverse limits and the long exact sequence for continuous cohomology; DerivedModuleAlgebra §1.T.1 supplies the Milnor sequence and Mittag–Leffler vanishing. Apply these to finite free `ℤ_p X` with continuous `Ẑ`-action. `H¹` of each `X/p^aX` is finite (determined by topological Frobenius), so `lim¹ H¹=0`; discrete `cd_p=1` then gives compact `H²=0` and `H¹(X)→H¹(X/MX)` surjective. Restrict to this finite-free setting unless stronger limit hypotheses are proved.

This supplies Layer 3.12 Local lifts of an Euler system at a prime and the finite-part theorem.

### From ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas)

Finite-index compact Shapiro on finite free lattices and finite quotients, with evaluation, restriction and cochain compatibility; consume the finite-coset carrier and the supplier’s inverse-limit comparison. Include the evaluation-pairing comparison for an index-two induced lattice: Shapiro followed by restriction to the two summands agrees with Galois-kernel evaluation, and with prime-to-`p` averaging of a lifted Frobenius. This is the comparison consumed by the induced-depth abundant-tuple criterion.

This supplies Layer 1.15 Existence of abundant tuples under the corrected span hypothesis.

### Finite-character hypothesis for the coefficient-prime application

Layer 8.34 assumes the following arithmetic assertion for the two residual characters, in both `p`-adic orientations: for `O` containing their Teichmüller values, the dual full/unramified Selmer group of `O(θ)⊗Λ^∨` is finitely generated `Λ`-torsion with `μ=0`, including `θ` locally 1 or `ω` and `θ` globally trivial, with the trivial-character augmentation factor retained. Keller–Yin Theorem 1.2.2, pp.13–14 (arXiv v2), proves this assertion from the CM main conjecture and analytic `μ`-vanishing. It is an explicit premise of the application here. Constructing elliptic units and Katz measures and proving that premise are outside this conditional application; its generic Rubin bound does not consume that verification.

### From SelmerIwasawaCohomology Layer 3

Consume finite Cartier-dual Poitou–Tate, the compact/discrete inverse-limit and Shapiro comparisons, coefficient propagation, Iwasawa cohomology finite generation and local Euler characteristics, with their hypotheses. Layer 8.35 constructs the arithmetic additions for the stated anticyclotomic modular lattice: `OrdinaryCoefficientPrime.local` proves the local invariant/`H²` correction vanishings, ordinary rank-one freeness and exact orthogonality; `corrections` proves the unramified/strict dictionary at `(π)`; `change` constructs the two condition-change sequences and computes the balanced full/zero ranks. It uses KY1.0.1–1.0.2 pp.8–9 and KY1.3.4–1.3.6 pp.20–23. No existing SelmerIwasawaCohomology target is credited with these arithmetic verifications.

This supplies Layer 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound; Layer 8.34 Residual transfer of anticyclotomic `μ`-vanishing.

The resulting ordinary `μ`-vanishing is the conclusion of §8.35, using precisely these finite-character and local hypotheses.

### Representative Lean signatures

The complete statements below are definitive. `Suggested.lean` has no compiled headline statements because the arithmetic carriers needed to express them are absent at the pins. The core-rank formulas of §0.10 and the finite–singular and prime-selection results of Layer 1 require coefficient-linear arithmetic cohomology and local conditions. The Euler congruence and derivative maps of §§2.3, 3.14 and 3.16–3.19 require actual Euler and Kolyvagin families. The Selmer bounds of §§4.7, 4.13 and 4.17–4.21 and the structure and primitivity theorems of §§5.3, 5.6, 5.10 and 5.13 require their Selmer carriers. The higher-rank regulator, Fitting and class-group results of §§6.6, 6.8, 7.2, 7.4, 7.5a and 7.6 require Stark systems and their arithmetic transition and determinant maps. The weak Leopoldt, primitivity and divisibility theorems of §§8.25–8.39 also require Iwasawa Selmer modules, specialization and characteristic ideals. The algebraic operations supplied by Mathlib and Tau Ceti do not by themselves define these objects. All declaration names and Checks below specify library targets; they are not a list of declarations in `Suggested.lean`.

## How to read the build

Layer 0 fixes Selmer data and coefficient adapters; Layer 1 constructs auxiliary primes and finite–singular interfaces. Layers 2–3 define Euler families and their derivatives. Layer 4 proves descent bounds, and Layer 5 adds primitivity and self-dual structure. Layers 6–7 form the higher-rank exterior-bidual branch. Layer 8 specializes the rank-one theory over an Iwasawa algebra. Each definition specifies operations and discriminating checks; each theorem gives its exact hypotheses and proof route. `Suggested.lean` identifies the missing arithmetic carriers needed to state the headline theorems. The definitions, operations and Checks below specify the library to be built.

## Layer 0: Selmer data and coefficient interfaces

### 0.1 Selmer triples and squarefree conductors

Fix a number field `K`, a prime `p` and a coefficient ring `R`: a complete noetherian local ring with maximal ideal `m` and finite residue field `k = R/m` of characteristic `p`. A Selmer triple `(T, F, P)` consists of a free `R`-module `T` of finite rank with a continuous `R`-linear action of `G_K` unramified outside finitely many primes, a Selmer structure `F` on `T` (a finite set `Σ(F)` of places containing the archimedean places, the places above `p` and the primes where `T` is ramified, with an `R`-submodule `H¹_F(K_v, T) ⊆ H¹(K_v, T)` for `v ∈ Σ(F)`, and the unramified condition elsewhere), and a set `P` of primes of `K` disjoint from `Σ(F)`. `N(P)` is the set of squarefree products of primes of `P`, with `1 ∈ N(P)`, and `ν(n)` is the number of prime factors of `n`. Selmer data `(T, F, P, r)` add an integer `r ≥ 1`. The dual is `T^* = Hom(T, μ_{p^∞})` with the dual structure `F^*`. The coefficients form the category of Mazur–Rubin 2004 §1 and Chapter 2: `R` carries its `m`-adic topology; compact coefficients are finitely generated `R`-modules with the `m`-adic topology and a continuous `G_K`-action (lattices and finite modules), and discrete coefficients are `m`-power-torsion modules of cofinite type with the discrete topology and a continuous action (such as `T^*` for a lattice `T`). Cartier duality exchanges the two, and finite modules belong to both. Every Selmer structure lives on a module of this category and has `Σ(F) ⊇ S_p ∪ S_∞`; this is what makes `Σ(F^*) = Σ(F)` legitimate, because `μ_{p^∞}` is unramified away from `p`.

The precise hypotheses are `R` is complete noetherian local with finite residue field of characteristic `p`, in its `m`-adic topology; `T` is free of finite rank over `R`, with the `m`-adic topology and a continuous `G_K`-action; `T^*` is discrete of cofinite type; `Σ(F)` contains `S_p ∪ S_∞` and every prime where `T` is ramified; `P ∩ Σ(F) = ∅`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Chapter 3, first paragraph, p. 19). Definition of a Selmer triple over `ℚ`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 4.1, p. 8). The same data over a number field `K`, with the `rank r`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Chapter 1 opening and §1.1, p. 7; Chapter 2 opening, p. 13). Coefficient conventions: `R` complete noetherian local with finite residue field of characteristic `p`; `T` an `R`-module with continuous Galois action, finitely generated in Chapter 2.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 2.1.1, p. 13; Definition 2.3.1, pp. 16–17). The support of a Selmer structure contains `∞, p` and the ramified primes; the dual structure has the same support.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 2.1, p. 6). Over a number field the support contains all infinite places, all primes above `p` and the ramified primes.

The Selmer structure, its Selmer module `H¹_F(K, T)` and the dual structure `F^*` are those of SelmerIwasawaCohomology §2.13 (Dual Selmer structures); the additional data here are the prime set `P` and the index set `N(P)`.

`N(P)` is the set of finite subsets of `P`, written multiplicatively; divisibility is inclusion and `ν` is cardinality.

Mazur–Rubin 2004 take `K = ℚ` (Chapter 2 and the first lines of Chapter 3); Mazur–Rubin 2016 Definition 4.1 states the same data over a number field `K`, and Howard Definition 1.2.1 over an imaginary quadratic field with `P ⊆` the rational primes inert in `K`.

The coefficient category and the support condition are part of the data, so every constructor must supply them: propagation to `T/IT` keeps `Σ` (Mazur–Rubin 2004 Example 2.1.7), modification adds the modified primes (Mazur–Rubin 2016 Definition 2.3), restriction of `P` keeps `F`, and duality keeps `Σ` (Mazur–Rubin 2004 Definition 2.3.1) because `T^*` is unramified at every prime `q ∤ p` where `T` is. Without `p ∈ Σ` this fails: over `ℚ` with `p` odd, the trivial `𝔽_p`-module with `Σ = ∅` satisfies the unramifiedness conditions, but its dual `μ_p` is ramified at `p`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.SelmerTriple`: The triple `(T, F, P)`: a Selmer structure `F` on `T` together with a set `P` of primes disjoint from `Σ(F)`.
- `TauCeti.KolyvaginSystems.IsCoefficientRing`: `R` is a complete noetherian local ring with finite residue field of prime characteristic, and its topology is the `m`-adic one (Mazur–Rubin 2004 §1; Mazur–Rubin 2016 §1 for the principal case).
- `TauCeti.KolyvaginSystems.residueChar`: The residue characteristic `p = char(R/m)` of a coefficient ring.
- `TauCeti.KolyvaginSystems.IsCompactCoefficient`: Over a coefficient ring: `T` finitely generated, with the `R`-module (`m`-adic) topology and a jointly continuous `G_K`-action.
- `TauCeti.KolyvaginSystems.IsDiscreteCoefficient`: Over a coefficient ring: `A` discrete with open point stabilisers (Tau Ceti IsSmoothDiscrete), `m`-power torsion, with finite `m`-torsion.
- `TauCeti.KolyvaginSystems.IsArithmeticCoefficient`: Compact of finite type or discrete of cofinite type; the two agree on finite modules.
- `TauCeti.KolyvaginSystems.SelmerStructure`: The L2 Selmer carrier on canonical `H¹: Σ(F)`, local conditions equal to the unramified condition off `Σ(F), T` unramified off `Σ(F), T` in the arithmetic coefficient category, and `S_p ∪ S_∞ ⊆ Σ(F)`.
- `TauCeti.KolyvaginSystems.SelmerTriple.conductors`: `N(P)`: the squarefree products of primes of `P`, as finite subsets of `P`.
- `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors`: `1 ∈ N(P)`.
- `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed`: If `n ∈ N(P)` and `m | n` then `m ∈ N(P)`.
- `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes`: For `P′ ⊆ P, (T, F, P′)` is a Selmer triple and `N(P′) ⊆ N(P)`.
- `TauCeti.KolyvaginSystems.SelmerTriple.isCompactCoefficient`: `A` free module of finite rank in the coefficient category is compact.
- `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes_F`: Restricting `P` keeps the Selmer structure, hence its support and coefficients.
- `TauCeti.KolyvaginSystems.SelmerTriple.dual`: The Cartier dual data `(T^*, F^*, P)` use the imported discrete Selmer carrier, with `Σ(F^*) = Σ(F) ⊇ S_p ∪ S_∞`. For a DVR lattice `T, T^* = Hom(T, μ_{p^∞})` is discrete torsion of cofinite type, not a finite free lattice and hence not an object of the same lattice-triple type. Over a principal artinian ring, the finite Cartier dual is free of the same rank after the coefficient duality identification.
- `TauCeti.KolyvaginSystems.dualRep`: `T^* = Hom_cts(T, μ_{p^∞})` for the residue characteristic `p`, with `ℚ/ℤ` discrete, `R` acting through `T` and `G_K` through the cyclotomic twist.
- `TauCeti.KolyvaginSystems.dualRep_isDiscreteCoefficient`: The Cartier dual of a compact coefficient module is discrete of cofinite type.
- `TauCeti.KolyvaginSystems.dualRep_isCompactCoefficient`: The Cartier dual of a discrete coefficient module of cofinite type is compact.
- `TauCeti.KolyvaginSystems.dualRep_isUnramified`: At a prime `q ∤ p` where `T` is unramified, `T^*` is unramified.
- `TauCeti.KolyvaginSystems.localPairing_nondegenerate`: On arithmetic coefficients the local Tate pairing `H¹(K_v,T) × H¹(K_v,T^*) → ℚ_p/ℤ_p` is nondegenerate; no such claim is made outside the coefficient category.
- `TauCeti.KolyvaginSystems.dualStructure_sigma`: `Σ(F^*) = Σ(F)` (Mazur–Rubin 2004 Definition 2.3.1).
- `TauCeti.KolyvaginSystems.propagatedStructure_sigma`: Propagation of `F` to `T/IT` keeps `Σ(F)` (Mazur–Rubin 2004 Example 2.1.7).

**Checks.**

- `SelmerTriple.conductors_empty`: For an empty prime set, the sole squarefree conductor is the empty product 1.
- `SelmerTriple.card_conductors_of_finite`: For two distinct primes `q₁,q₂`, conductors are exactly 1,`q₁,q₂,q₁q₂`.
- `SelmerTriple.disjoint_sigma`: `A` prime in `Σ(F)` divides no allowed conductor.
- `SelmerTriple.not_mem_conductors_of_sq`: No squarefree conductor product is the square of a prime ideal.
- `SelmerStructure.sigma_nonempty`: No Selmer structure has empty support: `S_∞ ⊆ Σ(F)`. In particular the trivial `𝔽_p`-module over `ℚ` with `Σ = ∅` is not one.
- `SelmerStructure.pInfinity_mem_sigma`: Every archimedean place and every prime above the residue characteristic lies in `Σ(F)`.
- `SelmerTriple.dual_contains_pInfinity`: The dual data keep `S_p ∪ S_∞ ⊆ Σ(F^*)`, and `T^*` is discrete of cofinite type.
- `dualRep.trivial_mod_p_ramified`: For `p` odd, the dual of the trivial `𝔽_p`-module over `ℚ` is `μ_p`, which is ramified at `p`; so an empty support cannot be kept by duality.
- `IsCoefficientRing.padicInt`: `ℤ_p` with its `p`-adic topology is a coefficient ring.
- `IsCoefficientRing.finiteField`: `𝔽_p` with the discrete topology is a coefficient ring of residue characteristic `p`.
- `IsCoefficientRing.not_rat_discrete`: `ℚ` with the discrete topology is not a coefficient ring (its residue field is infinite), so finite evaluation and duality make no claim for it.
- `IsArithmeticCoefficient.finite_both`: `A` finite discrete module with continuous action over a coefficient ring is both a compact and a discrete coefficient.
- `IsArithmeticCoefficient.not_fraction_field`: Over a DVR, `Frac(R)` with the discrete topology is neither finitely generated nor torsion, so it is not an arithmetic coefficient.

For `P = ∅` one has `N(P) = {1}` and a Selmer triple is a Selmer structure.

`N(P)` is closed under taking divisors, and `n, nq ∈ N(P)` with `q` prime implies `q ∈ P` and `q ∤ n`.

*Needs:* `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.2 (Compact and rational Selmer kernel)`; `Squarefree`; `IsAdic`; `IsAdicComplete`; `IsModuleTopology`; `TauCeti.IsSmoothDiscrete`.

### 0.2 Finite self-injective coefficients and arithmetic duality

Let `R` be a commutative noetherian self-injective local ring with finite residue field `k` of characteristic `p`. Then `R` is finite and artinian. For a finite `R[G_K]`-module `A` put `A^†=Hom_R(A,R)(1)`, with contragredient action and the cyclotomic twist. This is the `R`-linear Tate dual; distinguish it from the additive Cartier dual `A^D=Hom_ℤₚ(A,μ_{p^∞})`. Construct the comparison with the finite arithmetic cochains and duality of ArithmeticGaloisDuality R02.4. Use DerivedModuleAlgebra §1.M.1 (*Matlis duality for arithmetic coefficients*) for injective hulls and Matlis biduality; the addition here identifies its finite self-injective dual with the `R`-linear Tate dual and transports the arithmetic pairings and Selmer sequence. In particular `A` need not be free over a DVR quotient, and `R` need not be principal. This comparison supplies every use of BSS II Theorem 3.1 in Layers 6–7.

**Trace comparison.** Write `E_R=Hom_ℤₚ(R,ℚ_p/ℤ_p)`, with `(rλ)(s)=λ(rs)`. Choose a generator `λ` of the free rank-one `R`-module `E_R`. The adjunction

```text
Hom_R(B,E_R) ≃ Hom_ℤₚ(B,ℚ_p/ℤ_p),
f ↦ (b ↦ f(b)(1)),     η ↦ (b ↦ (r ↦ η(rb)))
```

and `R≃E_R, r↦rλ`, give `C_λ:A^†≃A^D, G_K`-equivariantly, and the analogous comparison for every finite `R`-module `B`. Existence of `λ` is part of the target: `E_R` is an injective cogenerator with simple socle; a finite self-injective local ring `R` is an indecomposable injective module with the same simple socle, hence `R≃E_R`. One can also prove the assertion by comparing their injective hulls and finite lengths. This is a finite-ring argument and does not assume that an arbitrary quotient of a character ring is Gorenstein. For a local Gorenstein `O`-order `ℛ` and a nonzero `a∈O`, reduce an isomorphism `Hom_O(ℛ,O)≃ℛ` modulo `a` and then use `O/aO`'s additive trace. It gives the same construction for `R=ℛ/aℛ`. To justify the initial artinian assertion, self-injectivity makes multiplication by a regular element surjective after dualizing, so every regular element is a unit. Prime avoidance for the finitely many associated primes gives a nonzero socle. The injective hull of `k` then embeds as a direct summand of `R` and equals `R` because a local ring is indecomposable. That hull is `m`-power torsion; noetherian finite generation bounds the exponent, giving an artinian ring, finite because `k` is finite. This also establishes the simple-socle claim used in the trace construction. No trace generator is claimed canonical.

**Pairings and propagation.** Transport the finite local Tate pairing through `C_λ`. Its `R`-valued form `b_v` is uniquely characterized by

```text
λ(r b_v(x,y)) = inv_v(rx ∪ C_λ(y))   for every r∈R.
```

It induces `H¹(K_v,A^†)≃Hom_R(H¹(K_v,A),R)` and the converse, with the usual Tate modification at real places for `p=2`. If `λ` is replaced by `uλ` for a unit `u`, then `C_λ` is multiplied by `u` and `b_v` is unchanged. Thus the `R`-orthogonal local condition `F^†`, the Selmer kernels and all resulting exact sequences are independent of this auxiliary choice. Restriction and corestriction are adjoint because they are adjoint before transport. For a coefficient quotient `A↠B`, its dual `B^†↪A^†` is an inclusion; the orthogonal of an image is the inverse image of the orthogonal, including the kernel when `H¹` of this inclusion is not injective. Do not replace the propagated relaxed condition's dual by zero unless that injection is proved. For any finite `R`-module `B`, exactness of `Hom_R(−,R)` and the evaluation `B≃B^{**}` follow from self-injectivity and the comparison with finite additive biduality. These statements apply to the finite Selmer modules and local quotients, not just to free `A`.

**Change of conditions.** For `F₁≤F₂` on `A`, agreeing with the unramified condition outside a common finite support containing `p`, infinity and the ramified primes, construct the exact `R`-linear sequence

```text
0 → H¹_F₁(K,A) → H¹_F₂(K,A)
  → ⊕_v H¹_F₂(K_v,A)/H¹_F₁(K_v,A)
  → Hom_R(H¹_F₁†(K,A^†),R)
  → Hom_R(H¹_F₂†(K,A^†),R) → 0.
```

The connecting map takes a local tuple to the functional obtained by summing `b_v` against a global dual class. Prove the sequence by applying finite Cartier-dual Poitou–Tate to `A` and then `C_λ` and trace adjunction to its two dual terms. Its final surjectivity is the dual of the inclusion of dual Selmer groups; it uses injectivity of `R`, not freeness of those groups. For finite free `A` this recovers BSS II Theorem 3.1, p.13. The extension to arbitrary finite `A` here follows from the displayed trace comparison and finite Cartier-dual Poitou–Tate; BSS II §3.1 itself assumes `A` free. The finite Euler characteristic formula in the opening boundary transports in the same way, since `#B=(#k)^{length_R B}`. The compact `O`-lattice/discrete limit remains the separate SelmerIwasawaCohomology construction: an infinite lattice is not substituted for `A` in this finite statement.

**Gorenstein order duality.** Let `ℛ` be a Gorenstein `O`-order, local or semilocal, so that `Hom_O(ℛ,O)` is an invertible `ℛ`-module; since `ℛ` is a finite product of complete local rings, it is free of rank one over `ℛ`. Choose an `O`-linear `t : ℛ → O` generating it, so that `r ↦ (s ↦ t(rs))` is an isomorphism `ℛ ≃ Hom_O(ℛ,O)`. For every finitely generated `ℛ`-module `M` that is free over `O`, the map `Hom_ℛ(M,ℛ) → Hom_O(M,O), φ ↦ t∘φ`, is an isomorphism; this is the tensor–hom adjunction `Hom_ℛ(M,Hom_O(ℛ,O)) ≃ Hom_O(M,O)` composed with the choice of `t`. Consequently `Hom_ℛ(−,ℛ)` is exact on short exact sequences of such lattices, which split over `O`, and evaluation `M → Hom_ℛ(Hom_ℛ(M,ℛ),ℛ)` is an isomorphism. For nonzero `a ∈ O`, `t` reduces to an `O/aO`-linear generator of `Hom_{O/a}(ℛ/aℛ,O/a)`; composing with the additive trace of `O/aO` gives a trace generator of the finite self-injective ring `ℛ/aℛ`, and the comparison commutes with `M ↦ M/aM`. Replacing `t` by `ut` with `u ∈ ℛ^×` multiplies the comparison by `u` and leaves orthogonals, exactness and biduality unchanged. Modules with `O`-torsion are excluded.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §4.3, p. 21). Local Gorenstein `O`-orders and their zero-dimensional Gorenstein reductions modulo powers of the maximal ideal; the lattice comparison above is the adjunction argument, constructed here.

Sources: [Burns–Sakamoto–Sano II](https://arxiv.org/abs/1805.08448v1), §3.1.1 pp.12–13 and Theorem 3.1 p.13, for the precise arithmetic coefficient category, dual and sequence; ArithmeticGaloisDuality R02.4 (finite Poitou–Tate) and R02.5.1 (finite Greenberg–Wiles), for the additive arithmetic inputs. The trace adjunction above is the explicit comparison proof, rather than an additional arithmetic duality assumption.

**Matlis-generator interface.** For a finite commutative local ring `R` of residue characteristic `p`, define `TauCeti.KolyvaginSystems.IsMatlisGenerator` for an additive `λ:R→ℚ_p/ℤ_p` by

```text
∀ ideal I of R, (∀ x∈I, λ(x)=0) ⇒ I=0.
```

This is equivalent to injectivity of `R→E_R, r↦rλ`: its kernel is an ideal contained in `ker λ`, while an ideal in `ker λ` kills `λ` under the `R`-action. Since `#E_R=#R`, injectivity is equivalent to bijectivity. Thus self-injectivity of `R`, existence of such a `λ`, and `dim_k soc(R)=1` are equivalent. For the socle implication, every nonzero ideal meets `soc(R)`; extend a nonzero additive character of the simple socle to `R` using injectivity of `ℚ_p/ℤ_p`. Its kernel contains no nonzero ideal. Conversely `soc(E_R)=Hom(k,ℚ_p/ℤ_p)` has `k`-dimension one. Two generators differ by a unique unit of `R`, because each generates `E_R` freely. These finite-ring comparisons specialize the injective-hull duality of [Stacks, Proposition 47.7.8, tag 08Z9](https://stacks.math.columbia.edu/tag/08Z9); the trace and arithmetic transport are the constructions above. Additive characters may be expressed using `UnitAddCircle=ℝ/ℤ`: for finite local `R` they land in the `p`-primary torsion, identified with `ℚ_p/ℤ_p`. The ideal-kernel predicate and the ZMod Check allow any finite additive exponent; the self-injectivity equivalence assumes a local ring. No arithmetic Tate twist is claimed without the stated residue-characteristic hypothesis.

The compatibility names from this interface are `TauCeti.KolyvaginSystems.IsSelfInjectiveCoefficient` (self-injectivity, with the stated coefficient hypotheses), `isSelfInjective_iff_exists_matlisGenerator`, `isSelfInjective_iff_socle`, and `IsMatlisGenerator.unique`. The names `dualEquivPontryagin` and `cartierDualEquiv` denote the untwisted and twisted `traceComparison`; `localDualityCoeff` and `annihilator_eq_orthogonal` denote `pairing` and its annihilator identity; `selmer_global_duality` is `selmer_change`; `dual_propagate_quotient` is `orthogonal_propagate`. These are interfaces to the same constructions, rather than additional dualities imported from an `O`-lattice theorem.

The additional arithmetic adapters expose the following API.

- `FiniteSelmerDuality.traceComparison`: `C_λ` and its inverse, compatible with Galois action and the Tate twist.
- `FiniteSelmerDuality.pairing`: `b_v`, its trace identity, perfectness, independence of `λ` and restriction–corestriction adjunction.
- `FiniteSelmerDuality.orthogonal_propagate`: Quotient images and dual-submodule inverse images give the same local condition.
- `FiniteSelmerDuality.selmer_change`: The displayed sequence, with the sum-of-local-pairings connecting map.
- `FiniteSelmerDuality.coefficient_naturality`: The pairing squares for an `R`-linear coefficient map and its contragredient. For a ring quotient `R↠S`, identify `Hom_R(B,R)` with `Hom_S(B,Ann_R(ker(R→S)))`; a comparison with `Hom_S(B,S)` requires an actual dualizing-module identification. No arbitrary ring quotient is declared self-injective.
- `FiniteSelmerDuality.gorensteinOrderDual`: For a local or semilocal Gorenstein `O`-order with chosen `t`, the isomorphism `Hom_ℛ(M,ℛ) ≃ Hom_O(M,O)` on finitely generated `O`-free `ℛ`-modules, with exactness on short exact sequences of such lattices, biduality and compatibility with reduction modulo nonzero `a ∈ O`.

**Checks.**

- Over `R=ℤ/p²` and `B=R/(p), Hom_R(B,R)=pR≃B`. The functional sending 1 to `p` pairs nontrivially with `λ(1)=1/p²`; replacing the finite dual by the lattice dual `Hom_ℤₚ(B,ℤ_p)=0` destroys perfectness.
- Over `R=k[ε]/(ε²)`, including `k=𝔽₂`, the `trace λ(a+bε)=Tr_{k/𝔽ₚ}(b)/p` is nondegenerate. For `k=𝔽₂` its pairing on `(1,ε)` has matrix `[[0,1],[1,0]]`; the constant-coefficient functional has radical `(ε)` and is not a trace generator. This tests the choice of `λ` over a principal ring that is not a field.
- Over `R=k[x,y]/(x²,y²)`, take the field trace of the `xy` coefficient. The basis `(1,x,y,xy)` pairs in the pairs `(1,xy)` and `(x,y)`, with determinant 1 up to sign, including characteristic 2. The maximal ideal `(x,y)` is not principal, while the socle `(xy)` is one-dimensional; the comparison must retain this self-injective coefficient ring.
- For the zero module and for `F₁=F₂` the local quotient is zero and the two dual terms are identified. For strict`⊂`relaxed the middle term is the full local `H¹`; reversing the two dual Selmer terms gives the wrong arrow.
- The local ring `k[x,y]/(x,y)²` has two-dimensional socle and fails self-injectivity; no `λ` makes its multiplication pairing perfect. It is excluded even though it is finite and artinian.
- For `R=ℤ/p²↠𝔽_p`, the `S`-dual of `S` is `S` whereas its `R`-dual is `pR`. The comparison uses `1↦p`; identifying both with the same subset of `R` would make the coefficient square false. A general quotient with no such identification is outside that assertion.
- `dualEquivPontryagin.exact`: For `R=ℤ/p²`, dualizing `0→pR→R→R/pR→0` gives outer terms of order `p` and `(R/pR)^*=pR`. The last restriction is surjective. Over `k[x,y]/(x,y)²`, a map `(x,y)→R` with `x↦x` and `y↦0` cannot extend by multiplication, so the corresponding restriction fails surjectivity.
- `annihilator_eq_orthogonal.generator_free`: Over `ℤ/p²` replace `λ` by `(1+p)λ`. Both sides of the trace identity scale by the same unit; the `R`-valued pairing and its orthogonals are unchanged. At `p=2` the unit is 3, so the assertion does not rely on division by 2.
- `IsSelfInjectiveCoefficient.principal`: On `ℤ/p^n, n≥1, λ(x)=x/p^n` modulo `ℤ` has no nonzero ideal in its kernel. The zero character fails for every nonzero ring, including the field `𝔽₂`.
- `IsSelfInjectiveCoefficient.nonprincipal` and `not_isSelfInjectiveCoefficient_square` are respectively the `xy`-socle and two-dimensional-socle computations above. The property tests ideals in the additive kernel, not injectivity of `λ` as a map of groups: the `xy` character has a large additive kernel and still works.
- `selmer_global_duality.mu_p`: For `K=ℚ`, odd `p, A=μ_p`, support `{p,∞}`, and the two conditions differing only at `p` between unramified and full, the sequence is `0→0→𝔽_p→𝔽_p²→𝔽_p→0→0`, up to choices of bases. The last two zeroes are the relaxed-dual Selmer term and the endpoint, respectively. Kummer theory gives the global line generated by `p`, the local uniformizer and unit lines, and the dual trivial-character line. Thus the nonzero connecting map is necessary even over a field. This is a computation of the change-of-conditions sequence, not the assertion that every prescribed local tuple is global.
- `gorensteinOrderDual.group_ring`: For `ℛ = O[G]` with `G` finite abelian and `t(Σ a_g g) = a_1`, the module `M = O` with trivial action has `Hom_ℛ(O,ℛ) = O·N_G`, and `t(N_G) = 1`; the comparison sends `1 ↦ N_G` to the identity of `O`.
- `gorensteinOrderDual.torsion_excluded`: For `ℛ = O` and `M = O/ϖ`, `Hom_ℛ(M,ℛ) = 0`, whereas the finite dual `Hom_O(M,Φ/O) ≅ O/ϖ`; the lattice comparison is not applied to modules with `O`-torsion.
- `gorensteinOrderDual.not_gorenstein`: The local order `ℛ = {(a,b,c) ∈ O³ : a ≡ b ≡ c mod ϖ}` has `ℛ/ϖℛ ≅ k[u,v]/(u,v)²` with `u = (0,ϖ,0), v = (0,0,ϖ)`. Its socle is two-dimensional, so `ℛ` is not Gorenstein and no generator `t` exists.

*Needs:* ArithmeticGaloisDuality §§R02.4.3, R02.5.1; DerivedModuleAlgebra §1.M.1 (Matlis duality for arithmetic coefficients); finite additive duality; the imported coefficient-linear cochain action and cup product; Layer 0.1 for support conventions. This comparison supplies the finite self-injective arithmetic duality used in the subsequent local-condition and Selmer-system targets.

### 0.3 The category of quotients of `T`

`Quot_R(T)` is the category whose objects are the quotients `T/IT` for all ideals `I` of `R`, and whose morphisms from `T/IT` to `T/JT` are the scalar multiplications by elements `r ∈ R` with `rI ⊆ J`. A local condition propagated from `T` to all quotients (images under `T → T/IT`) is functorial over `Quot_R(T)`. For `R` principal artinian of `length k` with uniformiser `π`, the objects are `T/m^iT` for `0 ≤ i ≤ k`. When `T` is finite free, multiplication by `π^{j−i}` is an injective morphism `T/m^iT → T/m^jT` for `i ≤ j`. A nonfree `T` does not satisfy this injectivity statement in general.

The precise hypotheses are `R` as in Layer 0.1 Selmer triples and squarefree conductors; `T` an `R[[G_K]]`-module.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Example 1.1.3, p. 8). Definition of the category of quotients.

Objects are indexed by ideals; a morphism is a class of scalars `r` modulo the scalars acting by the same map, so that composition is multiplication.

Functoriality of propagated conditions: for `r` with `rI ⊆ J`, multiplication by `r` maps the image of `H¹_F(K_v, T)` in `H¹(K_v, T/IT)` into its image in `H¹(K_v, T/JT)`, since `r` commutes with `T → T/IT` and `T → T/JT`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.QuotCat`: The category `Quot_R(T)`: objects the ideals `I` of `R` (standing for `T/IT`), morphisms `I → J` the scalars `r` with `rI ⊆ J` acting `T/IT → T/JT`.
- `TauCeti.KolyvaginSystems.QuotCat.scalarHom`: For `r ∈ R` with `r·I ≤ J`, the `G_K`-equivariant `R`-linear map `T/IT → T/JT` induced by multiplication by `r`.
- `TauCeti.KolyvaginSystems.QuotCat.scalarHom_comp`: scalarHom `s ∘` scalarHom `r =` scalarHom `(sr)`, and scalarHom 1 is the identity of `T/IT`.
- `TauCeti.KolyvaginSystems.QuotCat.scalarHom_injective_iff`: For `T` free and nonzero, multiplication by `r : T/IT → T/JT` is injective if and only if `(J : r) = I`.
- `TauCeti.KolyvaginSystems.QuotCat.propagate_functorial`: `A` local condition propagated to quotients is a subfunctor of `H¹(K_v, −)` on `Quot_R(T)`.

**Checks.**

- `QuotCat.quotient_zero`: The coefficient quotient comparison takes the zero class to zero.
- `QuotCat.zmod_sq_mul_p_injective`: Over `ℤ/p²`, the kernel of multiplication by `p` is the ideal `(p)`, giving the injective scalar map `R/(p)→R`.
- `QuotCat.nonfree_scalar`: For `R=ℤ/p²` and `T=R/(p)`, the scalar map `p:T/pT→T` is zero on a nonzero module and is not injective. The finite-free qualification is necessary.
- `QuotCat.not_hom_of_not_le`: Over `ℤ/p²`, scalar 1 does not carry the source ideal `(p)` into the target ideal 0, so it defines no such quotient morphism.

Over a field `R = k` the category has the two objects 0 and `T`.

For `R = ℤ/p²`, the map `p : T/pT → T` is a morphism and is injective when `T` is free.

Additional arithmetic check: If `R` is a field, the objects of `Quot_R(T)` are `T/0 = T` and `T/R·T = 0`.

*Needs:* Layer 0.1 Selmer triples and squarefree conductors; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`.

### 0.4 Cartesian local conditions

A local condition `F` at a place `v`, functorial over a category `𝒯` of `R[[G_{K_v}]]`-modules, is cartesian on `𝒯` if for every injective morphism `α : T₁ → T₂` of `𝒯` the square formed by `H¹_F(K_v, T₁) ⊆ H¹(K_v, T₁)` and `H¹_F(K_v, T₂) ⊆ H¹(K_v, T₂)` is cartesian: `H¹_F(K_v, T₁)` is the inverse image of `H¹_F(K_v, T₂)` under `α_*`. A Selmer structure `F` on `T` is cartesian if for every `q ∈ Σ(F)` the condition at `q`, propagated to quotients, is cartesian on `Quot_R(T)`.

The precise hypotheses are `F` is functorial over `𝒯`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 1.1.4, p. 8). The definition, in its equivalent form.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 3.1 and Remark 3.2, p. 7). Cartesian Selmer structures and the two standard sufficient conditions.

Equivalently, for injective `α` the condition on `T₁` equals the condition propagated backwards from `T₂` (inverse image), as in SelmerIwasawaCohomology §2.5 (Propagating local conditions).

The unramified (finite) condition is cartesian on unramified modules: for injective `T₁ → T₂` the map `Hom(I, T₁) → Hom(I, T₂)` is injective (Mazur–Rubin 2004, Lemma 1.1.9).

If `R` is a discrete valuation ring and `H¹(K_q, T)/H¹_F(K_q, T)` is torsion-free for `q ∈ Σ(F)`, the structures induced on `T/m^kT` are cartesian (Lemma 3.7.1`(i)`); cartesianness passes from `T` to `T/m^jT` (Lemma 3.7.3).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.IsCartesian`: The predicate: for every injective morphism `α` of `Quot_R(T), H¹_F(K_v, T₁) = α_*⁻¹(H¹_F(K_v, T₂))`.
- `TauCeti.KolyvaginSystems.isCartesian_iff_comap`: `F` is cartesian iff for all `i ≤ j` the condition on `T/m^iT` is the inverse image of the condition on `T/m^jT` under `π^{j−i}` (`R` principal artinian and `T` finite free).
- `TauCeti.KolyvaginSystems.isCartesian_unramified`: The finite condition is cartesian on any category of unramified modules.
- `TauCeti.KolyvaginSystems.isCartesian_of_field`: If `R` is a field every local condition on `T` is cartesian on `Quot_R(T)`.
- `TauCeti.KolyvaginSystems.isCartesian_of_torsionFree_quotient`: `R` a discrete valuation ring and `H¹(K_q, T)/H¹_F(K_q, T)` torsion-free imply that the induced condition on `T/m^kT` is cartesian on `Quot(T/m^kT)` for every `k`.
- `TauCeti.KolyvaginSystems.IsCartesian.quotient`: If `F` is cartesian on `Quot_R(T)` then the induced condition is cartesian on `Quot_{R/m^j}(T/m^jT)`.

**Checks.**

- `isCartesian_strict_and_relaxed_field`: Over a field, both strict and relaxed local conditions are cartesian.
- `isCartesian_unramified`: For an unramified coefficient representation, the unramified local condition is cartesian.
- `not_isCartesian_torsion_condition`: Take `p=3, K_v=ℚ₂` and the trivial module `R=ℤ/9`. Then `H¹(K_v,R)=R`. Propagating `F(R)=3R` to `R/3` gives zero, whereas its inverse image along multiplication by 3:`R/3→R` is all `R/3`. Thus this propagated `p`-torsion condition is not cartesian.

The unramified condition on unramified modules is cartesian; over a field every condition is cartesian.

A condition defined by an extension `L/K_v` need not be cartesian (Mazur–Rubin 2004, Remark 1.1.8); the non-example test below exhibits a failure.

Additional arithmetic check: For `K_v = ℚ_ℓ, ℓ ≠ p, R = ℤ/p^k` and `T = R` with trivial action, the unramified condition `Hom(G_{𝔽_ℓ}, T/p^iT)` is cartesian: a homomorphism to `ℤ/p^i` whose composite with `p^{j−i} : ℤ/p^i → ℤ/p^j` is unramified is unramified.

Additional arithmetic check: For `R = ℤ_p` and `T = ℤ_p(1)` over `ℚ_ℓ, ℓ ≠ p`, the condition `ker(H¹(ℚ_ℓ, T) → H¹(ℚ_ℓ^{ur}, T ⊗ ℚ_p))` has torsion-free quotient, and its propagation to `T/p^k` is cartesian.

*Needs:* Layer 0.3 The category of quotients of `T`; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; `SelmerIwasawaCohomology §2.6 (From V to T and W; saturation)`.

### 0.5 Lengths of cartesian conditions grow linearly

Let `R` be principal artinian of `length k` and `F` a local condition on `T` at `v`, cartesian on `Quot_R(T)`. Then there is an integer `r` such that `length H⁰(K_v, T/m^iT) − length H¹_F(K_v, T/m^iT) = r·i` for `0 < i ≤ k`.

The precise hypotheses are `R` principal artinian of `length k`; `F` cartesian on `Quot_R(T)`; `T` free of finite rank.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemma 1.1.5, p. 8). Statement and proof of the linearity.

For `i + j ≤ k` the sequence `0 → T/m^i → T/m^{i+j} → T/m^j → 0` gives a six-term exact sequence of `H⁰` and `H¹_F`: exactness in the middle of the `H¹_F` terms is the cartesian condition for `π^j`, and surjectivity on the right is the definition of propagation to a quotient.

Hence `λ(i) + λ(j) = λ(i + j)` for `λ(i) = length H⁰ − length H¹_F`, so `λ(i) = i·λ(1)`.

For the unramified condition on an unramified `T` one gets `r = 0`, since `H¹_f(K_v, T) ≅ T/(Fr − 1)T` has the length of `T^{Fr=1}`.

*Needs:* Layer 0.4 Cartesian local conditions; `Module.length`.

### 0.6 Selmer modules of quotients and torsion submodules

Assume `T̄^{G_K} = (T̄^*)^{G_K} = 0` for `T̄ = T/mT`. `(a)` For every ideal `I` of `R, T^*[I] → T^*` induces an isomorphism `H¹_{F^*}(K,T^*[I]) ≅ H¹_{F^*}(K,T^*)[I]`. At the general complete noetherian coefficient scope of MR04 retain its `(H.0), (H.1)` and `(H.3)`; at principal-artinian scope, or finite free coefficients over a commutative noetherian self-injective local ring with the BSS finite-dual dictionary, residual dual invariant vanishing suffices. `(b)` If `R` is principal artinian of `length k` and `F` is cartesian, then for `0 < i ≤ k` the injection `π^{k−i}:T/m^iT → T` induces isomorphisms `H¹(K,T/m^iT) ≅ H¹(K,T)[m^i]` and `H¹_F(K,T/m^iT) ≅ H¹_F(K,T)[m^i]`, and `H¹_F(K,T)[m^i]` is the kernel of `H¹_F(K,T) → H¹_F(K,T/m^{k−i}T)`.

The precise hypotheses are `(T/mT)^{G_K} = (T^*[m])^{G_K} = 0`; for `(b): R` principal artinian, `F` cartesian on `Quot_R(T)`; For `(a)` over general complete noetherian `R`: MR04 `(H.0), (H.1), (H.3)`. For the weaker finite-coefficient version: principal artinian `R`, or the self-injective local-ring/free-module/finite-dual scope of BSS II §3.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemma 3.5.3, p. 28). Part `(a)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemma 3.5.4, p. 29). Part `(b)`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Proposition 3.3`(i)`–(ii), pp. 7–8; Gomez erratum to MR04 Lemma 2.1.4, p. 32 (arXiv v1)). The principal-artinian number-field statement under invariant vanishing; the erratum restricts Lemma 2.1.4 to coefficient-ideal quotients.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8, arXiv v1 pp. 15–17). Replacement proof for arbitrary ideals over the stated self-injective local coefficient ring.

Use the corrected MR04 Lemma 2.1.4 only for coefficient-ideal quotients `T/IT`, as recorded in MR16’s Gomez erratum (arXiv v1 p.32; published p.182). Residual invariant vanishing alone does not apply to arbitrary Galois subquotients.

`(a)`: retain the general MR04 hypotheses for its original dual-annihilator statement. At the weaker finite self-injective coefficient scope use BSS II Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8: for generators `r₁`,…,`r_d` of `I`, compare `A/A[I]` with `A^d` by multiplication by those generators; prove vanishing of the diagonal-map cokernel invariants using the coefficient-ideal filtration, then identify the cohomological kernel with `I`-torsion. The Selmer conditions agree by inverse-image propagation. This replaces the defective induction through unrestricted subquotients.

`(b)`: the same argument with `0 → T/m^i → T → T/m^{k−i} → 0`; the local conditions match by cartesianness at `Σ(F)` and by Lemma 1.1.9 at the unramified places.

The two coefficient scopes give two separate suggested signatures: the general complete-noetherian form carries `(H.0), (H.1)` and `(H.3)` for the residue characteristic, and the finite form carries an artinian self-injective coefficient ring with residual invariant vanishing. A single signature with residual vanishing alone would assert the uncorrected Lemma 2.1.4.

For `T = μ_{p^k} ⊗ ρ^{-1}` with `ρ ≠ 1, ω`, both identifications hold (Mazur–Rubin 2004, Lemma 6.1.5).

Without the invariants hypothesis the statement fails: for `T = ℤ/p²` with `G_K` acting through a nontrivial character `χ ≡` 1 `(mod p)`, the connecting map `(T/pT)^{G_K} → H¹(K, T/pT)` is nonzero, so `H¹(K, T/pT) → H¹(K, T)[p]` is not injective.

*Needs:* Layer 0.4 Cartesian local conditions; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`; `ArithmeticGaloisDuality §R02.1.2 (Long exact sequences for continuous cohomology)`.

### 0.7 The canonical and the unramified Selmer structures

Let `R` be a complete discrete valuation ring with finite residue field of characteristic `p`: either of mixed characteristic (the ring of integers of a finite extension of `ℚ_p`, or a discrete valuation ring as in Mazur–Rubin 2016) or of equal characteristic (`k⟦X⟧`, which occurs as `S_𝔓` for `𝔓 = (ϖ)` in Layer 8.18). Let `T` be a lattice in the compact coefficient category. The canonical Selmer structure `F_can` on `T` has `Σ(F_can) = {q : T ramified at q} ∪ {v | p} ∪ {v | ∞}`; `H¹_{F_can}(K_q, T) = ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗_R Frac(R)))` for `q ∈ Σ(F_can), q ∤ p∞`. In mixed characteristic `T ⊗_R Frac(R) = T ⊗_{ℤ_p} ℚ_p`; in equal characteristic `T ⊗_{ℤ_p} ℚ_p = 0`, and only the `Frac(R)` form is meaningful; and `H¹_{F_can}(K_v, T) = H¹(K_v, T)` exactly for `v | p∞`. On `T/IT` it is the structure induced from `T`, which depends on `T` and not only on `T/IT`. The unramified structure `F_ur` of Mazur–Rubin 2016 Definition 5.1 has the same support, the same rational inertia kernel at `q ∤ p∞`, the relaxed condition at `v | ∞`, and at `𝔭 | p` the saturation of the universal norm subgroup `H¹(K_𝔭, T)_u = ⋂_L Cor_{L/K_𝔭} H¹(L, T)`, the intersection over finite unramified extensions `L/K_𝔭`; saturation means that `H¹(K_𝔭, T)/H¹_{F_ur}(K_𝔭, T)` is `R`-torsion-free and `H¹_{F_ur}(K_𝔭, T)/H¹(K_𝔭, T)_u` has finite length. At `𝔭 | p, F_ur` is not the rational inertia kernel. Its dual condition has the `R`-corank of `H⁰(K_𝔭, T^*)` (Mazur–Rubin 2016 Lemma 5.2), and `F_ur` is relaxed at `𝔭` when `H⁰(K_𝔭, T^*)` is finite (Corollary 5.3); if this holds at every `𝔭 | p` then `F_ur = F_can`.

The precise hypotheses are `R` a complete discrete valuation ring with finite residue field of characteristic `p`, of mixed or equal characteristic, for `F_can`; for `F_ur`, the discrete valuation rings of Mazur–Rubin 2016; `T` free of finite rank, compact (`m`-adic topology, continuous action), unramified outside a finite set.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.2.1, p. 23). Definition of `F_can` over `ℚ`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, p. 62). The same structure on `T ⊗ S_𝔓` for every height-one `𝔓`, defined through `T ⊗ Frac(S_𝔓)`, including the equal-characteristic ring at `𝔓 = pΛ`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 5.1, pp. 9–10). Definition of `F_ur` over a number field.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §6.2, p. 38). The same structure over a number field and a Gorenstein order.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Lemma 5.2 and Corollary 5.3, p. 10). The corank of the dual unramified condition at `p`, and the relaxed condition when `H⁰(K_𝔭, T^*)` has finite length.

The condition away from `p` is the inverse image of the unramified condition on `V = T ⊗_R Frac(R)` (SelmerIwasawaCohomology §2.6 (From `V` to `T` and `W`; saturation) in mixed characteristic; the same saturation argument in equal characteristic). Its quotient injects into the `Frac(R)`-module `H¹(K_q^{ur}, V)`, so it is torsion-free and `F_can` is cartesian on quotients by Mazur–Rubin 2004 Lemma 3.7.1`(i)`. Propagation to `T/IT` is by images in both characteristics.

Corestriction from a finite unramified `L/K_𝔭` on compact coefficients is Shapiro’s isomorphism followed by the induced-module `trace` (ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas)). The universal norm subgroup is the intersection of these images, and its saturation is the preimage of the `R`-torsion of the quotient.

At `𝔭 | p`, Mazur–Rubin 2016 Lemma 5.2 identifies `H¹_{F_ur^*}(K_𝔭, T^*)` with the maximal divisible part of the unramified inflation image, of `R`-corank equal to `corank_R H⁰(K_𝔭, T^*)`. If `H⁰(K_𝔭, T^*)` is finite, `H¹(K_𝔭, T)/H¹_{F_ur}(K_𝔭, T)` is both of finite length and torsion-free, hence zero (Corollary 5.3); so `F_ur = F_can` when this holds at every `𝔭 | p`.

Euler-system classes lie in `H¹_{F_can}(F, T)` (SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from `p`); Rubin, Corollary B.3.5).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.canonicalStructure`: `F_can` on a compact lattice over a complete discrete valuation ring with finite residue field: relaxed exactly at `S_p ∪ S_∞` and the inertia kernel `H¹(K_q,T) → H¹(K_q^{ur}, T ⊗_R Frac(R))` at the other places of `Σ`; `Σ` must contain `S_p ∪ S_∞`.
- `TauCeti.KolyvaginSystems.canonicalStructure_torsionFree`: `H¹(K_q, T)/H¹_{F_can}(K_q, T)` is torsion-free for every `q`, so `F_can` is cartesian on quotients.
- `TauCeti.KolyvaginSystems.canonicalStructure_dual_at_p`: The dual structure `F_can^*` is strict at every `v | p` and equals the dual of the unramified-saturated condition elsewhere.
- `TauCeti.KolyvaginSystems.canonicalStructure_quotient_at_p`: `H¹_{F_can}(K_𝔭, T/IT)` is the image of `H¹(K_𝔭, T)`; it equals `H¹(K_𝔭, T/IT)` if `H⁰(K_𝔭, T^*)` is divisible.
- `TauCeti.KolyvaginSystems.UnramifiedLocalLayer`: Finite unramified extensions `L/K_v`, as open subgroups of finite index of the decomposition group that contain inertia.
- `TauCeti.KolyvaginSystems.unramifiedCor`: Corestriction `H¹(L, T) → H¹(K_v, T)` on compact coefficients, supplied by ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas).
- `TauCeti.KolyvaginSystems.universalNormSubgroup`: `H¹(K_v, T)_u = ⋂_L Cor_{L/K_v} H¹(L, T)` over finite unramified `L/K_v`.
- `TauCeti.KolyvaginSystems.saturation`: The saturation of `N ⊆ M`: the preimage of the torsion of `M/N, i`.`e`. the elements with a nonzero multiple in `N`.
- `TauCeti.KolyvaginSystems.unramifiedCondition`: The local conditions of `F_ur`: relaxed at `v | ∞`, the saturated universal norm subgroup at `𝔭 | p`, and the rational inertia kernel at every other prime.
- `TauCeti.KolyvaginSystems.unramifiedStructure`: `F_ur` of Mazur–Rubin 2016, Definition 5.1, on a DVR lattice: its local conditions are unramifiedCondition.
- `TauCeti.KolyvaginSystems.unramifiedStructure_condition`: The local condition of `F_ur` at `v` is unramifiedCondition at `v`.
- `TauCeti.KolyvaginSystems.unramifiedStructure_condition_away`: At every prime `q ∤ p, F_ur` and `F_can` impose the same condition.
- `TauCeti.KolyvaginSystems.unramifiedStructure_dual_corank_at_p`: At `𝔭 | p` the dual condition `H¹_{F_ur^*}(K_𝔭, T^*)` has the `R`-corank of `H⁰(K_𝔭, T^*)` (Mazur–Rubin 2016, Lemma 5.2).
- `TauCeti.KolyvaginSystems.unramifiedStructure_relaxed_at_p`: If `H⁰(K_𝔭, T^*)` is finite, `F_ur` is relaxed at `𝔭 | p` (Mazur–Rubin 2016, Corollary 5.3).
- `TauCeti.KolyvaginSystems.unramifiedStructure_eq_canonical`: If `H⁰(K_𝔭, T^*)` is finite for every `𝔭 | p` then `F_ur = F_can` (Mazur–Rubin 2016, Corollary 5.3); mere unramifiedness of `T` at `p` does not suffice.

**Checks.**

- `canonicalStructure_unramified_place`: Outside `Σ`, the unramified structure equals the inertia restriction kernel.
- `canonicalStructure_mixed_char`: For `R` finite over `ℤ_p`, `T ⊗_R Frac(R) = T ⊗_{ℤ_p} ℚ_p`, so the condition is that of Mazur–Rubin 2004 Definition 3.2.1.
- `canonicalStructure_equal_char`: For `R = 𝔽_p⟦X⟧`, `T = R` with trivial action and a prime `q ∤ p` with `N(q) ≡ 1 (mod p)`, `H¹(K_q,R) ≅ R²` contains ramified homomorphisms through the tame quotient. The `Frac(R)` condition is `H¹_ur(K_q,R) ≅ R`, whereas the kernel of restriction to `H¹(K_q^{ur}, T ⊗_{ℤ_p} ℚ_p) = 0` would be all of `H¹(K_q,R)`.
- `canonicalStructure_relaxed_lattice`: At every place of `S_p ∪ S_∞` the lattice canonical condition is all local `H¹`.
- `canonicalStructure_quotient_ne_relaxed`: If the local coefficient reduction map on `H¹` is not surjective, the propagated finite canonical condition at a relaxed lattice place is a proper submodule.
- `unramifiedStructure_tate_twist_units`: For `T = ℤ_p(1)` over `ℚ` with `p` odd, the rational inertia kernel at `p` is zero while `F_ur` at `p` is free of rank one, so `F_ur` is not the inertia-kernel structure at `p`.
- `unramifiedLayer_degree_one`: The base local field is an unramified layer and its corestriction is the identity; the intersection defining universal norms includes this harmless factor.
- `unramifiedLayer_ramified_nonexample`: `A` nontrivial totally ramified extension is not an unramified layer. For an unramified layer of degree `p^a` the Kummer norm multiplies the valuation coordinate by `p^a`; a restriction map would give the wrong coordinate.
- `universalNorms_tate_units`: For `T=ℤ_p(1)` over `ℚ_p, p` odd, identify `H¹` with `ℤ_p·p⊕(1+pℤ_p)`. Norms from unramified degree-`p^a` layers have valuation in `p^aℤ_p` and are surjective on units. Their intersection is exactly the unit summand, not zero and not all `H¹`.
- `universalNorms_zero_coefficients`: For `T=0` all layer cohomology groups, norm images and their intersection are zero.
- `saturation_nonunit_index`: In `M=ℤ_p`, sat`(pℤ_p)=ℤ_p` whereas sat(0)`=0`. Saturation cannot mean closure in the `p`-adic topology.
- `saturation_direct_summand`: In `ℤ_p²`, sat`(ℤ_p e₁)=ℤ_p e₁` and sat`(pℤ_p e₁)=ℤ_p e₁`; no nonzero `e₂`-coordinate is admitted.
- `unramifiedStructure_zero`: Both canonical and unramified Selmer structures on the zero coefficient module have zero local condition at every place. For `ℤ_p(1)`, their distinct `p`-adic conditions are respectively full `H¹` and the saturated unit summand calculated above.

For `T = ℤ_p(1) ⊗ ρ^{-1}` with `ρ(p) ≠ 1, F_can` equals the unit structure `F` of Mazur–Rubin 2004 §6.1 (Lemma 6.1.2).

`H¹_{F_can}(ℚ_p, T/IT) = H¹(ℚ_p, T/IT)` when `H⁰(ℚ_p, T^*)` is divisible (Lemma A.1) and can be smaller otherwise.

Additional arithmetic check: For `K = ℚ, T = ℤ_p(1), p` odd: `H¹_{F_can}(ℚ, T)` is the `p`-adic completion of `ℤ[1/p]^×`, free of rank one over `ℤ_p`, generated by the class of `p`.

Additional arithmetic check: For `T=T_pE` over `ℚ` and `p` odd, `F_can` is the classical lattice Kummer structure relaxed at `p`, with `F_can^* ≤ F ≤ F_can` under the Weil-pairing dictionary. On `E[p^k]` use the image of `H¹(ℚ_p,T_pE)`; it is the full local group when `E(ℚ_p)[p^∞]=0` and may be proper otherwise.

Additional arithmetic check: For `T = ℤ_p(1) ⊗ ρ^{-1}` with `ρ` finite order prime to `p`, unramified at `p`, and `ρ(p)=1, T^*` is locally `ℚ_p/ℤ_p`. Its invariants are divisible, so the propagated canonical condition on `T/p^kT` is all `H¹(ℚ_p,T/p^kT)`. The unit condition on the lattice remains proper.

For `T = ℤ_p(1)` over `ℚ` with `p` odd: `H¹(ℚ_p, T)` is the `p`-adic completion of `ℚ_p^×`, free of rank two. `T^* = ℚ_p/ℤ_p` with trivial action has `H⁰` of corank one, so Corollary 5.3 does not apply. `F_ur` at `p` is the image of the local units, free of rank one and saturated, and its dual condition is the unramified condition, of corank one (Lemma 5.2). The rational inertia kernel at `p` is zero, since `ℚ_p(1)` has no inertia invariants and `H¹(ℚ_p, T)` has no torsion. So an inertia-kernel definition of `F_ur` at `p` is wrong.

*Needs:* Layer 0.4 Cartesian local conditions; `SelmerIwasawaCohomology §2.6 (From V to T and W; saturation)`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; `SelmerIwasawaCohomology Layer 2`; `ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas)`; `Submodule.torsion`; `cyclotomicCharacter`.

### 0.8 The core rank of a cartesian Selmer structure

Let `R` be principal artinian of `length k, F` a cartesian Selmer structure on `T`, and `T^{G_K} = (T^*)^{G_K} = 0`. There is a unique integer `r` such that `H¹_F(K, T) ≅ H¹_{F^*}(K, T^*) ⊕ R^r` if `r ≥ 0` and `H¹_F(K, T) ⊕ R^{−r} ≅ H¹_{F^*}(K, T^*)` if `r ≤ 0` (noncanonically). Mazur–Rubin 2016 Definition 3.4 calls the signed integer `r` the core rank. In the convention of Mazur–Rubin 2004 Definition 4.1.11, the nonnegative core ranks are `χ(T, F) = max(r, 0)` and `χ(T^*, F^*) = max(−r, 0)`; one of these is zero. Higher-rank systems use the signed `r` and require `r ≥ 1`. For `R` a discrete valuation ring and `F` cartesian, `χ(T, F)` is the common value of `χ(T/m^kT, F)` for `k ≥ 1`.

The precise hypotheses are `R` principal artinian (or a discrete valuation ring); `F` cartesian; `(T/mT)^{G_K} = (T^*[m])^{G_K} = 0`; `T` and `T^*` lie in the arithmetic coefficient category over a coefficient ring; the Selmer structure records this and `Σ(F) ⊇ S_p ∪ S_∞`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Proposition 3.3(iii) and Definition 3.4, p. 8). The integer `r` and the definition of the core rank from it.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.1.5 and Definition 4.1.11, pp. 36–38). The same statement over `ℚ`; the case `n = 1` is used here.

The isomorphism class of a finitely generated module `B` over a principal artinian ring is determined by `i ↦ length B[m^i]`; so it suffices that `length H¹_F(K,T)[m^i] − length H¹_{F^*}(K,T^*)[m^i] = t·i` for an integer `t`.

By Layer 0.6 Selmer modules of quotients and torsion submodules these are the lengths of `H¹_F(K, T/m^i)` and `H¹_{F^*}(K, T^*[m^i])`; by the supplier The Euler characteristic formula for Selmer modules their difference is a sum of local terms, each linear in `i` by Layer 0.5 Lengths of cartesian conditions grow linearly (the global `H⁰` terms vanish).

Then `r = t`. Independence of the modulus is core-rank-independence-of-modulus.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.coreRankInt`: The integer `r` with `length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = r·k`.
- `TauCeti.KolyvaginSystems.coreRank`: `χ(T, F) = max(r, 0)` as a natural number; `χ(T^*, F^*) = max(−r, 0)`.
- `TauCeti.KolyvaginSystems.coreRank_mul_length`: If `χ(T) > 0` then `length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = k·χ(T)`; if `χ(T) = 0` the difference is `−k·χ(T^*)`.
- `TauCeti.KolyvaginSystems.coreRank_eq_zero_or_dual`: `χ(T, F) = 0` or `χ(T^*, F^*) = 0`.
- `TauCeti.KolyvaginSystems.selmer_equiv_dual_prod_free`: If coreRankInt`(T,F) = r ≥ 0`, there is a noncanonical `R`-linear isomorphism `H¹_F(K,T) ≃ H¹_{F^*}(K,T^*) × R^r`. For `r ≤ 0` the free factor occurs on the other side.
- `TauCeti.KolyvaginSystems.coreRank_field`: For `R = k` a field, `χ(T) − χ(T^*) = dim_k H¹_F(K, T) − dim_k H¹_{F^*}(K, T^*)`.

**Checks.**

- `coreRank_negative_signed`: Signed core rank `−2` has MR04 positive part 0, rather than absolute value 2.
- `coreRank_positive_signed`: Signed core rank 3 has positive part 3.
- `coreRank_length_quotient`: With vanishing residual invariants, Selmer lengths 5 and 3 and coefficient length 2 give signed core rank 1.

`χ(T, F) = 1` for `T = μ_{p^k} ⊗ ρ^{-1}` with `ρ` even and nontrivial and `F` the unit-root structure of Mazur–Rubin 2004 §6.1; `χ = 0` for `ρ` odd, `ρ ≠ ω`.

The core rank is not the `R`-rank of `T`: Under the hypotheses of Layer 1.19 Worked example: the Tate module of an elliptic curve, for `T = E[p^k]`, a module of rank 2, `χ(T, F_can) = 1` and `χ(T, F) = 0` for the classical Selmer structure.

Additional arithmetic check: For `K = ℚ, R = ℤ/p^k, ρ` an even nontrivial character of order prime to `p` and `T = μ_{p^k} ⊗ ρ^{-1}` with the structure `F` of Mazur–Rubin 2004 Definition 6.1.1, `χ(T, F) = 1`; for `ρ` odd with `ρ ≠ ω, χ(T, F) = 0`.

Additional arithmetic check: Over `R = k`, replacing `F` by the structure relaxed at one prime `q ∈ P_1` (so that `H¹_s(K_q, T)` is one-dimensional) raises `r` by exactly 1.

Additional arithmetic check: For `E/ℚ` and `p ≥ 5` with surjective mod-`p` representation, `T = E[p^k]` has rank two, `χ(T,F) = 0` for the classical Kummer structure, and `χ(T,F_can) = 1` for the structure propagated from `T_pE`.

*Needs:* Layer 0.6 Selmer modules of quotients and torsion submodules; the supplier finite Greenberg–Wiles formula; Layer 0.5 Lengths of cartesian conditions grow linearly; `Module.length`.

### 0.9 The core rank is independent of the modulus

Let `R` be principal artinian of `length k` and `F` cartesian with the invariants hypothesis of core-rank. Then for `0 < i ≤ k` the Selmer triple `(T/m^iT, F, P)` over `R/m^i` has `χ(T/m^iT) = χ(T)` and `χ(T^*[m^i]) = χ(T^*)`, and `H¹_F(K, T/m^iT) ≅ (R/m^i)^{χ(T)} ⊕ H¹_{F^*}(K, T^*[m^i])` when `χ(T) > 0`. If `R` is a discrete valuation ring and `H¹(K_q, T)/H¹_F(K_q, T)` is torsion-free for `q ∈ Σ(F)`, then `rank_R H¹_F(K, T) − corank_R H¹_{F^*}(K, T^*) = χ(T) − χ(T^*)`.

The precise hypotheses are as in Layer 0.8 The core rank of a cartesian Selmer structure; `R/m^i` is again a coefficient ring, so the reduced Selmer structure on `T/m^iT` over `R/m^i` is defined.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.1.13 and Definition 5.2.4, pp. 38, 56). Independence of the modulus.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Corollary 5.2.6, p. 56). The rank formula over a discrete valuation ring.

Take `m^i`-torsion in the isomorphism of Layer 0.8 The core rank of a cartesian Selmer structure and apply selmer-torsion-identification.

For a discrete valuation ring pass to the limit over `k` using SelmerIwasawaCohomology §2.18 (Selmer groups of `T` and `W` as limits) and the bounded cokernel of `H¹_F(K,T)/m^k → H¹_F(K, T/m^k)` (Mazur–Rubin 2004, Lemma 3.7.1(ii)).

For `T = T_pE` and `F_can, rank H¹_{F_can}(ℚ, T) − corank H¹_{F_can^*}(ℚ, E[p^∞]) = 1`.

*Needs:* Layer 0.8 The core rank of a cartesian Selmer structure; Layer 0.6 Selmer modules of quotients and torsion submodules; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`.

### 0.10 Core rank of the canonical and unramified structures

`(a) (K = ℚ)` For `R` the ring of integers of a finite extension of `ℚ_p` and `T` satisfying `(H.0)`–`(H.3), χ(T^*, F_can^*) = 0` and `χ(T, F_can) = rank_R T^− + corank_R H⁰(ℚ_p, T^*)`, where `T^−` is the minus part for a complex conjugation. `(b)` (`K` a number field, `R` a discrete valuation ring) `χ(T, F_ur) = Σ_{v | ∞} corank_R H⁰(K_v, T^*)`.

The precise hypotheses are the invariants hypothesis of Layer 0.8 The core rank of a cartesian Selmer structure; for `(a): K = ℚ` and the hypotheses of Mazur–Rubin 2004 §5.2; for `(b): R` a discrete valuation ring, `T` a compact lattice, and `F_ur` as in Layer 0.7 The canonical and the unramified Selmer structures, with `Σ(F_ur) ⊇ S_p ∪ S_∞`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 5.2.15, p. 59). Part `(a)`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Theorem 5.4, p. 10). Part `(b)`.

By Layer 0.9 The core rank is independent of the modulus and the supplier The Euler characteristic formula for Selmer modules applied to `T^*[m^k], k(χ(T) − χ(T^*))` is a sum of local terms `length H⁰(K_v, T^*[m^k]) − length H¹_{F^*}(K_v, T^*[m^k])` up to a bounded error.

At `v | ∞` the term is `∼ k·corank H⁰(K_v, T^*)`; at `q ∤ p∞` it is bounded (unramified-dimension-count of SelmerIwasawaCohomology L2); at `p` it is `∼ k·corank H⁰(ℚ_p, T^*)` for `F_can^*` strict, and bounded for `F_ur` by Mazur–Rubin 2016 Lemma 5.2.

`T = ℤ_p(1) ⊗ ρ^{-1}: χ(T, F_can) = 1` if `ρ` is even with `ρ(p) ≠ 1`; `T = T_pE: χ(T, F_can) = 1`.

For an abelian variety `A` of dimension `d` over `K` with large image, `χ(T_pA, F) = d[K : ℚ]` (Mazur–Rubin 2016, Proposition 5.9): the core rank is not the analytic rank.

*Needs:* Layer 0.9 The core rank is independent of the modulus; the supplier finite Greenberg–Wiles formula; Layer 0.7 The canonical and the unramified Selmer structures; `SelmerIwasawaCohomology §2.14 (Dimensions of unramified classes)`.

### Examples

For an empty prime set, the sole squarefree conductor is the empty product 1.

For two distinct primes `q₁,q₂`, conductors are exactly 1,`q₁,q₂,q₁q₂`.

A prime in `Σ(F)` divides no allowed conductor.

### Dependencies

This layer uses `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.2 (Compact and rational Selmer kernel)`; `Squarefree`; `IsAdic`; `IsAdicComplete`; `IsModuleTopology`; `TauCeti.IsSmoothDiscrete`; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`; `Module.length`; Layer 0.1 Selmer triples and squarefree conductors; Layer 0.3 The category of quotients of `T`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; `SelmerIwasawaCohomology §2.6 (From V to T and W; saturation)`; Layer 0.4 Cartesian local conditions; `ArithmeticGaloisDuality §R02.1.2 (Long exact sequences for continuous cohomology)`; `ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas)`; `Submodule.torsion`; `cyclotomicCharacter`; Layer 0.6 Selmer modules of quotients and torsion submodules; the supplier finite Greenberg–Wiles formula; Layer 0.5 Lengths of cartesian conditions grow linearly; Layer 0.8 The core rank of a cartesian Selmer structure; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; Layer 0.9 The core rank is independent of the modulus; Layer 0.7 The canonical and the unramified Selmer structures; `SelmerIwasawaCohomology §2.14 (Dimensions of unramified classes)`.

Use Layer 0.2 for finite self-injective-`R` duality and the compact/discrete coefficient adapters of SelmerIwasawaCohomology Layer 2 for `O`-lattices and their torsion duals.

The proof also uses Mazur–Rubin 2016 Lemma 5.2 through Perrin-Riou's universal-norm lemma, and the bounded-kernel comparison in the proof of Theorem 5.4.

## Layer 1: Auxiliary primes and finite–singular comparison

### 1.1 The fields `K(q), K(r)` and their Galois groups

For a prime `q` of `K` not dividing `p, K(q)` is the maximal `p`-extension of `K` inside the ray class field of `K` modulo `q`, and `K(1)` is the maximal `p`-extension of `K` inside the Hilbert class field. `K(q)/K(1)` is unramified outside `q`, totally ramified above `q` and cyclic, with `Γ_q = Gal(K(q)/K(1))` the maximal `p`-quotient of `(O_K/q)^×/(O_K^× mod q)`. For a squarefree product `r = q₁⋯q_k, K(r) = K(q₁)⋯K(q_k), Γ_r = Gal(K(r)/K(1)) ≅ ∏_{q | r} Γ_q` with `Γ_q` the inertia group of `q` in `Γ_r`; for `s | r, Γ_s` is both a subgroup and a quotient of `Γ_r`. For `K ⊆ F ⊆ K_∞` finite over `K, F(r) = F·K(r)` and `Gal(F(r)/K(1)) ≅ Gal(F(1)/K(1)) × Γ_r` when `K_∞/K` is unramified outside `p`.

The precise hypotheses are `q ∤ p`; `r` squarefree and prime to `p`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §1, p. 55). The fields `K(q), K(r)` and the groups `Γ_q, Γ_r`.

Existence of the ray class field modulo `q` and its Galois group `Cl_q(K)` come from global class field theory (Tau Ceti's ClassFieldTheory roadmap, layers 12–13); `K(q)` is the fixed field of the prime-to-`p` part.

The exact sequence `0 → (O_K/q)^×/im(O_K^×) → Cl_q(K) → Cl(K) → 0` of Tau Ceti's ray class groups identifies `Γ_q`; ramification considerations show the `K(q)` are linearly disjoint over `K(1)`.

For `K = ℚ: K(1) = ℚ, ℚ(ℓ)` is the maximal `p`-extension in `ℚ(μ_ℓ)^+`, and `Γ_ℓ` is the `p`-part of `𝔽_ℓ^×/{±1}`, which for `p` odd is the `p`-part of `𝔽_ℓ^×`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.rayPExtension`: `K(q)` as an intermediate field of `K̄/K`, for `q ∤ p`; `K(1)` for the trivial modulus.
- `TauCeti.KolyvaginSystems.gammaPrime`: `Γ_q = Gal(K(q)/K(1))`, a finite cyclic `p`-group.
- `TauCeti.KolyvaginSystems.gammaPrime_equiv`: `Γ_q` is the maximal `p`-quotient of `(O_K/q)^×/(O_K^× mod q)`.
- `TauCeti.KolyvaginSystems.gammaConductor_equiv_pi`: `Γ_r ≅ ∏_{q | r} Γ_q`, compatibly with the inclusions and projections for `s | r`.
- `TauCeti.KolyvaginSystems.card_gammaPrime_dvd`: `#Γ_q` divides `N(q) − 1`.
- `TauCeti.KolyvaginSystems.rayPExtension_ramification`: `K(q)/K(1)` is unramified outside `q` and totally ramified at the primes above `q`.

**Checks.**

- `gammaConductor_one`: The relative Galois group of the conductor-one ray layer over `K(1)` is trivial.
- `gammaPrime_trivial_of_not_dvd`: If `p` does not divide `N(q)−1`, the relative `p`-ray group `Γ_q` is trivial.
- `gammaConductor_product`: The relative ray Galois group at `n` is the product of its one-prime relative groups.

`[K(q) : K(1)]` divides `N(q) − 1`.

`K(r)` is contained in, and in general not equal to, the maximal `p`-extension of `K` in the ray class field modulo `r`.

Additional arithmetic check: For `K = ℚ` and `p = 3, Γ_7` is cyclic of order 3 and `Γ_5` is trivial; for `p = 2, Γ_7` has order 1 because `6 = 2·3` and `(ℤ/7)^×/{±1}` has order 3.

Additional arithmetic check: For `K = ℚ, p = 3: Γ_{7·13} ≅ ℤ/3 × ℤ/3`, and the maximal 3-extension of `ℚ` of conductor 91 has this Galois group.

Additional arithmetic check: For `K = ℚ, p = 3, q = 13`: the ray class field modulo 13 is `ℚ(μ_13)^+`, of degree 6, and `ℚ(13)` is its cubic subfield, a proper subfield.

*Needs:* `TauCetiRoadmap.ClassFieldTheory Layer 13`; `TauCeti.GlobalNumberFields.RayClassGroup`.

### 1.2 Finite and singular parts at an unramified prime

Let `K_v` be nonarchimedean of residue characteristic `≠ p` with residue field `𝔽, T` a finitely generated module over a coefficient ring `R`, with its `m`-adic topology and an unramified continuous `G_{K_v}`-action and `|𝔽^×|·T = 0`. There are canonical functorial isomorphisms `H¹_f(K_v, T) ≅ T/(Fr − 1)T` (evaluate cocycles at Frobenius), `H¹_s(K_v, T) := H¹(K_v, T)/H¹_f(K_v, T) ≅ Hom(I, T^{Fr=1})`, and `H¹_s(K_v, T) ⊗ 𝔽^× ≅ T^{Fr=1}`.

The precise hypotheses are `T` unramified, of finite type over a coefficient ring (complete noetherian local, finite residue field of characteristic `p ≠ char 𝔽`), with the `m`-adic topology and a continuous action; `|𝔽^×|·T = 0`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemma 1.2.1, p. 10). The two canonical identifications.

`H¹_f = H¹(G_𝔽, T) ≅ T/(Fr − 1)T` is SelmerIwasawaCohomology §2.7 (The unramified condition) `(unramified_equiv_coinvariants)`.

The sequence `0 → H¹(G_𝔽, T) → H¹(K_v, T) → H¹(I, T)^{G_𝔽} → 0` (vanishing of `H²(G_𝔽, T)`) gives `H¹_s ≅ Hom(I, T)^{Fr=1}`; since `|𝔽^×|T = 0` and `I/|𝔽^×|I ≅ 𝔽^×` canonically (tame inertia), `Hom(I, T)^{Fr=1} = Hom(𝔽^×, T^{Fr=1})`.

For `T = ℤ/p^k` with trivial action and `p^k | #𝔽^×: H¹_f ≅ ℤ/p^k` and `H¹_s ≅ Hom(𝔽^×, ℤ/p^k)`.

The isomorphisms commute with maps `T → T′` of such modules.

Outside the coefficient category the identification fails: for `ℚ` with the discrete topology and trivial action, continuous `H¹` of the unramified quotient `Ẑ` is zero while the Frobenius coinvariants are `ℚ`. `ℚ` is not a coefficient ring, and the suggested finiteEvaluation requires compact coefficients.

*Needs:* `SelmerIwasawaCohomology §2.7 (The unramified condition)`; `TauCetiRoadmap.ClassFieldTheory Layer 7`; `ArithmeticGaloisDuality §R02.2.3 (Inflation–restriction for compact and rational coefficients)`; `TauCetiRoadmap.ClassFieldTheory Layer 5`.

### 1.3 Exponents, orders and reducibility depth

Let `O_λ` be a discrete valuation ring with uniformiser `λ`. The exponent and order conventions are Liu–Tian–Xiao–Zhang–Zhu Definition 2.1.6. For an `O_λ`-module `M` and `x ∈ M: exp_λ(x, M) = min{d ≥ 0 : λ^d x = 0} ∈ ℤ_{≥0} ∪ {∞}` and `ord_λ(x, M) = sup{d ≥ 0 : x ∈ λ^d M}`. For a profinite group `G` and a torsion `O_λ[G]`-module `R` of finite type, the reducibility depth of `R` is the smallest integer `r_R ≥ 0` such that (1) every `G`-stable `O_λ`-submodule `R′ ⊆ R` not contained in `λR` contains `λ^{r_R}R`, and (2) for every `m ≥ 1, End_{O_λ[G]}(R̄^{(m)})/O_λ·id` is annihilated by `λ^{r_R}`, where `R̄^{(m)} = R/λ^mR`. If `R/λR` is absolutely irreducible then `d_R = 0`. If `R` is a lattice with `R ⊗ ℚ` absolutely irreducible, there is `r_R` depending only on `R` bounding the reducibility depth of every `R̄^{(m)}`. In the abundance and localisation formulas below we write `d_R` for this reducibility depth (called `r_R` in LTXZZ), to distinguish it from ranks.

The precise hypotheses are `O_λ` a discrete valuation ring with finite residue field; `R` of finite type.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 2.3.2, published p.126). Definition of the reducibility depth.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Lemma 2.3.3, published p.126). The uniform bound.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 2.3.2, Lemmas 2.3.3–2.3.4, published pp.126–128). The published coefficient and depth conventions.

Absolutely irreducible residual representation: a submodule not in `λR` surjects onto `R/λR`, so equals `R` by Nakayama; endomorphisms are scalars by Schur and lifting.

Uniform bound: for `R_ℚ` absolutely irreducible the lattices stable under `G` in `R_ℚ` form finitely many homothety classes and `End(R) = O_λ`; a compactness argument bounds both conditions uniformly in `m` (Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.3).

The definition exposes the following operations and relations.

- `TauCeti.ErrorTolerant.expAt`: `exp_λ(x, M) ∈ ℕ∞`.
- `TauCeti.ErrorTolerant.ordAt`: `ord_λ(x, M) ∈ ℕ∞`.
- `TauCeti.ErrorTolerant.expAt_add_ordAt_eq`: In a free `O_λ/λ^n`-module, `exp_λ(x) + ord_λ(x) = n` for `x ≠ 0`.
- `TauCeti.ErrorTolerant.reducibilityDepth`: `r_R` for a torsion `O_λ[G]`-module `R` of finite type.
- `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero`: If `R/λR` is absolutely irreducible then `d_R = 0`.
- `TauCeti.ErrorTolerant.reducibilityDepth_bounded`: For a lattice `R` with `R_ℚ` absolutely irreducible, `sup_m r_{R̄^{(m)}} < ∞`.

**Checks.**

- `expAt_zero`: The annihilator exponent of zero is zero.
- `expAt_uniformizer_quotient`: In `O/(πⁿ), πᵈ` has annihilator exponent `n−d` for `d<n`.
- `reducibilityDepth_stable_counterexample`: `A` primitive stable submodule missing `πᵈT` disproves the depth bound `d`.

`r_R` measures the failure of residual irreducibility that Mazur–Rubin's `(H.1)` excludes; with `d_R = 0` the error-tolerant statements reduce to the clean ones.

Here `ord_λ(0,M)=∞`; it is not the truncated finite-level divisibility index, whose value at zero is the quotient length. For example, in `ℤ/9` the class 3 has `exp₃=ord₃=1` and the class 1 has `exp₃=2`. These functions are the order functions used in Rubin’s Chapter V.

Additional arithmetic check: In `M = ℤ/p³, exp_p(p) = 2` and `ord_p(p) = 1`.

Additional arithmetic check: For `R = E[p^m]` with `E[p]` absolutely irreducible, `d_R = 0`.

Additional arithmetic check: For `R = ℤ/p² ⊕ ℤ/p²` with `G` acting through the upper unipotent matrices `(1, p·b; 0, 1), b ∈ ℤ/p`, the submodule generated by `e₁` is `G`-stable and not contained in `pR` but does not contain `R`, so `r_R ≥ 1: r_R ≠ 0` although `R` is free.

Additional arithmetic check: `ord_λ(x, M) = ∞` iff `x ∈ ∩_d λ^d M`; for `M` of finite length this means `x = 0`.

*Needs:* `SelmerIwasawaCohomology §2.1 (Compact and rational Selmer data)`.

### 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`

Let `(T, F, P)` be a Selmer triple and `q` a prime with `q ∤ p∞` and `T` unramified at `q`. `G_q = Gal(K(q)_q/K_q)`, the Galois group of the completion of `K(q)` at `q` (for `K = ℚ` and in Mazur–Rubin 2004: `G_ℓ = 𝔽_ℓ^× = Gal(ℚ(μ_ℓ)/ℚ)`). Over `ℚ, I_ℓ` is the ideal of `R` generated by `ℓ − 1` and `P_ℓ(1)`, where `P_ℓ(x) = det(1 − Fr_ℓ x | T)`. Over `K` (`R` principal): `I_q = R` if `q` is not principal, and otherwise `I_q` is the largest power of `m` with `[K(q)_q : K_q]R ⊆ I_q` and `T/((Fr_q − 1)T + I_qT)` free of rank one over `R/I_q`. For `n ∈ N(P): I_n = Σ_{q | n} I_q (I_1 = 0)` and `G_n = ⊗_{q | n} G_q (G_1 = ℤ)`. Then `G_n ⊗ R/I_n` is free of rank one over `R/I_n`, and `I_q` annihilates |`𝔽_q^×`|-torsion requirements for the finite–singular map on `T/I_nT`.

The precise hypotheses are `T` free over `R`, unramified at `q, q ∤ p∞`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 2.2.1, p. 16). `I_ℓ, I_n` and `G_n` over `ℚ`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 2.2, p. 6). `I_q` over a number field.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Definition 1.2.1, p. 1444). The inert-prime variant.

`G_q` is cyclic and its order lies in `I_q`, so `G_q ⊗ R/I_q ≅ R/I_q` noncanonically; tensor over the primes dividing `n`.

The two definitions of `I_q` agree in their use: both give |`G_q|·(T/I_qT) = 0` and `det(1 − Fr_q | T/I_qT) = 0` (under the rank-one coinvariants condition), which are the hypotheses of the finite–singular comparison.

Howard's variant for `K` imaginary quadratic and `ℓ` inert: `I_ℓ` is the smallest ideal containing `ℓ + 1` for which `Fr_λ` acts trivially on `T/I_ℓT`, and `G_ℓ = k_λ^×/k_ℓ^×`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.conductorIdeal`: `I_q ⊆ R` for a prime `q`, and `I_n = ⨆_{q | n} I_q` for squarefree `n`.
- `TauCeti.KolyvaginSystems.conductorIdeal_one`: `I_1 = ⊥`.
- `TauCeti.KolyvaginSystems.conductorIdeal_mono`: `m | n` implies `I_m ≤ I_n`.
- `TauCeti.KolyvaginSystems.tameGroup`: `G_q = Gal(K(q)_q/K_q)` and `G_n = ⊗_{q | n} G_q`, with `G_1 = ℤ`.
- `TauCeti.KolyvaginSystems.tameGroup_tensor_free`: `G_n ⊗_ℤ R/I_n` is a free `R/I_n`-module of rank one.
- `TauCeti.KolyvaginSystems.conductorIdeal_rat`: For `K=ℚ`, odd residue characteristic `p` and `R` principal with the stated `p`-adic coefficient hypotheses, the 2016 ideal `I_ℓ` is the largest power of `m` containing the 2004 ideal `(ℓ−1,P_ℓ(1))` for which the coinvariants are free of rank one. The finite-modulus ray class group quotients by `±1`; its `p`-part agrees with the full tame group only after this odd-`p` restriction.

**Checks.**

- `conductorIdeal_two_primes`: `I_{q₁q₂}=I_{q₁}+I_{q₂}`, not their product or intersection.
- `conductorIdeal_one`: The conductor-one coefficient ideal is zero.
- `tameGroup_one`: The conductor-one tame tensor factor is `ℤ`, not the zero group.

For `T = ℤ_p(1)` over `ℚ: P_ℓ(x) = 1 − ℓx` and `I_ℓ = (ℓ − 1)`.

`I_n` depends on Frobenius and on `|G_q|`, not only on `n`.

Additional arithmetic check: For `K=ℚ`, odd `p, R=ℤ_p` and `T=ℤ_p(1)`, both conductor conventions give `I_ℓ=(ℓ−1)ℤ_p`, so `ℓ∈P_k^{all}` iff `ℓ≡`1 modulo `p^k`. At `p=2, ℓ=7`, the MR04 ideal is (2), whereas the finite-modulus ray class group has order 3 and its maximal 2-extension is trivial, so the MR16 ideal is the unit ideal.

Additional arithmetic check: For `T = T_pE` over `ℚ: P_ℓ(1) = 1 − a_ℓ + ℓ` and `I_ℓ = (ℓ − 1, a_ℓ − 2)`.

Additional arithmetic check: Two primes `ℓ, ℓ′` with `ℓ ≡ ℓ′ ≡` 1 `(mod p^k)` can have `I_ℓ ≠ I_ℓ′` for `T = T_pE`, since `a_ℓ ≢ a_ℓ′` in general: `I_ℓ` is not a function of `ℓ − 1` alone.

*Needs:* Layer 1.1 The fields `K(q), K(r)` and their Galois groups; Layer 0.1 Selmer triples and squarefree conductors; `LinearMap.charpoly`.

### 1.5 The transverse local condition

In the situation of Layer 1.2 Finite and singular parts at an unramified prime, fix a totally tamely ramified cyclic extension `L/K_v` with `[L:K_v]·T = 0`. The maximal choice has `Gal(L/K_v) ≅ 𝔽^×` (for `K_v = ℚ_ℓ`, `L = ℚ_ℓ(μ_ℓ)`). For `q` principal, or more generally splitting completely in `K(1)`, take `L = K(q)_q`, of degree `|G_q|` dividing `|𝔽^×|`, with `T` killed by `|G_q|`; it need not be maximal (for `K = ℚ`, `p = 3` and `q = 7` it is the cubic subfield of `ℚ_7(μ_7)`). The `L`-transverse condition is `H¹_tr(K_v, T) = ker(H¹(K_v, T) → H¹(L, T)) = H¹(L/K_v, T^{G_L})`. It projects isomorphically onto `H¹_s(K_v, T)`, so `H¹(K_v, T) = H¹_f(K_v, T) ⊕ H¹_tr(K_v, T)`, functorially in `T`. It is defined by restriction to the specified extension `L`, not by a choice of complement.

The precise hypotheses are `T` unramified with `[L:K_v]·T = 0`; `L/K_v` totally tamely ramified cyclic.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 1.1.6(iv) and Lemma 1.2.4, pp. 9, 11). Definition of the transverse condition and the splitting.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), §2, immediately before Definition 2.1, p. 6). The global ray-field example when `q` is principal; splitting in `K(1)` gives the same total-ramification conclusion.

Since `L/K_v` is totally ramified and `T` unramified, `T^{G_L} = T^{Fr=1}`; the composite `H¹(L/K_v, T^{G_L}) = Hom(Gal(L/K_v), T^{Fr=1}) → Hom(I, T^{Fr=1}) = H¹_s` is an isomorphism, because `Gal(L/K_v)` is the quotient of tame inertia of order `[L:K_v]` and `[L:K_v]·T = 0` (Mazur–Rubin 2004, Lemma 1.2.4, for the maximal `L`).

`c ∈ H¹(K_v, T)` decomposes as `c_f + c_tr`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.transverse`: `H¹_tr(K_v, T) = ker`(res : `H¹(K_v, T) → H¹(L, T)`).
- `TauCeti.KolyvaginSystems.transverse_isCompl_finite`: `H¹_f(K_v, T)` and `H¹_tr(K_v, T)` are complementary submodules of `H¹(K_v, T)`.
- `TauCeti.KolyvaginSystems.transverse_equiv_singular`: The projection `H¹_tr(K_v, T) → H¹_s(K_v, T)` is an isomorphism.
- `TauCeti.KolyvaginSystems.transverse_map`: `A` map `T → T′` of unramified modules killed by `[L:K_v]` carries `H¹_tr` to `H¹_tr`.
- `TauCeti.KolyvaginSystems.finitePart`: `c ↦ c_f` and `c ↦ c_tr`, the two projections of the decomposition.
- `TauCeti.KolyvaginSystems.transverse_eq_bot_iff`: `H¹_tr(K_v, T) = 0` iff `T^{Fr=1} = 0`.
- `TauCeti.KolyvaginSystems.transverse_eq_of_le`: If `L′ ⊆ L` are totally tamely ramified cyclic extensions of `K_v` and `[L′:K_v]·T = 0`, the `L′`- and `L`-transverse conditions coincide: the first is contained in the second, and both project isomorphically onto `H¹_s`.
- `TauCeti.KolyvaginSystems.exists_maximal_tame_ge`: Every totally tamely ramified cyclic `L′/K_v` lies in one of degree `|𝔽^×|`: for a uniformizer `π′` in the norm group of `L′`, the subgroup `π′^ℤ·(1 + 𝔪_v)` has index `|𝔽^×|` and lies in that norm group, and its class field contains `L′`.

Consequently every transverse condition of this subsection is the transverse condition of an extension of degree `|𝔽^×|`, to which Layer 1.10 applies.

**Checks.**

- `transverse_restriction_kernel`: The transverse condition is exactly the kernel of restriction to the designated totally ramified tame extension.
- `transverse_trivial`: If the Frobenius-fixed module is zero, the transverse condition is zero.
- `transverse_finite_projection`: The finite projection of a transverse class is zero under the supplied direct-sum comparison.
- `transverse_eq_of_le_cubic`: For `K_v = ℚ_7`, `p = 3`, `T = ℤ/3` and `L′ ⊂ L = ℚ_7(μ_7)` the cubic subfield, the norm groups are `⟨7⟩ × (ℤ_7^×)^3` and `⟨7⟩ × (1 + 7ℤ_7)`, and both transverse conditions are `{f : f(7) = 0}` in `Hom(ℚ_7^×, ℤ/3)`.
- For `K = ℚ(√−23)`, `p = 3` and `q = (2,ω)` with `ω = (1 + √−23)/2`, the class of `q` has order 3 and `h_K = 3`. Since `(O_K/q)^× = 1`, `K(q) = K(1)` and `K(q)_q/K_q` is unramified cubic. Thus this completion is not a transverse extension. Here `(ω−2) = q³`, no element has norm 2, and the Minkowski bound `2√23/π < 3.1`, together with `(ω) = q(3,ω)`, gives the class-group calculation.
- `transverse_eq_of_le_degree`: The hypothesis `[L′:K_v]·T = 0` is needed. For `K_v = ℚ_19`, `T = ℤ/9` and `L′` the cubic subfield of `ℚ_19(μ_19)`, the `L′`-transverse condition consists of the homomorphisms killing `19` and `(ℤ_19^×)^3`, a group of order 3, whereas `H¹_s` has order 9; so it is not a complement of `H¹_f`.

Different choices of `L` give different complements; all are transverse to `H¹_f`.

The transverse condition does not in general propagate to subquotients as the transverse condition (Remark 1.1.8), but `F(n)` stays cartesian on quotients (Lemma 3.7.4).

Additional arithmetic check: For `K_v = ℚ_ℓ, ℓ ≡` 1 `(mod p^k), T = ℤ/p^k: H¹(ℚ_ℓ, T) = Hom(ℚ_ℓ^×, ℤ/p^k) ≅ (ℤ/p^k)², H¹_f` is the homomorphisms trivial on `ℤ_ℓ^×`, and `H¹_tr` is the homomorphisms trivial on the norm group `⟨ℓ⟩ × (1 + ℓℤ_ℓ)` of `ℚ_ℓ(μ_ℓ)`, that is, those with `f(ℓ) = 0`.

Additional arithmetic check: In the example above, `{f : f(ℓu) = 0}`, for a unit `u ∈ ℤ_ℓ^×` that is not a `p`-th power modulo `ℓ`, is another complement of `H¹_f = {f : f(ℤ_ℓ^×) = 0}`, and it is not `H¹_tr = {f : f(ℓ) = 0}`: the transverse condition is determined by `L = ℚ_ℓ(μ_ℓ)`.

Additional arithmetic check: For `p` odd, `H¹_tr(K_v, T)` and `H¹_tr(K_v, T^*)` are exact orthogonal complements under the local Tate pairing; Layer 1.10 states the hypothesis at `p = 2` and the excluded `ℚ₃` example.

*Needs:* Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.1 The fields `K(q), K(r)` and their Galois groups.

### 1.6 The field cut out by a Selmer module and saturation of `θ_S`

Fix `m ≥ 1` and `R` free of finite rank over `O_λ/λ^m` with `ρ : Γ_F → GL(R), F_ρ` the field fixed by `ker ρ` and `G = Gal(F_ρ/F)`. Restriction `Res_ρ : H¹(F, R) → Hom_G(Γ^{ab}_{F_ρ}, R)` gives a pairing [ , ] : `H¹(F, R) × Γ^{ab}_{F_ρ} → R`. For a finitely generated submodule `S ⊆ H¹(F, R), F_S/F_ρ` is the finite abelian extension with `Gal(F^{ab}_ρ/F_S) = {γ : [s, γ] = 0 ∀ s ∈ S}`, and `θ_S : Gal(F_S/F_ρ) → Hom_{O_λ}(S, R)` is injective and `G`-equivariant. `(a)` If `Res_ρ` is injective and `S` is free of rank `r_S` over `O_λ/λ^{m−m′}` for some integer `0 ≤ m′ < m`, the `O_λ`-span of the image of `θ_S` contains `λ^{𝔣(r_S) d_R} Hom_{O_λ}(S, R)`, where `𝔣(0) = 𝔣(1) = 1, 𝔣(2) = 4, 𝔣(r + 1) = 2(𝔣(r) + 1)` for `r ≥ 2`. `(b) Res_ρ` is injective if the image of `Γ_F` in `GL(R̄)` contains a nontrivial scalar, or if `dim R̄ ≤ min{(ℓ + 1)/2, ℓ − 3}, R̄` is semisimple and `Hom_{𝔽_ℓ[Γ_F]}(End(R̄), R̄) = 0`, equivalently `Hom_{k[Γ_F]}(End(R̄)^{(σ)}, R̄) = 0` for every `σ ∈ Gal(k/𝔽_ℓ), k = O_λ/λ`.

The precise hypotheses are `R` free over `O_λ/λ^m`; for `(a): Res_ρ` injective.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Lemma 2.3.4, published pp.127–128). The saturation statement.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Lemma 2.3.5, published pp.127–128). The two criteria for injectivity of restriction.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Lemma 2.3.5, published pp.127–128). The published coefficient and depth conventions.

`θ_S` is injective by definition of `F_S`; equivariance is the compatibility of the pairing with `G`.

`(a)` by induction on `r_S` using both conditions of the reducibility depth; `(b)` by inflation–restriction: `ker Res_ρ = H¹(G, R)`, which vanishes by the scalar trick or by the cited `H¹`-vanishing for small faithful semisimple modules.

With `d_R = 0` and `r_S = 1` the image of `θ_S` spans `Hom(S, R)`: the clean Chebotarev input of Mazur–Rubin's Proposition 3.6.1.

`(H.3)` of Mazur–Rubin 2004 is the statement that `Res` is injective for the field `ℚ(T, μ_{p^∞})`.

*Needs:* Layer 1.3 Exponents, orders and reducibility depth; `ArithmeticGaloisDuality §R02.2.3 (Inflation–restriction for compact and rational coefficients)`.

### 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`

`(a)` Over `ℚ: P_k^{all}` is the set of primes `ℓ ∉ Σ(F)` with `T/(m^kT + (Fr_ℓ − 1)T)` free of rank one over `R/m^k` and `I_ℓ ⊆ m^k` (Mazur–Rubin's `P_k`); the restricted set is `P_k = P ∩ P_k^{all}`. Both decrease in `k`, and `N_k = N(P_k)`. `(b)` Over `K: P_k = {q ∈ P : I_q ⊆ m^k}`; for a finite Galois `L/K` and `τ ∈ G_K, P(L, τ)` is the set of primes `q ∉ Σ(F)` unramified in `L` with `Fr_q` conjugate to `τ` in `Gal(L/K)`. `(c)` Rubin: for `K ⊆ F ⊆ K_∞` finite and `0 ≠ M ∈ O, R_{F,M}` is the set of `r ∈ R(N)` such that every prime `q | r` satisfies `M | [K(q) : K(1)], M | P(Fr_q^{-1} | T^*; 1)`, and `q` splits completely in `F(1)/K`.

The precise hypotheses are a Selmer triple; for `(c)` an ideal `N` divisible by `p` and the ramified primes. In the finite-level Rubin Frobenius criterion require `q∤N`, `τ` to fix `F(1)(μ_M̄, (O_K^×)^{1/M̄})`, and `T^{τ=1}≠0`; Frobenius conjugacy is imposed on its compositum with `W_M`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.1.6, p. 21). The sets `P_k`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 4.2, p. 9). The sets `P(L, τ)`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Definition 1.1, p. 57). Rubin's sets `R_{F,M}`.

If `τ` satisfies `(H.2)`, `ℓ ∉ Σ(F)` and the Frobenius class of `ℓ` in `Gal(ℚ(T/m^kT, μ_{p^d})/ℚ)` is that of `τ` (`p^d` generating the kernel of `ℤ_p → R/m^k`), then `ℓ ∈ P_k^{all}` (Mazur–Rubin 2004, Lemma 3.5.6`(i)`); then `ℓ ∈ P_k` exactly when also `ℓ ∈ P`.

`M | [K(q) : K(1)]` iff `q` splits completely in `K(μ_M̄, (O_K^×)^{1/M̄})`; and if `q∤N`, `τ` fixes `F(1)(μ_M̄, (O_K^×)^{1/M̄})`, `T^{τ=1} ≠ 0`, and `Fr_q` is conjugate to `τ` on `F(1)(μ_M̄, (O_K^×)^{1/M̄}, W_M)`, then `q ∈ R_{F,M}` (Rubin, Lemmas IV.1.2–1.3).

`P(L,τ)` is a nonempty conjugacy-class Frobenius set and has positive density. For the unrestricted 2004 set `P_k^{all}, (H.2)` provides a nonempty Frobenius subset by Lemma 3.5.6`(i)`. For `P_k` restricted to a chosen `P`, require the containment hypothesis `(H.5)`, or 2016 `(H.7)` and `k` large enough as specified there. An arbitrary `P`, including `P=∅`, need not have positive density. Rubin’s prime-selection hypotheses similarly supply a nonempty Frobenius subset of the allowed primes.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.mr04Primes`: `P_k^{all}`, Mazur–Rubin's unrestricted set of primes `ℓ ∉ Σ(F)` of Definition 3.1.6, for `k ≥ 1`.
- `TauCeti.KolyvaginSystems.kolyvaginPrimes`: `P_k = P ∩ P_k^{all}` over `ℚ` and `{q ∈ P : I_q ⊆ m^k}` over `K`, for `k ≥ 1`; in particular `P_k ⊆ P`.
- `TauCeti.KolyvaginSystems.kolyvaginPrimes_antitone`: `P_{k+1} ⊆ P_k`, and likewise for `P_k^{all}`.
- `TauCeti.KolyvaginSystems.frobeniusPrimes`: `P(L, τ)`, as Tau Ceti's frobeniusPrimeSet of the class of `τ` minus `Σ(F)`.
- `TauCeti.KolyvaginSystems.mem_mr04Primes_of_frobenius`: If `ℓ ∉ Σ(F)`, `Fr_ℓ` is conjugate to `τ` in `Gal(ℚ(T/m^kT, μ_{p^d})/ℚ)` and `τ` satisfies `(H.2)`, then `ℓ ∈ P_k^{all}`.
- `TauCeti.KolyvaginSystems.mem_kolyvaginPrimes_of_frobenius`: Under the same hypotheses and `ℓ ∈ P`, `ℓ ∈ P_k`.
- `TauCeti.KolyvaginSystems.rubinPrimes`: `R_{F,M} ⊆ R(N)`.
- `TauCeti.KolyvaginSystems.mem_rubinPrimes_of_frobenius`: The finite-level form of Rubin's Lemma IV.1.3: for `q∤N`, if `τ` fixes `F(1)(μ_M̄, (O_K^×)^{1/M̄})`, `T^{τ=1} ≠ 0`, and `Fr_q` is conjugate to `τ` on its compositum with `W_M`, then `q ∈ R_{F,M}`. The source's stronger assumptions that `τ` fixes `K∞(1)`, `μ_{p^∞}` and all `p`-power unit radicals imply these finite-level fixing conditions.
- `TauCeti.KolyvaginSystems.kolyvaginPrimes_infinite`: For the unrestricted 2004 set `P_k^{all}, (H.2)` implies positive density and infinitude after removing a finite set. For the definition restricted to `P`, also require `P` to contain that Frobenius subset, as ensured by `(H.5)` (`P ⊇ P_t^{all}`) or `(H.7)`.

**Checks.**

- `kolyvaginPrimes_not_outside`: `A` prime outside the selected set is outside every level set.
- `kolyvaginPrimes_unit_ideal`: At positive level and a proper maximal-ideal power, a prime with unit conductor ideal is excluded.
- `kolyvaginPrimes_level_zero`: At level zero, every selected prime is allowed.
- `rubinPrimes_fixing_required`: For `K=F=ℚ`, `p=M=3`, trivial `T=ℤ₃`, `N=(3)` and `q=5`, a Frobenius lift `τ` satisfies conjugacy and `T^{τ=1}≠0`, but does not fix `μ₃`. The finite ray-class field of conductor 5 has degree 2, so `ℚ(5)=ℚ(1)=ℚ` and `5∉R_{ℚ,3}`.
- `kolyvaginPrimes_restricted_empty`: For `P = ∅`, `T = ℤ₃(1)` over `ℚ`, `τ = 1`, `k = 1` and `ℓ = 7`, Frobenius fixes `ℚ(μ₃)` and `(H.2)` holds, so `7 ∈ P_1^{all}`; but `P_1 = ∅`. The Frobenius criterion concludes membership in `P_k` only for `ℓ ∈ P`.

For `ℓ ∈ P_k` with `R` principal artinian of `length k: H¹_f(ℚ_ℓ, T), H¹_s(ℚ_ℓ, T)` and their duals are free of rank one and `φ^fs_ℓ` is an isomorphism (Lemma 3.5.6(ii)).

All chosen primes avoid `Σ(F)` and any prescribed finite set.

Additional arithmetic check: For `T = ℤ_p(1)` over `ℚ` with `Σ(F) = {p, ∞}: P_k^{all} = {ℓ ≠ p : ℓ ≡ 1 (mod p^k)}`.

Additional arithmetic check: For `R = ℤ_p` and `T = ℤ_p(1), ∩_k P_k^{all} = ∅`: no prime is `≡` 1 modulo every power of `p`.

Additional arithmetic check: For `K=F=ℚ`, `T=ℤ_p(1)` and `M=p^k`, `k≥1`, the Euler-polynomial condition is automatic. For odd `p`, a prime `ℓ∤N` lies in `R_{ℚ,M}` iff `ℓ≡1 (mod p^k)`. For `p=2` it lies there iff `ℓ≡1 (mod 2^{k+1})`, since the finite ray modulus gives degree equal to the `2`-part of `(ℓ−1)/2`. In particular `p=2`, `k=1`, `N=(2)`, `ℓ=3` satisfies `ℓ≡1 (mod 2)` but `ℚ(3)=ℚ`, so `3∉R_{ℚ,2}`.

Additional arithmetic check: For `T = T_pE` and `ℓ ≡` 1 `(mod p)` with `a_ℓ ≢` 2 `(mod p), ℓ ∉ P_1: I_ℓ = R`.

*Needs:* Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; Layer 1.1 The fields `K(q), K(r)` and their Galois groups; `TauCetiRoadmap.Chebotarev Layer 10`; `NumberField.Chebotarev.frobeniusPrimeSet`; `NumberField.artinSymbol`.

### 1.8 The finite–singular comparison map

Let `T` be free of finite rank over `R`, unramified at `v`, with |`𝔽^×|·T = 0` and `det(1 − Fr | T) = 0`. Put `P(x) = det(1 − Fr x | T)` and let `Q(x) ∈ R[x]` be the unique polynomial with `(x − 1)Q(x) = P(x)`. By Cayley–Hamilton `Q(Fr^{-1})T ⊆ T^{Fr=1}`, and `φ^fs : H¹_f(K_v, T) ≅ T/(Fr − 1)T → T^{Fr=1} ≅ H¹_s(K_v, T) ⊗ 𝔽^×` is induced by `Q(Fr^{-1})`. If `R` is artinian, |`𝔽^×|R = 0` and `T/(Fr − 1)T` is free of rank one, then `det(1 − Fr | T) = 0` automatically and `Q(Fr^{-1})` and `φ^fs` are isomorphisms, so `H¹_f` and `H¹_s` are free of rank one. With the tensor factor `𝔽^×` (globally `G_q`) retained the map involves no choice. A generator `σ` of the tame quotient gives Rubin's map `φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q : H¹_f → H¹_s` (`α_q` evaluation at `σ, β_q` evaluation at Frobenius), and `φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ`; for another generator `σ^a` one has `φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}`, so the tensor-valued map is independent of the generator.

The precise hypotheses are `T` free of finite rank over a coefficient ring, unramified, with the `m`-adic topology and a continuous action; |`𝔽^×|·T = 0`; `det(1 − Fr | T) = 0`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 1.2.2, p. 10). The comparison map with its tensor factor.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Definition 5.3, pp. 67–68). Rubin's version with a chosen generator `σ_q`.

`P(1) = 0` gives `Q`; `P(Fr^{-1}) = 0` on `T` by Cayley–Hamilton (Mathlib's LinearMap.`aeval_self_charpoly` after reversing the polynomial), so `(Fr^{-1} − 1)Q(Fr^{-1}) = 0` and `Q(Fr^{-1})` kills `(Fr − 1)T`.

Compose with the identifications of finite-singular-decomposition.

Isomorphism statement: reduce to `R` a field by Nakayama, where it is Rubin's Corollary A.2.7; then compare lengths of `T/(Fr − 1)T` and `T^{Fr=1}` (Mazur–Rubin 2004, Lemma 1.2.3).

Rubin's convention uses the Euler polynomial `P(Fr_q^{-1} | T^*; x) ≡ det(1 − Fr_q x | W_M)` modulo `M` (Lemma IV.1.2(iii)), so the two maps agree on `W_M = T/MT`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.fsQuotientPoly`: For any polynomial `P`, the `Q` with `(x − 1)·Q(x) = P(x) − P(1)`; for `P = det(1 − Fr·x | T)` with `det(1 − Fr | T) = 0` it is the quotient polynomial above.
- `TauCeti.KolyvaginSystems.fsQuotientPoly_spec`: `(X − C 1)·Q = P − C(P(1))`, which is `P` when `P(1) = 0`; `Q` is unique.
- `TauCeti.KolyvaginSystems.finiteSingular`: `φ^fs : H¹_f(K_v, T) → H¹_s(K_v, T) ⊗ 𝔽^×`, induced by `Q(Fr^{-1}) : T/(Fr − 1)T → T^{Fr=1}`.
- `TauCeti.KolyvaginSystems.finiteSingular_bijective`: If `R` is artinian, `|𝔽^×|R = 0` and `T/(Fr − 1)T` is free of rank one, `φ^fs` is bijective and `H¹_f, H¹_s` are free of rank one.
- `TauCeti.KolyvaginSystems.finiteSingular_map`: The comparison is natural under equivariant maps compatible with the chosen quotient polynomials: `f ∘ Q_T(Fr_T^{-1}) = Q_T′(Fr_T′^{-1}) ∘ f`. In particular, for reductions of one fixed finite free lattice under `R/I → R/J`, characteristic and quotient polynomials reduce together, so `φ^fs` commutes with the coefficient-reduction maps. Arbitrary equivariant maps between representations with different characteristic polynomials need not commute.
- `TauCeti.KolyvaginSystems.finiteSingular_generator`: For a generator `σ` of the tame quotient, `φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ` with `φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q` Rubin's map; `φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}`, so the tensor-valued map does not depend on `σ`.

**Checks.**

- `finiteSingular_cyclotomic`: `P=1−X` has quotient polynomial `Q=−1`.
- `finiteSingular_rank_two`: `P=(1−X)(1−aX)` has quotient polynomial `Q=−(1−aX)`.
- `finiteSingular_not_iso`: For `P=(1−X)², Q(1)=0`, so the rank-two fixed space does not have the rank-one isomorphism.
- `finiteSingular_not_natural_inclusion`: Over `𝔽₅, Q(1)` for the included fixed line is `−1` but for `diag(1,2)` it is `−(1−2)`, so arbitrary equivariant inclusions do not preserve the comparison.

`φ^fs` commutes with the quotient maps `T/I_nT → T/JT`: both identifications and `Q(Fr^{-1})` are functorial.

For `T = ℤ/p^k(1)` and `ℓ ≡` 1 `(mod p^k): P(x) = 1 − ℓx ≡ 1 − x, Q = −1`, and `φ^fs` is `−1` times the tautological identification of `T/(Fr − 1)T = T` with `T^{Fr=1} = T`.

Additional arithmetic check: For `R=ℤ/p²` and `T=R` with `Fr=1`, compare the finite–singular maps for `T` over `R` and `T/pT` over `R/p`: both quotient polynomials are `Q=−1`, and the maps on finite and singular terms commute with reduction.

*Needs:* Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; `LinearMap.aeval_self_charpoly`; `LinearMap.charpoly`.

For an arbitrary polynomial `P : R[X]` over a commutative ring, define `fsQuotientPoly P` to be `(P − C(P(1))) /ₘ (X − C 1)`. Monic division gives `fsQuotientPoly_spec`: `(X − C 1) fsQuotientPoly P = P − C(P(1))`. Uniqueness follows from injectivity of multiplication by the monic polynomial `X − C 1`. Under `P(1) = 0` this is precisely the finite–singular polynomial above (Rubin, Lemma IV.5.2, p.67). Its API also includes compatibility with coefficient-ring homomorphisms, since monic division commutes with coefficient change.

**Checks.**

- `fsQuotientPoly_C`: A constant polynomial has quotient zero.
- `P = 1 − X` has quotient `−1`, fixing the sign of the comparison.
- `P = X² − a` has quotient `X + 1`, since subtraction of `P(1) = 1 − a` removes the constant. This works over every commutative ring, nonreduced rings included.

### 1.9 The Selmer structures `F_a^b(c)`

For a Selmer structure `F` and pairwise coprime `a, b, c` with `c ∈ N(P)` (and `I_cT = 0` when needed for the transverse condition; in general one works on `T/I_cT`), `F_a^b(c)` has `Σ = Σ(F) ∪ {q : q | abc}` and local conditions: `H¹_F(K_q, T)` for `q ∈ Σ(F), q ∤ ab`; 0 for `q | a` (strict); `H¹(K_q, T)` for `q | b` (relaxed); `H¹_tr(K_q, T)` for `q | c` (transverse). One writes `F(n) = F^1_1(n), F^n, F_n`. Then `F_n ≤ F ≤ F^n` and `F_n ≤ F(n) ≤ F^n`. Under the hypothesis of Layer 1.10 at every prime `q | c` (`p` odd, or `p = 2` and `(|𝔽_q^×|/2)·T = 0`), the dual is `(F_a^b(c))^* = (F^*)_b^a(c)`; for `c = 1` this holds for every `p`.

The precise hypotheses are `a, b, c` pairwise coprime; `c ∈ N(P)`; `T` killed by `I_c` for the transverse places; for the dual formula with `c ≠ 1`, the hypothesis of Layer 1.10 at every `q | c`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Example 2.1.8, p. 15). The modified structures.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Example 2.3.2, p. 17). Their duals.

Built from SelmerIwasawaCohomology §2.1 (Compact and rational Selmer data) (withCond, strict, relax) and the transverse condition.

Duals: strict and relaxed are exchanged; finite is self-dual, and transverse is self-dual under its hypothesis (Layer 1.10 The transverse condition is self-dual).

If `R` is principal artinian of `length k, (H.2)` holds, `F` is cartesian and `n ∈ N_k`, then `F(n)` is cartesian (Mazur–Rubin 2004, Lemma 3.7.4).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.SelmerTriple.modify`: `F_a^b(c)`: strict at `a`, relaxed at `b`, transverse at `c`.
- `TauCeti.KolyvaginSystems.SelmerTriple.modify_le`: If `a′ | a, b | b′` and `c = c′` then `F_a^b(c) ≤ F_{a′}^{b′}(c′)`; in particular `F_n ≤ F ≤ F^n` and `F_n ≤ F(n) ≤ F^n`.
- `TauCeti.KolyvaginSystems.SelmerTriple.dual_modify`: `(F_a^b(c))^* = (F^*)_b^a(c)`, under the hypothesis of Layer 1.10 at every prime dividing `c`.
- `TauCeti.KolyvaginSystems.SelmerTriple.selmer_strict_eq_inf`: `H¹_{F_n}(K, T) = H¹_F(K, T) ⊓ H¹_{F(n)}(K, T)`.
- `TauCeti.KolyvaginSystems.SelmerTriple.modify_isCartesian`: Under `(H.2), R` principal artinian of `length k` and `n ∈ N_k, F` cartesian implies `F(n)` cartesian.
- `TauCeti.KolyvaginSystems.strict_sigma`: `Σ(F_n) = Σ(F) ∪ {q | n}` for the strict modification at `n`.
- `TauCeti.KolyvaginSystems.relaxed_sigma`: `Σ(F^n) = Σ(F) ∪ {q | n}` for the relaxed modification at `n`.
- `TauCeti.KolyvaginSystems.modify_sigma`: `Σ(F_a^b(c)) = Σ(F) ∪ {q | abc}` (Mazur–Rubin 2016 Definition 2.3), so the modified structure keeps `S_p ∪ S_∞`.

**Checks.**

- `modify_one`: Strict and relaxed modification at conductor one both give `F`.
- `modify_strict_one_prime`: Strict modification at `q` sets its local condition to zero.
- `modify_relaxed_one_prime`: Relaxed modification at `q` sets its local condition to the full local `H¹`.

`H¹_{F_n}(K, T) = H¹_F(K, T) ∩ H¹_{F(n)}(K, T)`.

For `p` odd, the dual of `F(n)` is `F^*(n)`: the transverse condition is not replaced by its naive complement.

Additional arithmetic check: `(F^n)^* = (F^*)_n` and `(F_n)^* = (F^*)^n`.

Additional arithmetic check: `F_n ≤ F(n) ≤ F^n`, and the quotient `H¹_{F^n}/H¹_{F_n}` injects into `⊕_{q | n} H¹(K_q, T)`.

Additional arithmetic check: For `q ∈ P_1` with `H¹_s(K_q, T) ≠ 0, F(q) ≠ F` and neither `F(q) ≤ F` nor `F ≤ F(q)`.

*Needs:* Layer 1.5 The transverse local condition; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; `SelmerIwasawaCohomology §2.1 (Compact and rational Selmer data)`; `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.3 (Change of local conditions)`.

### 1.10 The transverse condition is self-dual

Let `K_v` be nonarchimedean of residue characteristic `≠ p, T` unramified with `|𝔽^×|·T = 0`, and `L/K_v` totally ramified abelian of degree `|𝔽^×|`. Then `H¹_f(K_v, T)` and `H¹_f(K_v, T^*)` are exact orthogonal complements under the local Tate pairing `H¹(K_v, T) × H¹(K_v, T^*) → ℚ_p/ℤ_p`. If moreover `p` is odd, or `p = 2` and `(|𝔽^×|/2)·T = 0`, then `H¹_tr(K_v, T)` and `H¹_tr(K_v, T^*)` are exact orthogonal complements. No transverse self-duality is asserted at `p = 2` without the extra divisibility. For a totally tamely ramified cyclic `L′/K_v` with `[L′:K_v]·T = 0`, in particular `K(q)_q/K_q` when `q` splits completely in `K(1)` and `|G_q|·T = 0`, choose `L ⊇ L′` of degree `|𝔽^×|` (`exists_maximal_tame_ge` of Layer 1.5); the `L′`-transverse condition is the `L`-transverse condition (`transverse_eq_of_le`), so the transverse assertion applies to it under the same hypothesis.

The precise hypotheses are `v ∤ p`; `T` unramified and a compact coefficient module over a coefficient ring; `|𝔽^×|·T = 0`; for the transverse assertion, `p` odd or `(|𝔽^×|/2)·T = 0`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Proposition 1.3.2, p. 12). Self-duality of the finite and transverse conditions. The printed norm identity in the proof of (ii) omits a root-of-unity factor, which the computation below retains; it is trivial for odd `p`.

The finite parts are orthogonal complements under the finite Cartier pairing of ClassFieldTheory Layer 5 and its compact-lattice/discrete extension in SelmerIwasawaCohomology §2.17 (Local duality for the finite conditions on `T` and `W_M`). For finite self-injective `R`, Layer 0.2 transports that annihilator identity to the `R`-valued pairing; the `O`-lattice statement alone does not supply this coefficient comparison.

By the splitting it suffices that the transverse parts are orthogonal. Reduce to `T = ℤ/p^k` with `p^k | d = #𝔽^×: H¹_tr(T) = Hom(K_v^×/N L^×, ℤ/p^k)` and `H¹_tr(T^*) = ker(K_v^×/p^k → L^×/p^k)` by class field theory and Kummer theory. Let `α = β^{p^k}` with `β ∈ L`. A generator `s` of `Gal(L/K_v)` satisfies `s(β) = ξβ` with `ξ ∈ μ_{p^k}(K_v)`, so `N_{L/K_v}β = ξ^{d(d−1)/2}α^{d/p^k}`. If `p` is odd, or `p = 2` and `2^{k+1} | d`, then `p^k | d(d−1)/2`, hence `N_{L/K_v}β = α^{d/p^k}` and `α` is divisible by `p^k` in the cyclic group `K_v^×/N L^×` of order `d`. Without this divisibility, `p = 2` and `ξ` primitive give `ξ^{d(d−1)/2} = −1`, a unit that is not a norm, because the units that are norms from `L` are exactly `1 + 𝔪_v`.

General `T: H¹_tr(K_v, T) = H¹_tr(K_v, T^{G_{K_v}})` and `T^{G_{K_v}}` is a sum of cyclic modules `ℤ/p^{k_i}`; the hypothesis gives `p^{k_i} | d(d−1)/2` for each summand.

Local orthogonality for the strict, relaxed and transverse modifications: `(F_a^b(c))^* = (F^*)_b^a(c)` under the same hypothesis at every `q | c`.

**Checks.**

- `transverse_selfDual_odd`: For `p` odd and `T = ℤ/p^k`, the pairing of a transverse character with a transverse Kummer class is 0, since `ξ^{d(d−1)/2} = 1`.
- `transverse_selfDual_two_divisible`: For `K_v = ℚ₅`, `p = 2` and `T = 𝔽₂`, `d = 4` and `(d/2)·T = 0`; the transverse lines are again exact annihilators.
- `transverse_not_selfDual_two`: Excluded boundary case: `K_v = ℚ₃`, `R = T = 𝔽₂`, `L = ℚ₃(√−3)`, so `d = 2` and `(d/2)·T ≠ 0`. Both transverse lines are generated by the Kummer class of `−3`, and their pairing is the Hilbert symbol `(−3,−3)₃ = (−3,−1)₃ = −1`, because `−1` is not a norm from `L`. The transverse condition is not its own annihilator.

*Needs:* Layer 1.5 The transverse local condition; `SelmerIwasawaCohomology Layer 2`; `TauCetiRoadmap.ClassFieldTheory Layer 7`; `TauCetiRoadmap.ClassFieldTheory Layer 5`.

### 1.11 `γ`-associated places and `(S, γ)`-abundant tuples

Setting of Liu–Tian–Xiao–Zhang–Zhu §2.6: `F/F⁺` of degree `≤ 2, R` a polarised lattice with reductions `ρ̄^{(m)}` and their extensions `ρ̄₊^{(m)}` to `Γ_{F⁺}`, fields `F ⊆ F^{(m)} ⊆ F₊^{(m)}`, an element `γ` in the image of `ρ̄₊^{(m)}` lying in the nontrivial coset, `h_γ` the first component of `γ^{[F:F⁺]}`, and `S` a finitely generated submodule of the Selmer module in `H¹(F, R̄^{(m)})`. A place `w₊` of `F₊^{(m)}` is `γ`-associated if it is not above `∞` or `ℓ`, is unramified over `F⁺`, its place of `F^{(m)}` is unramified in `F_S`, and its Frobenius in `Gal(F₊^{(m)}/F⁺)` is `γ`. `G_{S,γ} ⊆ Gal(F_S/F^{(m)})` is the set of Frobenius elements `Ψ_w` of `γ`-associated places. Corrected Lemma 2.6.4: if the order of `γ` is prime to `ℓ` then `G_{S,γ} ⊆ θ_S^{-1} Hom_{O_λ}(S, (R̄^{(m)})^{h_γ})`, with equality when `[F : F⁺] = 1`; in general `G_{S,γ} = q(N^α)` for `N` the Galois group of the normal closure over `F₊^{(m)}, α` conjugation by a prime-to-`ℓ` lift of `γ` and `q` restriction to `F_S`. If `S` is free of rank `r_S` over `O_λ/λ^{m−m₀}`, an `r_S`-tuple `(Ψ₁, …, Ψ_{r_S}) ∈ G_{S,γ}^{r_S}` is `(S, γ)`-abundant if the image of `S → ((R̄^{(m)})^{h_γ})^{⊕ r_S}, s ↦ (θ_S(Ψ_i)(s))_i`, contains `λ^{m₀ + 𝔣(r_S) d_R}((R̄^{(m)})^{h_γ})^{⊕ r_S}`.

The precise hypotheses are the setting of §2.6 of the source; order of `γ` prime to `ℓ`.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 2.6.5, published p.134). Definition of abundant tuples.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Lemma 2.6.4, published p.134). The printed lemma, used here in its corrected form.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Lemma 2.6.4 and Definition 2.6.5, published pp.133–135). The published coefficient and depth conventions.

Frobenius elements of `γ`-associated places land in the `h_γ`-fixed part because `Ψ_w` is fixed by conjugation by the Frobenius of `w₊` raised to `[F : F⁺]`.

The exact image `q(N^α)` is computed by Chebotarev in the normal closure of `F_S F₊^{(m)}` over `F⁺`; the printed equality fails when `[F : F⁺] = 2` and `q(N^α)` is a proper subgroup.

The abundance loss uses the reducibility depth `d_R`, not the lattice rank. The published Lemma 2.3.4 gives the power `λ^{𝔣(r_S)d_R}`; Definition 2.6.5 adds `m₀`. This notation is also used in the diagonal-localisation bound.

The definition exposes the following operations and relations.

- `TauCeti.ErrorTolerant.gammaAssociated`: The four conditions for a place of `F₊^{(m)}` to be `γ`-associated.
- `TauCeti.ErrorTolerant.frobeniusSet`: `G_{S,γ} ⊆ Gal(F_S/F^{(m)})`.
- `TauCeti.ErrorTolerant.frobeniusSet_subset_fixed`: `θ_S(G_{S,γ}) ⊆ Hom_{O_λ}(S, (R̄^{(m)})^{h_γ})`, for `γ` of order prime to `ℓ`.
- `TauCeti.ErrorTolerant.frobeniusSet_eq_image`: `G_{S,γ} = q(N^α)`; equality with the full preimage holds iff `q : N^α → Gal(F_S/F^{(m)})^{h_γ}` is surjective, in particular when `[F : F⁺] = 1`.
- `TauCeti.ErrorTolerant.IsAbundant`: The predicate on `r_S`-tuples of `G_{S,γ}`.
- `TauCeti.ErrorTolerant.exists_isAbundant`: If `Res` is injective, `R_ℚ` is absolutely irreducible, `(R̄^{(m)})^{h_γ}` is free of rank one and `q : N^α → K^{h}` is surjective, an abundant `r_S`-tuple exists (corrected Proposition 2.6.6).

**Checks.**

- `frobeniusSet_proper`: `A` Selmer Galois element outside `q(N^α)` is not realized by `a γ`-associated prime.
- `frobeniusSet_fixed_evaluation`: Every realized Frobenius evaluation is fixed by `h_γ`.
- `isAbundant_zero_loss`: With `m₀=d=0`, abundance is surjectivity onto the fixed target, with every tuple entry realized by `a γ`-associated prime.
- `isAbundant_rank_one_values`: On a rank-one target `R=O/π^n`, write `b=m₀+𝔣(1)d_R<n`. A realized evaluation given by multiplication by `π^a` contains `π^bR` exactly when `a≤b`. Thus `a=b` passes, `a=b+1` fails, and the zero evaluation fails; if `b≥n` the containment alone is vacuous and does not certify realization by a prime.
- `isAbundant_empty`: For `S=0, r_S=0` and the target is zero, so the empty tuple is abundant. A nonempty tuple is not data of this required length.
- `gammaAssociated_exclusions`: `A` ramified place or a place above `ℓ` or infinity is excluded even if a formal Frobenius label is supplied. In the trivial unramified extension with `γ=1`, every place away from those exclusions and unramified in `F_S` satisfies the Frobenius field; a place whose actual Frobenius is not `γ` fails it.

For `[F : F⁺] = 1` the printed Lemma 2.6.4 holds as stated.

Abundance is a property of actual Frobenius elements, not of arbitrary elements of `Gal(F_S/F^{(m)})`.

Additional arithmetic check: If `F = F⁺` then `G_{S,γ} = θ_S^{-1} Hom(S, (R̄^{(m)})^{h_γ})` with `h_γ = γ`: the printed lemma.

Additional arithmetic check: For `r_S = 1, d_R = 0, m₀ = 0: Ψ` is abundant iff `θ_S(Ψ) : S → (R̄^{(m)})^{h_γ}` is surjective.

Additional arithmetic check: If `(Ψ_i)` is abundant for `S` free over `O_λ/λ^{m−m₀}`, then it is abundant for `λS` over `O_λ/λ^{m−m₀−1}` with `m₀` replaced by `m₀ + 1`.

*Needs:* Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`; Layer 1.3 Exponents, orders and reducibility depth; `TauCetiRoadmap.Chebotarev Layer 10`.

The saturation exponent in these formulas is `abundanceExponent : ℕ → ℕ`, defined by `𝔣(0) = 𝔣(1) = 1` and `𝔣(r + 2) = 2(𝔣(r + 1) + 1)`. Its API gives the two initial values, the recurrence, positivity and monotonicity. This is the exponent of Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.4, pp.126–128, not the number of classes or their rank.

**Checks.**

- The empty and one-class cases both have exponent one; assigning zero loss by setting `𝔣(0) = 0` changes the prescribed sequence.
- Two classes give `𝔣(2) = 4`.
- Three classes give `𝔣(3) = 10`; doubling the preceding term without the added two gives an incorrect value of eight.

### 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`

For a Selmer triple `(T, F, P)` over `K = ℚ: (H.0) T` is free of finite rank over `R`. `(H.1) T/mT` is an absolutely irreducible `k[G_ℚ]`-representation. `(H.2)` There is `τ ∈ G_ℚ` with `τ = 1` on `μ_{p^∞}` and `T/(τ − 1)T` free of rank one over `R`. `(H.3) H¹(ℚ(T, μ_{p^∞})/ℚ, T/mT) = H¹(ℚ(T, μ_{p^∞})/ℚ, T^*[m]) = 0`. `(H.4)` Either `(H.4a) Hom_{𝔽_p[[G_ℚ]]}(T/mT, T^*[m]) = 0`, or `(H.4b) p > 4`. `(H.5) P_t^{all} ⊆ P ⊆ P_1^{all}` for some `t ≥ 1`, with `P_k^{all}` Mazur–Rubin's unrestricted set `mr04Primes` of Layer 1.7 (their Definition 3.1.6 does not restrict to `P`, so `(H.5)` puts a whole level set inside `P`). `(H.6)` For every `ℓ ∈ Σ(F)` the local condition at `ℓ` is cartesian on `Quot_R(T)`. Each is a separate proposition; the record has one field for each.

The precise hypotheses are `K = ℚ`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §3.5, pp. 27–28). The list `(H.0)`–`(H.6)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §3.5, p. 27). The condition on the set of primes.

Each field uses the arithmetic and auxiliary-prime carriers of Layers 0–1: `ℚ(T, μ_{p^∞})` is the fixed field of the kernel of `G_ℚ → Aut(T) × Aut(μ_{p^∞})`, and `P_k` is Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`.

`(H.2)` holds with `τ = 1` when `rank T = 1`; `(H.6)` holds when `R` is a field; `(H.0)`–`(H.4)` pass to `T ⊗_R R′` for a surjection `R → R′` (Remark 3.5.1).

Under `(H.1)` and `(H.3), H⁰(ℚ,T/IT)=H⁰(ℚ,T*[I])=0` for coefficient ideals `I`. Prove this on finite coefficient quotients using their residual filtration and then pass to the compact limit where necessary. Lemma3.5.2 as printed wrongly extends this to arbitrary subquotients; use the corrected ideal-quotient scope recorded in the Gomez erratum.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.MR04Hypotheses`: The record with fields irreducible `(H.1), tau` (`H`.2: an element `τ` with its two properties), h1Vanishing `(H.3)`, homVanishingOrLarge `(H.4)`, primes `(H.5)`, cartesian `(H.6)`.
- `TauCeti.KolyvaginSystems.MR04Hypotheses.invariants_eq_bot`: For coefficient ideals `I, (H.1)` and `(H.3)` imply `H⁰(ℚ,T/IT)=H⁰(ℚ,T*[I])=0`. No claim is made about an arbitrary Galois subquotient.
- `TauCeti.KolyvaginSystems.MR04Hypotheses.dual`: If `T` satisfies `(H.0)`–`(H.5)` then so does `T^*` (for `R` principal artinian).
- `TauCeti.KolyvaginSystems.MR04Hypotheses.quotient`: `(H.0)`–`(H.4)` pass to `T ⊗_R R′` for surjective `R → R′`; `(H.6)` passes to `T/m^jT` for `R` principal artinian.
- `TauCeti.KolyvaginSystems.MR04Hypotheses.of_rank_one`: If `rank_R T = 1` then `(H.1)` holds and `(H.2)` holds with `τ = 1`.

**Checks.**

- `MR04Hypotheses.residual_invariants_zero`: MR04 admissibility forces `H⁰(K,T/mT)=0`.
- `MR04Hypotheses.rank_one_coinvariants`: For a rank-one coefficient module, `τ=1` has rank-one coinvariants.
- `MR04Hypotheses.not_dual_invariants`: `A` representation with nonzero residual Cartier-dual `H⁰` cannot satisfy MR04 hypotheses.
- `MR04Hypotheses.primes_empty_rejected`: `P = ∅` fails `(H.5)` whenever some `P_t^{all}` is nonempty; for `T = ℤ_p(1) ⊗ ρ^{-1}` below, `P_t^{all}` contains every `ℓ ∉ Σ(F)` with `ℓ ≡ 1 (mod p^t)` and `ρ(ℓ) = 1`. Read with the restricted sets `P_k = P ∩ P_k^{all}`, the inclusion `P_t ⊆ P` would hold for every `P`.

The record is satisfied by `T = ℤ_p(1) ⊗ ρ^{-1}, ρ ≠ 1, ω` of order prime to `p`, with `(H.4a)`; and by `T = T_pE` with surjective mod-`p` representation and `p ≥ 5`, with `(H.4b)`.

It is not satisfied by `T = ℤ_p(1): (H.3)` fails.

Additional arithmetic check: For `p` odd, `ρ : G_ℚ → ℤ_p^×` of finite order prime to `p` with `ρ ≠ 1` and `ρ ≠ ω, T = ℤ_p(1) ⊗ ρ^{-1}` satisfies `(H.0), (H.1), (H.2)` with `τ = 1, (H.3)` and `(H.4a)`.

Additional arithmetic check: For `E/ℚ` with `G_ℚ → Aut(E[p])` surjective and `p ≥ 5, T = T_pE` satisfies `(H.0)`–`(H.3)` and `(H.4b)`.

Additional arithmetic check: `T = ℤ_p(1) (ρ = 1)` does not satisfy `(H.3): T^*[m] = Hom(μ_p, μ_p)` is the trivial module `𝔽_p`, so `(T^*[m])^{G_ℚ} ≠ 0`, contradicting the consequence `S^{G_ℚ} = 0` of `(H.3)`. Likewise `ρ = ω` fails because `T/mT` is trivial.

Additional arithmetic check: If `R` is a field, `(H.6)` holds for every Selmer structure.

The arbitrary-subquotient version is excluded by the counterexample in arbitrary-subquotient counterexample. The API here is restricted to coefficient ideal quotients and Cartier-dual ideal torsion.

*Needs:* Layer 0.1 Selmer triples and squarefree conductors; Layer 0.4 Cartesian local conditions; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`.

### 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field

For Selmer data `(T, F, P, r)` over a number field `K`, let `M` be the smallest power of `p` with `MR = 0` if `R` is artinian and `M = p^∞` if `R` is a discrete valuation ring, `H` the Hilbert class field of `K` and `H_M = H(μ_M, (O_K^×)^{1/M})`. `(H.1) T̄^{G_K} = (T̄^*)^{G_K} = 0` and `T̄` is an absolutely irreducible `k[[G_K]]`-module. `(H.2)` There are `τ ∈ Gal(K̄/H_M)` and a finite Galois extension `L` of `K` in `K̄` such that `T/(τ − 1)T` is free of rank one over `R` and `P(L, τ) ⊆ P`, where `P(L, τ)` is the set of primes `q ∉ Σ(F)` unramified in `L` with `Fr_q` conjugate to `τ` in `Gal(L/K)`. Put `E=L·H_M(T)`. **`(H.3)`** `H¹(E/K,T/mT)=H¹(E/K,T^*[m])=0`, with continuous cohomology when `E/K` is infinite. `(H.4)` Either `T̄ ≇ T̄^*` as `k[[G_K]]`-modules, or `p > 3`. `(H.5) F` is cartesian. `(H.6) r = χ(T) > 0`. For `R` artinian only: `(H.7) I_q = 0` for every `q ∈ P`. When `L⊆H_M(T), (H.3)` is exactly the original residual vanishing.

The precise hypotheses are `K` a number field; `R` principal artinian or a discrete valuation ring.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), §4, hypotheses `(H.1)`–`(H.7)`, p. 9). The running hypotheses, with the Frobenius-field repair specified below.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Lemma 4.5, p. 9). The local argument for `(H.7)`, requiring the representation-field repair below.

The fields are stated with Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n (I_q)` and Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M} (P(L, τ))`.

**Field correction.** The printed `(H.2)` puts `L` inside `H_M`, both in arXiv v1 §4 p.9 and in the [published paper](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.933.pdf), §4 p.154. Lemma 4.5 (published p.155) uses `P(H_M,τ)` to infer the action on `T`. Take `K=ℚ, R=𝔽₅, T` the character of `ℚ(√2)/ℚ, τ=1` and `q=11`. Then `H_M=ℚ(μ₅)` and `q` splits there, but `Fr₁₁=−1` on `T`. Its coinvariants vanish and `I₁₁=R`. For `rank(T)>1` the printed containment would also force primes splitting in `H_M(T)` into `P`, violating `(H.7)`. The repair changes both the allowed `L` and, when necessary, the field in `(H.3)`. Allowing arbitrary `L` with the old vanishing alone is insufficient: `L` could contain a field cut out by a residual Selmer class and make its restriction zero at every allowed prime.

**Local and coefficient-level targets.** For `R` artinian, `q∈P(E,τ)` has `I_q=0`. Indeed its Frobenius fixes `H_M`, so `q` is principal, its residue field contains `μ_M`, and the image of `O_K^×` consists of Mth powers. The residue-unit description of the ray field gives `M∣[K(q)_q:K_q]`. Frobenius on `T` is conjugate to `τ` because `E` contains `K(T)`; hence the other defining rank-one condition for `I_q` holds. This proves the corrected Lemma 4.5. The field `E` is finite in this case, `P(E,τ)⊆P(L,τ)`, and replacing `L` by `E` leaves `E=L·H_M(T)` unchanged. This is the valid replacement for the artinian clause of Remark 4.3.

Here is a concrete control for the enlarged `(H.3)`, strengthening the field-cut-out warning above. Take `p=5, K=ℚ, ρ` the even quadratic character of `ℚ(√2)`, and `T=(ℤ₅(1)⊗ρ)/5` with the propagated `F_ur`. The anti-invariant fundamental unit `1+√`2 gives a nonzero Kummer class `c` in `H¹_F_ur(ℚ,T)`; it is not a fifth power in the unit group. MR16 §5.2, Proposition5.7 and Corollary5.8 pp.12–13 identify this Selmer condition and give core rank one. The original field `H_M(T)=ℚ(μ₅,√2)` has degree 8, so its residual `H¹` groups vanish by averaging. Let `L` be the finite Galois extension cut out by `c` over this field, take `τ=1` and `P=P(L,1)`. The old `(H.3)`, residual invariants, rank-one coinvariants, cartesianness and `(H.7)` all hold, but every allowed prime splits in `L` and has `loc_q(c)=0`. The repaired `(H.3)` fails: `c` inflates from a nonzero class over `L/K`. A bare character `T=𝔽₅(ρ)` would not be the multiplicative-group example of §5.2; its cyclotomic twist is essential here. The interface `MR16Hypotheses.arbitrary_field_rejected` records this counterexample to the old vanishing with arbitrary `L`, not a rejection of arbitrary `L` under the repaired vanishing. `TauCeti.KolyvaginSystems.MR16Hypotheses.restrictFrobenius` is the preceding valid artinian refinement with `E`.

For a DVR put `T_k=T/m^kT`, let `M_k` be the least `p`-power annihilating `R/m^k`, and put `E_k=L·H_{M_k}(T_k)`. These fields are finite, nested and contained in `E_∞=L·H_{p^∞}(T)`. Set `Q_k=P(E_k,τ)`. Then `Q_{k+1}⊆Q_k⊆P` and `I_q(T_k)=0` for `q∈Q_k`. Inflation injects `H¹(E_k/K,T̄)` into `H¹(E_∞/K,T̄)`, and similarly for `T̄^*`, so `(H.3)` descends to every level. Free rank-one `τ`-coinvariants survive reduction; cartesianness propagates `F`; core rank is unchanged by Layer 0.9. For an artinian coefficient quotient use the corresponding subfield of `E` and the same inflation argument. The `(H.1)`–`(H.6)` quotient record keeps `P`; its `(H.7)` refinement uses `Q_k`. It does not assert `I_q=0` on all of the original `P`.

**Global prime-selection target.** In every application of the MR16 Chebotarev argument, replace `H_M(T)` by `E` (or `E_k` at a finite level). Restriction of a nonzero residual class to `G_E` is injective by `(H.3)`, and `G_E` acts trivially on its coefficients. Thus it is a nonzero equivariant homomorphism on `G_E`. Absolute irreducibility and the rank-one `τ`-coinvariants make its projection to those coinvariants nonzero. The bad choices `γ` with `loc_q(c)=0` for `Fr_q=τγ` form proper affine subspaces. For `p>3`, four such sets of index at least `p` have total measure at most `4/p<1`.

For the other `(H.4)` branch, `k`-nonisomorphism must not silently be replaced by `𝔽_p`-nonisomorphism. Here is the additional small-`p` argument. The image of `𝔽_p[G_K]` on an absolutely irreducible `k`-representation is a matrix algebra over a finite subfield `k₀⊆k`: its radical becomes a nilpotent ideal after scalar extension to `End_k(T̄)`, hence is zero; the finite-field simple-algebra decomposition and absolute irreducibility give this matrix form. Consequently `T̄` restricted to `𝔽_p` is a sum of copies of one simple module `U`. The same holds for the dual, with a simple module `U′`. In the direct sum of the at most two `T̄`-classes and two dual classes being detected, let `H` be their combined restriction image on `G_E`. It is a semisimple `G_K`-submodule. Its quotient is a sum of copies of `U` and `U′`, so its `H¹(E/K,−)` vanishes by `(H.3)` and the direct-summand decomposition. Subtract a coboundary from the combined cocycle to make its value at `τ` lie in `H`. Translate `γ` once to cancel that value. All bad sets are then proper linear subspaces of `H`, rather than unrelated affine cosets.

If `U≇U′`, the two isotypic summands of `H` are independent. Each has at most two bad subspaces; two proper linear subspaces never cover a vector space over any field. If `U≅U′` but `T̄≇T̄^*` over `k`, their two `k`-structures differ by a nontrivial automorphism of `k₀`. In particular `#k₀≥p²≥4`. All four kernels are `k₀`-linear (a field automorphism in the dual identification does not change linearity of its kernel). Four proper linear subspaces cannot cover a vector space over a field of at least four elements: in dimension `n` their union has at most `1+4((#k₀)^{n−1}−1)<(#k₀)^n` elements. Thus the small-`p` branch also supplies a simultaneous good choice. This retains the printed `k`-nonisomorphism hypothesis without imposing a stronger `𝔽_p`-disjointness hypothesis.

For DVR coefficients first fix `k` and replace `E` by the finite field `E_k`; for artinian coefficients `E` is already finite. Apply Chebotarev in the finite extension of that field cut out by the finitely many residual classes. The chosen `τγ` still restricts to `τ` on `L` and on `H_{M_k}(T_k)` at that level (on `H_M(T)` in the artinian case); hence `q` is allowed, has the correct local rank and detects the required classes. Finite sets of previously used or ramified primes may be excluded. Higher-length classes are treated by their first nonzero socle reductions and the coefficient-injectivity theorem, not by assuming residual detection proves an arbitrary prescribed localization kernel.

This is the field replacement in MR16 Remark 4.4 p.9 and the proof of Lemma 6.9(ii) p.15; the finite-coset argument is Mazur–Rubin 2004 §3.6, Proposition 3.6.1 pp.30–31, transported to the common splitting field. Any use of its prescribed-kernel Proposition 3.6.2 retains that proposition's additional scalar-span and dual-independence hypotheses.

The audit of global consumers is as follows; the pages refer to arXiv:1312.4052v1.

| Consumer | Prime choice or transition and why the correction suffices |
| --- | --- |
| Lemma 6.9(ii), Theorem 6.10, p.15 | Detect a residual strict-dual class and kill it by one transverse modification. Use the preceding prime-selection target over `E_k`. The remaining exterior-dual computation is unchanged. |
| Lemma 7.2, Proposition 7.3, Theorem 7.4, pp.15–16 | Choose a common core conductor for two coefficient levels in `Q_max(k,l)`; the nested `Q_k` and residual vanishing give the same cofinal core vertices. Free core stalks give the surjective transitions and the Mittag–Leffler limit. No infinite Frobenius field is passed directly to Chebotarev. |
| Lemma 8.3, pp.17–18; Proposition 8.5 and Theorems 8.6–8.9, pp.18–19 | Simultaneous detection of the two classes is the only additional field-dependent step in the connectivity argument. Remove the finitely many conductor primes; the stub and regulator arguments then use the unchanged cartesian local algebra. |
| Proposition 12.3, Theorem 12.4, p.24 | Their core-vertex existence is Lemma 6.9; determinant transition maps and limits introduce no new prime condition. |
| Proposition 14.3, Theorem 14.4, pp.27–29 | Choose primes detecting a `T`-class and a dual class to decrease the dual length, and two `T`-classes in the common-core induction. Use the same finite-level simultaneous detection. Strict/relaxed/transverse modifications change only finitely many conditions, preserve `(H.1)`–`(H.3)`, and leave infinitely many primes outside the enlarged support. |

**MR04 bridge.** Over `ℚ, H_{p^∞}=ℚ(μ_{p^∞})`. MR04 `(H.5)` says `P ⊇ P_t^{all}` for a fixed finite `t`; Lemma 3.5.6 pp.29–30 supplies the Frobenius set at the field `ℚ(T/m^tT,μ_{p^a})` with `p^a` annihilating `R/m^t`. Choose this field as `L`. It lies in `H_{p^∞}(T)`, so `E` is the original MR04 splitting field and `(H.3)` needs no enlargement. MR04 `(H.3)`, Lemma 3.5.2 p.28 and `(H.1)` give `(H.1)` here; its `(H.4a)`, or `p>4`, implies `(H.4)` here. Its cartesian `(H.6)` is `(H.5)` here, and `χ(T)=r>0` is separately required. For a finite coefficient ring start with the same construction inside `H_M(T)`. The bridge requires MR04 `(H.5)`; an unrelated arbitrary-`L` containment is not a replacement for it.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.MR16Hypotheses`: The record with fields invariantsAndIrreducible `(H.1), tau (H.2: τ, L and P(L,τ)⊆P)`, h1Vanishing over `E=L·H_M(T) (H.3)`, notSelfDualOrLarge `(H.4)`, cartesian `(H.5)`, coreRank `(H.6)`.
- `TauCeti.KolyvaginSystems.MR16Hypotheses.IsArtinianAdmissible`: `(H.7): I_q = 0` for all `q ∈ P`, for `R` artinian.
- `TauCeti.KolyvaginSystems.MR16Hypotheses.quotient`: The `(H.1)`–`(H.6)` record descends to `T/m^kT`; `frobeniusRefinement` gives `Q_k` and `(H.7)`, with the inclusions `Q_{k+1}⊆Q_k` and the inflation squares.
- `TauCeti.KolyvaginSystems.MR16Hypotheses.artinianAdmissible_of_frobenius`: If `R` is artinian and `q ∈ P(H_M(T), τ)`, with `τ` fixing `H_M` and rank-one coinvariants on `T`, then `I_q = 0`. Refining further by `L` gives `(H.7)` inside the prime set from corrected `(H.2)`.
- `TauCeti.KolyvaginSystems.MR16Hypotheses.detect`: The finite-level residual simultaneous-localization target just proved, with finite exclusions and both coefficient duals.
- `TauCeti.KolyvaginSystems.MR16Hypotheses.of_mr04`: For `K=ℚ` and `p` odd, MR04 `(H.0)`–`(H.6)` and positive core rank give the corrected record by the finite-field construction above; the chosen `L` lies in `H_M(T)`.

**Checks.**

- `MR16Hypotheses.positive_rank`: MR16 admissibility excludes core rank zero.
- `MR16Hypotheses.infinite_primes`: The required Frobenius containment forces the selected prime set to be infinite.
- `MR16Hypotheses.not_empty_primes`: The empty selected prime set admits no MR16 hypothesis data.
- `MR16Hypotheses.representation_field_required`: For the `𝔽₅`-character of `ℚ(√2), q=11` splits in `H_M` but has zero coinvariants; replacing `H_M(T)` by `H_M` would falsely force `I₁₁=0`.
- `MR16Hypotheses.refine_frobenius_set`: The field `L·H_M(T)` fixes both containment in the allowed prime set and the rank-one coinvariants; `H_M` alone fixes neither representation action nor that rank.
- `MR16Hypotheses.enlarged_h1_required`: If a residual class cuts out a field contained in `L`, it vanishes on `G_E`. Such data fail the new `(H.3)`; the old `H_M(T)`-vanishing alone would not detect the defect.
- `MR16Hypotheses.quotient_tower`: At levels `k=1`,2 the fields `E₁⊆E₂` give `Q₂⊆Q₁`; the source of residual inflation is the smaller field and its target the larger one. Reversing that arrow would not prove quotient admissibility.
- `MR16Hypotheses.small_characteristic`: Over `k=𝔽₄`, a rank-one character of order 3 and its inverse are `k`-nonisomorphic but `𝔽₂`-isomorphic. This falls in the common-`U` case, with `#k₀=4`; four lines through zero in `k₀²` cover at most 13 of its 16 vectors. Treating `k`-nonisomorphism as `𝔽₂`-disjointness would fail this example. Over `𝔽₃` a self-dual residual representation still fails `(H.4)`.

**Application verifications.** For MR16 §5.2 pp.11–12, `T=ℤ_p(1)ρ^{-1}` with finite prime-to-`p ρ, ρ≠1,ω` and `ρ²≠ω` or `p>3`, choose `τ=1` and `L=K` (or the field cut out by `ρ`). That field lies in `H_{p^∞}(T)`, because cyclotomic action and the `T`-action recover `ρ`. For completeness put `E₀=H(μ_{p^∞})K(ρ)`. Its Galois group over `K` is abelian. The kernel of `E/E₀` is the Kummer group of units of `K`, a quotient of a finite sum of `ℤ_p(1)`, with conjugation through `ω` after residual reduction. For either residual coefficient character `θ=ωρ^{-1}` or `θ=ρ, θ` is nontrivial and `θ≠ω` by the exclusions on `ρ`. A central element with `θ`-value different from 1 kills `H¹(E₀/K,k(θ))`; the Kummer kernel has no equivariant map to `k(θ)` because its character is `ω`. Inflation–restriction proves `H¹(E/K,k(θ))=0`. Thus the corrected `(H.3)` is verified directly. The unramified cartesian structure and the positive archimedean core-rank condition remain those of the source; they are not consequences of `rank(T)=1` alone. Extend scalars to `ℤ_p[ρ]` for the general prime-to-`p` character.

For MR16 §5.3 pp.12–13, let `T=T_pA` and `p>3`, with a symplectic basis for which the residual image contains `GSp_{2d}(𝔽_p)`. The closed commutator image lies in `Sp_{2d}(ℤ_p)`, surjects onto `Sp_{2d}(𝔽_p)`, and hence equals `Sp_{2d}(ℤ_p)`. For `d≥2` this is [Landesman–Swaminathan–Tao–Xu](https://arxiv.org/abs/1607.04698v2), Theorem 1 p.1 and the commutator calculation §2.2 pp.3–4; for `d=1` the `p≥5` lifting argument is recalled in its introduction p.1. The extension `H_{p^∞}/K` is solvable (abelian Hilbert class field and cyclotomic/Kummer extensions); the perfect symplectic subgroup therefore lies in the image of `G_{H_{p^∞}}`. Choose there an integral regular unipotent: the product of the simple-root unipotents has unit successive off-diagonal pivots, so its difference from 1 has Smith factors 1,…,1,0. Its coinvariants are `ℤ_p`, giving `τ` and `(H.2)`. Take `L=K`, since `P` is all good primes away from `p`. For `(H.3)`, the normal symplectic subgroup acts without invariants on both residual duals; its central `−1` acts by `−1`, so the usual central-element cocycle identity makes `H¹` zero (2 is invertible). Inflation–restriction gives the two required vanishings over `H_{p^∞}(T)`. The same argument works modulo every `p^k`. The cartesian structure and `r=d[K:ℚ]` are MR16 Remark 3.2 and Proposition 5.9 p.13. No field outside `H_{p^∞}(T)` was added in either application.

`(H.6)` excludes core rank zero: it is a hypothesis on `(T, F)`, not a consequence of the others.

Additional arithmetic check: for `d=1` the unipotent `[[1,1],[0,1]]` has free rank-one coinvariants. For `d>1` a single symplectic transvection has coinvariant rank `2d−1` and does not supply `(H.2)`; the regular unipotent is essential.

Additional arithmetic check: `T = E[p^k]` with the classical Selmer structure has `χ = 0`, so `(H.6)` fails for every `r ≥ 1` although `(H.1)`–`(H.5)` can hold.

Additional arithmetic check: For `K = ℚ` and `p` odd, `H_M = ℚ(μ_M)`, so `(H.2)` asks for `τ` trivial on `μ_M`, as in 2004 `(H.2)`.

Additional arithmetic check: For `p = 3` and `T̄ ≅ T̄^*` (for example `T̄ = E[3]`) hypothesis `(H.4)` fails; `p = 3` is allowed only when `T̄` is not self-dual.

*Needs:* Layer 0.1 Selmer triples and squarefree conductors; Layer 0.8 The core rank of a cartesian Selmer structure; Layer 0.4 Cartesian local conditions; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`.

### 1.14 Anticyclotomic twists of a Tate module and their error constants

Let `E/ℚ` be an elliptic curve of conductor `N, p ∤ 2N` a prime of good ordinary reduction, `K` an imaginary quadratic field with discriminant prime to `Np` and `E(K)[p] = 0, Γ` the Galois group of the anticyclotomic `ℤ_p`-extension `K_∞/K` with topological generator `γ, R` the ring of integers of a finite extension `Φ/ℚ_p` with uniformiser `π` and `r = rank_{ℤ_p} R`, and `α : Γ → R^×` a continuous character. The twist is `T_α = T_pE ⊗_{ℤ_p} R(α)` with `G_K` acting through `ρ_E ⊗ α, V_α = T_α ⊗ Φ` and `A_α = V_α/T_α`; since `α ≡` 1 modulo the maximal ideal, `T_α/πT_α ≅ E[p] ⊗ R/(π)`, so `(T_α/πT_α)^{G_K} = 0`. The ordinary Selmer structure `F_ord` on `V_α` has `Σ = {w | pN} ∪ S_∞`, the relaxed condition at the complex place (where `H¹` vanishes), the image of `H¹(K_w, Fil⁺_w V_α)` at `w | p` (`Fil⁺_w` the kernel of reduction on `T_pE`, tensored with `R(α)`) and the unramified classes at `w | N`; it is propagated to `T_α` and `A_α`. The error constants are: `C_α = v_p(α(γ) − α^{-1}(γ))` if `α ≠ α^{-1}` and `C_α = 0` if `α = α^{-1}`; `C₁ = min{v_p(u − 1) : u ∈ U} ∈ ℕ ∪ {∞}` for the closed subgroup `U = ℤ_p^× ∩ ρ_E(G_{K_∞})` of `ℤ_p^×`; and `C₂ ∈ ℕ ∪ {∞}` the least `m ≥ 0` with `p^m End_{ℤ_p}(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ])` (`∞` if there is none). Two image conditions make them finite: `C₁ < ∞` iff (Sc) `U ≠ {1}`, and `C₂ < ∞` iff (Irr) `V_pE` is absolutely irreducible. `U` lies in the image of `ρ_α` for every `α`; under (Irr), `p^{C₂}` annihilates `End_R(T_α)/ρ_α(R[G_{K_∞}])`; `C₁ = 0` when `ρ_E` is surjective and `C₂ = 0` when `E[p]` is irreducible, so these cases satisfy (Sc) and (Irr). Every target below whose bound involves `C₁` or `C₂` assumes (Sc) and (Irr). The combined constants are `e_α = r(C₁ + C₂ + C_α)` (Castella–Grossi–Lee–Skinner) and `e = r(C₁ + C₂)` (Castella–Grossi–Skinner, for `α ≡` 1 modulo `π^m`). The Kolyvagin primes are `𝓛_E = {ℓ ∤ N inert in K : a_ℓ ≡ ℓ + 1 ≡ 0 mod p}` and `𝓛^{(k)} = {ℓ ∈ 𝓛_E : I_ℓ ⊆ p^kℤ_p}`.

The precise hypotheses are `E/ℚ, p ∤ 2N` good ordinary, `K` imaginary quadratic with `(D_K, Np) = 1` and `E(K)[p] = 0`; `α : Γ → R^×` continuous, residually trivial. The finiteness conditions (Sc) and (Irr) are not part of the datum.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.2, (3.2)–(3.3) and Theorem 3.2.1, p. 17 (arXiv v2)). defines the twist `T_α`, its residual identification with `E[p] ⊗ R/m`, the ordinary Selmer structure and the constant `C_α`

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.3.1, Lemmas 3.3.3–3.3.4 and Remark 3.3.5, pp. 18–19 (arXiv v2)). defines `C₁` through the open scalar subgroup `U` and `C₂` through the span of the image, and records their vanishing under surjectivity and irreducibility

([Francesc Castella, Giada Grossi, Christopher Skinner, Mazur's main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), §6.1 and §6.3, before Proposition 6.3.1, pp. 21–22 (arXiv v2)). for `α ≡` 1 modulo `π^m` uses the combined loss `e = r(C₁ + C₂)`, without `C_α`

([Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), §3, Lemma 3.0.3 and the definition of `C₁` after it, p. 36 (arXiv v2)). extends the definition of `C₁` to the lattice of a weight `2r` newform through scalar matrices in the image

Finiteness of `C₁`: `C₁ < ∞` iff some `u ∈ U` differs from 1, which is (Sc). Moreover `ρ_E(G_{K_∞}) = ρ_E(G_ℚ)`: for odd `p` the only subfields of `K_∞` Galois over `ℚ` are `ℚ` and fields containing `K`, and `K ⊄ ℚ(E[p^∞])` (`K` is ramified at a prime not dividing `Np` while `ℚ(E[p^∞])` is unramified outside `Np`). So (Sc) is a condition on `ρ_E(G_ℚ)`. The source takes openness of `U` in `ℤ_p^×` from Bogomolov's theorem (Nekovář, Proposition 6.1.1`(i)`); no roadmap earlier in the dependency order supplies that theorem or Serre's open image theorem, so (Sc) is a hypothesis.

Finiteness of `C₂`: under (Irr) the `ℚ_p`-span of `ρ_E(G_ℚ)` is `End(V_pE)` (Burnside), so `End(T_pE)/ρ_E(ℤ_p[G_ℚ])` is a torsion `ℤ_p`-module of finite type; conversely a finite `C₂` makes that span all of `End(V_pE)`, which forces absolute irreducibility. Since `α` is trivial on `G_{K_∞}` and `ρ_E(G_{K_∞}) = ρ_E(G_ℚ)`, `End_R(T_α)/ρ_α(R[G_{K_∞}]) = (End(T_pE)/ρ_E(ℤ_p[G_ℚ])) ⊗ R` is then killed by `p^{C₂}`. Irreducibility of `V_pE` for every `E/ℚ` is a theorem of Serre that no earlier roadmap supplies, so (Irr) is a hypothesis.

Surjective `ρ_E` gives `C₁ = 0` (take `u` with `v_p(u − 1) = 0`) and irreducible `E[p]` gives `C₂ = 0` (complex conjugation has the distinct eigenvalues `±1` on `E[p]` for odd `p`, so `E[p]` is absolutely irreducible, and the image of `ℤ_p[G_ℚ]` is all of End by Burnside and Nakayama).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.TwistData`: The datum `(E, p, K, R, α)` with the stated hypotheses, and the twisted module `T_α` with `G_K` acting by `ρ_E ⊗ α`.
- `TauCeti.KolyvaginSystems.TwistData.ordinaryStructure`: The ordinary Selmer structure `F_ord` on `V_α, T_α` and `A_α`, with `Σ = {w | pN} ∪ S_∞` and the relaxed condition at the complex place.
- `TauCeti.KolyvaginSystems.charError`: `C_α = v_p(α(γ) − α^{-1}(γ))` if `α ≠ α^{-1}`, and 0 otherwise; independent of the topological generator `γ`.
- `TauCeti.KolyvaginSystems.scalarError`: `C₁ = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ ρ_E(G_{K_∞})} ∈ ℕ∞`.
- `TauCeti.KolyvaginSystems.spanError`: `C₂ = min{m : p^m End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ])} ∈ ℕ∞`.
- `TauCeti.KolyvaginSystems.scalarError_lt_top_iff`: `C₁ < ∞` iff `ℤ_p^× ∩ ρ_E(G_{K_∞}) ≠ {1}` (Sc).
- `TauCeti.KolyvaginSystems.spanError_lt_top_iff`: `C₂ < ∞` iff `V_pE` is absolutely irreducible (Irr).
- `TauCeti.KolyvaginSystems.scalarError_eq_zero_of_surjective`: If `ρ_E` is surjective then `C₁ = 0`.
- `TauCeti.KolyvaginSystems.spanError_eq_zero_of_irreducible`: If `E[p]` is irreducible then `C₂ = 0`.
- `TauCeti.KolyvaginSystems.pow_spanError_mul_end_le`: Under (Irr), `p^{C₂}·End_R(T_α) ⊆ ρ_α(R[G_{K_∞}])` for every `α`.

**Checks.**

- `charError_trivial`: For `α = 1, C_α = 0`.
- `charError_no_quadratic_twist`: For odd `p`, continuity of `α:ℤ_p→R^×` gives `u=α(γ)≡1 (mod m_R)`. Hence `u+1` is a unit, `C_α=0` iff `α=1`, and otherwise `v_p(u−u⁻¹)=v_p(u−1)>0`. For `R=ℤ_p`, this strengthens to `u≡1 (mod p)` and `C_α≥1`. No nontrivial quadratic character occurs.
- `ramified_character_error`: For `R=ℤ_p[ζ_p]` and `α(γ)=ζ_p`, the continuous order-`p` character has `v_p(ζ_p−1)=v_p(ζ_p−ζ_p⁻¹)=1/(p−1)`, so it is not congruent to 1 modulo `pR`.
- `charError_close_to_one`: If `α(γ) = 1 + p^m u` with `u` a unit and `p` odd and `m ≥ 1`, then `α(γ) − α^{-1}(γ) = 2p^m u + O(p^{2m})`, so `C_α = m`: the error grows as `α` approaches 1, which is why the near-trivial bound of Layer 4 uses `e = r(C₁ + C₂)` instead.
- `scalarError_surjective`: For `ρ_E(G_ℚ) = GL₂(ℤ_p), U = ℤ_p^×` and `C₁ = 0`.
- `spanError_reducible`: If `E[p]` is reducible (an Eisenstein prime) then `ρ_E(ℤ_p[G_ℚ])` is a proper suborder of `M₂(ℤ_p)` and `C₂ ≥ 1`.
- `spanError_eq_top_of_split`: For the split lattice `ℤ_p(1) ⊕ ℤ_p` in place of `T_pE` (an algebraic test: by Serre's theorem no `E/ℚ` has a reducible `V_pE`), the image of `ℤ_p[G_ℚ]` lies in the diagonal matrices and `C₂ = ∞`. Finiteness of `C₂` is exactly (Irr).

For `ρ_E` surjective and `α` of finite order with `α² ≠ 1` (a character of the pro-`p` group `Γ` has `p`-power order), `e_α = r·v_p(α(γ) − α^{-1}(γ))` and `e = 0`.

For `α = 1` (the untwisted Tate module) `C_α = 0` and `e_α = r(C₁ + C₂)`.

The constants depend on `E` only through `ρ_E`, so curves whose integral Tate-module representations are conjugate over `GL₂(ℤ_p)` have equal `C₁, C₂`.

*Needs:* Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 0.1 Selmer triples and squarefree conductors; `SelmerIwasawaCohomology §2.8 (Greenberg’s local condition)`.

### 1.15 Existence of abundant tuples under the corrected span hypothesis

Setting of Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples: `F/F⁺` of degree at most two, `R` a polarised `O_λ`-lattice with reductions `R̄^{(m)}`, fields `F^{(m)} ⊆ F₊^{(m)}, γ` in the image of `ρ̄₊^{(m)}` in the nontrivial coset with `h_γ` the first component of `γ^{[F:F⁺]}`, and a finitely generated submodule `S ⊆ H¹_f(F, R̄^{(m)})` that is free of rank `r_S` over `O_λ/λ^{m−m₀}`. Assume `(i) R_ℚ` is absolutely irreducible; (ii) `Res_{ρ̄^{(m)}}` is injective, for instance by one of the two criteria of Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S(b)`; (iii) the order of `γ` is prime to `ℓ`; (iv) `(R̄^{(m)})^{h_γ}` is free of rank one over `O_λ/λ^m`; and `(v)` the `O_λ`-span of `θ_S(G_{S,γ})` contains `λ^c Hom_{O_λ}(S, (R̄^{(m)})^{h_γ})` for an integer `c` independent of `m`. Then there are elements `Ψ₁`, …, `Ψ_{r_S}` of `G_{S,γ}`, each the Frobenius of `a γ`-associated place, which may be taken outside any prescribed finite set of places, such that the image of `s ↦ (θ_S(Ψ_i)(s))_i` contains `λ^{m₀+c}((R̄^{(m)})^{h_γ})^{⊕r_S}`. Condition `(v)` holds with `c = 𝔣(r_S)d_R` when `[F:F⁺] = 1`, and the tuple is then `(S, γ)`-abundant; it holds with `c = 𝔣(r_S)d_{Ind R}` when `[F:F⁺] = 2` and `R_ℚ ≇ R_ℚ^𝔠`; and it holds when `R` extends to `R₊` over `F⁺` and `S` lies in the `𝔠`-eigenspace on which `γ` acts on `(R̄^{(m)})^{h_γ}` by `+1`. Without `(v)` the printed Proposition 2.6.6 fails when `[F:F⁺] = 2`, because `G_{S,γ}` can be trivial.

The precise hypotheses are `(i)`–`(v)` as stated; `S` free of rank `r_S` over `O_λ/λ^{m−m₀}`; `d_R` the reducibility depth of Layer 1.3 Exponents, orders and reducibility depth and `𝔣` the sequence of Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §2.6, Proposition 2.6.6 and its proof, pp. 134–135). asserts the existence of an `(S, γ)`-abundant `r_S`-tuple under `(i)`–(iv), deducing it from Lemmas 2.3.3–2.3.5 and the equality of Lemma 2.6.4

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §2.6, Lemma 2.6.4 and Definition 2.6.5, p. 134). the claimed equality `G_{S,γ} = θ_S^{-1}Hom(S, (R̄^{(m)})^{h_γ})`, whose converse inclusion is the step that fails for `[F:F⁺] = 2`, and the definition of abundance

By (ii) and Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S(a)`, the `O_λ`-span of `θ_S(Gal(F_S/F^{(m)}))` contains `λ^{𝔣(r_S)d_R}Hom_{O_λ}(S, R̄^{(m)})`. Since `h_γ` has order prime to `ℓ, Hom(S, (R̄^{(m)})^{h_γ})` is a direct summand of `Hom(S, R̄^{(m)})`.

Frobenius elements of `γ`-associated places land in `θ_S^{-1}Hom(S, (R̄^{(m)})^{h_γ})` (the correct inclusion of Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples). When `[F:F⁺] = 1` every element of that preimage is such a Frobenius, by Chebotarev in the Galois closure of `F_S F₊^{(m)}` over `F⁺`, which gives `(v)` with `c = 𝔣(r_S)d_R`; when `[F:F⁺] = 2` the realised set is `q(N^α)`, possibly a proper subset, and `(v)` is the extra hypothesis.

For the induced criterion when `R_Q` is not isomorphic to `R_Q^c`, use Shapiro to view `S` inside `H¹(F⁺, Ind_F^{F⁺}R)`. The rational induced representation is absolutely irreducible; apply the saturation bound with its lattice depth. Pairing evaluation on the two coefficient summands commutes with restriction. Average the Galois-closure kernel over the prime-to-`ℓ` cyclic subgroup generated by a lift of `γ`: this projection onto fixed points is surjective. Its restriction to `F_S` is the realised Frobenius set. The fixed coefficient module identifies with `R^{h_γ}`; projecting the saturation containment proves `(v)` with the induced depth. For an extending `R` and an eigenspace `S`, the same averaging computation has factor `1+εb` on the fixed line. It is a unit when `ε=b` and zero when `ε=−b`. Compact Shapiro and the coefficient/pairing compatibility are the ArithmeticGaloisDuality supplier inputs, not conclusions of discrete Shapiro alone.

Row selection: over `O_λ/λ^n`, if the span of a set of vectors contains `λ^c(O_λ/λ^n)^r` with `c < n`, then `r` of the vectors themselves already `span` a submodule containing `λ^c(O_λ/λ^n)^r` (Smith normal form over the discrete valuation ring). Applied to the vectors `(θ_S(Ψ)(s_j))_j` for `Ψ ∈ G_{S,γ}` and a basis `(s_j)` of `S`, with (iv) identifying the `λ^{m−m₀}`-torsion of `(R̄^{(m)})^{h_γ}` with `O_λ/λ^{m−m₀}`, this yields actual Frobenius elements, not linear combinations of them.

Avoiding a finite set: Chebotarev gives infinitely many `γ`-associated places with a prescribed Frobenius in `Gal(F_S/F^{(m)})`.

`[F:F⁺] = 1, d_R = 0` and `r_S = 1`: there is a single `γ`-associated place `w` with `loc_w : S → H¹_ns(F_w, R̄^{(m)})` injective on `S/λ^{m−m₀}`-torsion.

With `(v)` dropped, a quadratic-extension configuration in which the realized Frobenius subgroup is trivial satisfies `(i)`–(iv) and has `G_{S,γ} = {1}`, so no abundant tuple exists: `(v)` is necessary.

The tuple consists of Frobenius elements of places, so Layer 4.4 Localisation at abundant tuples with bounded loss applies to it with the same loss `c`.

*Needs:* Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples; Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`; Layer 1.3 Exponents, orders and reducibility depth; `TauCetiRoadmap.Chebotarev Layer 10`; `Module.equiv_directSum_of_isTorsion`; `ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas)`.

### 1.16 Residual detection of two classes and classes with prescribed ramification

Let `k₀` be a finite field of characteristic `p ≥ 5, V` a two-dimensional `k₀`-vector space with a continuous action `ρ : G_ℚ → GL(V) ≅ GL₂(k₀)` that is surjective, unramified outside a finite set `Σ` of primes and equipped with a perfect alternating `G_ℚ`-equivariant pairing `V × V → k₀(1)`, so `det ρ` is the mod-`p` cyclotomic character, `K` an imaginary quadratic field, `τ` complex conjugation, and `Λ` the Kolyvagin primes for `V`: primes `ℓ ∉ Σ, ℓ ∤ pD_K`, inert in `K`, with `ℓ + 1 ≡` 0 mod `p` and `tr(Frob_ℓ | V) = 0`, so that `Frob_ℓ` acts on `V` with characteristic polynomial `x² − 1`, as `τ` does. For `ℓ ∈ Λ, H¹(K_ℓ, V) = H¹_fin(K_ℓ, V) ⊕ H¹_tr(K_ℓ, V)` with both summands two-dimensional and maximal isotropic for the local Tate pairing, each `τ`-eigenspace `H¹_fin(K_ℓ, V)^±, H¹_tr(K_ℓ, V)^±` one-dimensional, and the local pairing perfect between `H¹_fin(K_ℓ, V)^±` and `H¹_tr(K_ℓ, V)^±`. `(a)` For `k₀`-linearly independent `c₁, c₂ ∈ H¹(K, V)` a positive density of `ℓ ∈ Λ`, outside any finite set, satisfy `loc_ℓ(c₁) ≠ 0` and `loc_ℓ(c₂) ≠ 0`. `(b)` Let `F` be a Selmer structure on `V` whose local conditions are `τ`-stable, are their own exact orthogonal complements under a perfect alternating `G_ℚ`-equivariant pairing `V × V → k₀(1)`, and equal `H¹_fin(K_v, V)` at every Kolyvagin prime `v`. For `ℓ ∈ Λ`, a finite subset `S ⊆ Λ` not containing `ℓ` and each sign `±`, there is a nonzero `c ∈ H¹(K, V)^±` with `loc_v(c) ∈ H¹_F(K_v, V)` for `v ∉ S ∪ {ℓ}, loc_v(c) ∈ H¹_tr(K_v, V)` for `v ∈ S`, and no condition at `ℓ`. Statement `(b)` does not assert that the singular part of `c` at `ℓ` is nonzero.

The precise hypotheses are `p ≥ 5, ρ : G_ℚ → GL₂(k₀)` surjective, and a perfect alternating equivariant pairing `V × V → k₀(1)`; this exact `GL₂` scope forces `k₀ = 𝔽_p` because `det ρ` has image `𝔽_p^×`; for `(b)`: self-dual, `τ`-stable local conditions that are finite at the Kolyvagin primes, as Zhang's Theorem 5.2 provides for Hecke-module quotients of Jacobians.

([Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1, discussion before Lemma 8.1, pp. 234–235). records the decomposition of the four-dimensional local cohomology at a Kolyvagin prime into finite and transverse parts, their eigenspaces and the perfect pairings between them

([Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1, Lemma 8.1, p. 235). two `k₀`-linearly independent classes are simultaneously nonzero at a positive density of Kolyvagin primes, under surjectivity of the residual representation

([Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf), §8.1, Lemma 8.2, p. 235). existence of a nonzero class in a prescribed eigenspace that is finite outside `S ∪ {ℓ}`, transverse at `S` and unrestricted at `ℓ`

`(a)` Restriction to `L = K(V)` is injective on `H¹(K, V)` because `H¹(Gal(L/K), V) = 0` for surjective `ρ` with `p ≥ 5` (the scalar trick of Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S(b)`). The images of `c₁, c₂` cut out an abelian extension `M/L` with `Gal(M/L) ≅` an `F_p[Gal(L/ℚ)]`-module; by linear independence and irreducibility one finds `σ ∈ Gal(M/L)` with `c_i((τσ)²) ≠ 0` for both `i`. Chebotarev (Tau Ceti's Chebotarev roadmap, Layer 10) applied to the class of `τσ` gives `ℓ ∈ Λ`, and `loc_ℓ(c_i)` is evaluation at `Frob_ℓ²` (Layer 1.2 Finite and singular parts at an unramified prime). This is the special case of McCallum, Proposition 3.1, that Zhang's Lemma 8.1 records.

`(b)` Compare the Selmer structures relaxed and strict at `ℓ` (transverse at `S`): by global duality (SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)) and self-duality of the local conditions, the relaxed-at-`ℓ` group exceeds the strict-at-`ℓ` dual group by the one-dimensional local term `H¹(K_ℓ, V)^±/H¹_fin(K_ℓ, V)^±` in each eigenspace, so each eigenspace of the relaxed group is nonzero (McCallum, Lemma 5.3, as invoked by Zhang).

The local decomposition and pairing statements are Layer 1.5 The transverse local condition and Layer 1.10 The transverse condition is self-dual specialised to `Frob_ℓ = τ` on `V`.

`(a)` with `c₂` in the opposite eigenspace to `c₁` detects nonzero classes in both eigenspaces simultaneously.

For nonzero linearly dependent classes, for `c₂ = λc₁` the statement reduces to single-class detection.

In `(b)`, with `S = ∅` the class `c` is a Selmer class away from `ℓ` that may be ramified at `ℓ`; with `ℓ` replaced by the empty condition it is not claimed.

*Needs:* Layer 1.5 The transverse local condition; Layer 1.10 The transverse condition is self-dual; Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; `TauCetiRoadmap.Chebotarev Layer 10`.

### 1.17 Implications between the hypothesis records

`(a) (H.0)`–`(H.4)` of 2004 are stable under `R → R′` surjective, and `(H.6)` under `T → T/m^jT`. `(b)` For `R` a discrete valuation ring, torsion-freeness of `H¹(K_q, T)/H¹_F(K_q, T)` for `q ∈ Σ(F)` implies `(H.6)/(H.5)` for every `T/m^kT`. `(c)` 2004 `(H.3)` implies `T̄^{G_ℚ} = (T̄^*)^{G_ℚ} = 0`, hence 2016 `(H.1)` given `(H.1)` of 2004; 2004 `(H.3)` gives the corrected 2016 `(H.3)` for `K=ℚ` with the bridge choice `L⊆H_M(T)` of 1.13: the finite-level splitting field is contained in `ℚ(T,μ_{p^∞})` and inflation on residual `H¹` is injective. This does not assert vanishing after an arbitrary enlargement by `L`. `(d)` The corrected 2016 `(H.1)`–`(H.6)` for artinian `R` give `(H.7)` on the refined prime set `P(L·H_M(T),τ)`. `(e)` Rubin's `Hyp(K, T)` (Layer 4.3 Rubin's hypotheses, index of divisibility and error terms) gives residual irreducibility and a rank-one `τ` fixing the maximal `p`-Hilbert class extension `K(1)`, cyclotomic `p`-power roots and `p`-power roots of units. It gives the `τ` of 2016 `(H.2)` only after checking that this `τ` fixes the full Hilbert class field `H` and that the prescribed finite-`L` Frobenius set lies in `P`; absolute residual irreducibility in 2016 `(H.1)` is also an additional condition; it does not give `(H.3)`, whose failure is measured by Rubin's error terms `n_W` and `n_W^*`.

The precise hypotheses are as in the two records.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Remark 3.5.1, p. 28). Stability under quotients of the coefficient ring.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Remark 4.3, p. 9). Passage to `(H.7)`.

`(a), (b)`: Mazur–Rubin 2004, Remark 3.5.1, Lemmas 3.7.1`(i)` and 3.7.3. `(c)`: Lemma 3.5.2 and inflation–restriction for `ℚ(T, μ_M) ⊆ ℚ(T, μ_{p^∞})` (ArithmeticGaloisDuality §R02.2.3 (Inflation–restriction for compact and rational coefficients)).

`(d)`: the repaired local and refinement proof in 1.13, replacing the printed field in Mazur–Rubin 2016 Lemma 4.5. `(e)`: compare Rubin's `Hyp(K, T)(i)` with `(H.2): τ` fixes `μ_{p^∞}, (O_K^×)^{1/p^∞}` and only the `p`-part `K(1)` of `H`. Fixing all of `H` must be separately checked. For a prescribed `L`, the actual `(H.2)` requirement is `P(L,τ)⊆P`; it does not require `τ` to fix `L`. The comparison of `(c)` and `(e)` uses the field repairs of 1.13 and is derived here from the two texts, which do not state it.

For a rank-one twist the rank-one coinvariant condition alone holds with `τ=1` in all three records. This checks that condition only; vanishing, absolute irreducibility and prime-set hypotheses still require their own verifications.

*Needs:* Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field; Layer 0.4 Cartesian local conditions; `ArithmeticGaloisDuality §R02.2.3 (Inflation–restriction for compact and rational coefficients)`.

### 1.18 Worked example: twists of `ℤ_p(1)` by characters of finite order

Let `p` be odd, `ρ : G_ℚ → ℤ_p^×` a character of finite order prime to `p, L` its field, `R = ℤ/p^k (or ℤ_p)` and `T = μ_{p^k} ⊗ ρ^{-1} (or ℤ_p(1) ⊗ ρ^{-1})`. With `H¹(ℚ, T) = (L^×/(L^×)^{p^k})^ρ`, let `F` be the structure with `H¹_F(ℚ_ℓ, T) = (O_{L,ℓ}^×/(O_{L,ℓ}^×)^{p^k})^ρ` for all `ℓ`. Then: if `ρ ≠ 1, ω, T` satisfies `(H.0)`–`(H.3), (H.4a)`, and `F, F_can` satisfy `(H.6)`; `χ(T, F) = 1` if `ρ` is even and `ρ ≠ 1`, and `χ(T, F) = 0` if `ρ` is odd and `ρ ≠ ω`; `F = F_can` if `ρ(p) ≠ 1`; and there are exact sequences `0 → (O_L^×/(O_L^×)^{p^k})^ρ → H¹_F(ℚ, T) → Cl(L)[p^k]^ρ → 0` with `H¹_{F^*}(ℚ, T^*) ≅ Hom(Cl(L), ℤ/p^k)^{ρ^{-1}}`.

The precise hypotheses are `p` odd; `ρ` of order prime to `p`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemma 6.1.5 and Proposition 6.1.6, pp. 71–72). Hypotheses and core rank for the twists of `ℤ_p(1)`.

Kummer theory identifies the local and global `H¹`; the unramified classes are the unit classes (Mazur–Rubin 2004, §6.1).

`kχ(T, F) = length H¹_F − length H¹_{F^*} = length (O_L^×/(O_L^×)^{p^k})^ρ` by the two sequences, which is `k` for `ρ` even nontrivial and 0 for `ρ` odd `≠ ω` (Dirichlet's unit theorem).

Propagation: the structure on `T/p^i` is the unit structure for `μ_{p^i} ⊗ ρ^{-1}`; the dual condition is the unramified one on `Hom(G_{L_λ}/I_λ, ℤ/p^k)^{ρ^{-1}}`.

The computed core rank matches Layer 0.10 Core rank of the canonical and unramified structures: rank `T^− + corank H⁰(ℚ_p, T^*)` for `F_can`.

Here `ρ(p)` is the Dirichlet-character value: it is the unramified Frobenius value when `ρ` is unramified at `p` and is 0 when its conductor is divisible by `p`. Thus the assertion `F=F_can` includes that ramified branch.

For finite-order `ρ` unramified at `p` with `ρ(p)=1`, the propagated condition at `p` for `F_can` on `T/p^k` is all `H¹(ℚ_p,T/p^k)`, since the dual invariants on the lattice are divisible (Lemma A.1). It differs from the unit structure `F`.

*Needs:* Layer 0.8 The core rank of a cartesian Selmer structure; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 0.7 The canonical and the unramified Selmer structures.

### 1.19 Worked example: the Tate module of an elliptic curve

Let `E/ℚ` be an elliptic curve and `p ≥ 5` a prime with `G_ℚ → Aut(E[p])` surjective, `T = E[p^k]` or `T_pE`, and `F` the classical Selmer structure (images of the local Kummer maps at the bad primes, `p` and `∞`). Then `F^* = F` under the Weil pairing, `H¹_F(ℚ, E[p^k])` is the `p^k`-Selmer group, `T` satisfies `(H.0)`–`(H.4), F` and `F_can` satisfy `(H.6), χ(T, F) = 0` and `χ(T, F_can) = 1`, where on `T_pE, F_can` is `F` relaxed at `p` and `F_can^* ≤ F ≤ F_can`. On `E[p^k], F_can` is propagated from `T_pE`; its local condition at `p` is the image of `H¹(ℚ_p,T_pE)`, which may be proper if `E(ℚ_p)[p^∞] ≠ 0`.

The precise hypotheses are `p ≥ 5`; surjective mod-`p` representation.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Proposition 6.2.2 and Lemma 6.2.3, p. 74). Core ranks and hypotheses for `T_pE`.

`(H.1)`–`(H.3)` follow from surjectivity onto `GL₂(𝔽_p)`; `(H.4b)` holds as `p > 4`; `(H.6)` by Lemma 3.7.1 since the Kummer images on `T_pE` have torsion-free quotient.

`χ(T, F) = 0` because `F` is self-dual (Layer 0.8 The core rank of a cartesian Selmer structure); `χ(T, F_can) = rank T_pE^− = 1` by core-rank-formula.

Both structures on the same `T` have different core ranks, 0 and 1: the core rank depends on `F`.

The analytic rank of `E` plays no role in either value.

*Needs:* Layer 0.10 Core rank of the canonical and unramified structures; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 0.7 The canonical and the unramified Selmer structures; the elliptic Kummer sequence and classical Selmer identification of TauCetiRoadmap.EllipticCurves Layer 7 (using its Layer 2 Tate module and Weil pairing).

### 1.20 Worked non-example: the trivial and Teichmüller characters

For `ρ = 1` the module `T = ℤ_p(1)` does not satisfy `(H.3)` of Mazur–Rubin 2004: `T^*[m] = Hom(μ_p, μ_p) = 𝔽_p` with trivial action, so `(T^*[m])^{G_ℚ} ≠ 0` and `H¹(ℚ(μ_{p^∞})/ℚ, 𝔽_p) = Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) ≠ 0`. For `ρ = ω, T/mT = μ_p ⊗ ω^{-1}` is trivial and `(H.3)` fails for the same reason. In both cases residual invariants are nonzero and the explicitly computed `H¹` refutes the h1Vanishing field, so no MR04 hypothesis record exists. The error-tolerant Rubin comparison is an application in Layer 4; it is not an input to either non-example.

The precise hypotheses are `p` odd.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemma 6.1.5, proof, p. 71). The two excluded characters are exactly those for which `(H.3)` fails.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Remark 2.7, p. 25). Locator for the Layer 4 error-tolerant comparison, not a premise of this residual non-example.

Compute `T^*[m]` and `T/mT` as Galois modules; `Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^×` has a quotient of order `p`.

Both exclusions follow from these residual computations. No Rubin hypothesis record or derivative construction is needed for this argument.

The record MR04Hypotheses has no term for `T = ℤ_p(1)`: the field h1Vanishing is refutable.

The failure is of `(H.3)`, not of `(H.1)` or `(H.2)`, which both hold for rank one.

*Needs:* Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`.

### 1.21 Simultaneous nonvanishing of localisations

Let `R` be principal artinian and `(T, F, P)` satisfy `(H.0)`–`(H.5)` of Mazur–Rubin 2004. If `c₁, c₂ ∈ H¹(ℚ, T)` and `c₃, c₄ ∈ H¹(ℚ, T^*)` are all nonzero, then for every `k ≥ 1` there is a set `S ⊆ P_k` of positive density such that for every `ℓ ∈ S` the four localisations `(c_i)_ℓ` are nonzero. Over a number field with self-injective coefficients (Burns–Sakamoto–Sano II, Lemma 3.9, under Hypothesis 3.2): for nonzero `c₁`, …, `c_s ∈ H¹(K, A)` and `c₁^*`, …, `c_t^* ∈ H¹(K, A^*(1))` with `s + t < p`, there is a set of primes `q ∈ P` of positive density with all localisations nonzero.

The precise hypotheses are `(H.0)`–`(H.5)`; this is the only place `(H.4)` is used; for the second form: Hypothesis 3.2 of Burns–Sakamoto–Sano II.

`(c)` **MR16 coefficient-level form.** Use `(H.1)`–`(H.3)` of 1.13, with the enlarged field `E=L·H_M(T)`. For an artinian coefficient quotient `T_j`, use the original finite field `E`; for a DVR first choose a finite level `k≥j` and use `E_k` of 1.13. Given nonzero classes `c₁`,…,`c_s` in `H¹(K,T_j)` and `c₁*`,…,`c_t*` in `H¹(K,T_j^*)` and a finite excluded set, there is a positive-density set of primes in `P(E,τ)`, respectively `Q_k`, detecting every class if `s+t<p`. The same conclusion holds for `s≤2,t≤2` under `(H.4)`, including its small-`p k`-nonisomorphism branch. These primes lie in `P` and have `I_q(T_j)=0`. This is a separate useful-prime statement for every `j`; it does not require `L` to lie in the smaller representation field of `T_j`.

Proof: residual vanishing over `E` or `E_k` propagates through the finite coefficient filtration. The quotient–socle comparison of 0.6 reduces nonzero classes to nonzero residual classes. Their restrictions are equivariant homomorphisms; each bad localization is a proper affine coset of index at least `p`. The measure bound gives the first assertion. For the four-class alternative use exactly the common-simple-module and translated linear-subspace proof in 1.13; its distinction between `k`-isomorphism and `𝔽_p`-isomorphism is retained. Apply finite Chebotarev to the fields cut out by these classes, excluding the prescribed finite set. MR16 Remark4.4 p.9 and the selection steps in Lemma6.9(ii), Proposition8.3, Proposition14.3 and Theorem14.4 pp.15,17–18,27–29 use this interface. No stronger `𝔽_p`-disjointness hypothesis is imposed in place of `(H.4)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Proposition 3.6.1, p. 30). The four-class statement.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Lemma 3.9, p. 17). The version over a number field with Gorenstein coefficients.

Let `t` be the level of `(H.5)`, put `k′ = max(k, t)`, let `F = ℚ(T, μ_{p^{k′}})` and fix `τ` as in `(H.2)`. By `(H.3)` restriction `C → Hom(G_F, T)^{G_ℚ}` is injective; by `(H.1)` the image of `c_i(G_F)` in `T/(τ − 1)T` is nonzero.

Each condition '`c_i(γτ) ≠ 0` in `T/(τ − 1)T`' excludes a proper coset union in `G_F`; `(H.4)` (`(H.4a)`, or `p > 4` counting four proper subgroups) shows the four conditions hold simultaneously for some `γ`.

Chebotarev (Tau Ceti's Chebotarev roadmap) gives a positive density of `ℓ ∉ Σ(F)` with Frobenius `γτ` on the field cut out by the classes. By Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}` such `ℓ` lie in `P_{k′}^{all}`, hence in `P_t^{all} ⊆ P` by `(H.5)` and in `P_k^{all}`; thus `ℓ ∈ P_k = P ∩ P_k^{all}`. Moreover `loc_ℓ(c_i) ≠ 0` since `H¹_f(ℚ_ℓ, T) ≅ T/(Fr − 1)T`.

A single prime with Frobenius `τ` on `ℚ(T, μ_{p^k})` does not suffice: the condition is on the larger field cut out by the classes.

The primes may be chosen outside any finite set, in particular prime to `Σ(F)` and to a given `n ∈ N`.

*Needs:* Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 1.2 Finite and singular parts at an unramified prime; `TauCetiRoadmap.Chebotarev Layer 10`.

### 1.22 Chebotarev selection of Kolyvagin primes with error terms

In the setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants put `T = T_α, T^{(k)} = T/π^kT, R^{(k)} = R/π^k` and `ord(x) = min{m : π^m x = 0}`. `(a) (α ≠ 1.)` Let `e_α = r(C₁ + C₂ + C_α)`. For `c₁, c₂, c₃ ∈ H¹(K, T^{(k)})` such that `Rc₁ + Rc₂` contains a submodule isomorphic to `π^{d₁}R^{(k)} ⊕ π^{d₂}R^{(k)}`, there are infinitely many `ℓ ∈ 𝓛^{(k)}`, outside any prescribed finite set, with `ord(loc_ℓ c₃) ≥ ord(c₃) − e_α` and with `R·loc_ℓ c₁ + R·loc_ℓ c₂ ⊆ H¹(K_ℓ, T^{(k)})` containing a submodule isomorphic to `π^{d₁+d₂+2e_α}(R^{(k)})^{⊕2}`; this second conclusion is vacuous when `d₁ + d₂ + 2e_α ≥ k`. `(b) (α ≠ 1, c₃ = c₁.)` There are infinitely many `ℓ ∈ 𝓛^{(k)}` with `ord(loc_ℓ c₁) ≥ ord(c₁) − e_α` and `R·loc_ℓ c₁ + R·loc_ℓ c₂ ⊇ π^{k−ord(c₁)+e_α}R^{(k)} ⊕ π^{d₁+d₂+2e_α}R^{(k)}`. `(c)` (`α ≡` 1 modulo `π^m`.) Let `e = r(C₁ + C₂)` and `T^{(m)}_E = T_pE ⊗ R/π^m`, on which complex conjugation acts. For classes `c^± ∈ H¹(K, T^{(m)}_E)^±` in the two eigenspaces and every `k ≥ m` there are infinitely many `ℓ ∈ 𝓛^{(k)}` with `ord(loc_ℓ c^±) ≥ ord(c^±) − e`; in particular `R·loc_ℓ c⁺ + R·loc_ℓ c⁻` contains a submodule isomorphic to `R/π^{max(0, ord c⁺ − e)} ⊕ R/π^{max(0, ord c⁻ − e)}`. When `ρ_E` is surjective, `C₁ = C₂ = 0` and `(c)` has no loss.

The precise hypotheses are the setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; (Sc) and (Irr) of Layer 1.14, so that `C₁` and `C₂` are finite; `p` odd; for `(a)`–`(b): α ≠ 1`; for `(c): α ≡` 1 modulo `π^m` and `k ≥ m`.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.3.1, Proposition 3.3.6 and its proof, pp. 19–21 (arXiv v2)). states and proves the selection of infinitely many Kolyvagin primes with localisation orders and spans controlled up to `r(C₁ + C₂ + C_α)`

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.3.1, Corollary 3.3.7, p. 21 (arXiv v2)). the case `c₃ = c₁`, giving the two-term span estimate

([Francesc Castella, Giada Grossi, Christopher Skinner, Mazur's main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), §6.3, Proposition 6.3.1, its proof and Remark 6.3.2, pp. 22–23 (arXiv v2)). the eigenspace version on the `π^m`-torsion for `α ≡` 1 mod `π^m`, with loss `r(C₁ + C₂)` and no `C_α`

Restriction to `L = K_α(E[p^k])`, where `K_α` trivialises `α` modulo `π^k`: by Sah's lemma for an element of `G_{K_∞}` acting on `T^{(k)}` as a scalar `u` with `v_p(u − 1) = C₁`, the kernel of `H¹(K, T^{(k)}) → Hom(G_L, T^{(k)}_E)` is killed by `p^{C₁}`. Only the centrality of that element is used; the printed claim that `ρ` is injective on `Gal(L/K)` is not needed.

The restricted homomorphisms `f_i` lie in the `α^{-1}`-eigenspace of `Hom(G_L, T_E^{(k)})`; complex conjugation exchanges the `α` and `α^{-1}` eigenspaces, whose intersection is killed by `π^{rC_α}`, so the projections `(1 ± τ)f_i` lose at most `rC_α` in order; for `(c)` one works directly on the `m`-torsion, where `τ` acts, and no `C_α` appears.

By the definition of `C₂` the `R`-span of the image of each `f^±_i` contains `π^{k−ord(f_i)+r(C₂+C_α)} T_E^{(k)}`; on `Z = G_L/H` (`H` the common kernel) Nekovář's quadratic-form lemmas produce `z ∈ Z⁺` with `q(z) ∉ m^{d₁+d₂+2e_α+1}` and `z` outside the preimage `Z₃` attached to `c₃`. The pair `(ψ⁺, ψ⁻)` needed for the valuation of `q` exists by a Smith-normal-form choice, although the printed choice is not justified.

Chebotarev (Tau Ceti's Chebotarev roadmap, Layer 10) gives infinitely many `ℓ ∤ pND_K` with Frobenius `τz` in `Gal(M/ℚ), M` the field cut out by `H`; such `ℓ` are inert in `K` with `a_ℓ ≡ ℓ + 1 ≡` 0 mod `p^k`, so `ℓ ∈ 𝓛^{(k)}`. Evaluation of the unramified classes at `Frob_ℓ² = z²` (Layer 1.2 Finite and singular parts at an unramified prime) gives `c_i(Frob_ℓ²) = (g⁺_i(z), g⁻_i(z))`, whence the order and span estimates.

With `ρ_E` surjective and `α` of finite order with `α² ≠ 1, (a)` with `e_α = rC_α` recovers the large-image statement of McCallum, Corollary 3.2, up to the `C_α` loss.

`(b)` applied with `c₂ ∈ Rc₁` is the single-class selection used in the first step of the rank-one argument (Layer 4.14 Rank one from a nonzero Kolyvagin class, with an explicit exponent bound).

In `(c)`, letting `α → 1` does not increase the loss, unlike `(a)` where `C_α → ∞`; this is the input that makes Layer 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1 independent of `m`.

*Needs:* Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 1.2 Finite and singular parts at an unramified prime; `TauCetiRoadmap.Chebotarev Layer 10`; `TauCeti.ContCohomology.H1`.

### 1.23 Primes with prescribed localisation kernels

In the setting of Layer 1.21 Simultaneous nonvanishing of localisations, suppose the image of `R → End(T)` is contained in the image of `ℤ_p[[G_ℚ]] → End(T)`. Fix a finite `R`-submodule `C ⊆ H¹(ℚ, T)`, a homomorphism `φ : C → R` and `k ≥ 1`. `(i)` There is a set `S ⊆ P_k` of positive density with `ker(loc_ℓ : C → H¹(ℚ_ℓ, T)) = ker φ` for all `ℓ ∈ S`. (ii) If also `(H.4a)` holds, `D ⊆ H¹(ℚ, T^*)` is a finite submodule and `ψ : D → R` a homomorphism, then `S` can be chosen with in addition `ker(loc_ℓ on D) = ker ψ`.

The precise hypotheses are `(H.0)`–`(H.5)`; image of `R` in `End(T)` inside the image of `ℤ_p[[G_ℚ]]`; `(H.4a)` for (ii).

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Proposition 3.6.2, p. 30). Prescribed kernels of localisation.

Via `C → Hom(G_F, T/(τ − 1)T) ≅ Hom(G_F, R)` (after fixing a generator), find `γ ∈ G_F` realising `φ`; the hypothesis on `End(T)` makes the span of the image of `G_F` an `R`-module (Mazur–Rubin 2004, Lemma 3.6.3).

`(H.4a)` makes the extensions cut out by `C` and `D` linearly disjoint, so `φ` and `ψ` can be realised by one `γ`; apply Chebotarev as before.

Used with `C = H¹_F(ℚ, T)` and `ker φ_i` cutting out a submodule `L` to find leading vertices through `L` (Layer 4.15 Leading vertices through a prescribed submodule).

Fails without the `End(T)` hypothesis: only `𝔽_p`-rational subspaces occur when `T = T₀ ⊗ k` (Remark 4.1.17).

*Needs:* Layer 1.21 Simultaneous nonvanishing of localisations.

### Examples

The relative Galois group of the conductor-one ray layer over `K(1)` is trivial.

If `p` does not divide `N(q)−1`, the relative `p`-ray group `Γ_q` is trivial.

The annihilator exponent of zero is zero.

### Dependencies

This layer uses `TauCetiRoadmap.ClassFieldTheory Layer 13`; `TauCeti.GlobalNumberFields.RayClassGroup`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; `TauCetiRoadmap.ClassFieldTheory Layer 7`; `ArithmeticGaloisDuality §R02.2.3 (Inflation–restriction for compact and rational coefficients)`; `TauCetiRoadmap.ClassFieldTheory Layer 5`; `SelmerIwasawaCohomology §2.1 (Compact and rational Selmer data)`; Layer 1.1 The fields `K(q), K(r)` and their Galois groups; Layer 0.1 Selmer triples and squarefree conductors; `LinearMap.charpoly`; Layer 1.2 Finite and singular parts at an unramified prime; Layer 1.3 Exponents, orders and reducibility depth; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; `TauCetiRoadmap.Chebotarev Layer 10`; `NumberField.Chebotarev.frobeniusPrimeSet`; `NumberField.artinSymbol`; `LinearMap.aeval_self_charpoly`; Layer 1.5 The transverse local condition; `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.3 (Change of local conditions)`; Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`; Layer 0.4 Cartesian local conditions; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 0.8 The core rank of a cartesian Selmer structure; `SelmerIwasawaCohomology §2.8 (Greenberg’s local condition)`; Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples; `Module.equiv_directSum_of_isTorsion`; `ArithmeticGaloisDuality §D7.3 (Compact Shapiro and projection formulas)`; Layer 1.10 The transverse condition is self-dual; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field; Layer 0.7 The canonical and the unramified Selmer structures; Layer 0.10 Core rank of the canonical and unramified structures; the elliptic Kummer sequence and classical Selmer identification of TauCetiRoadmap.EllipticCurves Layer 7 (using its Layer 2 Tate module and Weil pairing); Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; `TauCeti.ContCohomology.H1`; Layer 1.21 Simultaneous nonvanishing of localisations.

The proof also uses Mazur–Rubin 2004 Lemma 3.6.3 and the two-step proof of Propositions 3.6.1–3.6.2; Rubin Lemma V.2.1.

For `[F:F⁺]=2`, calculate the realized Frobenius subgroup `q(N^α)`, its span and the defect of paired evaluation before applying Layer 1.15. Its span hypothesis gives the constant `c`; the eigenspace condition alone does not imply it. The norm, paired-evaluation and obstruction calculations are prerequisites of that span test, rather than an unconditional Chebotarev argument.

The proof also uses McCallum's Proposition 3.1 and Lemma 5.3, which Layer 1.16 Residual detection of two classes and classes with prescribed ramification cites through Zhang §8.

## Layer 2: Euler systems

### 2.1 Euler polynomials and their conventions

Let `T` be a free module of finite rank over `O` (the ring of integers of a finite extension `Φ` of `ℚ_p`, or a coefficient order), with `G_K`-action unramified at a prime `q ∤ p, Fr_q` an arithmetic Frobenius, and `T^* = Hom_O(T, O(1))`. Rubin's Euler polynomial is `P(Fr_q^{-1} | T^*; x) = det(1 − Fr_q^{-1}x | T^*) ∈ O[x]`; it equals `det(1 − N(q)^{-1}Fr_q x | T)`. Mazur–Rubin use `P_q(x) = det(1 − Fr_q x | T)`. Burns–Sakamoto–Sano use `P_q(x) = det(1 − Fr_q^{-1}x | T^*(1))` with `T^* = Hom_R(T, R)`, which is Rubin's polynomial. The operators entering norm relations are obtained by substituting `x = Fr_q^{-1}` (acting on cohomology through `Gal(F/K)`): `P(Fr_q^{-1} | T^*; Fr_q^{-1})` for Rubin and `P_q(Fr_q^{-1})` for Mazur–Rubin. The coefficients satisfy `a_i^{Rubin} = N(q)^{-i} a_i^{MR}`, so the two polynomials are congruent modulo `N(q) − 1`, hence modulo `M` whenever `M | [K(q) : K(1)]`.

The precise hypotheses are `T` unramified at `q, q ∤ p`; `Fr_q` arithmetic Frobenius; the dual is the Tate dual `Hom(T, O(1))`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Lemma 1.2 and its proof, p. 57). The identity between the two determinants and the annihilation statements.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Remark 3.2.3, p. 23). The two conventions differ and are equivalent.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §6.1, pp. 36–37). The convention of Burns–Sakamoto–Sano, `P_q(x) = det(1 − Fr_q^{-1}x | T^*(1))`.

`det(1 − Fr_q^{-1}x | Hom(T, O(1))) = det(1 − N(q)^{-1}Fr_q x | T): Fr_q^{-1}` acts on `Hom(T, O(1))` as the transpose of `Fr_q` on `T` times `ε_cyc(Fr_q)^{-1} = N(q)^{-1}`.

`P(Fr_q^{-1} | T^*; N(q)Fr_q^{-1})` annihilates `T` by Cayley–Hamilton; if `M | [K(q) : K(1)]` then `P(Fr_q^{-1} | T^*; x) ≡ det(1 − Fr_q x | W_M)` modulo `M` and `P(Fr_q^{-1} | T^*; Fr_q^{-1})` annihilates `W_M` (Rubin, Lemma IV.1.2).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.eulerPolyAt`: `P(Fr_q^{-1} | T^*; x) = det(1 − Fr_q^{-1}·x | T^*) ∈ O[X]`, for `T` unramified at `q`; it is `eulerPoly` below applied to `Fr_q^{-1}` on `T^*`.
- `TauCeti.EulerSystems.eulerPolyAt_eq_det_twist`: `P(Fr_q^{-1} | T^*; x) = det(1 − N(q)^{-1}·Fr_q·x | T)`.
- `TauCeti.EulerSystems.eulerPolyMR`: `P_q(x) = det(1 − Fr_q·x | T)`, the Mazur–Rubin convention.
- `TauCeti.EulerSystems.eulerPolyAt_coeff`: `coeff_i(eulerPolyAt) · N(q)^i = coeff_i`(eulerPolyMR).
- `TauCeti.EulerSystems.eulerPolyAt_congr`: `eulerPolyAt ≡` eulerPolyMR modulo `(N(q) − 1)·O[X]`.
- `TauCeti.EulerSystems.eulerPolyAt_aeval_annihilates`: `P(Fr_q^{-1} | T^*; N(q)Fr_q^{-1}) = 0` on `T`, and `P(Fr_q^{-1} | T^*; Fr_q^{-1}) = 0` on `W_M` when `M | [K(q) : K(1)]`.
- `TauCeti.EulerSystems.eulerPolyAt_twist`: For a character `χ` of finite order unramified at `q: P(Fr_q^{-1} | (T ⊗ χ)^*; x) = P(Fr_q^{-1} | T^*; χ(Fr_q)x)`.

For an endomorphism `f` of a finite free module `M` over a commutative ring `R`, define `eulerPoly f` to be `(LinearMap.charpoly f).reverse`. Prove `eulerPoly_eval_zero`: its value at zero is one when `R` is nontrivial. For a linear equivalence `f : M ≃ₗ[R] M`, prove `aeval_inv_eulerPoly_eq_zero`: evaluation at the inverse endomorphism is zero. These are the reversed characteristic-polynomial form of Cayley–Hamilton used in Rubin IV.1.2; `Matrix.reverse_charpoly` supplies the determinant identification. Prove `eulerPoly_id_rank_one` for `M = R`: the identity has Euler polynomial `1 − X`.

**Checks.**

- The zero endomorphism of a free rank-two module has Euler polynomial `1`, although its characteristic polynomial is `X²`.
- `eulerPoly_zp_one`: For rank-one Frobenius multiplication by `N(q)`, `det(1 − Fr·X) = 1−N(q)X` is the MR polynomial, while `Fr⁻¹` on `T^*` is the identity and gives Rubin's `1−X` (`eulerPoly_id_rank_one`).
- Elliptic normalization: an MR polynomial `1−aX+N(q)X²` becomes `1−aN(q)⁻¹X+N(q)⁻¹X²` in the Rubin normalization.
- `eulerPoly_rank_zero`: For the zero representation both Euler polynomials equal 1; every endomorphism of a zero module has `det(1 − fX) = 1`.

For `T = ℤ_p(1)`: Rubin's polynomial is `1 − x (T^* = ℤ_p)` and Mazur–Rubin's is `1 − N(q)x`; they agree modulo `N(q) − 1`.

The polynomials differ as elements of `O[x]`; systems for the two conventions are related by an explicit map, not equal (Layer 2.6 Changing the Euler factors).

Additional arithmetic check: For `T = ℤ_p(1)` and `N(q) ≠ 1` the two polynomials are different elements of `O[X]`, although congruent modulo `N(q) − 1`.

*Needs:* `LinearMap.charpoly`; `LinearMap.aeval_self_charpoly`.

### 2.2 The module of Euler systems

Let `𝒦/K` be an abelian extension and `N` an ideal of `K` divisible by `p` and by all primes where `T` is ramified. Write `K ⊂_f F` for finite subextensions `F` of `𝒦/K`, and for `F ⊆ F′` let `Σ(F′/F)` be the set of primes of `K` not dividing `N` that ramify in `F′` but not in `F`. An Euler system for `(T, 𝒦, N)` is a family `c = (c_F)_F` with `c_F ∈ H¹(F, T)` such that for all `K ⊂_f F ⊂_f F′ ⊆ 𝒦, Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1})) c_F`. The set `ES(T, 𝒦, N)` of such families is the `O[[Gal(𝒦/K)]]`-submodule of `∏_F H¹(F, T)` cut out by these equations (an equaliser). `(𝒦, N)` is admissible in Rubin's sense if `(i) 𝒦 ⊇ K(q)` for every `q ∤ N` and (ii) `𝒦` contains a `ℤ_p^d`-extension `K_∞` of `K, d ≥ 1`, in which no finite prime splits completely. The definition itself does not require `(i)`–(ii); the theorems do. The zero family is an Euler system.

The precise hypotheses are `𝒦/K` abelian; `p | N` and `N` divisible by the primes where `T` is ramified.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Definition 1.1, pp. 21–22). The definition.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Remark 2.8, p. 25). The zero system is an Euler system.

`Cor_{F′/F}` is corestriction on continuous cohomology (Tau Ceti's explicitCor1 for the open subgroup `G_{F′} ⊆ G_F`), and `Fr_q` acts on `H¹(F, T)` through `Gal(F/K)`, in which `q` is unramified.

The relations are `O`-linear in `c` and compatible with the `Gal(𝒦/K)`-action `(σc)_F = σ(c_F)`, giving the module structure.

Since `p | N`, no Euler factors at primes above `p` occur and, for `F ⊆ F′ ⊆ F K_∞, Cor_{F′/F}(c_{F′}) = c_F`: the classes are universal norms in the `K_∞`-direction. The tower relation and the auxiliary-prime relation are the two cases `Σ(F′/F) = ∅` and `Σ(F′/F) = {q}`.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.EulerSystem`: The submodule `ES(T, 𝒦, N) ⊆ ∏_{K ⊂_f F ⊆ 𝒦} H¹(F, T)` of families satisfying the corestriction relations.
- `TauCeti.EulerSystems.EulerSystem.eval`: `c ↦ c_F`, an `O`-linear map `ES(T, 𝒦, N) → H¹(F, T)`.
- `TauCeti.EulerSystems.EulerSystem.cor_eval`: `Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1}))·c_F`.
- `TauCeti.EulerSystems.EulerSystem.cor_eval_of_ramified_eq`: If `Σ(F′/F) = ∅` then `Cor_{F′/F}(c_{F′}) = c_F`.
- `TauCeti.EulerSystems.EulerSystem.ext`: Two Euler systems with the same classes `c_F` for all `F` are equal.
- `TauCeti.EulerSystems.EulerSystem.lift`: `A` family of `O`-linear maps `f_F : X → H¹(F, T)` satisfying the relations is the same as an `O`-linear map `X → ES(T, 𝒦, N)`; it is determined by the `f_F`.
- `TauCeti.EulerSystems.EulerSystem.restrictTower`: For `𝒦′ ⊆ 𝒦`, restriction of the index family is an `O`-linear map `ES(T, 𝒦, N) → ES(T, 𝒦′, N)`; for an ideal `N′` prime to `p` and `𝒦₀` the maximal subextension of `𝒦` unramified at the primes dividing `N′`, it lands in `ES(T, 𝒦₀, NN′)`.
- `TauCeti.EulerSystems.IsAdmissibleTower`: Rubin's conditions `(i)` and (ii) on `(𝒦, N, K_∞)`.

**Checks.**

- `EulerSystem.zero_mem`: The zero family is an Euler system.
- `EulerSystem.universal_norm`: When no new ramified primes occur, each component is in the image of corestriction from the larger layer.
- `EulerSystem.not_restriction`: On such a layer, a restriction-compatible family fails the norm relation when `([F′:F]−1)c_F` is nonzero.

`ES` is the equaliser of two maps `∏_F H¹(F, T) ⇉ ∏_{F ⊆ F′} H¹(F, T)`, so a morphism into `ES` is a compatible family of morphisms.

The norm relation uses corestriction: replacing it by restriction or by equality `c_{F′} = c_F` gives a different (wrong) object.

Additional arithmetic check: For `K = ℚ, T = ℤ_p(1)` and the Kummer images of the `p`-extended cyclotomic units `c̃_m`, the relation for `ℚ(μ_m) ⊆ ℚ(μ_{mℓ}), ℓ ∤ mp`, is `N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{-1}}`: the factor is `P(Fr_ℓ^{-1} | ℤ_p; Fr_ℓ^{-1}) = 1 − Fr_ℓ^{-1}`.

*Needs:* Layer 2.1 Euler polynomials and their conventions; Layer 1.1 The fields `K(q), K(r)` and their Galois groups; `TauCeti.ContCohomology.explicitCor1`; `TauCeti.ContCohomology.explicitCor1_comp_res1`; `ArithmeticGaloisDuality §R02.1.2 (Comparison with the canonical carrier)`.

### 2.3 Euler-system classes are unramified away from `p`

Let `c` be an Euler system for an admissible tower (so `𝒦 ⊇ K_∞` with no finite prime splitting completely). Then for every `F` and every place `w ∤ p` of `F, (c_F)_w ∈ H¹_ur(F_w, T)`; that is, `c_F ∈ S^{Σ_p}(F, T)`, and `c_F ∈ H¹_{F_can}(F, T)`. Hence `c_F` lies in `H¹(O_{F,S(F)}, T)` for `S(F) = S ∪ S_ram(F/K)`, the cohomology of the maximal extension unramified outside `S(F)`.

The precise hypotheses are admissible tower; `T` finitely generated over `ℤ_p`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, before Theorem 2.10, p. 25). The classes are unramified outside `p`.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Lemma 6.6, p. 38). The same statement for the canonical Selmer structure.

`c_F` is a universal norm from `F K_∞`, in which the decomposition group of `w` is infinite; apply SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from `p`)(ii).

The comparison `H¹_ur(F_w, T) ⊆ ker(H¹(F_w, T) → H¹(F_w^{ur}, V))` gives the statement for `F_can` at ramified primes.

Without condition (ii) the statement fails: `c_K` is then unconstrained (Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems).

*Needs:* Layer 2.2 The module of Euler systems; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`; Layer 0.7 The canonical and the unramified Selmer structures.

### 2.4 The conductor-indexed presentations

`(a)` For an admissible `(𝒦, N)`, an Euler system is equivalent to a family `c̃_m ∈ H¹(K[m] ∩ 𝒦, T)` indexed by all generalised ideals `m` (`K[m]` the ray class field), with `Cor_{K[mq]∩𝒦/K[m]∩𝒦}(c̃_{mq}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c̃_m` if `q ∤ mN` and `= c̃_m` if `q | mN`: put `c_F = Cor_{K[m]∩𝒦/F}(c̃_m)` for `m` the conductor of `F/K`, and conversely `c̃_m = ∏_q P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{K[m]∩𝒦}`, the product over primes dividing `m`, not dividing `N`, unramified in `(K[m] ∩ 𝒦)/K`. `(b)` For `𝒦_min = K_∞·∏_{q ∤ N} K(q)`, an Euler system is determined by, and equivalent to, a family `{c_{F(r)}}` over squarefree `r` prime to `N` and `K ⊂_f F ⊆ K_∞` with `Cor_{F(rq)/F(r)}(c_{F(rq)}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{F(r)}` when `K(q) ≠ K(1)`, and `Cor_{F′(r)/F(r)}(c_{F′(r)}) = c_{F(r)}`; then `c_L = Cor_{F(r)/L}(c_{F(r)})` for `r, F` minimal with `L ⊆ F(r)`.

The precise hypotheses are admissible `(𝒦, N)`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Remarks 1.3 and 1.4, pp. 22–23). Both presentations.

Check the relations in both directions using transitivity of corestriction and that `Fr_q` acts trivially through fields in which `q` splits.

`(b)`: every finite subextension of `𝒦_min` lies in some `F(r)`; the family on the cofinal set `{F(r)}` determines the rest.

The archimedean part of a generalised ideal is allowed in `(a)`.

The equivalence is an isomorphism of modules `ES(T, 𝒦_min, N) ≅ {families (c_{F(r)})}`.

*Needs:* Layer 2.2 The module of Euler systems; Layer 1.1 The fields `K(q), K(r)` and their Galois groups; `TauCetiRoadmap.ClassFieldTheory Layer 13`.

### 2.5 Twisting Euler systems by characters of finite order

Let `c` be an Euler system for `(T, 𝒦, N)` and `χ : Gal(𝒦/K) → O^×` a character of finite order with conductor `𝔣` and field `L = 𝒦^{ker χ}`; let `O_χ` be free of rank one with generator `ξ_χ` and `T ⊗ χ = T ⊗ O_χ`. Define `c^χ_F ∈ H¹(F, T ⊗ χ)` as the image of `c_{FL}` under `H¹(FL, T) → H¹(FL, T) ⊗ O_χ ≅ H¹(FL, T ⊗ χ) → H¹(F, T ⊗ χ)`, the last map being corestriction. Then `{c^χ_F}` is an Euler system for `(T ⊗ χ, 𝒦, 𝔣N)`. If `L ⊆ L′ ⊆ 𝒦` have the same conductor, the image of `c^χ_F` under `Res` then `⊗ξ_χ^{-1}` in `H¹(FL′, T)` is `Σ_{δ ∈ Gal(FL′/F)} χ(δ)δ c_{FL′}`. Coefficient extension along `O → O′` finite flat acts on families termwise when `H¹(F, T) ⊗ O′ = H¹(F, T ⊗ O′)`, and is used to adjoin the values of `χ`.

The precise hypotheses are `χ` of finite order on `Gal(𝒦/K)`; values of `χ` in `O^×` (after enlarging `O`).

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Proposition 4.2, p. 30). The twisted family is an Euler system.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Lemma 4.3, p. 31). The restriction formula.

Compute `Cor_{F′/F}(c^χ_{F′}) = Cor_{FL/F}((∏ P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{FL}) ⊗ ξ_χ)`; moving `ξ_χ` past `Fr_q^{-1}` multiplies by `χ(Fr_q)`, and `P(Fr_q^{-1} | T^*; χ(Fr_q)x) = P(Fr_q^{-1} | (T ⊗ χ)^*; x)`.

`Σ(F′L/FL)` computed with `N` equals `Σ(F′/F)` computed with `𝔣N`.

The restriction formula follows from `Res ∘ Cor = Σ δ` and `Cor_{FL′/FL} c_{FL′} = c_{FL}`.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.EulerSystem.twist`: `c ↦ c^χ : ES(T, 𝒦, N) → ES(T ⊗ χ, 𝒦, 𝔣N), O`-linear after fixing `ξ_χ`.
- `TauCeti.EulerSystems.EulerSystem.twist_eval`: `(c^χ)_F = Cor_{FL/F}(c_{FL} ⊗ ξ_χ)`.
- `TauCeti.EulerSystems.EulerSystem.twist_one`: `c^1 = c`.
- `TauCeti.EulerSystems.EulerSystem.res_twist`: `Res_{FL′/F}(c^χ_F) ⊗ ξ_χ^{-1} = Σ_{δ ∈ Gal(FL′/F)} χ(δ)·δ·c_{FL′}`.
- `TauCeti.EulerSystems.EulerSystem.baseChange`: For `O → O′` finite flat, `ES(T, 𝒦, N) ⊗_O O′ → ES(T ⊗ O′, 𝒦, N)` is defined termwise and is injective.

**Checks.**

- `EulerSystem.twist_zero`: Twisting takes the zero Euler system to zero.
- `EulerSystem.twist_conductor`: Every prime ramified in the character field enters the twisted bad support.
- `EulerSystem.twist_inverse_norm`: If the character compositum introduces no new Euler factors, `cor(c_{FLχ})=c_F`; in general the inverse-twist norm is the Euler-factor product, as stated by the API.

Twisting by the trivial character is the identity.

Twisting is `O`-linear after choosing compatible generators. For finite-order `χ,ψ`, the iterated twist is obtained by corestriction from `FL_χL_ψ`, while the direct `χψ`-twist uses `FL_{χψ}`. Comparing these by the Euler relation introduces the Euler factors for primes ramifying in the former and not the latter outside `N`. In particular `(c^χ)^{χ^{-1}}_F = Cor_{FL_χ/F}(c_{FL_χ})`, after cancelling generators; this equals the applicable Euler-factor product times `c_F` and need not equal `c_F`. Both families are compared in the common conductor `f_χ f_ψ N`.

Additional arithmetic check: For `χ = 1, L = K` and `c^χ_F = c_F`.

Additional arithmetic check: For `K = ℚ, T = ℤ_p(1), χ` of conductor `f`: the image of `c^χ_ℚ` in `H¹(L, T)` is `Σ_{δ ∈ Gal(L/ℚ)} χ(δ)δc_L`, the `χ^{-1}`-component of the Kummer class of the cyclotomic unit of `L`.

*Needs:* Layer 2.2 The module of Euler systems; Layer 2.1 Euler polynomials and their conventions.

### 2.6 Changing the Euler factors

`(a)` Let `f_q, g_q ∈ O[x] (q ∤ N)` with `f_q ≡ g_q` modulo `N(q) − 1`, and `c̃` a family with `Cor_{F′/F}(c̃_{F′}) = (∏_{q ∈ Σ(F′/F)} f_q(Fr_q^{-1})) c̃_F`. Then there is a family `c` with the same relations for `g_q`, with `c_F = c̃_F` for every finite abelian `F/K` unramified outside `N`, and with `Σ_γ χ(γ)γc_F = Σ_γ χ(γ)γc̃_F` whenever `χ` is a character of `Gal(F/K)` of conductor `𝔣` and every prime ramified in `F/K` divides `N𝔣`; the construction is an explicit `O`-linear map `c̃ ↦ c`. `(b)` For `f_q∈O[x,x⁻¹]`, units `u_q∈O^×` and an integer `d`, put `g_q(x)=u_q x^d f_q(x⁻¹)`. A family with `f_q(Fr_q)` norm factors is transformed into one with `g_q(Fr_q⁻¹)` factors by multiplying its component at `F` by `∏_{q∈Σ(F/K)}u_q Fr_q^{−d}`, using fixed Frobenius lifts in `Gal(K^ab/K)`. `(c)` In particular a family satisfying the relations with `P(Fr_q^{-1} | T; Fr_q)` gives an Euler system in the sense of Definition II.1.1, and the modules of Euler systems for the conventions of Rubin and of Mazur–Rubin are isomorphic. The change of factors is a map of systems, not an equality.

The precise hypotheses are `f_q≡g_q (mod N(q)−1)` for `(a)`; Laurent polynomials, unit multipliers and `d∈ℤ` for `(b)`; the coefficient and dual-polynomial conventions of §2.1 for `(c)`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX, Lemma 6.1, p. 141). Changing congruent Euler factors.

(Karl Rubin, Euler Systems, Lemma IX.6.3, p.143, and Corollary IX.6.4, pp.143–144). The Laurent reciprocal/monomial transformation in `(b)` and the convention conversion in `(c)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Remark 3.2.3, p. 23). The two conventions give isomorphic modules.

Since `[K(q) : K(1)]` divides `N(q) − 1, (f_q − g_q)(Fr_q^{-1})` is divisible by the degree of the `q`-part; correct `c̃_F` by an explicit alternating sum over the primes ramified in `F` (Rubin, Lemma IX.6.1).

The Mazur–Rubin and Rubin polynomials are congruent modulo `N(q) − 1` by euler-polynomial.

Rubin's Example IX.6.2: `K = ℚ, f_q = 1 − x` and `g_q = 1 − q^{-1}x`.

The map is the identity on classes over fields unramified outside `N`.

**Checks.**

- For `f_q(x)=1−x`, `u_q=1` and `d=1`, the reciprocal operation gives `g_q(x)=x−1`, whereas the variable-power substitution would give `1−x`.
- Taking `u_q=1` and `d=0` reverses Frobenius in the norm factor: `g_q(Fr_q⁻¹)=f_q(Fr_q)`.
- If `F/K` is unramified outside `N`, the product defining the transformation in `(b)` is empty and its component is unchanged.

*Needs:* Layer 2.2 The module of Euler systems; Layer 2.1 Euler polynomials and their conventions.

### 2.7 The universal Euler system

Fix `N` and `K_∞/K` as in an admissible tower, `R(N)` the squarefree products of primes not dividing `N`. For `r ∈ R(N)` and `K ⊂_f F ⊆ K_∞, X_{F(r)} = Y_{F(r)}/Z_{F(r)}`, where `Y_{F(r)}` is the free `O[Gal(F(r)/K)]`-module on symbols `x_{F(s)}, s | r`, and `Z_{F(r)}` is generated by `σx_{F(s)} − x_{F(s)} (σ ∈ Gal(F(r)/F(s))), N_q x_{F(qs)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} (qs | r, K(q) ≠ K(1))` and `x_{F(qs)} − x_{F(s)} (qs | r, K(q) = K(1))`. The universal Euler system is `X = colim_{F,r} X_{F(r)}`; `X_{∞,r} = lim_F X_{F(r)}`. Sending `x_{F(r)} ↦ c_{F(r)}` gives `G_K`-equivariant maps `X_{F(r)} → H¹(F(r), T)` for every Euler system `c`. Structure: `X_{F(r)}` is a finitely generated free `O`-module, free over `O[Gal(F(r)/K(r))]` of `rank [K(r) : K], X_{F(r)} ⊗ Φ` is free of rank one over `Φ[Gal(F(r)/K)], X_{F′(r)} ⊗ O[Gal(F(r)/K)] ≅ X_{F(r)}, X_{F(s)} ≅ X_{F′(r)}^{Gal(F′(r)/F(s))}`; `X_{∞,r}` is free of `rank [K(r) : K]` over `O[[Gal(K_∞(r)/K(r))]]`; and `Ext¹_{(O/M)[G]}(X_{F(r)}/M, (O/M)[G]^k) = 0` for `G = Gal(F(r)/K)`, with the analogue for `X_{∞,r}`.

The precise hypotheses are `N, K_∞` as in an admissible tower.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Definitions 2.1–2.2, p. 58). Definition of `X_{F(r)}` and `X`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Proposition 3.1, p. 59). Freeness of the universal Euler system.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Proposition 3.4, p. 61). The `Ext¹` vanishing.

The relations of `X_{F(r)}` are exactly the Euler system relations in the presentation of Layer 2.4 The conductor-indexed presentations`(b)`; this gives the universal property (Rubin, Lemma IV.2.3).

Freeness: an explicit `O`-basis of `X_{F(r)}` built from coset representatives and `Γ_q − {1}` (Proposition IV.3.1).

`Ext` vanishing: for `B` free over `R[[H]]` with `H` of finite index in `G, Ext¹_{R[[G]]}(B, R[[G]]) = 0` (Lemma IV.3.3).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.Universal.X`: `X_{F(r)}` as a quotient of a free `O[Gal(F(r)/K)]`-module by the three families of relations.
- `TauCeti.EulerSystems.Universal.gen`: The class `x_{F(s)} ∈ X_{F(r)}` for `s | r`.
- `TauCeti.EulerSystems.Universal.norm_gen`: `N_q·x_{F(qs)} = P(Fr_q^{-1} | T^*; Fr_q^{-1})·x_{F(s)}` when `K(q) ≠ K(1)`, and `x_{F(qs)} = x_{F(s)}` otherwise.
- `TauCeti.EulerSystems.Universal.lift`: For an Euler system `c`, the unique `O[G_K]`-linear map `X_{F(r)} → H¹(F(r), T)` with `x_{F(s)} ↦ res(c_{F(s)})`.
- `TauCeti.EulerSystems.Universal.free`: `X_{F(r)}` is free of finite rank over `O` and free of `rank [K(r) : K]` over `O[Gal(F(r)/K(r))]`.
- `TauCeti.EulerSystems.Universal.ext_eq_zero`: `Ext¹_{(O/M)[G]}(X_{F(r)}/M X_{F(r)}, (O/M)[G]^k) = 0` for `G = Gal(F(r)/K)`.

**Checks.**

- `Universal.X_one`: When `F=K` and `K(1)=K`, the conductor-one universal module is `R`.
- `Universal.rank_one_prime`: With `F=K` and `K(1)=K`, the one-prime universal module has `R`-rank `|Γ_q|` under admissibility.
- `Universal.zero_lift`: The universal lift of the zero Euler system takes every distinguished generator to zero.

For `r = 1` and `F = K` with `K(1) = K: X_K = O·x_K`.

`Hom_{G_K}(X_{∞,R}, colim_r lim_F H¹(F(r), T))` recovers Euler systems for `𝒦_min` (Remark IV.2.4).

Additional arithmetic check: `X_{F(r)}` is not free over `O[Gal(F(r)/K)]` in general: only `X_{F(r)} ⊗ Φ` is free of rank one over `Φ[Gal(F(r)/K)]`.

*Needs:* Layer 2.4 The conductor-indexed presentations; Layer 2.1 Euler polynomials and their conventions; `MonoidAlgebra`.

### 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems

`(a)` Rigidity. Without condition (ii) of an admissible tower the class `c_K` can be unconstrained: if the chosen tower has no nontrivial finite subextension unramified at every finite place (in particular if `K` has narrow class number one), `P(Fr_q^{-1} | T^*; 1) = 0` for every `q ∤ N` and `𝒦` is the maximal abelian extension unramified at every prime dividing `N`, the only relations involving `c_K` are `Cor_{F/K}c_F = ∏_{q ∈ Σ(F/K)} P(Fr_q^{-1} | T^*; 1)c_K = 0`, and the family `c_F = 0 (F ≠ K), c_K` arbitrary is an Euler system. Condition (ii) is therefore replaced by (ii)`′`: at least one of `(a) 𝒦` contains a `ℤ_p^d`-extension of `K` in which no finite prime splits completely; `(b) c_{K(r)} ∈ S^{Σ_p}(K(r), T)` for every `r`, and there is `γ ∈ G_K` with `γ = 1` on `K(1)(μ_{p^∞}, (O_K^×)^{1/p^∞})` and `γ − 1` injective on `T`; `(c) c_{K(r)} ∈ S^{Σ_p}(K(r), T)` for every `r, Fr_q^n − 1` is injective on `T` for every prime `q ∤ N` and every power `n` of `p`, and the family `{c_{K(r)}}` satisfies the congruence of Corollary IV.8.1. Under (ii)`′` and `T^{G_{K(1)}} = 0`, Theorems II.2.2, II.2.3 and II.2.10 hold as stated. `(b)` Finite depth. For `0 ≠ M ∈ O` an Euler system for `W_M` (of depth `M`) is a family as in the definition with `c_F ∈ H¹(F, W_M)`. `(c)` Anticyclotomic. Fix `d|p−1, χ:G_K→ℤ_p^×` of exact order `d`, and `K′=K^{ker χ}`. For `q∤p` let `K′(q)_χ` be the maximal `p`-extension inside the ray class field of `K′` of modulus `qO_{K′}` on whose Galois group `Gal(K′/K)` acts by `χ`; `K′(1)_χ` is its unramified counterpart. Require `𝒦′/K′` to be an abelian `p`-extension, Galois over `K`, with this `χ`-action, containing `K′(q)_χ` for all `q∤N`. The ideal `N` contains `p`, the conductor of `χ` and the ramification of `T`. `A χ`-anticyclotomic Euler system is a family `c_F∈H¹(F,T), K′⊆F⊆𝒦′` finite over `K′`, with the corestriction relation of Layer 2.2, now indexed by primes `q` of `K` and rational-to-`K` Frobenius acting on `T` and on `F`. Its rigidity hypothesis is one of:

- `𝒦′` contains a `ℤ_p^d`-extension of `K′` with no completely split finite prime and with `χ`-conjugation action.
- Every `χ`-ray class `c_{K′(r)_χ}` is in `S^{Σ_p}`, and there is `γ∈G_K` with `ε_cyc(γ)=χ(γ)`, with `γ^d` fixing `K′(1)_χ(μ_{p^∞},(O_{K′}^×)^{1/p^∞})`, and with `γ−1` injective on `T`.
- Every `χ`-ray class is in `S^{Σ_p}`, every `Fr_q^{p^a}−1` on `T` is injective for `q∤N` and `a≥0`, and the `χ`-ray version of the local congruence holds. The congruence is `chiRayTorsionCongruence` below, for a family-independent lower-data lift `chiRayCongruenceLift` that is part of the data of this alternative when `d>1`; published Definition9.4.1(ii)`(c)`, p.181, names an analogue of 4.8.1 without giving an integral formula. The other clauses do not imply the congruence.

The finite–singular map on semilocal `χ`-ray cohomology sends the `χ^i`-part to the `χ^{i−1}`-part, as fixed in Layer 3.16; it is not an equivariant map after removing its `G_q` factor. `(d)` An Euler system is trivial at a finite set `Σ` of primes not dividing `p` if `c_F ∈ S_Σ^{Σ_p}(F, T)` for all `F`.

In the `χ`-family's norm relation, fix a prime above `q` and the associated rational-to-`K` Frobenius lift on the relevant finite Galois quotient. For a nonabelian `χ`-tower the lift itself is not a canonical group element; changing the chosen prime conjugates it and the local restriction together. This choice does not replace `Fr_q` by `Fr_q^f` in the Euler factor.

**Semilocal `χ`-ray data (`ChiRayLocalData`).** Put `C=Gal(K′/K), Q=Nq, s=Fr_q|K′, f=ord(s)`, and choose `w|q`. The residue field at `w` has `Q^f` elements. After choosing a generator of its cyclic `p`-primary unit group, arithmetic Frobenius gives the following noncanonical module identification:

```text
U_q = (⊕_{w|q} k_w^×) ⊗ ℤ_p
    ≃ Ind_{⟨s⟩}^C (ℤ_p/(Q^f−1)),   s·u=Q u.
```

The projector `e_χ=d^{-1}∑_{g∈C}χ(g)^{-1}g` gives a cyclic `χ`-part of order `p^{v_p(Q−χ(s))}`. Indeed the stabilizer relation on that part is `(Q−χ(s))u=0`; factoring `Q^f−1` into its distinct Teichmüller roots shows that every other factor is a unit whenever this part is nonzero. If `Q` modulo `p` differs from `χ(s)`, the part is zero. The ray class exact sequence takes the quotient by the images of global units, so the local inertia degree `e_χ` in `K′(q)_χ/K′(1)_χ` divides `Q−χ(s)` in `ℤ_p`. It need not equal its `p`-part. The residue norm `k_w^×→k_q^×` is `u↦u^{1+Q+⋯+Q^{f−1}}`; this norm and the `χ`-projection are different maps. Tame reciprocity gives `sσs^{-1}=σ^Q` on local inertia, consistently with `χ(s)` modulo `e_χ`.

For unramified `T` the finite local module at `w` is `T/(Fr_q^f−1)T`, with the analogous quotient for `T/M`. The singular module for finite coefficients is `(T/M)(−1)^{Fr_q^f=1}`. Thus the rational-to-`K` Frobenius is `Fr_q`, whereas the Frobenius used to evaluate an unramified cocycle at `w` is `Fr_q^f`; the singular action has the additional `Q^{-1}` twist. When `M` divides `e_χ, Q≡χ(s)` modulo `M`. This accounts for the `χ^{−1}` shift, but does not determine the missing congruence between the upper and lower Euler-system classes.

Proof inputs are GlobalNumberFields Layer 2 for the ray class residue-unit exact sequence, ClassFieldTheory Layer 13 for the corresponding ray fields and Layer 7 for local reciprocity, and the finite unramified/tame cohomology dictionary of Layers 1.2 and 1.8. Rubin IX §4 pp.137–139 supplies the `χ`-fields and character action. The displayed induced-module calculation is the additional local-field transport; no formula for the third rigidity alternative is attributed to that source. For that alternative construct the integral operator relating the two local classes with denominator `e_χ`, and prove its compatibility with the Euler polynomial at `Fr_q` rather than `Fr_q^f`. Merely substituting `Q^f−1` for `Q−1` in IV.8.1 does not do this.

**Domain of a divided comparison.** Already at a first ray edge with `K′(1)_χ=K′`, the lower and upper unramified local classes can be identified with `b`,`a` in `H=T/(F^f−1)T`, respectively, where `F` is rational-to-`K` Frobenius on `T`. Corestriction from the totally ramified ray edge gives

```text
e_χ a = P_q(F⁻¹)b.
```

This identity only determines `a` modulo `H[e_χ]`. Indeed multiplication by `e_χ` identifies `H/H[e_χ]` with `e_χ H`. Applying its inverse to `P_q(F⁻¹)b` gives a well-defined divided class precisely for `b` in `P_q(F⁻¹)⁻¹(e_χ H)`. This uses the existing quotient-by-kernel isomorphism, not a choice of a torsion lift. It does not select an element of `H`. The arithmetic interface `ChiRayLocalData.norm_division_class` records this consequence of the norm relation; `chiRayIntegralClassComparison` is the assertion that recovers the actual upper class, with its `H[e_χ]` ambiguity resolved. At higher unramified local levels, the cohomology quotient uses `F^{f p^a}−1` for the local residue degree `f p^a`; the Euler factor remains `P_q` at `F`.

There need not be an endomorphism `A` of the whole `H` satisfying `e_χ A=P_q(F⁻¹)`. In the `p=3, q=2, T=ℤ₃(1)` example below, `H=ℤ₃/(2²−1)≃𝔽₃` and `P_q(F⁻¹)=2·id_H`. Every `3A` is zero. Thus a total divided endomorphism on `H` cannot be the general interface. An operator on admissible Euler-class data, with an argument selecting the torsion lift, is not ruled out by this calculation. The norm relation in this example forces `b=0` and leaves a arbitrary; no global Euler family is being asserted.

**Integral comparison and its exact torsion condition.** `chiRayIntegralClassComparison c` is the integral comparison for an actual global `χ`-Euler family `c`. For `d=1` it is a theorem for every family in an admissible tower (`chiRayIntegralClassComparison.ordinary` below) and is imposed by the third alternative. For `d>1` under any of the three alternatives, and for `d=1` under the second alternative alone, no source constructs the lift or proves the torsion congruence; there `chiRayIntegralClassComparison c` is a named hypothesis on `c`, not a target, and in the third alternative it is part of the definition. At a first ray edge identify the actual unramified lower and upper classes with `b` and `a` in `H` above. Define the lower input `ChiRayLowerData(c,q)` to consist of `c`'s components at the finite subextensions unramified at `q`, their restriction and corestriction maps, and the fixed representation, Frobenius and reciprocity data. It excludes the upper `q`-ramified components. A lift `chiRayCongruenceLift` assigns `a₀∈H` to this lower input, `O`-linearly and naturally, with

```text
[e_χ a₀ = P_q(F⁻¹)b],
[a₀] = norm_division_class(b) in H/H[e_χ].
```

For a fixed representation, tower and rigidity branch, its domain is the `O`-module of lower data occurring in global norm-compatible families satisfying that branch’s field, injectivity and local-finiteness assumptions. The congruence and its vanishing are excluded from the input: alternative `(c)` imposes the latter only for a given lift. This domain is not all of `H`. The predicate `chiRayTorsionCongruence` is the additional equality

```text
Δ_q(c) := a − chiRayCongruenceLift(ChiRayLowerData(c,q)) = 0 in H[e_χ].
```

The norm relation proves only membership in `H[e_χ]`. It does not prove this equality. An arbitrary section of `H→H/H[e_χ]`, or the assignment `a₀=a` using the excluded upper component, is not this construction. The API `ChiRayLowerData.restrict`, `.conjugate` and `.zero` records the lower-family maps; `chiRayCongruenceLift.norm`, `.naturality` and `.ordinary` records the displayed norm equation, compatibility with restriction and conjugation, and the ordinary formula below. At other ray levels, replace `H` by `T/(F^{fp^a}−1)T` and transport the whole lower diagram; do not change `P_q(F⁻¹)`. The derivative consequence is the `χ`-finite–singular equality in 3.16, with finite evaluation at `F^{fp^a}`, tame evaluation at `σ_q`, and the `Q⁻¹` singular twist from this dictionary. Where it is a hypothesis, `chiRayIntegralClassComparison c` asserts a lift with these properties and `Δ_q(c)=0` at every ray edge and level. In the third rigidity alternative this congruence is an extra hypothesis on the family, not something proved by that alternative's other two clauses.

The case `d=1` is a theorem. For `d=1` put `e=[K(q):K(1)]`, so `e|Q−1`. The polynomial

```text
A_q(X) = (P_q(X)−P_q(QX))/e ∈ O[X]
```

is integral, coefficient by coefficient. Define `a₀=A_q(F⁻¹)b`. Cayley–Hamilton `P_q(QF_T⁻¹)=0` gives `e a₀=P_q(F⁻¹)b`. Rubin's Corollary IV.8.1, p.77 of the draft, proves `Δ_q=0` for the actual global family in an admissible tower. In alternative `(c)` this congruence is imposed. Alternative `(b)` in IX.1, pp.134–135, proves the key cochain relation with a fixed annihilator loss and derivative primes refined from `M` to Mm; it does not justify cancelling torsion in `H` to assert this same integral equality. Thus `chiRayIntegralClassComparison.ordinary` has a definite formula and proof source. In the derivative-prime application `M` must divide `e` and `P_q(1)`, but the integral ordinary congruence itself does not require this `M`. For nontrivial `χ`, even the refined conditions of 3.16 need not make this same polynomial integral with denominator `e_χ`. The all-roots congruence modulo `M` proves derivative invariance; it is not an integral division by the potentially larger `e_χ`.

**Checks.**

- `ChiRayLowerData.upper_excluded`: Two one-edge local diagrams with `b=0, a=0` or 1 in `H=𝔽₃` and `e_χ=3` have the same lower data and norm class. A rule that reads a to define `a₀` passes the norm equation and fails this input contract. These diagrams are not asserted to extend to rigid global families.
- `ChiRayLowerData.zero`: The zero lower family must map to `a₀=0` by `O`-linearity, even when `H[e_χ]≠0`. Choosing a fixed nonzero lift of its zero quotient class violates this condition.
- `ChiRayLowerData.transport`: Conjugating a chosen prime and rational Frobenius transports the entire lower diagram and its quotient class. At `f=2` the finite evaluation still uses `F²`; substituting `F²` into `P_q(F⁻¹)` fails the existing `q=2` polynomial control.
- `chiRayTorsionCongruence.torsion_free`: If `H[e_χ]=0`, any constructed lift of the norm class equals the actual upper class. If `e_χ` is a unit, the total map `e_χ⁻¹P_q(F⁻¹)` is defined as an algebraic cancellation check; a trivial ray edge itself uses the identity relation. If `H=0` all comparisons are uniquely zero. None of these arguments permits cancellation when `H[e_χ]≠0`.
- `chiRayIntegralClassComparison.ordinary_sign`: For `P=1−X, A_q(X)=((Q−1)/e)X`. At `e=Q−1` it is `X`, with a positive sign. The polynomial identity `(1−X)−(1−QX)=(Q−1)X` fixes this sign; its negative would fail the cyclotomic-unit control.
- `chiRayIntegralClassComparison.refined_not_integral`: Take `p=3,K′=ℚ(√−11),q=17`. This prime is inert. The Minkowski bound is less than 3 and 2 is inert, so the class number is one; global units `±1` have trivial 3-primary image. Thus the 3-primary inertia degree is `e_χ=9`. On a rank-two local lattice let `F=[[0,−17],[1,3]]`. Then `P_q(X)=1−(3/17)X+(1/17)X²` and `F²−1=3B` with `B=[[-6,−17],[1,−3]], det B=35` a 3-adic unit. Hence `H≃(ℤ/3)²`. The eigenvalues of `F` modulo 3 are the two distinct signs, and its Hensel eigenspaces define an involution `τ` with both quotients `T/(τ∓1)T` free of rank one and `F≡τ` mod 3. Thus the local all-roots and representation conditions at `M=3` are compatible with this example. Nevertheless the `X`-coefficient of `[P_q(X)−P_q(17X)]/9` is `16/51`, not 3-integral. On `H, P_q(F⁻¹)=0`, so the norm equation alone allows every upper value, including nonzero ones when `b=0`. This is a local control, not a claim to construct an `E_M`-refined global prime or a rigid Euler system. The displayed matrix identity, determinant and coefficient distinguish depth three from inertia degree nine.

The precise hypotheses are as in each variant.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX §1, p. 133). The failure of rigidity without condition (ii) and the replacement (ii)`′`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX, Definition 3.1, p. 136). Finite depth.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX, Definition 4.1, p. 138). Anticyclotomic Euler systems.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX, Definition 5.1, p. 140). Triviality at `Σ`.

Each variant is the module cut out by the same corestriction equations in a different product; the predicates `(b), (c)` are stated with Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}` and congruence.

For `d = 1` a `χ`-anticyclotomic system is an Euler system; for `K = ℚ, d = 2` and `χ` odd quadratic, `K′` is imaginary quadratic and `𝒦′` an anticyclotomic `p`-extension (the setting of Heegner points).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.IsRigid`: Condition (ii)`′`: one of the alternatives `(a), (b), (c)`.
- `TauCeti.EulerSystems.FiniteDepthEulerSystem`: Euler systems for `W_M`.
- `TauCeti.EulerSystems.EulerSystem.toFiniteDepth`: `ES(T, 𝒦, N) → ES(W_M, 𝒦, N)` by reduction modulo `M`, compatible in `M`.
- `TauCeti.EulerSystems.AnticyclotomicEulerSystem`: `χ`-anticyclotomic Euler systems for `(T, 𝒦′, N)`.
- `TauCeti.EulerSystems.AnticyclotomicEulerSystem.of_trivial`: For `d = 1` (`χ` trivial) a `χ`-anticyclotomic Euler system is an Euler system.
- `TauCeti.EulerSystems.ChiRayLocalData`: The semilocal residue module with `C`-action, `χ`-projector, norm exponent and tame Frobenius action just constructed; `residue_chi_order`, `ray_degree_dvd`, `residue_norm`, and `local_frobenius_power` expose these identities. This data is not a completed definition of the third rigidity predicate.
- `TauCeti.EulerSystems.EulerSystem.IsTrivialAt`: `c_F ∈ S_Σ^{Σ_p}(F, T)` for every `F`.

**Checks.**

- `IsRigid.of_admissible`: An admissible tower supplies the rigidity conditions.
- `not_isRigid_failed_unramified`: Without an infinite direction, a family failing the ray unramified condition is not rigid.
- `IsRigid.of_injective_direction`: The ray unramified condition together with an injective `γ−1` direction in `H_M` gives rigidity.
- `FiniteDepth.unit_modulus` (degenerate): If `M∈O^×, W_M=0`, so the sole finite-depth system is zero. A definition retaining the lattice cohomology would fail this check.
- `FiniteDepth.coefficient_exponent` (computation): For `M=π²`, every component is killed by `π²`; a class of exact order `π²` is allowed and is not killed by `π`. The carrier must not silently reduce to `W_π`.
- `FiniteDepth.norm_nonexample`: In a one-edge norm diagram over `O/π²` with corestriction the identity and Euler factor 1, components (1,0) fail the relation; the product of all cohomology groups is too large.
- `Anticyclotomic.trivial_character`: For `d=1` the `χ`-ray fields, `χ`-action and second rigidity alternative reduce to their untwisted versions; in particular `ε_cyc(γ)=1` is recovered.
- `Anticyclotomic.quadratic_action`: For `d=2` a lift of the nontrivial automorphism sends a cyclic `p`-group generator `σ` to `σ⁻¹`. For odd `p`, replacing that action by the trivial action fails whenever `σ≠1`.
- `Anticyclotomic.eigenspace_shift`: For `d=2, χ^0` finite classes map to `χ`-singular classes; `χ`-finite classes map to the trivial singular part. An equivariant scalar comparison would give the wrong parity.
- `ChiRayLocalData.inert_quadratic` (computed): Take `p=3, K=ℚ, K′=ℚ(√−11), q=2`. The polynomial `x²−x+3` is irreducible modulo 2, so `f=2` and the residue field is `𝔽₄`. Its unit group has order 3. The only global units are `±1` and have trivial image there. The Minkowski bound is less than 3, and there is no ideal of norm 2, so the class number is one. Hence `e_χ=3`, dividing `Q−χ(s)=2−(−1)=3` but not `Q−1=1`. This rules out the ordinary ray denominator.
- `Anticyclotomic.ray_degree`: Take `K′=ℚ(i), p=3, q=11`. Its residue group is `𝔽₁₂₁^×` of order 120, with cyclic 3-part of order 3. The four global units have prime-to-3 order and the class number is one. Conjugation acts by 11`≡−1` modulo 3, so `e_χ=3` divides `11+1=12` and does not divide `11−1=10`. This check concerns a `χ`-ray field, not an exceptional-unit ring-class degree formula.
- `ChiRayLocalData.divided_operator` (local negative control): In the same `p=3, q=2` example take `T=ℤ₃(1)⊗χ`. Rational-to-`ℚ` Frobenius is `F=−2` on `T` and `P_q(X)=1+X`. The ordinary candidate `[P_q(X)−P_q(2X)]/e_χ=−X/3` is not in `ℤ₃[X]`. Replacing 2 by the residue cardinality 4 gives `−X`, but `P_q(4F^{-1})=−1`, whereas the required Cayley–Hamilton identity is `P_q(2F^{-1})=0`. Thus the two substitutions fail for different computed reasons. This is a test of the proposed local operator, not a claim to construct a global Euler system.
- `ChiRayLocalData.auxiliary_prime`: In the same `q=2` ray field, `T=ℤ₃(1)` gives `P_q(X)=1−X` and `P_q(1)=0`, so `M=3` divides both the ray degree and `P_q(1)`, as required for a derivative prime. The ordinary quotient `[P_q(X)−P_q(2X)]/3=X/3` is still nonintegral. Replacing 2 by 4 makes it `X` but changes `P_q(2/2)=0` into `P_q(4/2)=−1`. Thus the failed substitutions are not confined to primes outside the derivative set. At the unramified local module `k_w^×⊗ℤ₃≃ℤ/3`, corestriction from the totally ramified degree-three ray layer is multiplication by 3. Lower class 0 and upper classes 0 or 1 have the same norm relation. The residue dictionary and norm relation alone do not choose an integral divided operator. This local calculation makes no assertion of a global Euler-system counterexample.
- `ChiRayLocalData.no_total_division`: On `H=𝔽₃` in the preceding derivative-prime example, `F⁻¹=2` and `P_q(F⁻¹)=1−2=2`. For every `𝔽₃`-linear `A, 3A=0≠2·id`. This obstruction applies to every endomorphism, independently of a polynomial formula. When `H[e_χ]=0` the norm relation has at most one upper value; when `e_χ` is a unit its divided comparison is total. These cases distinguish uniqueness from existence on the admissible domain.
- `ChiRayLocalData.norm_exponent`: For `f=1` the residue norm exponent is 1; for `f=2` it is `1+Q`. In the preceding `𝔽₄/𝔽₂` example it is 3 and the norm kills the entire unit group. It is not multiplication by `Q−1`.
- `ChiRayLocalData.unit_quotient`: If global units surject onto the `χ`-residue group, `e_χ=1` even when `p` divides `Q−χ(s)`; the local residue order is an upper bound, not a ray-degree equality. For `d=1` the stabilizer has `f=1` and the bound reduces to the `p`-part of `Q−1`.
- `IsTrivialAt.empty`: For `Σ=∅` the predicate imposes no additional strict local condition.
- `IsTrivialAt.zero`: The zero system is trivial at every finite `Σ`, including primes where `T` is ramified.
- `IsTrivialAt.local_nonzero`: At `q∈Σ` a system with nonzero localization is not trivial at `Σ`, even if that localization is unramified. Strictness cannot be replaced by unramifiedness.

A system of infinite depth gives one of depth `M` for every `M`.

The counterexample family (`c_K` arbitrary, others 0) satisfies none of `(a), (b), (c)` when `c_K ∉ S^{Σ_p}`.

Additional arithmetic check: If the chosen tower has no nontrivial finite subextension unramified at every finite place (for example `K` has narrow class number one), `P(Fr_q^{-1} | T^*; 1) = 0` for all `q ∤ N` and `𝒦` is the maximal abelian extension of `K` unramified at every prime dividing `N`, the family `c_K = x, c_F = 0` for `F ≠ K` is an Euler system for every `x ∈ H¹(K, T)`; for `x ∉ S^{Σ_p}(K, T)` it satisfies none of `(a), (b), (c)`.

Additional arithmetic check: For `K=ℚ(√3)`, the Minkowski bound `√3<2` gives ordinary class number one. But `F=K(i)=ℚ(ζ₁₂)` has discriminant `144=12²`, so `F/K` is unramified at every finite place and ramified at infinity. For `p=5`, `T=ℤ₅(1)` and `N=(5)`, the indicated tower contains `F`; its norm relation has empty Euler-factor product 1. Taking `c_F=0` and `c_K` the nonzero Kummer class of 2 would force `0=c_K`, and is excluded by the strengthened hypothesis.

Additional arithmetic check: For `K = ℚ, χ` the quadratic character of an imaginary quadratic field `K′: d = 2` and the relation at a prime `ℓ` inert in `K′` uses `P(Fr_ℓ^{-1} | T^*; Fr_ℓ^{-1})` with `Fr_ℓ ∈ G_ℚ`, whose square is the Frobenius of the prime of `K′` above `ℓ`.

*Needs:* Layer 2.2 The module of Euler systems; Layer 2.3 Euler-system classes are unramified away from `p`.

### 2.9 Anticyclotomic Euler systems over ring class fields

Let `f` be a newform of weight `2r` and level `N, p ∤ 2(2r − 1)!Nφ(N), K` an imaginary quadratic field in which every prime dividing `N` splits, with `O_c^× = {±1}` (that is, `c > 1` or |`D_K`|>4) and, when `r>1`, either |`D_K`|>3 odd or `8|D_K` (the canonical CM setting of Castella–Hsieh §4.1), `T` the `G_ℚ`-stable `O`-lattice in the self-dual twist `V` of the `p`-adic representation of `f` with its `G_ℚ`-equivariant perfect pairing `T × T → O(1)`, and `χ : Gal(K_{c_o p^∞}/K) → O^×` a locally algebraic anticyclotomic character of infinity type `(j, −j)` and conductor `cO_K, c = c_o p^s` with `(c_o, pN) = 1`. Let `𝒦` be the set of squarefree products of primes `ℓ` inert in `K` with `ℓ ∤ 2pNc_o, K_n` the ring class field of conductor `n, τ` complex conjugation and `w_f` the Atkin–Lehner sign; choose `𝔑 ⊆ O_K` of norm `N` and let `σ_𝔑` be its Artin element. Cohomology is unramified outside the places above `pNc_on` as in §7.1. An anticyclotomic Euler system for `(T, χ)` is a family `c = (c_n)_{n∈𝒦}` with `c_n ∈ H¹(K_{cn}, T ⊗ χ^{-1})` such that for every `n = mℓ ∈ 𝒦`: (E1) `cor_{K_{cn}/K_{cm}}(c_n) = a_ℓ(f)·c_m`; (E2) `loc_ℓ(c_n) = res(loc_ℓ(c_m)^{Frob_ℓ})` along `K_{cm,λ} ⊆ K_{cn,λ}`; (E3) if `χ² = 1, c_n^τ = w_f χ(σ_𝔑)·c_n^{σ_𝔑}`. The bottom class is `c_K = cor_{K_c/K}(c_1) ∈ H¹(K, T ⊗ χ^{-1})`. The families form an `O`-submodule of `∏_{n∈𝒦} H¹(K_{cn}, T ⊗ χ^{-1})`. This is Nekovář's notion, distinct from Rubin's `χ`-anticyclotomic Euler systems (Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems`(c)`): the norm relation carries the Hecke eigenvalue `a_ℓ(f)` of an inert prime, and the tower is the ring class tower rather than ray class fields. In (E2), use rational arithmetic Frobenius on the locally untwisted `T`, as in Lemma4.7 pp.18–19; evaluation on finite `H¹` uses its square, the Frobenius of `K_λ`. This convention is part of the definition.

The precise hypotheses are: `f` a newform of weight `2r` and level `N` prime to `p`; `T` the Nekovář lattice with its perfect pairing; `χ` anticyclotomic of conductor `c_o p^s` with `(c_o, pN) = 1`; Castella–Hsieh `(H)(a)`–`(c)`, including both canonical CM discriminant branches when `r>1`; `O_c^× = {±1}`, that is `c > 1` or `|D_K|>4`, which gives the full degree `ℓ+1` of `K_{cℓ}/K_c` used by the operators of Layers 3.6–3.8 and 4.7; no splitting assumption on `p`. The general conductor-change degree `(ℓ+1)/[O_c^×:O_{cℓ}^×]`, including exceptional units at `c = 1`, is the ClassFieldTheory boundary above; that branch is outside these operators.

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.1 and §7.2, Definition 7.1, pp. 28–29 (author's version)). fixes the self-dual Nekovář lattice with its pairing and defines anticyclotomic Euler systems over ring class fields by the relations (E1)–(E3)

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.3, Proposition 7.4, p. 31 (author's version)). verifies (E1)–(E3) for the `χ^{-1}`-components of the generalised Heegner classes

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.4, Lemma4.7 and proof, pp.18–19). Pins rational Frobenius in the local norm congruence, independently of the square used to evaluate finite cohomology.

The conditions (E1)–(E3) are `O`-linear equations in the product of the cohomology groups, so the families form a submodule (an equaliser of the corestriction, localisation and conjugation maps).

The bottom class is the corestriction of `c_1`; under (E1) it agrees with `cor_{K_{cn}/K}(c_n)/∏_{ℓ|n} a_ℓ(f)` whenever the `a_ℓ(f)` are invertible, which is not assumed.

The character is locally trivial at an inert auxiliary prime: its unramified Frobenius value on the principal ideal `(ℓ)` is 1. Lemma4.7 therefore defines the rational Frobenius action after forgetting the locally trivial character line; it is not a global action on a nonquadratic twist.

**API.**

- `TauCeti.EulerSystems.RingClassEulerSystem`: The `O`-submodule of `∏_{n∈𝒦} H¹(K_{cn}, T ⊗ χ^{-1})` cut out by (E1)–(E3).
- `TauCeti.EulerSystems.RingClassEulerSystem.eval`: `c ↦ c_n`, an `O`-linear map to `H¹(K_{cn}, T ⊗ χ^{-1})`.
- `TauCeti.EulerSystems.RingClassEulerSystem.cor_eval`: (E1): `cor_{K_{cn}/K_{cm}}(c_n) = a_ℓ(f)·c_m` for `n = mℓ`.
- `TauCeti.EulerSystems.RingClassEulerSystem.loc_eval`: (E2): `loc_ℓ(c_n) = res(loc_ℓ(c_m)^{Frob_ℓ})`. Here `Frob_ℓ` is rational Frobenius on the locally untwisted `T`; `Fr_λ=Frob_ℓ²` is used for finite evaluation.
- `TauCeti.EulerSystems.RingClassEulerSystem.conj_eval`: (E3): for `χ² = 1, c_n^τ = w_f χ(σ_𝔑) c_n^{σ_𝔑}`.
- `TauCeti.EulerSystems.RingClassEulerSystem.bottom`: `c_K = cor_{K_c/K}(c_1)`.
- `TauCeti.EulerSystems.RingClassEulerSystem.ext`: Two systems with the same `c_n` for all `n ∈ 𝒦` are equal.
- `TauCeti.EulerSystems.RingClassEulerSystem.twist`: Multiplication by a scalar of `O` and restriction of the index set to the products of primes in a subset of `𝒦` preserve (E1)–(E3).

**Checks.**

- `RingClassEulerSystem.zero_mem` (degenerate): The family `c_n = 0` for all `n` satisfies (E1)–(E3) and has `c_K = 0`.
- `RingClassEulerSystem.bottom_def` (computation): For `c_o = 1` and `χ` of conductor `p^s, c_K = cor_{K_{p^s}/K}(c_1)`; for `χ` trivial and `c = 1, c_K = cor_{K_1/K}(c_1)`.
- `RingClassEulerSystem.not_rubin_relation` (non-example): `A` family satisfying Rubin's Euler-polynomial corestriction relation of Layer 2.2 The module of Euler systems along ray class fields need not satisfy (E1): at an inert `ℓ` the ring class extension `K_{cℓ}/K_{c}` is cyclic of order `ℓ + 1` under the stable-unit hypothesis, and (E1) multiplies by `a_ℓ(f)`, not by an Euler factor evaluated at Frobenius.
- `RingClassEulerSystem.exceptional_units` (excluded boundary): For `K = ℚ(i)`, `c = 1` and the inert prime `ℓ = 3`, `[O_K^×:O_3^×] = 2`; the order of conductor 3 has discriminant `−36` and class number 2, so `[K_3:K_1] = 2`, not `ℓ + 1 = 4`. Here `|D_K| = 4 > 3`, and the hypothesis `O_c^× = {±1}` excludes the datum.
- `RingClassEulerSystem.heegner_weight_two` (compatibility): For `r = 1` and `χ = 1`, the Kummer images of Heegner points `y_n ∈ E(K_n)` satisfy (E1) with `a_ℓ(f) = a_ℓ(E)`.
- `RingClassEulerSystem.frobenius_square` (non-example): At an `M`-admissible inert `ℓ`, rational Frobenius `J` has eigenvalues `+1` and `−1` modulo `π^M`, whereas `Fr_λ=J²` acts as 1. Substituting `Fr_λ` for rational Frobenius in (E2) changes its action on the negative eigenspace.

Generalised Heegner classes `z_{f,χ^{-1},nc}` satisfy (E1)–(E3) (Castella–Hsieh, Proposition 7.4), and so do their Iwasawa-theoretic specialisations (Proposition 7.8); Proposition 7.4 is proved for `p` split in `K` and `−r<j<r`, and Proposition 7.8 for `p` split in `K`, `f` ordinary at `p` and `j≥r` (Castella–Hsieh §§7.3–7.4, pp. 31–32).

For `f` of weight two and `χ` trivial, the Kummer images of Heegner points satisfy (E1)–(E3).

The zero family is an Euler system; such a system carries no arithmetic information and every theorem using it needs `c_K ≠ 0`.

Used by `Castella–Hsieh, §7.2, Definitions 7.1–7.2 and Theorem 7.3`: the input of Kolyvagin's descent for generalised Heegner cycles

Used by `Layer 3.8 Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at p`: the derivative classes `κ(n)` are built from the `c_n`

*Needs:* Layer 2.2 The module of Euler systems; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; `TauCetiRoadmap.ClassFieldTheory Layer 13`; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence.

### Examples

For rank-one Frobenius multiplication by `N(q)`, the Rubin polynomial is `1−X` and the MR polynomial is `1−N(q)X`.

For the zero representation both Euler polynomials equal 1.

The zero family is an Euler system.

### Dependencies

This layer uses `LinearMap.charpoly`; `LinearMap.aeval_self_charpoly`; Layer 2.1 Euler polynomials and their conventions; Layer 1.1 The fields `K(q), K(r)` and their Galois groups; `TauCeti.ContCohomology.explicitCor1`; `TauCeti.ContCohomology.explicitCor1_comp_res1`; `ArithmeticGaloisDuality §R02.1.2 (Comparison with the canonical carrier)`; Layer 2.2 The module of Euler systems; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`; Layer 0.7 The canonical and the unramified Selmer structures; `TauCetiRoadmap.ClassFieldTheory Layer 13`; Layer 2.4 The conductor-indexed presentations; `MonoidAlgebra`; Layer 2.3 Euler-system classes are unramified away from `p`; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence.

The proof also uses Rubin Lemma IX.6.3 and Corollary IX.6.4 in full, Proposition IV.3.1(iv)–`(v)`, Lemmas IV.2.5, IV.4.6 and Proposition IV.4.7 as separate statements.

Smoothing of arithmetic Euler families is an explicit application input.

The Beilinson–Flach classes of Kings–Loeffler–Zerbes are a construction of arithmetic classes, outside this roadmap's scope.

## Layer 3: Kolyvagin derivatives

### 3.1 The norm and Kolyvagin derivative operators

Let `Γ` be a finite cyclic group of order `n` with generator `σ`. In `ℤ[Γ]` put `N_Γ = Σ_{γ ∈ Γ} γ` and `D_σ = Σ_{i=0}^{n−1} i·σ^i`. Then `(σ − 1)D_σ = n − N_Γ`. For a prime `q ∤ p`, with `Γ_q = Gal(K(q)/K(1))` and the generator `σ_q` fixed through tame inertia (a generator `ξ` of `lim μ_{p^n}` and a prime of `K̄` above `q`), write `N_q = N_{Γ_q}` and `D_q = D_{σ_q}`; for squarefree `r, N_r = ∏_{q | r} N_q = Σ_{σ ∈ Γ_r} σ` and `D_r = ∏_{q | r} D_q ∈ ℤ[Γ_r]`, with `N_r = N_sN_{r/s}` and `D_r = D_sD_{r/s}` for `s | r`. Under the augmentation `ε, ε(N_Γ) = n` and `ε(D_σ) = n(n − 1)/2`. For another generator `σ^a` (a prime to `n`) and `a′a ≡` 1 `(mod n), D_{σ^a} − a′D_σ ∈ nℤ[Γ]`.

The precise hypotheses are `Γ` finite cyclic with a chosen generator.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Definition 4.1 and (4), p. 62). The operators `D_q, D_r` and the identity `(σ_q − 1)D_q = |Γ_q| − N_q`.

Telescoping: `(σ − 1)Σ_{i<n} iσ^i = Σ_{i=1}^{n} (i − 1)σ^i − Σ_{i<n} iσ^i = (n − 1)σ^n − Σ_{i=1}^{n−1} σ^i = n − N_Γ`, using `σ^n = 1`.

Products: `Γ_r ≅ ∏ Γ_q`, and elements of `ℤ[Γ_q]` for different `q` commute.

Change of generator: `D_{σ^a} = Σ_i i·σ^{ai} = Σ_j (a′j mod n)·σ^j`, which is congruent to `a′·Σ_j j·σ^j` modulo `n`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.normElement`: `N_Γ = Σ_{γ ∈ Γ} γ ∈ ℤ[Γ]` for a finite group `Γ`.
- `TauCeti.KolyvaginSystems.kolyvaginDerivative`: `D_σ = Σ_{i < n} i·σ^i ∈ ℤ[Γ]` for `σ` of order `n`.
- `TauCeti.KolyvaginSystems.sub_one_mul_kolyvaginDerivative`: `(σ − 1)·D_σ = n − N_Γ` when `σ` generates `Γ` of order `n`.
- `TauCeti.KolyvaginSystems.augmentation_kolyvaginDerivative`: `ε(D_σ) = n(n − 1)/2` and `ε(N_Γ) = n`.
- `TauCeti.KolyvaginSystems.kolyvaginDerivative_prod`: For `Γ = Γ₁ × Γ₂` and `r = st: D_r = D_s·D_t` and `N_r = N_s·N_t` in `ℤ[Γ₁ × Γ₂]`.
- `TauCeti.KolyvaginSystems.kolyvaginDerivative_generator`: For a`·a′ ≡` 1 `(mod n): D_{σ^a} − a′·D_σ ∈ n·ℤ[Γ]`.
- `TauCeti.KolyvaginSystems.normElement_eq_representation_norm`: For a representation `ρ` of `Γ`, the action of `N_Γ` is Mathlib's Representation.norm `ρ`.

**Checks.**

- `kolyvaginDerivative_order_two`: For order 2, `D_σ=σ`.
- `kolyvaginDerivative_order_three`: For order 3, `D_σ=σ+2σ²`.
- `kolyvaginDerivative_trivial`: For `m = 1` (the trivial cyclic group) the derivative is zero, whatever the chosen element.
- `kolyvaginDerivative_not_norm_multiple`: If `σ` has order `n ≥ 2`, `(σ−1)D_σ = n − N` is nonzero in the integral group ring: its coefficient at the identity is `n − 1`.
- `normElement_trivial`: For the trivial group, `N_Γ=1` and `ε(N_Γ)=1`, whereas `D_1=0`.
- `normElement_order_two`: In `ℤ[C₂], N_Γ=1+σ` and `ε(N_Γ)=2`, while `D_σ=σ`. The coefficient of the identity distinguishes the two operators.
- `augmentation_basis`: Every group element `γ` has `ε(γ)=1`; hence `N_Γ` acts by `|Γ|` on the trivial representation, agreeing with `Representation.norm`. The zero augmentation map fails this check.
- `augmentation_derivative_order_three`: In `ℤ[C₃], ε(σ+2σ²)=3=ε(1+σ+σ²)`, although the two group-ring elements differ. Equal augmentation does not identify a derivative with a norm.

For `n = 2: D_σ = σ` and `(σ − 1)σ = 1 − σ = 2 − (1 + σ)`.

The identity is the only property of `D_q` used in the invariance of derivative classes.

*Needs:* `MonoidAlgebra`; `Representation.norm`; Layer 1.1 The fields `K(q), K(r)` and their Galois groups.

For a lift `σ` not assumed to have order `m`, define `liftedNorm σ m = Σ_{i<m} σ^(i+1)` in `ℤ[G]`. Its API comprises the empty sum, concatenation `N(σ,m+n) = N(σ,m) + σ^m N(σ,n)`, equality with the group norm when `σ` generates a cyclic group of order `m`, and `sub_one_mul_kolyvaginDerivative_lifted`: `(σ − 1) D(σ,m) = m σ^m − N(σ,m)`. The specialization `sub_one_mul_kolyvaginDerivative_of_pow_eq_one` assumes `σ^m = 1`. These are the lifted identity (9) of Rubin IV §7, p.75; a decomposition-group lift need not have the order of its inertia image.

**Checks.**

- `liftedNorm_zero`: `m = 0` gives `D = N = 0` and both sides zero.
- `m = 1` gives `D = 0` and `N = σ`, so the right side is `σ − σ`, not `1 − σ` for an arbitrary lift.
- At order two, `N = σ + 1` and `D = σ`, giving `(σ − 1)σ = 1 − σ`.

### 3.2 The induced module, the connecting map and lifts of an Euler system

Let `𝕎_M = Maps_cont(G_K, W_M)` with `(γf)(g) = f(gγ)`, containing `W_M` via `t ↦ (g ↦ gt)`. `(a)` For `K ⊂_f L ⊆ K_∞(r)` there is a canonical `δ_L : (𝕎_M/W_M)^{G_L} → H¹(L, W_M)` with `0 → W_M^{G_L} → 𝕎_M^{G_L} → (𝕎_M/W_M)^{G_L} → H¹(L, W_M) → 0` exact; `δ_L(f)` is represented by `γ ↦ (γ − 1)f̂` for a lift `f̂ ∈ 𝕎_M`; and `δ` commutes with restriction and with norm/corestriction. `(b)` For an Euler system `c` and `r ∈ R` there is a family of `O[G_K]`-maps `d_F : X_{F(r)} → (𝕎_M/W_M)^{G_{F(r)}}, K ⊂_f F ⊆ K_∞`, with `δ_{F(r)} ∘ d_F` equal to `x_{F(s)} ↦ c_{F(s)} (mod M)` and compatible with norms `N_{F′(r)/F(r)}`; each `d_F` is unique up to `Hom_{O[G_K]}(X_{F(r)}, 𝕎_M)`.

The precise hypotheses are an Euler system for an admissible tower; `0 ≠ M ∈ O`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Proposition 4.5, pp. 63–64). The connecting map `δ_L` and its properties.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Proposition 4.8, p. 65). Existence and uniqueness of the lifts `d_F`.

`(a): 𝕎_M` is induced, hence `H¹(L, 𝕎_M) = 0`; take `G_L`-cohomology of `0 → W_M → 𝕎_M → 𝕎_M/W_M → 0`. The cocycle formula and the compatibility with corestriction are in Tau Ceti for discrete coefficients (the connecting map of a short exact sequence and `explicitCor_delta0`).

`(b)`: the obstruction to lifting `X_{F(r)}/M → H¹(F(r), W_M)` through `δ` lies in `Ext¹` of `X_{F(r)}/M` against the induced module, which vanishes by the freeness of the universal Euler system (Layer 2.7 The universal Euler system, Proposition IV.3.4) and the structure of `𝕎_M^{G_{F(r)}}` as a free `(O/M)[Gal(F(r)/K)]`-module (Lemma IV.4.6); pass to the limit over `F` using Proposition IV.4.7.

If `W^{G_{F(r)}} = 0` the lift is unnecessary: restriction `H¹(F, W_M) → H¹(F(r), W_M)^{Gal(F(r)/F)}` is an isomorphism.

*Needs:* Layer 2.7 The universal Euler system; `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`; `TauCeti.ContCohomology.explicitCor1`.

### 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits

For a Selmer triple `(T, F, P)`: a Kolyvagin system is a family `κ = (κ_n)_{n ∈ N(P)}` with `κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n` such that for every prime `q` with `nq ∈ N(P), (κ_{nq})_{q,s} = φ^fs_q(κ_n)` in `H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}`, where the left side is localisation at `q` followed by projection to the singular quotient, and the right side is localisation, reduction modulo `I_{nq}` and `φ^fs_q ⊗ 1`. `KS(T, F, P)` is the `R`-module of Kolyvagin systems. A weak Kolyvagin system has `κ_n ∈ H¹_{F^n}(K, T/I_nT) ⊗ G_n` with the same relation. The generalised module is `K̄S(T, F, P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j)`, with a natural map `KS → K̄S`; every `κ̄ ∈ K̄S` has a class `κ̄_1 ∈ H¹_F(K, T)`. The order of vanishing of `κ ≠ 0` is `ord(κ) = min{ν(n) : κ_n ≠ 0}`, and `L(T) = {κ_1 : κ ∈ KS(T)} ⊆ H¹_F(K, T)` is the module of `L`-values. The blind spot of `κ̄` is the set of ideals `I` with zero image in `K̄S(T/I)`.

The precise hypotheses are a Selmer triple; for the relation, `T/I_{nq}T` satisfies the hypotheses of the finite–singular comparison at `q`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.1.3, p. 20). The concrete definition and relation (5).

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.1.6, p. 21). The generalised module and the map to it.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.1.8, p. 21). Weak Kolyvagin systems.

`KS` is the submodule of `∏_n H¹_{F(n)}(K, T/I_nT) ⊗ G_n` cut out by the relations: an equaliser, containing 0.

Functoriality (Remark 3.1.4): direct sums; change of ring `KS(T) ⊗ R′ → KS(T ⊗ R′)`; restriction to `P′ ⊆ P`; inclusion `KS(T, F′) ⊆ KS(T, F)` for `F′ ≤ F`; and for `n ∈ N` a map `KS(T, F, P) ⊗ Hom(G_n, R/I_n) → KS(T/I_nT, F(n), P(n))`.

In a Kolyvagin system `(κ_{nq})_q` is determined by `(κ_n)_q` (Remark 3.1.7); a weak system determines `κ_n` only modulo `H¹_F(K, T/I_nT)` (Remark 3.1.9).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.KolyvaginSystem`: The `R`-submodule `KS(T, F, P)` of `∏_{n ∈ N(P)} H¹_{F(n)}(K, T/I_nT) ⊗ G_n` defined by the finite–singular relations.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.eval`: `κ ↦ κ_n, R`-linear.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.singular_eq_finiteSingular`: `(κ_{nq})_{q,s} = φ^fs_q(κ_n)` for `nq ∈ N(P)`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.ext`: `κ = κ′` iff `κ_n = κ′_n` for all `n`.
- `TauCeti.KolyvaginSystems.WeakKolyvaginSystem`: Families in `∏_n H¹_{F^n}(K, T/I_nT) ⊗ G_n` with the same relations; `KS ≤` weak `KS`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.map`: Change of ring, of `P`, and of `F` as in Remark 3.1.4, each `R`-linear and compatible with eval.
- `TauCeti.KolyvaginSystems.GeneralizedKolyvaginSystem`: `K̄S(T, F, P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j)`, with toGeneralized : `KS → K̄S` and `κ̄ ↦ κ̄_1 ∈ H¹_F(K, T)`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.ord`: `ord(κ) = min{ν(n) : κ_n ≠ 0} ∈ ℕ∞`, with `ord(0) = ⊤`.
- `TauCeti.KolyvaginSystems.moduleOfLValues`: The image submodule of conductor-one evaluation `KS(T)→H¹_F(K,T)`.
- `TauCeti.KolyvaginSystems.blindSpot`: Ideals `I` for which the image of `κ̄` in `K̄S(T/IT)` vanishes; this records vanishing of the whole system, not just its leading class.

**Checks.**

- `KolyvaginSystem.zero_mem`: The zero Kolyvagin system has order infinity.
- `KolyvaginSystem.empty_primes`: For an empty prime set, evaluation gives `KS≃H¹_F(K,T)`.
- `KolyvaginSystem.not_product`: `A` family with zero upper component and nonzero lower finite–singular localization at an edge is not a Kolyvagin system.
- `WeakKolyvaginSystem.empty_primes`: With `P=∅`, weak and ordinary systems both equal `H¹_F(K,T)`; with one conductor prime, a weak class with nonzero finite part is excluded from ordinary `KS`.
- `WeakKolyvaginSystem.edge_nonexample`: In a field edge model with `φ^fs=id`, lower value 1 and upper singular value 0 violate the weak equation too; relaxing transversality does not remove that equation. The zero family satisfies it.
- `GeneralizedKolyvaginSystem.constant_diagram`: If all transition systems are the same module `M` with identity maps, the inverse/direct limit is `M`, not a product of copies of `M`.
- `GeneralizedKolyvaginSystem.inverse_compatibility`: In the quotient tower `R/π²→R/π`, components `(1 mod π²,0 mod π)` are not compatible, while (1,1) and (0,0) are. Restriction in `j` must also identify a system with its restricted representative.
- `moduleOfLValues.zero_image`: If evaluation at 1 is zero, its image is 0 even if `KS` is nonzero; the zero system always maps into that image.
- `moduleOfLValues.nonunit_image`: If a free rank-one system module has generator with leading value `π^s` in a free rank-one Selmer module, its image is `π^sR`, becoming all `R` exactly for `s=0`.
- `blindSpot.zero_system`: Every coefficient ideal is in the blind spot of the zero system.
- `blindSpot.unit_ideal`: The unit ideal is in every blind spot since `T/T=0`. A residual nonzero system has `m` outside its blind spot.
- `blindSpot.zero_ideal`: The zero ideal belongs exactly when the original generalized system is zero; a nonzero system with zero leading class therefore still has the zero ideal outside its blind spot.
- `moduleOfLValues.sum`: If leading evaluations generate values `a` and `b`, their image contains `a+b` and every `R`-linear combination. For the algebraic evaluation model `R²→R, (x,y)↦ax+`by, the image is `(a,b)`, which need not be principal.
- `order.leading_zero`: In a formal conductor diagram with first nonzero component at a one-prime conductor, the order is 1 even though `κ_1=0`. For a nonzero leading component it is 0; the zero family has order `∞`.

The zero family is a Kolyvagin system; a system may have `κ_1 = 0`.

For core rank one `KS → K̄S` is an isomorphism (Layer 5); in general it is neither injective nor surjective.

Additional arithmetic check: `κ_1 ∈ H¹_F(K, T) ⊗ ℤ = H¹_F(K, T)`: the stalk at 1 has `I_1 = 0, G_1 = ℤ` and `F(1) = F`.

Additional arithmetic check: For `T = ℤ_p(1), Σ(F) = {p, ∞}` relaxed at `p`, the raw derivative classes of cyclotomic units form a weak Kolyvagin system whose finite parts `(κ_n)_{ℓ,f}, ℓ | n`, are not zero in general, so it is not a Kolyvagin system (Example 3.1.10).

*Needs:* Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.8 The finite–singular comparison map; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 0.1 Selmer triples and squarefree conductors.

### 3.4 Invariance of the derivative of the universal class

Let `K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O` and `r ∈ R_{F,M}`. If `N_{F(1)/F} ∈ ℤ[Gal(F(r)/F)]` restricts to `Σ_{γ ∈ Gal(F(1)/F)} γ`, then `N_{F(1)/F}D_r x_{F(r)} ∈ (X_{F(r)}/M X_{F(r)})^{Gal(F(r)/F)}`, independently of the choice of `N_{F(1)/F}`. Consequently for an Euler system `c` the image of `N_{F(1)/F}D_r c_{F(r)}` in `H¹(F(r), W_M)` is fixed by `Gal(F(r)/F)`.

The precise hypotheses are `r ∈ R_{F,M}`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Lemma 4.2, p. 62). The invariance statement.

Show `(σ − 1)D_r x_{F(r)} ∈ M X_{F(r)}` for `σ ∈ Gal(F(r)/F(1))` by induction on the number of primes of `r`: for `r = qs, (σ_q − 1)D_r = (|Γ_q| − N_q)D_s` and `N_q x_{F(r)} = P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} ≡ P(Fr_q^{-1} | T^*; 1)x_{F(s)}` modulo `(Fr_q − 1)D_s x_{F(s)}`.

Both `M` | |`Γ_q`| and `M | P(Fr_q^{-1} | T^*; 1)` hold by definition of `R_{F,M}`; `Fr_q` acts on `x_{F(s)}` through `Gal(F(s)/K)`, where the induction hypothesis applies since `q` splits completely in `F(1)/K`.

For `r = q: (σ_q − 1)D_q x_{F(q)} = |Γ_q|x_{F(q)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_F ∈ M X_{F(q)}`.

*Needs:* Layer 3.1 The norm and Kolyvagin derivative operators; Layer 2.7 The universal Euler system; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`.

### 3.5 Selected descent through a map with bounded kernel and cokernel

Let `R` be commutative, `A` and `B R`-modules, `f:A→ₗ[R]B`, and `a∈R` annihilate `ker(f)` and `coker(f)`. For `x∈B` choose `b` with `f(b)=a x` and set `d_a(x)=a²b`. This defines an `R`-linear map `B→A`, independent of `b`, with `f(d_a(x))=a³x` and `d_a(f(y))=a³y`. It is a selected scaled inverse, not a uniqueness assertion about all preimages. If `f` factors as `A` —`r→ C` —`s→ B`, a kills `ker(s)`, and `z∈C` satisfies `s(z)=x`, then `r(d_a(x))=a³z`.

The precise hypotheses are: `R` commutative; `A` and `B R`-modules; a annihilates `ker(f)` and `coker(f)`; For the factorisation assertion `f=s∘r`, the same a annihilates `ker(s)`.

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.2, p.29, bounded restriction and the printed uniqueness claim). Motivation for the corrected selection; the module calculation here supplies the comparison, rather than attributing it to the source.

The cokernel condition supplies `b`. If `b` and `b′` work, `a(b−b′)=0`; hence `a²b=a²b′`. Choose sums and scalar multiples of witnesses to prove linearity. For `x=f(y)`, take `b=a y`.

For the factorisation identity `s`(`r(b)−`a `z`)`=0`. Thus a `r(b)=a²z`, and multiplying once more by a gives `r(a²b)=a³z`. This is the compatibility needed for a cyclic cochain lift; no injectivity of a local restriction is assumed.

**API.**

- `TauCeti.EulerSystems.selectedDescent`: The selected map `d_a(x) = a²b` for `f(b) = a x`; `selectedDescent_eq` states equality with `a²b` for every such witness when `a` kills the kernel, and the displayed witness argument proves its `R`-linearity.
- `TauCeti.EulerSystems.selectedDescent_spec`: `f∘d_a=a³ id`, with no condition on `ker(f)`.
- `TauCeti.EulerSystems.selectedDescent_comp_self`: `d_a∘f=a³ id` when `a` kills `ker(f)`.
- `TauCeti.EulerSystems.selectedDescent_factor`: If a kills `ker(s)` and `s(z)=x`, then `r(d_a(x))=a³z`.

**Checks.**

- `selected_identity` (compatibility): For `f=id, d_a` is multiplication by `a³`; it is `id` when `a=1`.
- `selected_zero` (degenerate): The zero target class has selected descent zero even when `ker(f)` is nonzero.
- `selected_nonunit` (computation): Over `ℤ, f:ℤ→ℤ` is multiplication by 5, `a=5`. A witness for `x` is `b=x`, so `d_5(x)=25x` and `f(d_5(x))=125x`.
- `selected_kernel_not_unique` (non-example): For `ℤ/25→ℤ/5` and `a=5, d_a=0`, while zero has five preimages. The selected element is canonical but the full fibre is not a singleton.

The choice is independent of a witness but is not unique in the full fibre of `a³x`.

Comparison is made in the intermediate global cohomology group before localizing; local restriction need not have a uniform kernel.

Used by Layer 3.7 The finite–singular relation with its Frobenius operator: Identifies the selected global descent with `a³` times the cyclic cocycle over each intermediate ring-class field.

*Needs:* `LinearMap.ker`; `LinearMap.range`.

### 3.6 Uniform restriction control throughout the ring-class tower

Put `U=T⊗χ⁻¹, W=(U⊗_O Φ)/U` and `U_M=U/π^M`. For the ring-class fields `F=K_{cm}⊆L=K_{cn}` with `m|n` and `(n,cpN)=1`, there is a single `p`-power `a=p^ν`, independent of `m,n,M`, annihilating `W(F), W(L)`, and the kernel and cokernel of `H¹(F,U_M)→H¹(L,U_M)^{Gal(L/F)}`. Increase `ν` to include the finite local groups at places dividing `c_oN`. The same restriction bound holds for `K⊆K_{cn}`.

The precise hypotheses are: The lattice and `χ` are those of the ring-class Euler-system definition; in particular `U` is unramified outside `pNc_o`, and its rational representation is pure of weight one; Auxiliary conductors are squarefree and prime to `cpN`.

([Jan Nekovář, Kolyvagin’s method for Chow groups of Kuga–Sato varieties](https://archive.mpim-bonn.mpg.de/994/1/preprint_1990_78.pdf), §6, Proposition6.3 and Corollary6.4, printed pp.11–12 (MPIM1990-78)). Intersection-of-ramification-fields and invariant-coefficient proof of restriction control; the same proof is applied here over each intermediate ring-class field.

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.1–7.2, p.29; §6, p.28, purity discussion). The coefficient twist, restricted ramification and pure weight needed to extend the argument to `χ`.

The field cutting out `U_M` is unramified outside `pNc_o`. Its intersection with `K_{cn}`, viewed as an abelian extension of `K`, is unramified at every auxiliary prime dividing `n`. The conductor description of ring-class fields therefore puts the intersection inside `K_c`. Consequently `U_M^{G_{K_{cn}}}=U_M^{G_{K_c}}` for all `n` and `M`; the same equality holds with `cm` in place of `cn`.

The invariant group `W(K_c)` is finite: choose a good prime of `K_c` at which the pure weight-one representation `U` has no eigenvalue 1, and use the determinant of `Fr−1` to bound `W`-invariants. The anticyclotomic character is pure of weight zero, so twisting preserves this argument. A fixed `p^ν` kills these invariants. Do not infer a uniform bound from finiteness separately at each `M`.

In inflation–restriction both the kernel and cokernel are subquotients of `H¹` and `H²` of `Gal(L/F)` with coefficients `U_M^{G_L}`. These coefficients are killed by `a`; their entire cochain complexes, hence their cohomology, are killed by `a`. This works for every intermediate field and does not multiply the bound by the number of auxiliary primes.

For restriction from `K` the same intersection argument bounds `U_M^{G_{K_{cn}}}`. For the finitely many places over `c_oN` use the finite local-invariant and local-dual-invariant bounds in CH §7.2 and Nekovář Lemma10.1, enlarging the single `ν`.

The same bound holds for `K_c→K_{cn}` and `K_{cm}→K_{cn}`; it is independent of the number of prime factors of `n`.

The argument uses one finite `W(K_c)`, not an unbounded collection of finite groups.

*Needs:* Layer 2.9 Anticyclotomic Euler systems over ring class fields; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence; `SelmerIwasawaCohomology §4.25 (Uniform local annihilation away from p)`; `SelmerIwasawaCohomology Layer 2`.

### 3.7 The finite–singular relation with its Frobenius operator

Let `c` be an anticyclotomic Euler system for `(T, χ)` in the sense of Layer 2.9 Anticyclotomic Euler systems over ring class fields, `π` a uniformiser of `O, O_M = O/π^M, T_M = T/π^M T`, and `a = p^ν` the single annihilator of Layer 3.6: it kills `(i)` the kernels and cokernels of the restriction maps from `K` and from `K_{cm}` to the Galois invariants of `H¹(K_{cn}, T_M ⊗ χ^{-1})`, for all `m | n` and all `M`, and (ii) `H¹(K_v, T_M ⊗ χ^{-1})` for all `v | c_oN`. Put `B₁ = min{ord_π(x − 1) : x·I₂ ∈ ρ*_f ⊗ χ^{-1}(G_K), x ∈ ℤ_p^×}`. A prime `ℓ` is `M`-admissible if `ℓ ∤ 2cNp` is inert in `K, a_ℓ(f) ≡ ℓ + 1 ≡` 0 mod `π^M` and `π^{M+B₁+1} ∤ ℓ + 1 ± a_ℓ(f)ℓ^{1−r}`; `𝒦_M` is the set of squarefree products of `M`-admissible primes. For `n ∈ 𝒦_M, G_n = Gal(K_{nc}/K_c) = ∏_{ℓ|n} G_ℓ` with `G_ℓ` cyclic of order `ℓ + 1` (the stable-unit hypothesis of Layer 2.9) and chosen generators `σ_ℓ`; `D_ℓ = Σ_{i=1}^{ℓ} iσ_ℓ^i` and `D_n = ∏_{ℓ|n} D_ℓ`. Writing `x = D_n c_n` modulo `π^M`, choose `b ∈ H¹(K_c, T_M ⊗ χ^{-1})` with `res(b) = ax` and define `D_M(n) = a²b` and `κ(n) = cor_{K_c/K}(D_M(n)) ∈ H¹(K, T_M ⊗ χ^{-1})`. The derivative identity and (E1) make `x` invariant under `G_n`, and Layer 3.5 Selected descent through a map with bounded kernel and cokernel shows that `D_M(n)` is independent of `b` and has `res(D_M(n)) = a³x`; it is not asserted to be the unique preimage of `a³x`.

For `n = mℓ ∈ 𝒦_M` let `λ|ℓ`. The anticyclotomic character `χ` is trivial on `G_{K_λ}`, so the underlying basis of its character line identifies both `U_M` and `(T⊗χ)_M` locally with `T_M`. Let `Φ_ℓ=ρ_T(Fr_ℓ)` for rational arithmetic Frobenius, `N_ℓ=ℓ+1, h_ℓ=a_ℓ(f)ℓ^{1−r}`. Thus `Φ_ℓ²−h_ℓΦ_ℓ+ℓ=0`. Write `u=α_ℓ(loc_ℓκ(m))` and `v=β_ℓ(∂_ℓκ(n))`, using evaluation at `Fr_ℓ²` on the finite part and at the chosen tame generator on the singular part. On `T_M` put `A_ℓ=(h_ℓ/π^M)Φ_ℓ−(N_ℓ/π^M)id` and `B_ℓ=(a_ℓ(f)/π^M)id−(N_ℓ/π^M)Φ_ℓ`; the divisions are performed integrally before reduction. Then `A_ℓ v=B_ℓ u`. The localization of `κ(n)` is transverse. If `M>B₁`, both `A_ℓ` and `B_ℓ` have kernels and cokernels annihilated by `π^{B₁}`. The identical operator relation holds for the conjugate character; it does not identify the two global twists.

The precise hypotheses are: The selected formula, ring-class norm relations and `M`-admissibility of every auxiliary prime; `p` is odd; `ν` has the uniform relative restriction property (it exists by Nekovář's Proposition 6.3, Corollary 6.4 and Lemma 10.1, cited by the source) and `B₁ < ∞` (`ρ*_f` absolutely irreducible with open image); `χ` is anticyclotomic and unramified at `ℓ`; For the bounded-kernel/cokernel assertion `M>B₁`.

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.2, from the choice of `ν` to the definition of `κ(n)`, pp. 29–30 (author's version)). defines `ν, B₁, M`-admissible primes, the derivative operators and the derivative classes `κ(n)`

([Jan Nekovář, Kolyvagin’s method for Chow groups of Kuga–Sato varieties](https://archive.mpim-bonn.mpg.de/994/1/preprint_1990_78.pdf), §7, printed pp.12–14; §9, printed pp.16–19; Proposition10.2 proof, printed p.20 (MPIM1990-78)). Cyclic cocycle, integral local norm identity and application with `x=D_m y_m, y=D_m y_n`. The operator formula here is derived from the cochain identity rather than quoting the scalar eigenspace formula.

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §4.4, Lemma4.7 and its proof, pp.18–19; §7.2, pp.29–30). Local triviality of the character and the rational Frobenius congruence; §7.1 uses ambiguous Frobenius wording, so the rational operator and its square are distinguished here.

Use Layer 3.5 Selected descent through a map with bounded kernel and cokernel and Layer 3.6 Uniform restriction control throughout the ring-class tower with `a=p^ν`. Over `F=K_{cm}, y=D_m c_n` modulo `π^M` has corestriction zero by (E1), since `a_ℓ(f)∈π^MO`. The cyclic cocycle of Nekovář §7 gives `z∈H¹(F,U_M)` restricting to `D_ℓy=D_nc_n`. If `b` is the witness chosen over `K_c, res_F(b)−`a `z` is in the kernel of restriction to `K_{cn}`; that kernel is killed by `a`. Therefore `res_F(D_M(n))=a³z` exactly. This compares global classes before localization and avoids any false boundedness assertion for local restriction at `ℓ`. Formally take the intermediate module to be the inverse image, under restriction from `F`, of `H¹(K_{cn},U_M)^{G_n}`; `z` belongs to it. The factorisation then lands in the same invariant target as the original restriction map.

The inert principal prime `λ` splits in `K_{cm}/K` and `K_c/K`, while `K_{cn}/K_{cm}` is totally ramified at `λ` with cyclic group of order `N_ℓ`. Local triviality of `χ` follows from its unramifiedness at `λ` and `χ(Fr_λ)=χ((ℓ))=1`. Use the local extension of `T` to `G_{ℚ_ℓ}` to define rational Frobenius. This uses the local character line, not a nonexistent global `G_ℚ`-action on `U`.

Work first with the integral cocycles `x=D_m c_m` and `y=D_m c_n`. Choose `t` with `cor(y)−a_ℓ(f)x=δt`. The cyclic cocycle has tame value `−t` modulo `π^M`, after the common `a³` scaling. If `x₀,y₀` are unramified local values, restriction of this coboundary identity gives `N_ℓ y₀−a_ℓ(f)x₀=(Φ_ℓ²−1)(t+π^M w)`. The local norm congruence (E2) gives `y₀=Φ_ℓx₀` modulo `π^M` and the unramified coboundary ambiguity. The calculation is componentwise on semilocal cohomology and commutes with `D_m`: transport the local Frobenius to each conjugate place before summing. Divide the displayed integral identity by `π^M` and reduce; `Φ_ℓ²−1∈π^M End_O(T)` kills the `w` term. Substituting `v=−a³t, u=a³x₀` gives `A_ℓv=B_ℓu`. The cyclic cocycle restricts trivially to the unramified subgroup at `λ`, giving transversality. Corestriction from `K_c` sums these componentwise identities.

Modulo `π^M, J=Φ_ℓ` satisfies `J²=1`. Since `p` is odd, `(1±J)/2` split `T_M` into its two rank-one summands. The eigenvalues of `A_ℓ` are `(±h_ℓ−N_ℓ)/π^M`. Those of `B_ℓ` are `(a_ℓ(f)∓N_ℓ)/π^M`. Since `ℓ≡−1` modulo `π^M, a_ℓ(f)/π^M≡(−1)^{r−1}h_ℓ/π^M` modulo `π^M`; admissibility therefore bounds all four valuations by `B₁`. Each operator has a `π^{B₁}`-scaled inverse. This supplies bounded comparison, without cancelling a nonunit scalar.

For conjugation use the coefficient map `T⊗χ⁻¹→T⊗χ` induced by `ρ_T(τ)`, together with `g↦τgτ⁻¹`. On local finite values rational Frobenius acts by `J`, and on singular values by `−J` because it inverts tame inertia modulo `π^M`. Pair `χ⁻¹` and `χ` through `T×T→O(1)`. Only when `χ²=1` does (E3) additionally give an eigensign on one global module. No `ε_n` is substituted into the general-character relation.

For `h_ℓ=a_ℓ(f), B_ℓ=J A_ℓ` and the relation becomes `A_ℓ(v−Ju)=0`. It only forces `π^{B₁}(v−Ju)=0`; cancelling `A_ℓ` without a unit hypothesis is invalid.

For a nonquadratic `χ, τ²` still identifies the two successive coefficient transports with identity, but `τ` is not an endomorphism of `H¹(K,T_M⊗χ⁻¹)`.

If `u₁,u₂ span` a submodule containing `π^dT_M` and `A_ℓv_i=B_ℓu_i`, then the `v_i span` a submodule containing `π^{d+2B₁}T_M`. Indeed `B_ℓ span(u_i)` contains `π^{d+B₁}T_M`; compare `A_ℓ` on `π^{d+B₁}T_M` with `A_ℓ span(v_i)`, and kill its kernel by `π^{B₁}`. This is the span estimate used by descent.

**API.**

- `TauCeti.EulerSystems.RingClassEulerSystem.admissiblePrimes`: The set of `M`-admissible primes and `𝒦_M` of their squarefree products.
- `TauCeti.EulerSystems.RingClassEulerSystem.derivative`: Choose `b` with `res(b)=p^νD_nc_n` and set `κ(n)=cor_{K_c/K}(p^{2ν}b)`; this selection is independent of `b` under the stated relative restriction bound. The restriction identity alone does not characterize the result uniquely.

**Checks.**

- `derivative_zero` (degenerate): For the zero system, `κ(n) = 0` for every `n ∈ 𝒦_M`.
- `derivative_needs_admissible` (non-example): If `ℓ | n` has `ℓ + 1 ≢` 0 mod `π^M`, then `D_n c_n` need not be `G_n`-invariant modulo `π^M` and `κ(n)` is not defined; `M`-admissibility is part of the construction, not a convenience.
- `descent_noninjective_control` (non-example): For the reduction map `ℤ/p² → ℤ/p`, the kernel and cokernel are killed by `p`, but the zero target has `p` distinct preimages. This rules out deducing uniqueness of a descent from bounded kernel and cokernel alone.

*Needs:* Layer 3.1 The norm and Kolyvagin derivative operators; Layer 3.5 Selected descent through a map with bounded kernel and cokernel; Layer 3.6 Uniform restriction control throughout the ring-class tower; Layer 2.9 Anticyclotomic Euler systems over ring class fields; `SelmerIwasawaCohomology Layer 2`; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence.

### 3.8 Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at `p`

Let `c` be an anticyclotomic Euler system for `(T, χ)` in the sense of Layer 2.9 Anticyclotomic Euler systems over ring class fields, and let `π, O_M, T_M, ν, a = p^ν, B₁`, the `M`-admissible primes, `𝒦_M`, `G_n, D_n`, the selected descent `D_M(n)` and the derivative classes `κ(n) = cor_{K_c/K}(D_M(n)) ∈ H¹(K, T_M ⊗ χ^{-1})` be those defined at the start of Layer 3.7 The finite–singular relation with its Frobenius operator. Given a `Φ`-subspace `F ⊆ H¹(K ⊗ ℚ_p, V ⊗ χ^{-1})` with orthogonal complement `F*` (`F* = F` if `χ² = 1`), `F_M` the image of its inverse image in `H¹(K ⊗ ℚ_p, T ⊗ χ^{-1})`, and the `n`-imprimitive Selmer group `Sel^{(n)}_F(K, T_M ⊗ χ^{-1})` (finite at `v ∤ pn`, in `F_M` at `p` when `p ∤ n`), the space `ES(T, χ, F)` consists of the systems with (E4) `c_K ∈ Sel_F(K, T ⊗ χ^{-1})` and `c_K^τ ∈ Sel_{F*}(K, T ⊗ χ)`, and (E5) `κ(n) ∈ Sel^{(n)}_F(K, T_M ⊗ χ^{-1})` for all `M` and `n ∈ 𝒦_M`. The classes satisfy (K1) `κ(n)∈Sel_F^{(np)}(K,T_M⊗χ⁻¹)` and `κ(1)=p^{3ν}c_K` modulo `π^M`; (K2-op) `A_ℓβ_ℓ(∂_ℓκ(n))=B_ℓα_ℓ(loc_ℓκ(n/ℓ))` with the integral divided Frobenius operators and bounded kernels/cokernels of Layer 3.7 The finite–singular relation with its Frobenius operator; and (K3) `κ(n)^τ=ε_nκ(n)` only if `χ²=1, ε_n=χ(σ_𝔑)w_f(−1)^{ω(n)}`. For general `χ` the coefficient transport under `τ` is between the `χ⁻¹` and `χ` modules. E5 is an additional local condition on the Euler system, not a consequence of the norm relations.

The precise hypotheses are: `c` an anticyclotomic Euler system for `(T, χ)` over ring class fields; the data and hypotheses of Layer 3.7, including the existence of `ν` and `B₁ < ∞`; Use the single `ν` from Layer 3.6 Uniform restriction control throughout the ring-class tower for all intermediate ring-class fields, enlarged to annihilate the indicated bad local groups; The local Frobenius convention is rational Frobenius on `T` after the character is locally trivialized; finite evaluation uses its square. No scalar conjugation sign is imposed when `χ²≠1`.

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.2, (K1)–(K3), pp. 29–30 (author's version)). records the relations (K1)–(K3) for the classes `κ(n)` of Layer 3.7, from Nekovář's Proposition 10.2

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.2, Definition 7.2, p. 30 (author's version)). defines `ES(T, χ, F)` by the conditions (E4) and (E5) at `p`

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.3, Lemma 7.5 and Proposition 7.6, p. 31; §7.4, Proposition 7.8 with footnote 5, pp. 32–33 (author's version)). verifies (E4)–(E5) for generalised Heegner classes; footnote 5 states that the Lemma 7.5 step applies only to absolutely unramified extensions and points to Kobayashi–Ota for a correct argument

([Jan Nekovář, Kolyvagin’s method for Chow groups of Kuga–Sato varieties](https://archive.mpim-bonn.mpg.de/994/1/preprint_1990_78.pdf), §6, Proposition6.3 and Corollary6.4, printed pp.11–12; §§7,9, printed pp.12–19; Proposition10.2 proof, printed p.20 (MPIM1990-78)). The restriction, cyclic cocycle and local norm computations; the explicit selected-lift comparison and coefficient transport are supplied by the new prerequisites.

At `n=1` choose `b=a c_1` in the definition of Layer 3.7; corestriction gives `κ(1)=a³c_K`.

The uniform restriction lemma proves the relative bound, including every intermediate `K_{cm}`; it is a consequence of the tower hypotheses. For `n=mℓ`, comparison with the cyclic cocycle before localization is the factorisation identity `res_{K_{cm}}D_M(n)=a³z` in ring-class-local-operator. This supplies the canonical local relation and transversality for arbitrary `χ`.

At good primes outside `np`, both the class and field extension are unramified, so the restriction to inertia is zero. At places dividing `c_oN` the chosen a kills the local cohomology and the selected class already contains `a²`. This proves (K1) away from `p`. At `p`, (E5) is exactly the required extra hypothesis; for generalized cycles its arithmetic verification must use the correction to Proposition7.8, footnote5.

For `χ²=1`, conjugating `D_n` changes it by `(−1)^{ω(n)}` modulo norm terms, which vanish by (E1) and admissibility. The selected linear map respects this conjugation and (E3) gives (K3). For nonquadratic `χ` retain the two coefficient modules and the operator relation; no `ε_n`-eigenspace claim is made.

**API.**

- `TauCeti.EulerSystems.RingClassEulerSystem.derivative_one`: `κ(1) ≡ p^{3ν}c_K` modulo `π^M`.
- `TauCeti.EulerSystems.RingClassEulerSystem.derivative_mem_selmer`: (K1): `κ(n) ∈ Sel^{(np)}_F(K, T_M ⊗ χ^{-1})`.
- `TauCeti.EulerSystems.RingClassEulerSystem.finiteSingular`: For every `χ, A_ℓβ_ℓ(∂_ℓκ(n))=B_ℓα_ℓ(loc_ℓκ(n/ℓ))` with operators defined in Layer 3.7 The finite–singular relation with its Frobenius operator; their kernels/cokernels are killed by `π^{B₁}` when `M>B₁`. Keep both global twists under conjugation.
- `TauCeti.EulerSystems.RingClassEulerSystem.derivative_conj`: (K3): `κ(n)^τ = ε_n κ(n)` when `χ² = 1`.
- `TauCeti.EulerSystems.RingClassEulerSystem.withLocalCondition`: `ES(T, χ, F)`: the submodule of systems satisfying (E4) and (E5).

**Checks.**

- `derivative_one_eq` (computation): For `n = 1, D_1 = 1` and `κ(1) = cor_{K_c/K}(p^{3ν}c_1 mod π^M) = p^{3ν}c_K` mod `π^M`.
- `derivative_eigen` (characterisation): For `χ` trivial, `r = 1` and `n` a product of two admissible primes, `κ(n)` lies in the `w_fχ(σ_𝔑)`-eigenspace of `τ`, the sign of `n = 1` times `(−1)²`.

`κ(1) ≡ p^{3ν}c_K` modulo `π^M`, so `c_K ≠ 0` in `H¹(K, V ⊗ χ^{-1})` gives `κ(1) ≠ 0` for `M` large.

For `χ² = 1` every `κ(n)` lies in the `ε_n`-eigenspace of complex conjugation.

The extra admissibility condition bounds the `π`-valuation of each coefficient obtained by dividing `ℓ + 1 ± a_ℓ(f)ℓ^{1−r}` by `π^M` by `B₁`. A coefficient is a unit only when its valuation is zero; `B₁ = 0` forces this, whereas `B₁ > 0` allows a bounded nonunit loss.

Used by `Castella–Hsieh, §7.5, proof of Theorem 7.3`: the classes `κ(n)` and relations (K1)–(K3) drive Kolyvagin's descent

Used by `Layer 4.7 Rational Kolyvagin descent for ring-class anticyclotomic Euler systems`: the descent input

*Needs:* Layer 2.9 Anticyclotomic Euler systems over ring class fields; Layer 3.1 The norm and Kolyvagin derivative operators; Layer 1.8 The finite–singular comparison map; `SelmerIwasawaCohomology §2.1 (Compact and rational Selmer data)`; `TauCeti.ContCohomology.H1`; Layer 3.5 Selected descent through a map with bounded kernel and cokernel; Layer 3.6 Uniform restriction control throughout the ring-class tower; Layer 3.7 The finite–singular relation with its Frobenius operator.

### 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`

For an Euler system `c, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O` and `r ∈ R_{F,M}`, fix a lift `d = d_F` and put `D_{r,F} = N_{F(1)/F}D_r`. Then `d(D_{r,F}x_{F(r)}) ∈ (𝕎_M/W_M)^{G_F}` and `κ_{F,r,M} = δ_F(d(D_{r,F}x_{F(r)})) ∈ H¹(F, W_M)`. It is independent of the choices of `N_{F(1)/F}` and `d`, and is represented by `γ ↦ (γ − 1)f` for any `f ∈ 𝕎_M` lifting `d(D_{r,F}x_{F(r)})`. Properties: `(i) κ_{F,1,M}` is the image of `c_F` in `H¹(F, W_M)`; (ii) the restriction of `κ_{F,r,M}` to `F(r)` is the image of `D_{r,F}c_{F(r)}`; (iii) for `M | M′` and `r ∈ R_{F,M′}, κ_{F,r,M′} ↦ κ_{F,r,M}` under `H¹(F, W_{M′}) → H¹(F, W_M)` and `κ_{F,r,M} ↦ (M′/M)κ_{F,r,M′}` under `H¹(F, W_M) → H¹(F, W_{M′})`. The class depends only on the images of `c_{F(s)}, s | r`, in `H¹(F(r), W_M)`, so the ordinary construction applies to Euler systems of finite depth. Its `χ`-anticyclotomic extension on the refined prime set is the target `chiUniversalDerivativeDescent` of 3.16.

The precise hypotheses are `r ∈ R_{F,M}` and an ordinary Euler system or its finite-depth variant of Layer 2.8. For the `χ`-anticyclotomic variant use the exact hypotheses and obligations of 3.16; this subsection does not transfer the ordinary proof to a semidirect tower.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Definition 4.10, p. 66). Definition of the derivative class.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Lemma 4.13, p. 67). The three basic properties.

Layer 3.4 Invariance of the derivative of the universal class places `d(D_{r,F}x_{F(r)})` in the `G_F`-invariants; independence of `d` follows since two lifts differ by `Hom(X_{F(r)}, 𝕎_M)`, whose values on the invariant element lie in the image of `𝕎_M^{G_F} = ker δ_F`.

`(i): r = 1, D_{1,F} = N_{F(1)/F}` and `Cor_{F(1)/F}c_{F(1)} = c_F`; (ii), (iii) from the definition and the compatibilities of `δ`.

The intrinsic target: with the generators `σ_q` not fixed, the same construction gives a class in `H¹(F, W_M) ⊗ G_r`, independent of the generators (Layer 3.1 The norm and Kolyvagin derivative operators, change of generator).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.derivativeClass`: `κ_{F,r,M} ∈ H¹(F, W_M)` for `r ∈ R_{F,M}`; in intrinsic form an element of `H¹(F, W_M) ⊗ G_r`.
- `TauCeti.KolyvaginSystems.derivativeClass_one`: `κ_{F,1,M} =` image of `c_F`.
- `TauCeti.KolyvaginSystems.res_derivativeClass`: `res_{F(r)/F}(κ_{F,r,M}) =` image of `D_{r,F}·c_{F(r)}` in `H¹(F(r), W_M)`.
- `TauCeti.KolyvaginSystems.derivativeClass_reduction`: For `M | M′`: reduction sends `κ_{F,r,M′}` to `κ_{F,r,M}`, and multiplication `M′/M : W_M → W_{M′}` sends `κ_{F,r,M}` to `(M′/M)·κ_{F,r,M′}`.
- `TauCeti.KolyvaginSystems.derivativeClass_cocycle`: `κ_{F,r,M}` is the class of `γ ↦ (γ − 1)·f` for any lift `f` of `d(D_{r,F}x_{F(r)})`.
- `TauCeti.KolyvaginSystems.derivativeClass_linear`: `c ↦ κ_{F,r,M}(c)` is `O`-linear in the Euler system.
- `TauCeti.KolyvaginSystems.derivativeClass_generator`: `κ ⊗ (⊗_q σ_q) ∈ H¹(F, W_M) ⊗ G_r` does not depend on the generators `σ_q`.

**Checks.**

- `derivativeClass_zero`: Every derivative class of the zero Euler system is zero.
- `derivativeClass_delta_lift`: The induced connecting class vanishes for an invariant element lifted from the coinduced module.
- `derivativeClass_conductor_one_nonzero`: At conductor one, a nonzero initial component remains nonzero if its coefficient reduction on `H¹` is injective.

When `W^{G_{F(r)}} = 0, κ_{F,r,M}` is the unique class restricting to `D_{r,F}c_{F(r)}`.

Scalar and quotient compatibility: `κ(ac) = aκ(c)`, and (iii).

Additional arithmetic check: For `r = 1` and `F = K` with `K(1) = K, κ_{K,1,M} = c_K` mod `M`.

Additional arithmetic check: For `K = ℚ, T = ℤ_p(1), M = p^k` and `ℓ ≡` 1 `(mod p^k): κ_{ℚ,ℓ,M} ∈ ℚ^×/(ℚ^×)^{p^k}` is the unique class whose image in `ℚ(ℓ)^×/p^k` is `D_ℓ` applied to the cyclotomic unit of `ℚ(ℓ)` (here `W^{G_{ℚ(ℓ)}} = 0` for `p` odd).

Additional arithmetic check: `κ_{F,r,M}` is not `Cor_{F(r)/F}(c_{F(r)}) = N_r c`: corestriction gives the Euler-factor multiple of `c_F`, which is 0 modulo `M` for `r ∈ R_{F,M}` with `r ≠ 1`, while `κ_{F,r,M}` is in general nonzero.

*Needs:* Layer 3.4 Invariance of the derivative of the universal class; Layer 3.2 The induced module, the connecting map and lifts of an Euler system; Layer 2.2 The module of Euler systems; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`.

### 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor

Let `c` be an Euler system for `T` (Layer 2.2 The module of Euler systems) over an admissible tower, `K ⊂_f F ⊂ K_∞, 0 ≠ M ∈ O` and `r ∈ R_{F,M}`, with `κ_{F,r,M}` the derivative class of Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`. `(a)` For every prime `Q` of `F` not dividing `pr, (κ_{F,r,M})_Q ∈ H¹_ur(F_Q, W_M)`. `(b)` If `T` is unramified at `Q`, then `(κ_{F,r,M})_Q ∈ H¹_f(F_Q, W_M)`. `(c)` For every archimedean place `w` of `F, (κ_{F,r,M})_w ∈ H¹_f(F_w, W_M)`. `(d)` Let `m = sup_{q ∤ p}[W^{I_q} : (W^{I_q})_div]`, the supremum over primes `q` of `K` of the index of the maximal divisible subgroup in the inertia invariants of `W = V/T`; it is a finite positive integer, independent of `M`. Then for every `r ∈ R_{F,Mm}` and every prime `Q` of `F` not dividing `pr, (κ_{F,r,M})_Q ∈ H¹_f(F_Q, W_M)`. Part `(d)` is weaker than Layer 3.13 Local behaviour of derivative classes`(a)` at primes where `T` is ramified, but suffices for the bounds of Chapter II and for Euler systems of finite depth.

The precise hypotheses are `c` an Euler system for `T` over an admissible tower (`K_∞ ⊆ 𝒦` with no finite prime splitting completely); `r ∈ R_{F,M}` for `(a)`–`(c)`; `r ∈ R_{F,Mm}` for `(d)`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §6, Proposition 6.1, Corollary 6.2 and Lemma 6.3, p. 69). Euler-system classes are unramified away from `p`; the derivative classes are unramified away from `pr`, finite where `T` is unramified and at archimedean places

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §6, Remark 6.4 and Corollary 6.5 with proof, pp. 69–70). the finite-part statement at ramified primes up to the factor `m`, sufficient for the Chapter II theorems

`(a)`: an inertia group `I` of `Q` in `G_F` lies in `G_{F(r)}` because `F(r)/F` is unramified at `Q`; by Lemma IV.4.13(ii) the restriction of `κ_{F,r,M}` to `I` is the image of `D_{r,F}c_{F(r)}`, which vanishes on `I` since every class `γc_{F(r)}` is unramified away from `p` (Rubin, Proposition IV.6.1, from the universal-norm lemma of SelmerIwasawaCohomology §3.5(ii)).

`(b)`: if `T` is unramified at `Q` then `H¹_f(F_Q, W_M) = H¹_ur(F_Q, W_M)` (Rubin, Lemma I.3.8(ii)).

`(c): F(r)/F` is unramified at archimedean places, so `w` splits completely and `(κ_{F,r,M})_w` is the image of `(D_{r,F}c_{F(r)})_{w̃} ∈ H¹(F_w, T) = H¹_f(F_w, T)` (Rubin, Remark I.3.7, Lemma I.3.8(i)).

`(d): m` is finite because the indices are finite and almost all equal to 1; `m` kills `H¹_ur(F_Q, W_{Mm})/H¹_f(F_Q, W_{Mm})` (Rubin, Lemma I.3.5(iii)); apply `(a)` to `κ_{F,r,Mm}` and use that `m·κ_{F,r,Mm}` is the image of `κ_{F,r,M}` (Lemma IV.4.13(iii)).

For `T` unramified outside `p, (b)` gives Layer 3.13 Local behaviour of derivative classes`(a)` at every `Q ∤ pr` with no loss, and `m = 1`.

For `T = T_pE` with `E` of split multiplicative reduction at `q`, the nondivisible part of `W^{I_q}` is the `p`-part of the component group of the Néron model at `q`, so `m` can exceed 1 and `(d)` loses a bounded factor.

The bound `m` in `(d)` does not depend on `M`, so the losses in the Chapter II bounds stay bounded as `M` grows.

*Needs:* Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 2.3 Euler-system classes are unramified away from `p`; `SelmerIwasawaCohomology §3.6 (Semilocal cohomology and descent of local classes)`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`.

### 3.11 The lifted telescoping identity and the key norm relation for lifts

Fix an Euler system `c` for `T, 0 ≠ M ∈ O, r ∈ R`, a prime `q ∈ R_{K,M}` not dividing `r, K ⊂_f F ⊂ K_∞`, a prime `Q` of `K̄` above `q` with inertia and decomposition groups `I ⊆ D`, a lift `σ_q ∈ I` of the generator of `Γ_q` and a Frobenius `Fr_q ∈ D`. Put `m = [K(q) : K(1)], N_q = Σ_{i=1}^{m} σ_q^i` and `D_q = Σ_{i=0}^{m−1} iσ_q^i` in `ℤ[I]`. `(a) (σ_q − 1)D_q = mσ_q^m − N_q` in `ℤ[I]` (the lifted telescoping identity; `σ_q^m ≠ 1` in `I`). `(b)` If `d : X_{F(r)} → 𝕎_M/W_M` lifts `c` as in Layer 3.2 The induced module, the connecting map and lifts of an Euler system and `d̂(x_{F(r)}) ∈ 𝕎_M` lifts `d(x_{F(r)})`, then `σσ′γd̂(x_{F(r)}) = σ′σγd̂(x_{F(r)})` for all `γ ∈ G_K` and `σ, σ′ ∈ D`; this can fail for `σ, σ′` outside `D`. `(c)` For a lift `d : X_{F(rq)} → 𝕎_M/W_M` of `c` and lifts `d̂(x_{F(rq)}), d̂(x_{F(r)}) ∈ 𝕎_M, N_q γ d̂(x_{F(rq)}) − P(Fr_q^{-1} | T*; Fr_q^{-1}) γ d̂(x_{F(r)}) ∈ W_M` is independent of the choices and is zero in `W_M` for every `γ ∈ G_K`. `(d)` Consequently, if moreover `rq ∈ R_{F,M}` (so that both derivative classes below are defined by Layer 3.9), with `Q_q(x) ∈ (O/M)[x]` the unique polynomial with `(x − 1)Q_q(x) ≡ P(Fr_q^{-1} | T*; x)` mod `M, κ_{F,rq,M}(σ_q) = Q_q(Fr_q^{-1})κ_{F,r,M}(Fr_q)` in `W_M` for cocycles representing the derivative classes: the singular part of `κ_{F,rq,M}` at `q` is `φ^fs_q` of the finite part of `κ_{F,r,M}` (Layer 3.13 Local behaviour of derivative classes`(b)`).

The precise hypotheses are `c` an Euler system for `T` over an admissible tower; `q ∈ R_{K,M}`, so `M | [K(q) : K(1)]` and `M | P(Fr_q^{-1} | T*; 1)`; `T` unramified at `q`; for `(d)`, additionally `rq ∈ R_{F,M}` (Rubin, Theorem IV.5.4).

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §7, identity (9), Lemma 7.1 and Remark 7.2, p. 74). the lifted telescoping identity in `ℤ[I]` and the commutation of decomposition-group elements on lifts

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §7, Lemma 7.3 and its proof, pp. 75–76). the key relation between the lifts at `rq` and `r`, proved by passing to a subfield of `K_∞` with large local degree

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §5, Lemma 5.2 and Definition 5.3, pp. 67–68; §7, proof of Theorem 5.4, p. 76). the polynomial `Q_q`, the finite–singular comparison `φ^fs_q` and the deduction of the singular-part formula

`(a)` is the telescoping computation of Layer 3.1 The norm and Kolyvagin derivative operators carried out in `ℤ[I]` without imposing `σ_q^m = 1`.

`(b): T` is unramified at `q`, so every cocycle representing `γc_{F(r)}` vanishes on `I ∩ G_{F(r)}` (Rubin, Proposition IV.6.1), hence `(σ − 1)γd̂(x_{F(r)}) = 0` for `σ ∈ I ∩ G_{F(r)}` by the cocycle formula of Layer 3.2 The induced module, the connecting map and lifts of an Euler system; the commutator subgroup of `D` lies in `I ∩ G_{F(r)}` because `D/I` and `Gal(F(r)/K)` are abelian.

`(c)`: independence of the choices uses that `σ_q` fixes `W_M`, that `M | [K(q) : K(1)]` and that `P(Fr_q^{-1} | T*; Fr_q^{-1})` kills `W_M` (Layer 2.1 Euler polynomials and their conventions). For vanishing, pass to `F′ ⊆ K_∞` in which the decomposition group of `q` in `F′(rq)/F(rq)` has order divisible by `k_pM` (possible because the decomposition group in `K_∞` is infinite), write the norm as `N′N″` with `N′` the sum over the powers of `Fr_q^k`, and use `(b)` to commute `N′` past `N_q` and `P(Fr_q^{-1})`; the difference lies in `N′W_M ⊆ |H|W_M = 0`.

`(d)`: by the cocycle formula `κ_{F,r,M}(Fr_q) = (Fr_q − 1)D_{r,F}d̂(x_{F(r)})` and `κ_{F,rq,M}(σ_q) = (σ_q − 1)D_{rq,F}d̂(x_{F(rq)})`; expand with `(a)`, use `(b)` to commute elements of `O[D]`, and `(c)` with `M | m` to conclude.

For `K = ℚ, T = ℤ_p(1)` and `q = ℓ` a prime with `M | ℓ − 1, P(Fr_ℓ^{-1} | T*; x) = 1 − x` and `Q_ℓ = −1`, so `(d)` says the singular part of `κ_{rℓ}` at `ℓ` is minus the image of the finite part of `κ_r`: Kolyvagin's relation for cyclotomic units up to sign conventions.

Example of `(b)` failing outside `D`: for `σ, σ′ ∈ G_K` with non-commuting images in `Gal(K(W_M)K(r)/K), σσ′d̂` and `σ′σd̂` can differ because the action on `d̂` does not factor through an abelian extension.

With `M` replaced by `M′` dividing `M`, the identities in `(c)`–`(d)` reduce compatibly.

Domain of `(d)`: for `K = F = ℚ`, `T = ℤ₃(1)`, `M = 3`, `r = 2` and `q = 7`, one has `r ∈ R` and `q ∈ R_{K,M}`, but `[ℚ(2):ℚ] = 1`, so `2 ∉ R_{ℚ,3}` and the classes in `(d)` are undefined; `(a)`–`(c)` still apply.

*Needs:* Layer 3.1 The norm and Kolyvagin derivative operators; Layer 3.2 The induced module, the connecting map and lifts of an Euler system; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 2.1 Euler polynomials and their conventions; Layer 2.3 Euler-system classes are unramified away from `p`; `Polynomial.X_sub_C_dvd_sub_C_eval`; `Polynomial.divByMonic`.

### 3.12 Local lifts of an Euler system at a prime and the finite-part theorem

Fix an Euler system `c` for `T, 0 ≠ M ∈ O, r ∈ R` and a prime `q` of `K` not dividing `pr`, with inertia and decomposition groups `I ⊆ D ⊆ G_K`. Put `W^f_M = T^I/MT^I ⊆ (W_M)^I, 𝕎_M = Maps_cont(G_K, W_M)` and `𝕎^f_M = Maps_cont(G_K, W^f_M)` with `G_K` acting by right translation, and `Ind_D(W_M) ⊆ 𝕎_M, Ind_D(W^f_M) ⊆ 𝕎^f_M` the `D`-equivariant maps `(f(hg) = hf(g) for h ∈ D)`. For a finite extension `L` of `K` unramified at `q` write `H^i(L_q, −) = ⊕_{Q | q} H^i(L_Q, −)`. `(a)` For `K ⊂_f F ⊂ K_∞` there is a commutative diagram with exact columns whose columns are the `G_{F(r)}`-cohomology sequences of `0 → W_M → 𝕎_M → 𝕎_M/W_M → 0, 0 → Ind_D(W_M) → 𝕎_M → 𝕎_M/Ind_D(W_M) → 0` and `0 → Ind_D(W^f_M) → 𝕎^f_M → 𝕎^f_M/Ind_D(W^f_M) → 0`, ending in `H¹(F(r), W_M), H¹(F(r)_q, W_M)` and `H¹(F(r)_q, W^f_M)`, with horizontal maps `res_q` and the maps induced by `W^f_M ⊆ W_M`. `(b)` There are norm-compatible `O[G_K]`-maps `d_{F,q} : X_{F(r)} → (𝕎_M/Ind_D(W_M))^{G_{F(r)}}` and `d^f_{F,q} : X_{F(r)} → (𝕎^f_M/Ind_D(W^f_M))^{G_{F(r)}}` (`X_{F(r)}` the universal Euler system module of Layer 2.7 The universal Euler system) whose compositions with the connecting maps send `x_{F(s)}` to `(c_{F(s)})_q` for every `s | r`; each is unique up to `Hom_{O[G_K]}(X_{F(r)}, 𝕎_M)`, respectively `Hom_{O[G_K]}(X_{F(r)}, 𝕎^f_M)`. `(c)` Consequently, for `r ∈ R_{F,M}` and every prime `Q` of `F` above `q, (κ_{F,r,M})_Q` lies in the image of `H¹_ur(F_Q, T)` and hence in `H¹_f(F_Q, W_M)`: this is Rubin's Theorem IV.5.1 at primes where `T` may be ramified.

The precise hypotheses are `c` an Euler system for `T` over an admissible tower; the decomposition group of `q` in `K_∞/K` is infinite (no finite prime splits completely); `q ∤ pr`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §6, Definition 6.6 and Lemma 6.7, pp. 70–71). semilocal cohomology at `q`, the modules `W^f_M, 𝕎^f_M` and `Ind_D`, and the three-column commutative diagram

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §6, Proposition 6.8 with proof and Remark 6.9, pp. 71–73). existence and uniqueness of the local lifts `d_{F,q}` and `d^f_{F,q}`, by the inverse-limit argument over a `ℤ_p`-subextension

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §6, proof of Theorem 5.1, pp. 73–74). comparison of the global and unramified lifts, and the cohomological-dimension-one step giving the finite part

`(a): 𝕎_M` and `Ind_D(W_M)` are coinduced modules (Tau Ceti's TauCeti.coind with the trivial subgroup and with `D`), so Shapiro's lemma (TauCeti.ContCohomology.explicitShapiro1) and the double-coset decomposition identify the `G_{F(r)}`-cohomology of `Ind_D(W_M)` with the semilocal cohomology `⊕_{Q|q} H¹(F(r)_Q, W_M)` (SelmerIwasawaCohomology §3.6 (Semilocal cohomology and descent of local classes)); `𝕎_M` has trivial higher cohomology. The left column is Layer 3.2 The induced module, the connecting map and lifts of an Euler system`(a)`.

`(b)`: the classes `(c_{F(s)})_Q` are unramified (Rubin, Proposition IV.6.1), so the map `X_{F(r)} → H¹(F(r)_q, W_M)` factors through `H¹(F(r)_q, W^f_M)`. Choose a `ℤ_p`-extension `K′_∞ ⊆ K_∞` in which `q` has finitely many primes; then the inverse limit of `H⁰(F(r)_q, W_M)` over the tower vanishes (Rubin, Lemma B.3.2) and each `H¹(F(r)_q, W_M)` is finite, so the limit of the right column is short exact; the limit of `(𝕎^f_M)^{G_{F(r)}}` is free over `(O/M)[[Gal(K_∞(r)/K)]]`, and the `Ext¹`-vanishing of Layer 2.7 The universal Euler system lifts `X_{∞,r}` to the middle term; descend to finite level by the freeness of `X_{∞,r}`.

`(c)`: compare the image of the global lift `d` of Layer 3.2 The induced module, the connecting map and lifts of an Euler system`(b)` with `d^f_{F,q}` in the middle column; by uniqueness they differ by an element of `Hom(X_{F(r)}, (𝕎_M)^{G_{F(r)}})`, which on `D_{r,F}x_{F(r)}` lands in the kernel of the connecting map by Layer 3.4 Invariance of the derivative of the universal class. Hence `(κ_{F,r,M})_Q` comes from `H¹(F_Q, T^{I_Q}/MT^{I_Q})`; combined with Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor`(a)` it comes from `H¹(F_Q^ur/F_Q, T^{I_Q}/M)`, and since `Gal(F_Q^ur/F_Q) ≅ Ẑ` has cohomological dimension one, `H¹_ur(F_Q, T)` surjects onto that group; Rubin's Lemmas `I`.3.5(ii) and `I`.3.8`(i)` place the image in `H¹_f`.

For `X=T^{I_Q}`, a finite free `ℤ_p`-module, identify continuous cochains with the inverse limit for `X/p^aX`. `H¹(Ẑ,X/p^aX)` is finite, hence its tower is Mittag-Leffler. The Milnor sequence gives `H²(Ẑ,X)=0` because `H²` of every finite discrete quotient vanishes. The quotient `X→X/MX` has a continuous section, so the compact long exact sequence gives surjectivity on `H¹`. Do not extend this argument to an arbitrary profinite coefficient module without the limit hypotheses.

If `T` is unramified at `q` then `W^f_M = W_M, Ind_D(W^f_M) = Ind_D(W_M)`, the right and middle columns coincide and `(c)` reduces to Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor`(b)`.

For `r = 1, (c)` says `(c_F)_Q` mod `M` lies in `H¹_f(F_Q, W_M)`, as it must since `c_F` is a universal norm.

The hypothesis that the decomposition group of `q` in `K_∞/K` is infinite is used to kill the inverse limit of local `H⁰`; for a finite decomposition group the lift need not exist.

*Needs:* Layer 3.2 The induced module, the connecting map and lifts of an Euler system; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.4 Invariance of the derivative of the universal class; Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor; Layer 2.7 The universal Euler system; `SelmerIwasawaCohomology §3.6 (Semilocal cohomology and descent of local classes)`; `TauCeti.coind`; `TauCeti.ContCohomology.explicitShapiro1`; `TauCetiRoadmap.ProfiniteCohomology Layer 11`; `ArithmeticGaloisDuality §R02.1.2 (Continuous cochains into inverse limits)`; `DerivedModuleAlgebra §1.T.1 (The Milnor sequence for towers of complexes)`; `DerivedModuleAlgebra §1.T.1 (Mittag-Leffler towers have vanishing lim¹)`; `ArithmeticGaloisDuality §R02.1.2 (Long exact sequences for continuous cohomology)`.

### 3.13 Local behaviour of derivative classes

Let `c` be an Euler system for `T, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O`. `(a)` If `r ∈ R_{F,M}` and `w` is a place of `F` not dividing `pr`, then `(κ_{F,r,M})_w ∈ H¹_f(F_w, W_M)`; equivalently `κ_{F,r,M} ∈ S^{Σ_{pr}}(F, W_M)`. `(b)` If `rq ∈ R_{F,M}`, then the image of `κ_{F,rq,M}` in `H¹_s(F_Q, W_M)` is `φ^fs_q` of the localisation of `κ_{F,r,M}: (κ_{F,rq,M})^s_q = φ^fs_q(κ_{F,r,M})`. `(c)` If `W_M/(Fr_q − 1)W_M` is free of rank one over `O/M`, the order of `(κ_{K,rq,M})^s_q` in `H¹_s(K_q, W_M)` equals the order of `(κ_{K,r,M})_q` in `H¹_f(K_q, W_M)`. `(d)` If `c` is trivial at a finite set `Σ` of primes not dividing `p`, then `κ_{F,r,M} ∈ S_Σ^{Σ_{pr}}(F, W_M)`. For Euler systems of finite depth `(b)` holds and `(a)` holds after multiplying by a constant `m` independent of `M`.

The precise hypotheses are an Euler system for an admissible tower (so the classes are universal norms); `r, rq ∈ R_{F,M}`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Theorem 5.1, p. 67). Finiteness away from `pr`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Theorem 5.4, p. 68). The finite–singular relation.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX, Theorem 5.2, p. 140). Triviality at `Σ` is inherited.

`(a)`: the Euler system classes are unramified outside `p` (Layer 2.3 Euler-system classes are unramified away from `p`, Proposition IV.6.1); the local lifts of Proposition IV.6.8 and the local induced modules show the derivative class is locally a coboundary of an unramified element; at archimedean places use Lemma IV.6.3.

`(b)`: compute with the cocycle of Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}` on a decomposition group at `q`, using the lifted telescoping identity and the key relation Lemma IV.7.3, which expresses `(σ̄_q − 1)` of the lift through `Q_q(Fr_q^{-1})` applied to the Frobenius value of the lift for `r`.

`(c): φ^fs_q` is an isomorphism by Layer 1.8 The finite–singular comparison map; `(d)`: Theorem IX.5.2, using uniqueness of local lifts.

Rubin IV §6: build local lifts through `T^I/MT^I` in Lemma 6.7 and Proposition 6.8. Infinite decomposition groups force the inverse limit of local `H⁰` to vanish; compare global and local lifts using uniqueness, then procyclic cohomological dimension one lifts the unramified finite-level class to `T^I`. At derivative primes Lemma 7.1 gives commutation only inside the decomposition group, and Lemma 7.3 kills the lift discrepancy by passing to a tower with large local degree (pp. 69–76).

For `r = 1` and `q ∈ R_{K,M}`: the singular part of `κ_{K,q,M}` at `q` is `φ^fs_q(c_K mod M)`.

Together `(a)` and `(b)` say that (`κ_{K,r,M} ⊗` generators)`_r` is a weak Kolyvagin system for `F_can` relaxed at `p`.

*Needs:* Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 1.8 The finite–singular comparison map; Layer 2.3 Euler-system classes are unramified away from `p`; `SelmerIwasawaCohomology §3.6 (Semilocal cohomology and descent of local classes)`; Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor; Layer 3.12 Local lifts of an Euler system at a prime and the finite-part theorem; Layer 3.11 The lifted telescoping identity and the key norm relation for lifts.

### 3.14 Kolyvagin's congruence

Let `c` be an Euler system for `T, K ⊂_f F ⊆ K_∞, q ∈ R` prime and `rq ∈ R`. For every prime `Q` of `F(rq)` above `q, (c_{F(rq)})_Q = ((P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)]) (c_{F(r)})_Q` in `H¹(F(rq)_Q, T)`, where `P_q(x) = P(Fr_q^{-1} | T^*; x)` and `(P_q(x) − P_q(N(q)x))/[K(q) : K(1)] ∈ O[x]`.

The precise hypotheses are an Euler system for an admissible tower.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV, Corollary 8.1, p. 77). The congruence relation.

The quotient polynomial is integral because `[K(q) : K(1)]` divides `N(q) − 1`.

Apply the local computation behind Layer 3.13 Local behaviour of derivative classes`(b)` to the lift `d̂` over the tower `F K_∞: H¹(F(rq)_Q, T)` is the limit of the finite-level groups, and `P_q(N(q)Fr_q^{-1})` annihilates `T`.

For `T = ℤ_p(1)` this is the classical congruence between cyclotomic units modulo the primes above `q` (Example IV.8.2).

The congruence is a consequence of the definition for towers extending in the `p`-direction; it is an extra hypothesis in rigidity condition `(c)`.

*Needs:* Layer 3.13 Local behaviour of derivative classes; Layer 2.1 Euler polynomials and their conventions; Layer 3.11 The lifted telescoping identity and the key norm relation for lifts.

### 3.15 Derivative classes form a weak Kolyvagin system; their finite parts

Let `K = ℚ, R` the integers of a finite extension of `ℚ_p, F = F_can` and `P` a set of primes `ℓ ≠ p`, unramified for `T`, with `T/(Fr_ℓ − 1)T` cyclic and `Fr_ℓ^{p^k} − 1` injective on `T` for all `k ≥ 0`. For an Euler system `c` for `(T, P, 𝒦)` with `𝒦` containing the maximal abelian `p`-extension unramified outside `p` and `P`, let `κ_n = κ_{[ℚ,n,I_n]} ⊗` (generators) `∈ H¹(ℚ, T/I_nT) ⊗ G_n, κ_1 = c_ℚ`. `(a)` If `H⁰(ℚ_p, T^*)` is divisible, `(κ_n)` is a weak Kolyvagin system for `(T, F_can, P)`; in general for each `k` and all large `j` the images `κ_n^{(k)}, n ∈ N_j`, form a weak Kolyvagin system for `(T/m^kT, F_can, P_j)`. `(b)` For `ℓ | n, (κ_n)_{ℓ,f} = Σ_{π ∈ S_1(n), π(ℓ) ≠ ℓ} (−1)^{ν(n/d_π)} (κ_{d_π})_{ℓ,f} ⊗ ⊗_{q | (n/d_π)} ρ_q(P_q(Fr_{π(q)}^{-1}))`, where `S_1(n)` is the set of permutations of the primes dividing `n` whose non-fixed primes form a single orbit, `d_π = ∏_{π(ℓ)=ℓ} ℓ`, and `A_{q,I} = ker((R/I)[G_q] → R/I)` is the augmentation ideal of the original finite tame group algebra. The `(R/I)`-linear comparison `ρ_q : A_{q,I}/A_{q,I}² ≅ G_q ⊗_ℤ R/I` sends `[σ] − 1` to `σ ⊗ 1`.

The precise hypotheses are `K = ℚ`; the two conditions on the primes of `P`; `𝒦` contains the maximal abelian `p`-extension of `ℚ` unramified outside `p` and `P`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Appendix `A`, Proposition A.2, p. 79). The raw derivative classes form a weak system.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Appendix `A`, Theorem A.4, p. 80). The formula for the finite parts.

`(a)`: Layer 3.13 Local behaviour of derivative classes gives `κ_n ∈ H¹_{F^{np}}` and relation (5); the condition at `p` is automatic if `H⁰(ℚ_p, T^*)` is divisible (Lemma A.1) and holds for the images in `T/m^k` after restricting to `N_j` (Proposition A.2).

([Barry Mazur and Karl Rubin, Refined class number formulas and Kolyvagin systems](https://arxiv.org/abs/0909.3916), §2, equation (1), p. 2). The integral augmentation comparison; extending coefficients gives `ρ_q`.

The group algebra uses `MonoidAlgebra (R ⧸ I) G_q`, with the original multiplicative group `G_q`; the tensor product uses its underlying abelian group over `ℤ`. Modulo the square of the augmentation ideal, `[στ] − 1 = ([σ] − 1) + ([τ] − 1)`. The inverse comparison sends `σ ⊗ a` to `a([σ] − 1)`; these maps are inverse on generators and commute with coefficient reduction.

`(b)`: compute the restriction of `κ_m` to `ℚ(ℓ)_ℓ` through the `ℓ`-finite quotient of the universal Euler system and the augmentation filtration (Propositions `A`.8, `A`.13, `A`.15); `P_q(Fr_{π(q)}^{-1})` lies in the augmentation ideal because `P_q(1) ∈ I_q`.

**Checks.**

- For `n = ℓ`, `S_1(ℓ)` has no `π` with `π(ℓ) ≠ ℓ`, so `(κ_ℓ)_{ℓ,f} = 0`.
- For `n = ℓq` the only `π` is the transposition, `d_π = 1`, and `(κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}))`.
- For `R` unramified quadratic over `ℤ₃`, `I = 3R`, `k = 𝔽₉` and `G_q = C₃`, the algebra `k[C₃] ≅ k[x]/(x³)` has augmentation quotient `kx` of dimension one over `k`, as does `C₃ ⊗_ℤ k`. Replacing the indexing group by the additive group of this tensor gives `k[C₃²] ≅ k[x,y]/(x³,y³)` and augmentation quotient of dimension two. The arithmetic data `T = R(1)`, `q = 7` have this tame group and conductor ideal.
- For the trivial tame group, the augmentation ideal and `G_q ⊗_ℤ R/I` are both zero. Reducing `R/I` further carries `[σ] − 1 ↦ σ ⊗ 1` to the same formula over the new coefficients.

*Needs:* Layer 3.13 Local behaviour of derivative classes; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 0.7 The canonical and the unramified Selmer structures; Layer 2.7 The universal Euler system.

### 3.16 Derivative classes of `χ`-anticyclotomic Euler systems

Let `χ:G_K→ℤ_p^×` have exact order `d|p−1`, let `K′` be its fixed field, and let `c` be a `χ`-anticyclotomic Euler system for `T`, with one of the three rigidity alternatives of 2.8. Fix a power `M=p^n, n≥0`, viewed in `O`. Write `L_s=K′(s)_χ, L_1=K′(1)_χ, Γ_s=Gal(L_s/K′)`, and `G_s=Gal(L_s/K)`. Thus `Γ_s` is abelian and normal, `G_s/Γ_s=C=Gal(K′/K)`, and conjugation on `Γ_s` is through `χ`. The prime-to-`p` quotient has order `d`; choosing a complement presents `G_s` as `Γ_s⋊C`, but no construction below depends on that choice. On the inertia factor `I_q=Gal(L_q/L_1)`, a compatible rational Frobenius `F_q` satisfies `F_qσ_qF_q⁻¹=σ_q^Q`. Put `P_q(X)=P(Fr_q⁻¹|T*;X)`; both Frobenius occurrences in the norm factor are inverse, as in published Definition9.4.1`(i)`, p.181. The Frobenius in the local finite evaluation at `w|q` is `F_q^f`, where `f=ord(F_q|K′)`.

There are two prime sets. The broad set `R_{K′,M}` consists of squarefree products of `q∤N` with `M|[L_q:L_1]` and `M|P_q(1)`. The target `chiUniversalDerivativeDescent` constructs, for every `d|p−1` and every `r` in the refined set `R_{K′,M,τ}` defined below, naturally and `O`-linearly in the actual global family `c`, classes `κ_{K′,r,M}∈H¹(K′,W_M)`, with restriction equal to `N_{L_1/K′}D_r c_{L_r}` modulo `M`, bottom class `c_{K′}` modulo `M`, coefficient compatibility and independence of norm lifts, tame generators in tensor-valued form, cochain lifts, and the analogue of 3.10. For `d=1` it also covers Rubin's set of 3.9, on which every `q|r` splits in `L_1`. On the broad set no derivative class is asserted for `d>1`: the broad conditions do not give the all-roots congruence used below (Check `chiRefinedPrimes.one_root_insufficient`), and no source treats that set. The `χ`-finite–singular map sends `χ^i` to `χ^{i−1}`; its tensor-valued version retains `I_q` and is equivariant. The analogue of 3.13 is the `χ`-finite–singular relation

```text
loc^s_q(κ_{K′,rq,M}) = φ^fs_q(loc_q κ_{K′,r,M})   for every M and every rq ∈ R_{K′,M,τ}.
```

For `d=1` it is 3.13. For `d>1` published §9.4, p.182, asserts it with a proof sketch only, and the local obstruction recorded below is not resolved there; the relation is therefore a hypothesis of its consumer 4.21`(b)`, not a target.

**The semidirect universal presentation.** Define `chiUniversalPresentation(r)` to be the `O[G_r]`-module generated by `x_s` for `s|r`, with relations

```text
(h−1)x_s = 0                      (h∈Gal(L_r/L_s)),
N_q x_{sq} = P_q(F_q⁻¹)x_s        (q∤s, sq|r, L_q≠L_1),
x_{sq} = x_s                     (L_q=L_1).
```

Here `N_q` is the full inertia norm and each relation generates an `O[G_r]`-submodule: all its `G_r`-translates are imposed. In the second relation `F_q` acts through `G_s`; any two lifts through the `q`-inertia factor agree on `x_s`. Compatible choices of primes are transported by conjugation. Include the analogous generators and norm relations at finite levels `E` of `𝒦′` when passing to the cofinal global presentation. A global Euler family gives an equivariant map `chiUniversalPresentation.toEulerClasses` to `H¹(L_r,W_M)`, sending `x_s` to `res_{L_r/L_s}(c_{L_s} mod M)`. Restriction–corestriction proves the norm relations and conjugation proves their translates. This construction does not impose `C`-invariance on `x_s`. Nor does it assert that this quotient is `O`-free or regular as a `G_r`-module: those would require additional proofs, not the abelian freeness theorem of 2.7.

The API `chiUniversalPresentation.gen`, `stabilizer`, `norm`, `toEulerClasses` and `conjugate` exposes exactly these generators, relations, evaluations and transports. The underlying group-algebra and quotient operations are imported; the new object records this Euler presentation. Sources: Rubin, draft IV.2.1–2.3, p.58, for the ordinary presentation; published §9.4, pp.180–182, for the changed tower. Taking the full semidirect group algebra and imposing all translates is the construction required by the nonabelian action.

**Checks.**

- `chiUniversalPresentation.trivial_character`: For `d=1, G_r=Γ_r` and the presentation agrees with 2.7. With `r=1` and `L_1=K′` it is `O[C]x_1`, reducing to `Ox_1` only when `C=1`; imposing `Cx_1=x_1` would lose nontrivial components of `c_{K′}`.
- `chiUniversalPresentation.conjugate_norm`: For `d=2`, conjugation sends `σ_q` to `σ_q⁻¹` and permutes all summands of `N_q`. Thus `N_q` is fixed, while `D_q` is generally changed. A presentation treating `D_q` as central fails this test.
- `chiUniversalPresentation.zero_evaluation`: The zero global family induces the zero evaluation map. A single pair satisfying a norm equation gives a map from the one-edge presentation, but need not extend to the cofinal presentation of a rigid global family.

**Refined primes and the congruence they supply.** Fix `τ` satisfying the published hypotheses: `ε_cyc(τ)=χ(τ), τ^d` fixes `L_1(μ_{p^∞},(O_{K′}^×)^{1/p^∞})`, and `T/(τ−ζ)T` is free of rank one over `O` for **every** `ζ∈μ_d`. Define `chiRefinedPrimes(M,τ)` by requiring `q∤N` and Frobenius conjugate to `τ` in

```text
E_M = L_1(μ_M, (O_{K′}^×)^{1/M}, W_M) / K.
```

This is a finite Galois field, with conjugacy rather than equality of unspecified lifts. Its squarefree products form `R_{K′,M,τ}`. Published Theorem9.4.3 and its proof sketch, p.182, use this refined set. The source asserts derivative classes and the local relations there. The broad set above carries no derivative classes for `d>1`; it is not substituted for this source's set.

Prove `chiRefinedPrimes.ray_degree`, `.all_roots` and `.subset_broad`: the unit-radical and unramified-field conditions give `M|[L_q:L_1]` and `F_q^d|L_1=1`, the cyclotomic condition gives `Q≡χ(τ)` mod `M`, and the representation condition gives `F_T≡τ` on `T/M` up to conjugacy. The dual-polynomial convention is `P_q(X)=det(1−Q⁻¹F_T X|T)`. Since every `τ−ζ` has a nonzero free quotient, its determinant is zero. Multiplication by `χ(τ)` permutes `μ_d`, so `P_q(η)≡`0 mod `M` for every `η∈μ_d`, in particular `η=1`. The differences of distinct Teichmüller roots are units. Successive division by their monic linear factors therefore gives

```text
X^d−1 divides P_q(X) in (O/M)[X].
```

This division works over the possibly nonreduced ring `O/M`; a field-only distinct-root argument is insufficient. It uses polynomial division and comaximal linear factors, not a new polynomial theory. When `M` is a unit the coefficient ring and all assertions are zero. The ray-degree step consumes GlobalNumberFields Layer 2 and ClassFieldTheory Layers 7 and 13 with their unit-radical reciprocity, as in 1.13; it is not supplied by local duality in ClassFieldTheory Layer 5.

**Checks.**

- `chiRefinedPrimes.one_root_insufficient`: For `p=3,d=2,P=1−X, P(1)=0` but `P(−1)=2≠0` modulo 3. Consequently `X²−1` does not divide `P`. The earlier `χ`-ray norm-module control passes the broad condition and fails this stronger congruence. A rank-one `τ=1` likewise has `T/(τ+1)T=0`, not free rank one.
- `chiRefinedPrimes.all_roots`: Over `𝔽₃, P=1−X²=−(X²−1)` vanishes at both roots. For `d=1` the extra polynomial condition is precisely `M|P(1)`, while the refined field condition also requires `q` split in `L_1`. The same factorization holds over `ℤ/9`, testing nonreduced coefficients as well.
- `chiRefinedPrimes.coefficient_level`: Refinement modulo `M` is not refinement modulo `[L_q:L_1]` when the latter has larger valuation. In particular `M=3` and inertia degree 9 must not justify division of polynomial coefficients by 9. The rank-two local control in 2.8 distinguishes these levels.
- `chiRefinedPrimes.small_p`: At `p=2` the condition `d|p−1` forces `d=1`; there is no quadratic `χ` in this contract. A coefficient ring `k[[π]]` of characteristic `p` has no arithmetic cyclotomic field `E_M` of this kind. The polynomial division argument is algebraic, but the prime-set definition is confined to the stated mixed-characteristic arithmetic setting.

**Refined derivative invariance.** Let `M` divide every inertia order, suppose `X^d−1` divides every `P_q` modulo `M`, and require `F_q^d|L_1=1` for every `q|r`. All three conditions hold on the refined set. Put `J_s=Gal(L_s/L_1)`, the product of its tame inertia factors `I_q`. Then `chiUniversalDerivativeDescent.refined_invariance` states that

```text
(g−1) h_r = 0 in chiUniversalPresentation(r)/M,
h_r = Ñ_{L_1/K′} D_r x_r,       g∈Γ_r,
```

and `h_r` is independent of the norm lift `Ñ`. Prove first the stronger inertia statement `(j−1)D_r x_r=0` for `j∈J_r`, simultaneously for every `G_r`-translate of every generator. For `q|r` put `t=r/q`. The telescoping identity gives `(σ_q−1)D_r x_r=−D_tP_q(F_q⁻¹)x_t` modulo `M`. Factor `P_q(F_q⁻¹)=(F_q^{-d}−1)R_q(F_q⁻¹)` modulo `M`. The field-fixing hypothesis places `F_q^d` in `J_t`, not merely in `Γ_t`. Since `J_t⊆Γ_t` is abelian, `F_q^{-d}` commutes with `D_t`. Expand `R_q(F_q⁻¹)x_t` as a sum of translated `x_t`'s and apply the induction hypothesis to each. For a translated norm relation the polynomial is conjugated too; the `d`-th power of that conjugated Frobenius still lies in `J_t`. No commutation of `F_q` with `D_t` is used. Thus `J_r` fixes `D_r x_r`. Two lifts of the norm from `Γ_1=Gal(L_1/K′)` differ by the `J_r`-augmentation ideal, which now kills `D_r x_r`. Their outputs agree, and the `Γ_1`-norm makes that output `Γ_r`-invariant. Restriction–corestriction evaluates these equalities on the actual global Euler classes. The condition `F_q^d|L_1=1` cannot be omitted from this argument: `Γ_t`-invariance of a normed derivative alone would not show that the `J_r`-augmentation ideal kills the unnormed derivative.

Without the all-roots congruence and the condition `F_q^d|L_1=1` no invariance statement is made; the broad set imposes neither. For `d=1` the three conditions above define Rubin's set, and the refined argument recovers Rubin IV.4.2, pp.62–63, with `M` dividing the inertia orders and `P_q(1)` and `q` split in `L_1` as required in IV.1.1. A single norm equation does not give invariance (Check `chiUniversalDerivativeDescent.norm_not_invariance`).

**Canonical descent when invariants vanish.** If additionally `H⁰(L_r,W_M)=0`, inflation–restriction makes res:`H¹(K′,W_M)→H¹(L_r,W_M)^{Γ_r}` an isomorphism. Its inverse defines `chiUniversalDerivativeDescent.no_invariants` from the preceding invariance theorem. This proves existence, linearity, bottom-class identity, coefficient compatibility when both levels satisfy the hypotheses, and independence of all descent witnesses. For the cochain description set `B=Maps_cont(G_K,W_M)`, embed `t` as `(g↦gt)`, use right translation `(γf)(g)=f(gγ)`, and put `Z=B/W_M`. A lift `f` of `a Γ_r`-invariant value in `Z` gives the cocycle `γ↦(γ−1)f`. Replacing `f` by `f+t` changes it by the coboundary of `t`, with this sign.

There is also an equivariant lift of the universal evaluation at this level. The exact sequence `0→B^{G_{L_r}}→Z^{G_{L_r}}→H¹(L_r,W_M)→0` follows because `W_M^{G_{L_r}}=0`. As an `(O/M)[G_r]`-module, `B^{G_{L_r}}` is a finite direct sum of coinduced copies of `O/M`, which is self-injective. The adjunction `Hom_{(O/M)[G_r]}(A,Maps(G_r,O/M))≅Hom_{O/M}(A,O/M)` makes this kernel injective, also for nonabelian `G_r`. Thus the evaluation lifts. Two equivariant lifts differ by a map to `B^{G_{L_r}}`; on the invariant `h_r` their difference lies in `B^{G_{K′}}` and is killed by the connecting map. This proves independence of the cochain lift without claiming freeness of the semidirect Euler presentation. Sources: Rubin draft IV.4.5–4.8, pp.63–66, IV.4.10–4.13, pp.66–67, and Appendix `B`.4.1–4.5, pp.155–156, for the coinduced sequence, action and connecting cocycle; the argument above uses them for the finite semidirect quotient under the displayed `H⁰` hypothesis.

For the exponent-bound hypotheses there is a useful vanishing criterion, `chiUniversalDerivativeDescent.irreducible_refined`. If `T/𝔭T` is irreducible over `G_{K′}` and has dimension greater than one, then `H⁰(L_r,W_M)=0` for every finite Galois `p`-extension `L_r/K′`. Indeed residual invariants under `G_{L_r}` form a `G_{K′}`-stable subspace. If nonzero, irreducibility makes the whole residual representation factor through a finite `p`-group, whose only irreducible representation in characteristic `p` is the one-dimensional trivial representation. This contradicts the dimension. `A 𝔭`-power filtration then gives the claim for `W_M`. This is the arithmetic application of the existing modular `p`-group result cited in the opening boundaries, together with inflation–restriction (Rubin Appendix `B`.2.5, p.152); it does not re-plan that representation theorem. When `d>1` the all-roots quotient condition forces `rank_O T≥d>1`, since the distinct `ζ` are distinct eigenvalues over `Frac(O)`. Thus 4.21`(b)`'`s` refined classes have this canonical cochain descent in every rigidity branch. In dimension one the criterion applies if the residual character is nontrivial, but a trivial residual character has invariant torsion and must use the ordinary or cofinal lifting argument.

Without this `H⁰` hypothesis, `chiCompatibleCochainLifts` denotes compatible equivariant lifts of the universal evaluation over the cofinal global presentation such that any two differ, on `h_r`, by an element of `B^{G_{K′}}`. The finite-level kernel is then generally `B^{G_{L_r}}/W_M^{G_{L_r}}`, not `B^{G_{L_r}}`, so the injectivity argument just given cannot be reused unchanged, and vanishing of `H⁰` for the lattice `T` does not imply vanishing for `W_M`. For `d=1` the lifts are a target: Rubin's ordinary admissible-tower argument supplies them, and for the ordinary replacement alternatives `(b),(c)` IX.1, pp.134–135, supplies them under `T^{G_{K(1)}}=0` and a fixed `m` with `r∈R_{K,Mm}`, as recorded in 3.19. Those are the precise supported restrictions, rather than a claim that arbitrary finite-level invariant torsion vanishes. For `d>1` published §9.4 gives a sketch, not a construction: a proof by passing to an infinite tower would need base-change and relative-freeness or `Ext`-vanishing properties of the semidirect presentation before the inverse-limit sequence of IV.4.7, and these do not follow from writing the quotient presentation, since overlapping norm relations involve possibly noncommuting Frobenius operators. For `d>1`, `chiCompatibleCochainLifts c` is therefore a named hypothesis on `c`, not a target. The bound 4.21`(b)` does not use it: its residual irreducibility gives the `H⁰` vanishing above.

This is the local obstruction behind the `χ`-finite–singular relation. A proof would first need `chiRayIntegralClassComparison` of 2.8 to control the actual upper and lower unramified classes, including the `H[e_χ]` ambiguity, and then derive the relation; it is not obtained by dividing the norm equation in a torsion group. In the ordinary proof Rubin IV.7.1–7.3, pp.74–76, uses the abelian decomposition quotient to commute operators on cochain lifts. The identity `P_q(QF_T⁻¹)=0` is Cayley–Hamilton, whereas `P_q(F_T⁻¹)` need not vanish when `Q≡χ(s)` rather than 1. Replacing `F` by `F^f` changes the prescribed Euler factor and does not repair that step. No source carries out this derivation for `d>1`, even given `chiRayIntegralClassComparison`.

Mazur–Rubin, §3.2, Theorems3.2.`4/3`.2.7 and Remarks3.2.`3/3`.2.5, pp.23–24, treat abelian towers over `ℚ` and finite-order coefficient twists; their Chapter4, pp.35–54, assumes its Selmer triple and constructs the artinian-system theory. Perrin-Riou, §1.2, pp.1236–1240, and Proposition2.2.5, pp.1249–1250, use cyclotomic abelian fields and derive local congruences from global trace families. Kato, §13.1–13.4, pp.224–226, likewise uses cyclotomic fields, with an explicitly transported Euler polynomial. These supply the ordinary and coefficient-twist cases, not a proof that a `χ`-semidirect tower becomes abelian after twisting `T`; for `d>1` the `χ`-finite–singular relation therefore remains a hypothesis.

**Checks.**

- `chiUniversalDerivativeDescent.trivial_character`: For `d=1, f=1` and the semidirect action is trivial; the polynomial hypothesis becomes `M|P_q(1)`, and `F_q|L_1=1` is the ordinary splitting condition. Recover the ordinary presentation and admissible-tower derivative descent on that source prime set. For the two replacement rigidity alternatives retain 3.19's invariant-vanishing hypothesis and fixed Mm refinement; their source proof is not a claim at every broad conductor of depth `M`.
- `chiUniversalDerivativeDescent.character_shift`: For `d=2`, one derivative changes `χ^i` to `χ^{i−1}` and two derivatives return to `χ^i`. More generally `ν(r)` derivatives give `χ^{i−ν(r)}`. Keeping the tame tensor factor `⊗_{q|r}I_q` restores equivariance. At `p=2` only `d=1` is allowed.
- `chiUniversalDerivativeDescent.norm_not_invariance`: Over `𝔽₃`, let `σ` cycle `(e₀,e₁,e₂)`, let `F(e₀)=−e₀, F(e₁)=−e₂, F(e₂)=−e₁`, and put `x=e₀, N=1+σ+σ², y=2Nx`. Then `σ³=F²=1, Fσ=σ²F, σy=y`, and `Nx=(1−F⁻¹)y` for `P=1−X` with `P(1)=0`. Nevertheless `D=σ+2σ²` gives `(σ−1)Dx=−Nx≠0`. This finite norm module is not assumed to extend to a rigid global Euler system; it fails the refined all-roots condition `P(−1)=0`.
- `chiUniversalDerivativeDescent.irreducible_refined`: In residual dimension two or more, a finite `p`-group cannot act irreducibly in characteristic `p`; hence invariants after a finite `p`-extension vanish under the stated irreducibility hypothesis. A rank-one trivial residual character has full invariants and fails that vanishing conclusion. Rank zero is excluded by irreducibility and by every free-rank-one quotient condition.
- `chiCompatibleCochainLifts.residual_invariants`: For a rank-one unramified local lattice with Frobenius `1+p, T^{Fr=1}=0` but `(T/pT)^{Fr=1}=T/pT`. Thus the no-invariants descent cannot infer its hypothesis from lattice injectivity. For the zero coefficient module descent is uniquely zero, and `r=1` gives the original bottom class.
- `chiCompatibleCochainLifts.cocycle_sign`: With the embedding `t↦(g↦gt)` and right translation, evaluation at 1 gives `((γ−1)t)(1)=γt−t`. Replacing a cochain lift `f` by `f+t` changes its cocycle by this coboundary, not its negative. For `γ=−1` on `𝔽₃` and `f=t=1`, the two coboundaries are 1 and 2, whose difference is `γt−t=1`.

*Needs:* Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.13 Local behaviour of derivative classes; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; Layer 0.2 finite self-injective coefficient duality; the existing coinduction and inflation–restriction interfaces in the opening boundaries.

### 3.17 The map from Euler systems to Kolyvagin systems

In the setting of Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts, define for `n ∈ N κ′_n = Σ_{π ∈ S(n)}` sign`(π) κ_{d_π} ⊗ ⊗_{ℓ | (n/d_π)} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})) ∈ H¹(ℚ, T/I_nT) ⊗ G_n`, the sum over all permutations of the primes dividing `n`. Then `(κ′_n)` satisfies the finite–singular relations and `(κ′_n)_{ℓ,f} = 0` for `ℓ | n`. Theorem (Mazur–Rubin 3.2.4): if `𝒦` contains the maximal abelian `p`-extension of `ℚ` unramified outside `p` and `P`, and `(a) T/(Fr_ℓ − 1)T` is cyclic and `(b) Fr_ℓ^{p^k} − 1` is injective on `T` for all `ℓ ∈ P, k ≥ 0`, then `c ↦ κ′` is a canonical `G_ℚ`-equivariant homomorphism `ES(T) → K̄S(T, F_can, P)` with `κ̄_1 = c_ℚ`; if moreover `H⁰(ℚ_p, T^*)` is divisible it is a homomorphism `ES(T) → KS(T, F_can, P)` with `κ_1 = c_ℚ`. Variant (3.2.7): if `𝒦` contains the maximal abelian `p`-extension unramified outside a cofinite set of primes containing `P` (no `p`-direction), `c_F ∈ H¹_{F_can}(F, T)` for all `F`, and there is `γ ∈ G_ℚ` with `γ − 1` killing `μ_{p^∞}` and injective on `T`, the same conclusions hold. The output in `K̄S` is a generalised Kolyvagin system; the ordinary one needs the local divisibility condition at `p`. Over a number field `K` the rank-one case of Layer 7.2 The higher Kolyvagin derivative gives the corresponding map.

The precise hypotheses are `K = ℚ, R` the integers of a finite extension of `ℚ_p`; `(a), (b)` of Theorem 3.2.4; the Euler factors are `P_ℓ(Fr_ℓ^{-1})` with `P_ℓ(x) = det(1 − Fr_ℓ x | T)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 3.2.4, pp. 23–24). The theorem.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Appendix `A`, proof of Theorem 3.2.4, (33), p. 80). The corrected classes.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 3.2.7, p. 24). The variant without the `p`-direction.

Each `ρ_ℓ` in this sum is the augmentation comparison in `(R/I_n)[G_ℓ]` of §3.15, after coefficient reduction. Relation (5) for `κ′` follows from that for `κ` by inspection of the sum.

Group the sum according to `π(ℓ) = ℓ` or not: `κ′_n = Σ_{π(ℓ)=ℓ}` sign`(π) s_π ⊗` (⋯) with `s_π = κ_{d_π} − Σ_{π′ ∈ S_1(d_π), π′(ℓ)≠ℓ} (−1)^{ν(d_π/d_{π′})} κ_{d_{π′}} ⊗` (⋯); Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts gives `(s_π)_{ℓ,f} = 0`.

Hence `κ′_n ∈ H¹_{F(n)}(ℚ, T/I_nT) ⊗ G_n`. Without divisibility at `p` the construction is carried out for `T/m^k` on `N_j, j` large, giving an element of the limit `K̄S`.

To use Rubin's Euler systems first change the Euler factors by Layer 2.6 Changing the Euler factors.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.correctedClass`: `κ′_n = Σ_{π ∈ Perm(primes of n)}` sign`(π)·κ_{d_π} ⊗ ⊗_{ℓ | n/d_π} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1}))`.
- `TauCeti.KolyvaginSystems.correctedClass_one`: `κ′_1 = c_ℚ`, and `κ′_ℓ = κ_ℓ` for a prime `ℓ`.
- `TauCeti.KolyvaginSystems.correctedClass_finite_eq_zero`: `(κ′_n)_{ℓ,f} = 0` for every `ℓ | n`.
- `TauCeti.KolyvaginSystems.eulerToKolyvagin`: The `R`-linear, `G_ℚ`-equivariant map `ES(T, P, 𝒦) → K̄S(T, F_can, P)`.
- `TauCeti.KolyvaginSystems.eulerToKolyvagin_one`: (eulerToKolyvagin `c`)`_1 = c_ℚ`.
- `TauCeti.KolyvaginSystems.eulerToKolyvagin_ordinary`: If `H⁰(ℚ_p, T^*)` is divisible, the map factors through `KS(T, F_can, P) → K̄S`.
- `TauCeti.KolyvaginSystems.eulerToKolyvagin_twist`: For a twisted Euler system and the corresponding admissible twisted triple, the conductor-one evaluation of its generalized Kolyvagin system equals the twisted initial class. Full finite-level twisting compatibility uses the coefficient/polynomial/augmentation dictionary.

**Checks.**

- `eulerToKolyvagin_zero`: The zero Euler system maps to zero.
- `correctedClass_finite_vanishes`: The corrected weak family from an admissible Euler system has vanishing finite part at every conductor prime.
- `WeakKolyvaginSystem.not_kolyvagin`: `A` weak family with nonzero finite part at a conductor prime is outside the image of ordinary Kolyvagin systems.

`κ′_1 = κ_1 = c_ℚ` and `κ′_ℓ = κ_ℓ`.

For `n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}))`.

Compatibility: with twisting (Remark 3.2.5), with scalars and with `T → T/m^k`.

Additional arithmetic check: For `n = ℓ`: Perm `= {id}, κ′_ℓ = κ_ℓ` and `(κ_ℓ)_{ℓ,f} = 0` by the finite-part formula.

Additional arithmetic check: For `n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}))`; the sign of the transposition is `−1` and `d_π = 1`.

Additional arithmetic check: For `T` with `H⁰(ℚ_p, T^*)` not divisible, `H¹_{F_can}(ℚ_p, T/IT)` can be a proper submodule of `H¹(ℚ_p, T/IT)` (Lemma A.1), the classes `κ′_n` need not satisfy the condition at `p`, and the map is defined only into `K̄S`: the ordinary and the generalised outputs are different statements.

*Needs:* Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 2.2 The module of Euler systems; Layer 2.6 Changing the Euler factors; twisting.

### 3.18 Worked example: Kolyvagin's congruence for the multiplicative group

Let `T = ℤ_p(1)`, so `H¹(F(r), T)` is the `p`-adic completion of `F(r)^×` and, for a prime `Q` of `F(r)` not dividing `p` with residue field `k_Q, H¹_f(F(r)_Q, T) = H¹_ur(F(r)_Q, T) ≅ k_Q^× ⊗ ℤ_p`; full local `H¹` is the completion of `F(r)_Q^×` and also has the valuation summand `ℤ_p`. Then `P(Fr_q^{-1} | T*; x) = 1 − x` and the congruence of Layer 3.14 Kolyvagin's congruence reads: for every `r ∈ R`, prime `q` with `rq ∈ R` and prime `Q` of `F(r)` above `q`, the element `c_{F(rq)} / c_{F(r)}^{((N(q) − 1)/[K(q):K(1)]) Fr_q^{-1}}` has order prime to `p` in `k_Q^×`, that is, the two classes agree in the `p`-adic completion of `k_Q^×`. For the cyclotomic-unit Euler system this is the `p`-part of the congruence `1 − ζ_{rq} ≡ 1 − ζ_r^{Fr_q^{-1}}` modulo every prime above `q`, which holds because `ζ_q ≡` 1 there. Kolyvagin's original definition imposed this congruence as an axiom; under Rubin's definition, which requires the system to extend along a `ℤ_p^d`-extension, it is a theorem (Layer 3.14 Kolyvagin's congruence), and conversely the congruence allows one to drop the `ℤ_p^d`-extension (rigidity condition (ii)`′(c)` of Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems).

The precise hypotheses are `T = ℤ_p(1)`; `c` an Euler system for `T` over an admissible tower.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IV §8, Example 8.2, p. 78 (1999 draft)). specialises the congruence of Corollary IV.8.1 to `T = ℤ_p(1)` and relates it to the congruence for cyclotomic units, with the denominator misprinted as `[K(q) : K]`

([Karl Rubin, Euler Systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), Chapter 4 §8, Example 4.8.2 and (4.13), p. 103 (published version)). the same example with the denominator `[K(q) : K(1)]`, the congruence read in the `p`-adic completion of `k_Q^×`

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II §1, Remark 1.5, p. 23). Kolyvagin's method required an extra congruence condition; Rubin's universal-norm hypothesis makes it a consequence, and conversely the congruence can replace that hypothesis

For `T = ℤ_p(1), T* = Hom(T, ℤ_p(1)) = ℤ_p` with trivial action, so `det(1 − Fr_q^{-1}x | T*) = 1 − x`.

`(P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)] = ((N(q) − 1)/[K(q) : K(1)])Fr_q^{-1}`. The 1999 draft prints the denominator `[K(q) : K]` in Example IV.8.2; the published Example 4.8.2 has `[K(q) : K(1)]`, as Corollary IV.8.1 requires . The two agree when `K(1) = K`, for instance for `K = ℚ`.

Local Kummer theory gives `H¹(L, ℤ_p(1)) ≅ lim_a L^×/(L^×)^{p^a}`. For residue characteristic different from `p`, reduction identifies the completed units with `k_L^× ⊗ ℤ_p`, and valuation gives a split exact sequence `0 → k_L^× ⊗ ℤ_p → H¹(L, ℤ_p(1)) → ℤ_p → 0`. Euler-system classes at `q` lie in the finite/unramified subgroup by Layer 2.3 Euler-system classes are unramified away from `p`. Their unit reductions give the stated congruence. The full-group identification printed in both Rubin examples omits the valuation term.

For `K = ℚ, r = 1` and the cyclotomic units `c_{ℚ(q)} = N(1 − ζ_q)` (suitably smoothed), the congruence says the unit is a `p`-th power residue up to the stated exponent modulo primes above `q`.

For `q ∈ R` with `N(q) ≡` 1 modulo a high power of `p` the exponent `(N(q) − 1)/[K(q) : K(1)]` is a `p`-adic unit times a power of `p`, so the statement is nontrivial exactly on the `p`-part of `k_Q^×`.

A local uniformizer has valuation 1 and a nonzero Kummer class in the `ℤ_p` summand; it is not an element of `H¹_f` and cannot be identified with a residue-field unit.

*Needs:* Layer 3.14 Kolyvagin's congruence; Layer 3.11 The lifted telescoping identity and the key norm relation for lifts; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; Layer 2.3 Euler-system classes are unramified away from `p`.

### 3.19 Derivative classes and the key relation under the alternative rigidity conditions

Let `c` be an Euler system for `(T, 𝒦, N)` satisfying Rubin's condition (ii)`′(b)` or (ii)`′(c)` of Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems in place of the existence of a `ℤ_p^d`-extension in `𝒦`, and assume `T^{G_{K(1)}} = 0`. (ii)`′(b): c_{K(r)} ∈ S^{Σ_p}(K(r), T)` for every `r`, and some `γ ∈ G_K` is trivial on `K(1)(μ_{p^∞}, (O_K^×)^{1/p^∞})` with `γ − 1` injective on `T`. (ii)`′(c): c_{K(r)} ∈ S^{Σ_p}(K(r), T)` for every `r, Fr_q^n − 1` is injective on `T` for every `q ∤ N` and every power `n` of `p`, and the classes `c_{K(r)}` satisfy the congruence of Layer 3.14. Then there is a power `m` of `p`, independent of `M`, such that for `r ∈ R_{K,Mm}` the derivative classes `κ_{K,r,M}` are defined and satisfy `(a) κ_{K,r,M}` is finite at every place not dividing `pr`, and `(b)` the singular part of `κ_{K,rq,M}` at `q` is `φ^fs_q` of the finite part of `κ_{K,r,M}` at `q`. Under (ii)`′(b), (b)` rests on the identity `P(γ | T; 1)·(N_q γ d̂(x_{F(rq)}) − P(Fr_q^{-1} | T*; Fr_q^{-1}) γ d̂(x_{F(r)})) = 0` in `W_{M′}` for a power `M′` of `p` divisible by `M·P(γ | T; 1)`, proved with auxiliary primes `l` in place of the `ℤ_p`-tower. Consequently Rubin's Theorems II.2.2, II.2.3 and II.2.10 (Layer 4.17 Rubin's bound with error terms) hold with the same conclusions.

The precise hypotheses are `c` satisfies the corestriction relations of an Euler system and (ii)`′(b)` or (ii)`′(c)`; `T^{G_{K(1)}} = 0`; `r ∈ R_{K,Mm}`, with `m` depending on `T` and `c` but not on `M`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX §1, condition (ii)`′` and the adaptation of Chapters IV–`V`, pp. 133–135). the alternative rigidity conditions, the construction of derivative classes when `T^{G_{K(1)}} = 0`, the analogue of Theorem IV.5.1 via Corollary IV.6.5, and the analogue of Lemma IV.7.3 through auxiliary primes `l`

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX §1, Example 1.1 and Theorem 1.2, pp. 135–136). cyclotomic units satisfying (ii)`′(b)` and (ii)`′(c)` without a `ℤ_p`-tower, and the resulting class-number equality

Construction: `T^{G_{K(1)}} = 0` gives `T^{G_{K(r)}} = 0` for every `r` (Rubin, Lemma IV.2.5(i)), so with `𝕋 = Maps(G_K, T)` the sequence `0 → 𝕋^{G_{F(r)}} → (𝕋/T)^{G_{F(r)}} → H¹(F(r), T) → 0` is exact and replaces the inverse limit of Proposition IV.4.7; lift `c` through it as in Layer 3.2 The induced module, the connecting map and lifts of an Euler system`(b)`, project to `(𝕎_M/W_M)^{G_{F(r)}}` and define `κ_{F,r,M}` as in Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`.

`(a)`: Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor`(d)` needs only that the Euler-system classes are unramified away from `p`, which (ii)`′(b)` and (ii)`′(c)` include as an assumption (under (ii)`′(a)` it came from the tower).

`(b)` under (ii)`′(b)`: with `n = |μ_{p^∞} ∩ K`| choose, by Chebotarev, a prime `l` with `Fr_l = γ` on `K(1)(μ_{nM′}, (O_K^×)^{1/(nM′)}, W_{M′}), Fr_l = 1` on `K(rq)`, and `Fr_l ≠ 1` on `K(λ^{1/(np)})` where `λO_K = q^h, h` the order of `q` in the class group. Then `nM′ | [K(l) : K]` and the decomposition group of `q` in `Gal(K(l)/K)` has order at least `M′`. The Euler relation makes `P(Fr_l^{-1} | T*; Fr_l^{-1})c_{K(r)}` a norm from `K(rl)`, and `P(Fr_l^{-1} | T*; Fr_l^{-1}) ≡ P(γ | T; 1)` mod `M` in `O[Gal(K(rq)/K)]`; the proof of Layer 3.11 The lifted telescoping identity and the key norm relation for lifts`(c)` then runs with `K(l)/K` in place of the tower.

`(b)` under (ii)`′(c)`: reverse the argument of Layer 3.14 Kolyvagin's congruence, deducing the key relation of Layer 3.11 The lifted telescoping identity and the key norm relation for lifts`(c)` from the congruence and the injectivity of `Fr_q^n − 1`.

The bounds of Layer 4.17 Rubin's bound with error terms use only `κ_{K,r,M}` for `r ∈ R_{K,Mm}` with these properties; the extra factor `m` does not affect them.

Cyclotomic units without a `ℤ_p`-tower: for `χ` a nontrivial even character of conductor prime to `p`, the twisted family of `(ζ_m − 1)(ζ_m^{-1} − 1)` satisfies (ii)`′(b)` and (ii)`′(c)` but not (ii)`′(a)`, and the theorem gives `|A_L^χ| = [E_L^χ : C_{L,χ}]` (Rubin, Example IX.1.1 and Theorem IX.1.2; the cyclotomic-unit family is an arithmetic input).

Without any rigidity condition the statement fails: the family with `c_F = 0` for `F ≠ K` and `c_K` arbitrary is an Euler system (Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems`(a)`).

Under (ii)`′(a)` the theorem reduces to Layer 3.13 Local behaviour of derivative classes with `m = 1`.

*Needs:* Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; Layer 2.7 The universal Euler system; Layer 3.2 The induced module, the connecting map and lifts of an Euler system; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor; Layer 3.11 The lifted telescoping identity and the key norm relation for lifts; Layer 3.14 Kolyvagin's congruence; `TauCetiRoadmap.Chebotarev Layer 10`.

### 3.20 The two-prime check of the correction terms

For distinct `ℓ, q ∈ P` and `n = ℓq: (i) (κ_{ℓq})_{ℓ,s} = φ^fs_ℓ(κ_q)` and `(κ_{ℓq})_{q,s} = φ^fs_q(κ_ℓ)`; (ii) `(κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}))`; (iii) the corrected class `κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}))` has zero finite part at `ℓ` and at `q` and the same singular parts as `κ_{ℓq}` at `ℓ` and `q`, because the correction term `κ_1` is unramified at `ℓ` and `q`; (iv) `κ′_{ℓq}` is symmetric in `ℓ` and `q`. Hence `κ′` satisfies both edge relations of the square 1 — `ℓ` — `ℓq` — `q` — 1.

The precise hypotheses are the setting of euler-to-kolyvagin.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Appendix `A`, Theorem A.4 and (33), p. 80). The two formulas specialised to two primes.

`(i)` is Layer 3.13 Local behaviour of derivative classes`(b)` with `κ′_ℓ = κ_ℓ`; (ii) is Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts for the transposition, with sign `(−1)^{ν(n/d_π)} = (−1)² = 1`; (iii) subtract; (iv) the correction term is symmetric.

The sign in (iii) is `−1 =` sign of the transposition, opposite to the sign `+1 = (−1)^{ν(ℓq)}` in (ii): the two formulas are consistent.

Omitting the correction leaves `(κ_{ℓq})_{ℓ,f} ≠ 0` in general, so `κ_{ℓq} ∉ H¹_{F(ℓq)}`.

*Needs:* Layer 3.17 The map from Euler systems to Kolyvagin systems; Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts.

### Examples

For order 2, `D_σ=σ`.

For order 3, `D_σ=σ+2σ²`.

The derivative of the identity in the trivial cyclic group is zero.

### Dependencies

This layer uses `MonoidAlgebra`; `Representation.norm`; Layer 1.1 The fields `K(q), K(r)` and their Galois groups; Layer 2.7 The universal Euler system; `TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`; `TauCeti.ContCohomology.explicitCor1`; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.8 The finite–singular comparison map; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 0.1 Selmer triples and squarefree conductors; Layer 3.1 The norm and Kolyvagin derivative operators; `LinearMap.ker`; `LinearMap.range`; Layer 2.9 Anticyclotomic Euler systems over ring class fields; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence; `SelmerIwasawaCohomology §4.25 (Uniform local annihilation away from p)`; `SelmerIwasawaCohomology Layer 2`; Layer 3.5 Selected descent through a map with bounded kernel and cokernel; Layer 3.6 Uniform restriction control throughout the ring-class tower; `SelmerIwasawaCohomology §2.1 (Compact and rational Selmer data)`; `TauCeti.ContCohomology.H1`; Layer 3.7 The finite–singular relation with its Frobenius operator; Layer 3.4 Invariance of the derivative of the universal class; Layer 3.2 The induced module, the connecting map and lifts of an Euler system; Layer 2.2 The module of Euler systems; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 2.3 Euler-system classes are unramified away from `p`; `SelmerIwasawaCohomology §3.6 (Semilocal cohomology and descent of local classes)`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; Layer 2.1 Euler polynomials and their conventions; `Polynomial.X_sub_C_dvd_sub_C_eval`; `Polynomial.divByMonic`; Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor; `TauCeti.coind`; `TauCeti.ContCohomology.explicitShapiro1`; `TauCetiRoadmap.ProfiniteCohomology Layer 11`; `ArithmeticGaloisDuality §R02.1.2 (Continuous cochains into inverse limits)`; `DerivedModuleAlgebra §1.T.1 (The Milnor sequence for towers of complexes)`; `DerivedModuleAlgebra §1.T.1 (Mittag-Leffler towers have vanishing lim¹)`; `ArithmeticGaloisDuality §R02.1.2 (Long exact sequences for continuous cohomology)`; Layer 3.12 Local lifts of an Euler system at a prime and the finite-part theorem; Layer 3.11 The lifted telescoping identity and the key norm relation for lifts; Layer 3.13 Local behaviour of derivative classes; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 0.7 The canonical and the unramified Selmer structures; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts; Layer 2.6 Changing the Euler factors; Layer 2.5 Twisting Euler systems by characters of finite order; Layer 3.14 Kolyvagin's congruence; `TauCetiRoadmap.Chebotarev Layer 10`; Layer 3.17 The map from Euler systems to Kolyvagin systems.

The proof also uses Mazur–Rubin 2004 Appendix `A` (Lemma A.6 to Proposition A.15).

## Layer 4: Descent and bounded errors

### 4.1 The Selmer graph and the Selmer sheaf

A sheaf `S` of `R`-modules on a graph `X` assigns a module `S(v)` to each vertex, a module `S(e)` to each edge and a map `ψ_v^e : S(v) → S(e)` whenever `v` is an endpoint of `e`; a global section is a family `(κ_v)` with `ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′})` for every edge `e = {v, v′}`; `Γ(S)` is the module of global sections. For a Selmer triple `(T, F, P), X(P)` is the graph with vertex set `N(P)` and an edge joining `n` and `nq` whenever `n, nq ∈ N(P)` with `q` prime. The Selmer sheaf `ℋ = ℋ_{(T,F,P)}` has `ℋ(n) = H¹_{F(n)}(K, T/I_nT) ⊗ G_n`; for the edge `e` joining `n` and `nq, ℋ(e) = H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}`; `ψ_{nq}^e` is localisation at `q` followed by projection to `H¹_s`; and `ψ_n^e` is localisation at `q`, reduction to `T/I_{nq}T` and `φ^fs_q ⊗ 1`. Then `KS(T, F, P) = Γ(ℋ)`. The sheaf `ℋ̂` with `ℋ̂(n) = H¹_{F^n}(K, T/I_nT) ⊗ G_n` and the same edges has `Γ(ℋ̂)` the weak Kolyvagin systems, and `ℋ ⊆ ℋ̂`.

The precise hypotheses are a Selmer triple.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.1.2, pp. 19–20). The graph and the sheaf.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.1.1, p. 19). Sheaves on graphs and global sections.

The maps are well defined: classes in `H¹_{F(n)}` are finite at `q ∤ n`, and `φ^fs_q` applies because `I_q` kills `T/I_{nq}T`.

`Γ(ℋ) = KS`: the compatibility at the edge `{n, nq}` is relation (5) of Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits.

Functoriality in `(T, F, P)` as in Remark 3.1.4; restriction to `P′ ⊆ P` is restriction to the full subgraph `X(P′)`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.conductorGraph`: `X(P)`: the simple graph on `N(P)` with `n` adjacent to `m` iff `m = nq` or `n = mq` for a prime `q ∈ P`.
- `TauCeti.KolyvaginSystems.GraphSheaf`: Vertex modules, edge modules and vertex-to-edge maps on a simple graph.
- `TauCeti.KolyvaginSystems.GraphSheaf.sections`: `Γ(S)`, the submodule of `∏_v S(v)` of compatible families.
- `TauCeti.KolyvaginSystems.GraphSheaf.mem_sections`: `κ ∈ Γ(S)` iff `ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′})` for every edge `e = {v, v′}`.
- `TauCeti.KolyvaginSystems.selmerSheaf`: `ℋ_{(T,F,P)}` on `X(P)`.
- `TauCeti.KolyvaginSystems.sections_selmerSheaf`: `Γ(ℋ) = KS(T, F, P)` as submodules of `∏_n ℋ(n)`.
- `TauCeti.KolyvaginSystems.GraphSheaf.Subsheaf`: Subsheaves: submodules of the stalks and edge modules stable under the maps; `Γ` of a subsheaf is a submodule of `Γ`.

**Checks.**

- `conductorGraph_two_prime_nonedge`: For distinct `q₁,q₂`, the vertices 1 and `q₁q₂` are not adjacent.
- `sections_one_vertex`: On a one-vertex graph, sections equal the sole stalk.
- `sections_ne_product`: `A` family whose two restrictions at an edge disagree is not a section.

For `P = {q}: X` has two vertices and one edge, and `Γ(ℋ) = {(κ_1, κ_q) : (κ_q)_{q,s} = φ^fs_q(κ_1)}`.

`X(P)` is the 1-skeleton of the cube on `P`; it is connected.

Additional arithmetic check: For `P = {q₁, q₂}, X(P)` is the 4-cycle 1 — `q₁` — `q₁q₂` — `q₂` — 1.

Additional arithmetic check: `ℋ(1) = H¹_F(K, T)` and `ℋ̂(1) = H¹_F(K, T)`.

*Needs:* Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.8 The finite–singular comparison map; `SimpleGraph`.

### 4.2 Selmer lengths across an edge

Let `R` be principal artinian of `length k` and `(T, F, P)` satisfy `(H.0)`–`(H.6)` with `P ⊆ P_k`. Put `λ(n, T) = length H¹_{F(n)}(ℚ, T)` and `λ(n, T^*) = length H¹_{F(n)^*}(ℚ, T^*)`. `(a) λ(n, T) − λ(n, T^*)` is independent of `n ∈ N`. `(b)` For `nℓ ∈ N` the four inclusions `S₀⊆S_n⊆S₁` and `S₀⊆S_{nℓ}⊆S₁`, where `S₀=H¹_{F_ℓ(n)}, S_n=H¹_{F(n)}, S_{nℓ}=H¹_{F(nℓ)}` and `S₁=H¹_{F^ℓ(n)}`, have cyclic quotients with `a=length(S₁/S_n), b=length(S₁/S_{nℓ}), c=length(S_n/S₀)` and `d=length(S_{nℓ}/S₀)` with `0 ≤ a, b, c, d ≤ k, a + c = b + d, a ≥ d, b ≥ c`, and dually `a^* + a = b^* + b = c^* + c = d^* + d = k`. `(c) |λ(nℓ, T) − λ(n, T)| ≤ k`; if `H¹_{F(n)}(ℚ, T) → H¹_f(ℚ_ℓ, T)` is surjective then `H¹_{F(nℓ)^*}(ℚ, T^*) = H¹_{F^ℓ(n)^*}(ℚ, T^*)`; the images of `m^{λ(n,T^*)}H¹_{F(n)}` under `φ^fs_ℓ ∘ loc_ℓ` and of `m^{λ(nℓ,T^*)}H¹_{F(nℓ)}` under `loc_ℓ` in `H¹_s(ℚ_ℓ, T)` are equal; and if both localisations `H¹_{F(n)}(ℚ, T)[m] → H¹_f(ℚ_ℓ, T)` and `H¹_{F(n)^*}(ℚ, T^*)[m] → H¹_f(ℚ_ℓ, T^*)` are nonzero then `λ(nℓ, T̄) = λ(n, T̄) − 1` and `λ(nℓ, T̄^*) = λ(n, T̄^*) − 1`.

The precise hypotheses are `(H.0)`–`(H.6), R` principal artinian of `length k, P ⊆ P_k`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Lemmas 4.1.6–4.1.7, pp. 36–37). The four quotient lengths in the Selmer diamond and their change along an edge.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Corollary 2.3.6, p. 17). Invariance of the length difference.

`(a)`: Corollary 2.3.6 applies the supplier finite Greenberg–Wiles formula to the two modified structures.

`(b)`: the local modules at `ℓ` are free of rank one, giving the bounds; the dual relations are global duality (SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)) for the pairs `(F(n), F^ℓ(n))` etc.

`(c)`: read off from the two diamonds of inclusions.

For a field-coefficient diamond `S₀=0, S_n=k, S_{nℓ}=0` and `S₁=k`, the four lengths are `(a,b,c,d)=(0,1,1,0)`. Both chains have total length 1; `a≥d` and `b≥c` hold. This algebraic diagram fixes which arrows carry the four labels; it does not assert an arithmetic realization. The dual complementary lengths are (1,0,0,1).

For `n` a core vertex with `λ(n, T^*) = 0` and surjective localisation at `ℓ, nℓ` is again a core vertex.

*Needs:* the supplier finite Greenberg–Wiles formula; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.8 The finite–singular comparison map; `SelmerIwasawaCohomology Layer 2`; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`.

### 4.3 Rubin's hypotheses, index of divisibility and error terms

Let `T` be a `p`-adic representation of `G_K` over `O, V = T ⊗ Φ, W = V/T, W_M = M^{-1}T/T, 𝔭` the maximal ideal of `O, k = O/𝔭, K(1)` the maximal `p`-extension of `K` in the Hilbert class field. `Hyp(K, T): (i)` there is `τ ∈ G_K` acting trivially on `μ_{p^∞}`, on `(O_K^×)^{1/p^∞}` and on `K(1)`, with `T/(τ − 1)T` free of rank one over `O`; (ii) `T ⊗ k` is an irreducible `k[G_K]`-module. `Hyp(K, V): (i)` there is such a `τ` with `dim_Φ V/(τ − 1)V = 1`; (ii) `V` is an irreducible `Φ[G_K]`-module. For an Euler system `c, ind_O(c) = sup{n : c_K ∈ 𝔭^nH¹(K, T) + H¹(K, T)_tors} ≤ ∞`. `Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞})`, and the error terms are `n_W = ℓ_O(H¹(Ω/K, W) ∩ S^{Σ_p}(K, W))` and `n_W^* = ℓ_O(H¹(Ω/K, W^*) ∩ S_{Σ_p}(K, W^*))`, where `S^{Σ_p}` and `S_{Σ_p}` are the Selmer groups relaxed and strict at the primes above `p`. `H¹(Ω/K, W)` and `H¹(Ω/K, W^*)` are finite if `V` is irreducible, `T ≠ O` and `T ≠ O(1)`.

The precise hypotheses are `T` a `p`-adic representation unramified outside finitely many primes.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II §2, p. 24). The two hypothesis packages.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Definition 2.1, p. 24). The index of divisibility.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter V, Lemma 3.2, p. 87). Finiteness of the error groups.

`Hyp(K, T)` holds with `τ = 1` when `rank T = 1`. `Hyp(K, T)` implies `Hyp(K, V)`.

Finiteness of `H¹(Ω/K, W)`: Rubin's Corollary C.2.2 (cohomology of `p`-adic analytic groups), under irreducibility of `V`.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.HypKT`: `Hyp(K, T)`: the element `τ` with its three triviality conditions and free rank-one coinvariants, and residual irreducibility.
- `TauCeti.EulerSystems.HypKV`: `Hyp(K, V)`.
- `TauCeti.EulerSystems.HypKT.toHypKV`: `Hyp(K, T)` implies `Hyp(K, V)`.
- `TauCeti.EulerSystems.indexOfDivisibility`: `ind_O(c) ∈ ℕ∞`.
- `TauCeti.EulerSystems.indexOfDivisibility_eq_top_iff`: `ind_O(c) = ∞` iff `c_K ∈ H¹(K, T)_tors`.
- `TauCeti.EulerSystems.errorTerm`: `n_W` and `n_W^* ∈ ℕ∞`, finite when `T ≠ O, O(1)` and `V` is irreducible.
- `TauCeti.EulerSystems.indexOfDivisibility_smul`: `ind_O(π·c) = ind_O(c) + 1` for a uniformiser `π`.

**Checks.**

- `indexOfDivisibility_zero_system`: The zero Euler system has infinite initial divisibility index.
- `HypKT.rank_one`: `A` rank-one `O`-lattice has irreducible one-dimensional reduction and `τ=1` gives coinvariants `O`; thus both `Hyp(K,T)` and `Hyp(K,V)` hold, including the trivial character.
- `HypKT.zero_and_rank_two`: The zero representation has zero coinvariants and is not irreducible. For the trivial rank-two representation, every `τ` gives coinvariants `O²` and the residual representation is reducible; both hypotheses fail.
- `HypKT.integral_coinvariants`: The matrix `τ=[[1,π^a],[0,1]]` on `O², a>0`, has rational coinvariant dimension one but integral coinvariants `O⊕O/(π^a)`. This is a test of the coinvariant fields, not an example of the full global hypotheses: the rational field alone must not certify `Hyp(K,T)`.
- `HypKT.p_hilbert`: If `K` has nontrivial `p`-class group, take `T=ℤ_p` with trivial action and `a τ` whose image in `Gal(K(1)/K)` is nonidentity. Its coinvariants are `ℤ_p`, but it fails the Hilbert-class-field condition. For `τ=1` that condition holds.
- `HypKT.roots_and_units`: For `K=ℚ` and odd `p`, take trivial `T=ℤ_p` and `τ` with cyclotomic value `1+p`. It acts trivially on `μ_p` but sends a primitive `p²`-th root `ζ` to `ζ^{1+p}≠ζ`. Its free rank-one coinvariants do not certify the roots-and-units condition; `τ=1` satisfies every field-fixing condition.
- `indexOfDivisibility_torsion_quotient`: In the model `H¹≃O⊕O/(π²)`, a leading value `(π³,1)` has index 3, while (0,1) has index `∞`. The index is computed after quotienting torsion.
- `indexOfDivisibility_scaling`: In that model, `π(π³,1)` has index 4; multiplying a torsion class still gives index `∞`.
- `errorTerm_length`: `A` zero error intersection has length 0, `O/(π²)` has length 2, and `(O/(π))²` also has length 2 although its annihilator exponent is only 1. Error terms measure length of the specified intersection, not its exponent or the whole ambient cohomology group.
- `errorTerm.reducible_trivial_infinite`: For `K=ℚ` and trivial `T=ℤ_p²`, neither excluded rank-one lattice occurs, but `V` is reducible. The cyclotomic `ℤ_p`-quotient of `Gal(Ω/K)` supplies infinitely many continuous homomorphisms into `(ℚ_p/ℤ_p)²`, so the ambient error cohomology is infinite. Omitting irreducibility from the finiteness assertion fails this example.

For `T = ℤ_p(1) ⊗ χ^{-1}` with `χ` even nontrivial of order prime to `p: n_W = n_W^* = 0`.

The two error terms are distinct; neither is assumed zero.

Additional arithmetic check: If `rank_O T = 1` then `Hyp(K, T)` holds with `τ = 1`.

Additional arithmetic check: For `T = O` with trivial action, `H¹(Ω/K, W) = Hom(Gal(Ω/K), Φ/O)` is infinite: the finiteness statement excludes `T = O` and `T = O(1)`.

Additional arithmetic check: For `K = ℚ, T = ℤ_p(1) ⊗ χ^{-1}, χ ≠ 1, ω` of order prime to `p: H¹(Ω/ℚ, W) = H¹(Ω/ℚ, W^*) = 0`, so `n_W = n_W^* = 0`.

For `T=Z_p(1)`, MR04`(H.3)` fails by the Layer 1 residual computation, whereas Rubin `Hyp(K,T)` holds with `τ=1`. Applying the error-tolerant bound still requires its stated strict-dual Selmer finiteness hypothesis; for the corresponding trivial representation this condition is Leopoldt’s conjecture (RemarkII.2.7).

*Needs:* Layer 2.2 The module of Euler systems; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; `SelmerIwasawaCohomology §2.9 (Compact and rational Galois Selmer groups)`.

### 4.4 Localisation at abundant tuples with bounded loss

Setting of Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples. `(a)` (Uniform annihilation.) Let `R` be a lattice with `R_ℚ^𝔠 ≅ R_ℚ^∨(1)`, pure of weight `−1` at every nonarchimedean place not above `ℓ`. For every finite set `Σ` of places there is `m_Σ ≥ 1` such that for every saturated free submodule `S` of the Bloch–Kato Selmer module with images `S^{(m)}` modulo `λ^m` and every `m > m_Σ, loc_w(λ^{m_Σ}S^{(m)}) = 0` for every nonarchimedean `w ∈ Σ` not above `ℓ`. `(b)` (Corrected Proposition 2.6.7.) Let `S` be free of `rank r` over `O_λ/λ^{m−m₀}` and `(Ψ₁, …, Ψ_r)` an `(S, γ)`-abundant tuple realised by `γ`-associated places `w_i`. Put `c = 𝔣(r)d_R` and let `A` be the matrix of `s ↦ (θ_S(Ψ_i)(s))_i` in a basis `e₁`, …, `e_r` of `S`, after identifying the `λ^{m−m₀}`-torsion of `(R̄^{(m)})^{h_γ}` with `O_λ/λ^{m−m₀}`; abundance says that the image of `A` contains `λ^c(O_λ/λ^{m−m₀})^r`. Then there is an integral matrix `C` with `AC = CA = λ^c·I` in the finite coefficient ring (`scaled_inverse`, for every `c`; `C = 0` when `c ≥ m − m₀`), and the elements `s_j = Ce_j ∈ S` satisfy `loc_{w_i}(s_j) = 0` for `i ≠ j` and `exp_λ(loc_{w_i}(s_i), H¹_ns(F_{w_i}, R̄^{(m)})) ≥ m − m₀ − 𝔣(r)d_R`; the `s_j span` a submodule containing `λ^{𝔣(r)d_R}S` and form a basis of `S` when `𝔣(r)d_R = 0`. For `r = 2` and a primitive `v ∈ S` one can moreover choose a primitive `t ∈ S` with `loc_{w₁}(t) = 0` and `exp_λ(loc_{w₂}(t)) ≥ m − m₀ − 𝔣(2)d_R` after possibly interchanging the two places. The printed statement (a basis for every abundant tuple) is false when the loss is positive.

The precise hypotheses are as in Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples; for `(a)`: the purity and polarisation hypotheses.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Proposition 2.4.6(2), published pp.130–131). Uniform annihilation of localisations.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Proposition 2.6.7, published pp.134–135). The printed statement, corrected here.

([Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Proposition 2.4.6(2), published pp.130–131; Proposition 2.6.7, published pp.134–135). The published coefficient and depth conventions.

`(a)`: local cohomology `H¹_ns` at `w ∤ ℓ` of a pure weight `−1` lattice is finite, of exponent bounded independently of `m`; saturation makes `S^{(m)}` free and its localisation factor through the torsion of the local group.

`(b)`: linear algebra over the discrete valuation ring: use Smith normal form over the DVR: if `c < m−m₀`, each nonzero diagonal exponent is at most `c`, giving an integral scaled inverse of a suitable lift and a reduction `C` with `AC=CA=λ^cI`; if `c ≥ m−m₀` take `C=0`. An arbitrary matrix over the finite quotient need not be invertible there; for `r = 2` take `t = (−u₂, u₁)` from the first row `π^a(u₁, u₂)` of `A`. The localisation statement follows because `loc_{w_i}` on `S` factors through `θ_S(Ψ_i)` (evaluation at Frobenius, Layer 1.2 Finite and singular parts at an unramified prime).

With `d_R = 0`: a basis of `S` diagonalising the localisations, with `exp ≥ m − m₀`: the clean statement.

The linear-algebra step of the printed form fails when the loss is positive: for `A = (λ, 1; 0, λ)` over `O_λ/λ^n` with `n ≥ 3`, whose image contains `λ²(O_λ/λ^n)²`, there is no basis `s₁, s₂` with `A(s_j)` supported on the `j`-th coordinate, since that would write `A = D·B` with `D` diagonal and `B` invertible, and the second row `(0, λ)` forces `det B ∈ λO_λ`. The corrected statement uses the scaled inverse `C = λ²A^{-1} = (λ, −1; 0, λ)`.

*Needs:* Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples; Layer 1.3 Exponents, orders and reducibility depth; Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`; `SelmerIwasawaCohomology Layer 4`, §4.25 (uniform local annihilation); Layer 1.15 Existence of abundant tuples under the corrected span hypothesis.

### 4.5 Cassels structure without residual irreducibility

In the elliptic anticyclotomic setting of Layer 4.18 Self-dual descent with explicit error constants, assume `E(K)[p]=0`, cartesianness of the propagated ordinary conditions and the symmetric conjugate-self-dual local pairing of `CGLS` §3.3. For each `k≥1` and `n∈N^(k)`, there is a finite `R/m^k`-module `M^(k)(n)` and `ε∈{0,1}`, independent of `k` and `n`, such that `H¹_{F_ord(n)}(K,T_α/m^kT_α) ≃ (R/m^k)^ε ⊕ M^(k)(n) ⊕ M^(k)(n)`. The residual representation may be reducible. This is the specialized weak-hypothesis pairing and parity input; it does not assert the full Howard rigidity theorem under these weaker hypotheses. The anticyclotomic character `α` is residually trivial.

The precise hypotheses are `E/K, p, R, α` and `T_α` are exactly the setting of `CGLS` §3.2; `p∤2N`, good ordinary reduction, `disc(K)` prime to `Np`; `E(K)[p]=0`; ordinary conditions cartesian; conjugate self-duality as in `CGLS` §3.3; `α` is congruent to the trivial character modulo the maximal ideal of `R`, as in `CGLS` §3.2 (arXiv v2 p.17).

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), Proposition 3.3.2 and Lemma 3.3.1, arXiv v2 pp. 18–19). The weaker structure and invariant hypotheses.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Theorem 1.4.2, pp. 1448–1450; Lemma 1.5.3 and Proposition 1.5.5, pp. 1450–1451). Pairing and parity proof used with the hypotheses specified by `CGLS`.

The invariant/torsion identifications use `CGLS` Lemma 3.3.1, which uses vanishing residual invariants rather than irreducibility.

Apply the Cassels pairing argument of Howard Theorem 1.4.2 and the parity argument of Proposition 1.5.5 using only invariant vanishing, cartesianness and the symmetric conjugate-self-dual conditions actually used in those proofs. `CGLS` Proposition 3.3.2 verifies these hypotheses in the residually trivial ordinary twist setting.

Howard Lemma 1.5.3 gives parity invariance under the same weak hypotheses; `CGLS` explicitly records independence of `k` and `n`.

*Needs:* Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 0.4 Cartesian local conditions; `SelmerIwasawaCohomology Layer 2`.

### 4.6 Module lemmas for the self-dual induction over a discrete valuation ring

Let `R` be a discrete valuation ring with uniformiser `π` and finite residue field. For a finitely generated torsion `R`-module `X` write `X ≅ ⊕_{i=1}^{s(X)} R/π^{d_i(X)}` with `d₁(X) ≥ ⋯ ≥ d_{s(X)}(X) > 0` and `exp(X) = d₁(X) (exp(0) = 0)`. `(a)` If `N ⊆ M` then `s(N) ≤ s(M)` and `d_i(N) ≤ d_i(M)` for `1 ≤ i ≤ s(N)`. `(b)` Consider exact sequences `0 → X → R/π^k ⊕ M → R/π^{k−a} ⊕ R/π^b → 0` and `0 → X → R/π^k ⊕ M′ → R/π^{a′} ⊕ R/π^{k−b′} → 0` of finite `R`-modules, where `M` and `M′` are each a direct sum of two isomorphic modules, `2s = dim M[π], 2s′ = dim M′[π], k > exp(M) + 2a` and `a′ ≤` a. Fix `M = ⊕_{i=1}^{2s} M_i` with `M_i ≅ R/π^{d_i(M)}` and `d₁(M) = d₂(M) ≥ d₃(M) = d₄(M) ≥` ⋯. Then `(i) s − 1 ≤ s′ ≤ s + 1`; (ii) `b ≤ exp(M)`; (iii) `exp(X) ≤ exp(M) + a`; (iv) if `s > 0` there is an index `1 ≤ i₀ ≤ 2s` with `⊕_{i ≠ i₀} M_i ↪ X`, while if `s = 0` only the trivial injection 0 `↪ X` is asserted; `(v)` there is an injection `X ↪ M′ ⊕ R/π^{exp(X)}`; (vi) `d_i(M′) ≥ d_{i+2}(M)` for `1 ≤ i ≤ 2s − 2` (an empty range when `s ≤ 1`).

The precise hypotheses are `R` a discrete valuation ring; all modules finitely generated and torsion; for `(b)`: the two exact sequences, `M` and `M′` doubled modules, `k > exp(M) + 2a` and `a′ ≤` a.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.3.2, Lemma 3.3.9 and its proof, p. 22 (arXiv v2)). monotonicity of the invariants of finitely generated torsion modules under inclusion

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.3.2, (3.11)–(3.13), Lemma 3.3.10 and Proposition 3.3.11, pp. 22–23 (arXiv v2)). the two exact sequences of the induction step and the comparison of the doubled modules `M` and `M′`

`(a): s(N) = dim N[π] ≤ dim M[π]`; induct on `s(N)` by passing to `N/N[π^d] ⊆ M/M[π^d]` with `d = d_{s(N)}(N)`, and count `dim N[π^d]/N[π^{d−1}] ≤ dim M[π^d]/M[π^{d−1}]`.

`(i)`: the minimal number of generators changes by at most one across each sequence, by `(a)`; (ii): since `k − a > exp(M)`, the free summand `R/π^k` maps onto a summand of order `max(k − a, b)`, so `M` surjects onto `R/π^{min(k−a, b)}`; (iii): `X/(X ∩ R/π^k)` embeds in `M` and `X ∩ R/π^k ≅ R/π^a`.

(iv): when `s > 0`, the image of the map in the first sequence is `R/π^{k−a}` plus the image of one summand `M_{i₀}`, so `X` surjects onto `⊕_{i≠i₀} M_i`, and Pontryagin self-duality of finite `R`-modules turns this into an injection; when `s = 0` no index is chosen (the empty-summand case requires no index).

`(v)`: the free summand maps onto `R/π^{k−b′}`: the order `o` of the image of 1 satisfies `o > a′` because `k − o ≤ exp(X) < k − a′`, and `o ≤ max(a′, k − b′)` (apply the order comparison to this free summand); then `X` is an extension of a cyclic module by `M″ ⊆ M′` and duality gives the injection. (vi) combines (iv), `(v)` and `(a)`.

`N = R/π ⊆ M = R/π² ⊕ R/π` (`N` the socle of the first summand): `s(N) = 1 ≤ 2` and `d₁(N) = 1 ≤ 2`.

With `M = 0 (s = 0)` the first sequence forces `b = 0` and `X ≅ R/π^a`, and (iv) asserts nothing beyond 0 `↪ X`; there is no summand to omit.

The doubling hypothesis makes `dim M[π]` even, so `s` is an integer; the self-dual Cassels structure of Layer 4.5 Cassels structure without residual irreducibility supplies it.

*Needs:* `Module.equiv_directSum_of_isTorsion`; `Module.length`; `IsDiscreteValuationRing`.

### 4.7 Rational Kolyvagin descent for ring-class anticyclotomic Euler systems

In the setting of Layer 3.8 Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at `p`, assume Hypothesis `(H)(a)`–`(c)` of Castella–Hsieh §6: `p ∤ 2(2r − 1)!Nφ(N)`; every prime dividing `N` splits in `K`, and, if `r > 1`, either |`D_K`| > 3 is odd or `8 | D_K` (existence of a canonical CM elliptic curve); and `(c_o, N) = 1`. `(a)` If `c ∈ ES(T, χ, F)` has `c_K ≠ 0` in `H¹(K, V ⊗ χ^{-1})`, then `Sel_{F*}(K, V ⊗ χ) = Φ·c_K^τ, Φ = O[1/p]`: the Selmer group of `V ⊗ χ` with local condition `F*` at `p` is the line spanned by the conjugate of the bottom class. `(b)` (Complementary local class.) Suppose further that `p = 𝔭𝔭̄` splits in `K, f` is ordinary at `p` and `χ` has infinity type `(j, −j)` with `j ≥ r`, and let `z^χ` be the `χ`-specialisation of the Iwasawa class of generalised Heegner cycles. If `loc_p(z^{χ^{-1}}) ≠ 0`, then the Bloch–Kato Selmer group `Sel(K, V ⊗ χ)` vanishes. The statement is rational: it bounds the `Φ`-dimension, not the length of an integral Selmer module.

The precise hypotheses are: Castella–Hsieh Hypothesis `(H)(a)`–`(c): p ∤ 2(2r − 1)!Nφ(N)`; every prime dividing `N` splits in `K`, with |`D_K`| > 3 odd or `8 | D_K` when `r > 1`; `(c_o, N) = 1`; `c ∈ ES(T, χ, F)` with `c_K` non-torsion; for `(b)` additionally `p` split in `K, f` ordinary, `j ≥ r`

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.2, Theorem 7.3, p. 30 (author's version)). the Selmer group with the dual local condition is the line spanned by the conjugate of the nonzero bottom class

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.5, Lemmas 7.10–7.16 and the descent argument, pp. 33–37 (author's version)). the image lemmas with the constant `B₂`, the selection of admissible primes and the descent with constants `B₁`–`B₄`

([Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), §7.4, Theorem 7.9 and its proof, p. 33 (author's version); §6, Hypothesis `(H)`, p.26; §4.1, pp.14–15). the vanishing of the Bloch–Kato Selmer group from a nonzero local class via Poitou–Tate, and the standing hypotheses

Image lemmas: with `H♭` the maximal pro-`p` subextension of `K_{c_o}` in the ring class field cutting out `χ` mod `π^M, ℚ^{ker ρ*_f} ∩ H♭ = ℚ` (a `p`-ramified abelian subextension of `K_{c_o p^∞}` is `ℚ` or `ℚ(√p*)`), so `ρ*_f(G_ℚ) = ρ*_f(G_{H♭})`; `B₂ = min{n : π^n M₂(O) ⊆ O[ρ*_f(G_ℚ)]}` bounds the failure of `R_ρ`-submodules to be large, and Nekovář's lemmas give `π^{(2^{s+1}−2)B₂}V_S ⊆ O[G_S]` for the Galois group cut out by an `s`-generated submodule `S`.

Prime selection: `π^{B₁}` kills `H¹(Gal(L/K), T_M ⊗ χ^{-1})` (a scalar in the image), and Chebotarev gives infinitely many inert `ℓ` with prescribed Frobenius `g ∈ G_S^+` that are `M`-admissible.

Descent: retain the paired classes with coefficients `T_M⊗χ⁻¹` and `T_M⊗χ`. The image and Chebotarev arguments of CH Lemmas7.10–7.16 use `B₁,B₂`, the bottom divisibility `B₃` and `B₄=min ord_π(χ²(σ)−1)` for `χ²≠1` (zero otherwise). Replace the printed scalar (K2) by ring-class-local-operator. On each of the two auxiliary primes its two operators have `π^{B₁}`-scaled inverses. Thus local orders change by at most `B₁`; when two finite vectors span up to `π^d`, the singular vectors span up to `π^{d+2B₁}`. Enlarge the fixed constants in the prime selection and CH Lemma7.18 by these losses and by `3ν·ord_π(p)` from the selected bottom class. These are fixed in `M` and in the number of selected primes (at most two in this argument). Local Tate duality pairs the opposite twists, and the global reciprocity sum gives a fixed `π`-power annihilator of `Sel_{F*}(K,T_M⊗χ)/(O·κ(1)^τ)`. Let `M` tend to infinity and invert `π` to obtain `(a)`. The numerical `C₁` from the printed scalar proof is not asserted unchanged.

`(b)`: apply `(a)` to the specialisations of the Iwasawa classes, with `F` the orthogonal complement of the line spanned by `loc_v(z^χ)` at `v | p`, and use the Poitou–Tate sequence; for `j ≥ r` the Bloch–Kato condition is relaxed at one prime above `p` and strict at the other. The verification that these classes satisfy (E5) uses a corestriction step that the authors correct in the footnote to Proposition 7.8.

For `χ = 1, r = 1` and Heegner points, `(a)` is the rational form of Kolyvagin's theorem: a non-torsion Heegner point spans the Selmer group of `V = V_pE` over `Φ`.

If `c_K` is torsion the theorem gives nothing; the integral exponent bound needs the error-tolerant theory of this layer.

`(b)` concludes vanishing from the nonvanishing of a local class, not of `c_K` itself: it is the rank-zero companion of `(a)`.

For `χ²≠1`, the argument pairs the `χ⁻¹` and `χ` Selmer modules. It never takes a `τ`-eigenspace in either one; only their locally identified `T_M` values are acted on by `J`.

*Needs:* Layer 3.8 Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at `p`; Layer 1.10 The transverse condition is self-dual; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; `TauCetiRoadmap.Chebotarev Layer 10`; Layer 3.7 The finite–singular relation with its Frobenius operator.

### 4.8 Local maximal orders and the pairing's lattice interfaces

The order carrier and maximal-order existence are imported from ClassicalArithmeticCompletion §§7.4, 7.21, 7.56. The following additional local inputs supply the separated-pairing argument; existence and the general full-idempotent Morita equivalence are not new targets. Let `F` be a nonarchimedean local field, `O` its valuation ring, and `C` a finite-dimensional separable semisimple `F`-algebra. The pairing uses `F=ℚ_p`. Orders and lattices are finite over `O` and full in their ambient vector spaces. Keep both module sides explicit.

**Division order and modules.** For a finite-dimensional division `F`-algebra `Δ` with centre `Z` separable over `F`, use `Z` and the extension of the valuation to `Δ`. Normalized to agree with `v_F`, it is

```text
w(x) = v_F(det_F(leftMul x)) / dim_F Δ,   w(0)=∞.
```

Its nonnegative part `O_Δ` is the unique maximal `O`-order, consisting of the elements integral over `O`. Its radical `J` consists of the elements of positive value. For a least-positive-value element `Π, J=ΠO_Δ=O_ΔΠ`, and every nonzero one-sided fractional ideal is `J^a, a∈ℤ`. Every finitely generated `O_Δ`-module on either side is a direct sum of a finite free module and modules `O_Δ/J^{a_i}, a_i≥1`. A module of finite cardinality has no free summand; an `O`-torsion-free module has no torsion summand. The free rank and exponents are unique up to order. The zero module has the empty decomposition and free rank zero. No commutative PID hypothesis is substituted for these statements.

Proof plan: multiplicativity follows from the determinant; the ultrametric inequality reduces, after division by a nonzero summand, to the valuation in the commutative field `F(z)`. Integrality is checked in `F(x)`. The reduced trace over `Z`, composed with the separable field `trace Z/F`, gives a nondegenerate pairing; its trace-dual bound makes `O_Δ` an `O`-lattice. The trace of the regular representation is not substituted in positive characteristic. A one-sided ideal has an element of least division valuation, and division on the appropriate side proves the ideal formula. For a presentation matrix over `O_Δ`, choose a least-value nonzero entry and clear its row and column using the corresponding left and right quotients. Induction gives a diagonal presentation. The radical filtration gives uniqueness of the elementary divisors. In particular, for `Q=O_Δ/J^e` and finite right `Q`-module `W`, the left `Q`-module `Hom_{O_Δ}(W,Q)` has cardinality `#W`: the dual of `O_Δ/J^a` is `J^{e-a}/J^e`. This is a cardinality assertion, with its side specified, rather than a canonical self-duality of `W`.

Sources: [Milne, Class Field Theory, v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf), IV §4 pp.139–140, for the local division valuation; [Yu, On the existence of maximal orders, v1](https://arxiv.org/abs/1105.2897v1), §4.3 Lemma4.4 pp.12–13, for the unique order and one-sided ideals. The diagonal-reduction and cyclic-dual arguments above are the additional module proofs required here.

**Matrix lattices and full corners.** Let `S` be a right `Δ`-space of dimension `n≥1, L` a full right `O_Δ`-lattice, and `Γ=End_{O_Δ}(L)`, acting on the left. An `O_Δ`-basis identifies `Γ` with `M_n(O_Δ)`. Its coordinate idempotents `e_i` are full, `Σe_i=1` and `e_iΓe_i≃O_Δ`. The left `Γ`-module `L≃Γe_1` is projective; `End_Γ(L)≃O_Δ^op` via right multiplication, whereas `End_Γ(L)^op≃O_Δ`. The residue module `L/LJ` is simple over `Γ/rad Γ=M_n(O_Δ/J)`. It is not necessary or correct to call the column lattice `Γ`-free when `n>1`.

Every maximal order of `End_Δ(S)` is a lattice stabilizer of this form, and each such stabilizer is maximal. Its stable full right `O_Δ`-lattices in `S` are `LΠ^a, a∈ℤ`. To construct a stable lattice for an order `Γ₀`, take `Γ₀L₀`, with `L₀` any full right `O_Δ`-lattice; then maximality identifies `Γ₀` with its stabilizer when `Γ₀` is maximal. For the converse classification, matrix units show that every stable lattice is a direct sum of `n` copies of the same fractional right ideal, and left `O_Δ`-multiplications make that ideal bilateral. The division valuation gives `J^a`. Alternatively its first nonzero residue layer and Nakayama give the same conclusion. An overorder stabilizes its span of `L`, which has the same stabilizer `Γ`; hence it equals `Γ`. Every lattice over a maximal matrix order is projective: its full corner is a free `O_Δ`-module, and the imported Morita equivalence reconstructs a sum of projective columns. A surjection of such lattices onto a lattice consequently has a module-linear section.

Sources: Yu Theorem4.5 pp.13 and Lemma5.2 p.14, with the explicit basis/corner argument above; Milne IV Theorems1.`14/1`.17 pp.124–125 for the algebraic double centralizer and matrix presentation. Tau Ceti `IsIdempotentElem.cornerEquivalence` in `TauCeti/RingTheory/Morita/Corner.lean` supplies the equivalence once fullness has been established. Left modules are handled by the opposite ring; no right action is silently identified with an endomorphism-ring homomorphism having the same multiplication.

**Products and the two commuting orders.** `A` maximal order in `C` contains all central primitive idempotents and is the product of the component maximal orders: adjoining the central idempotents gives a finite overorder, so maximality forces equality. For a faithful finite-dimensional left `B`-module `V`, with `B` a finite-dimensional separable semisimple `F`-algebra, put `D=End_B(V)^op` and let `R_max` be a maximal order in `D`. Every full right `R_max`-lattice `L` has maximal left stabilizer `Λ_max` in `B`, with `End_{Λ_max}(L)^op=R_max`. The centres identify through their common action on `V`. To prove this, write

```text
B=∏ M_{n_i}(Δ_i),  V=⊕ M_{n_i,m_i}(Δ_i),  D=∏ M_{m_i}(Δ_i).
```

All `n_i,m_i` are positive by faithfulness. First conjugate `R_max` in each `M_{m_i}(Δ_i)` to its matrix-order form. The full right corner `L e₁` is then a full right `O_{Δ_i}`-lattice in `Δ_i^{n_i}`; choose its `O_{Δ_i}`-basis. The corresponding left change of basis in `GL_{n_i}(Δ_i)` commutes with the already fixed right action, and matrix units reconstruct `L` as `M_{n_i,m_i}(O_{Δ_i})`. The two stabilizers are then the two indicated matrix orders. These two basis choices are noncanonical; no equality with the standard lattice in the original coordinates is asserted. For a finite pairing into this lattice modulo a nonzero central scalar, taking the left and right matrix corners preserves both separatedness maps and their surjectivity: identify the evaluation squares using the unit and counit of the existing equivalence, on the two respective sides. Apply the preceding cyclic-dual cardinalities at the division corner, then reconstruct with matrix units. This supplies the multiplicity-sensitive comparison used below.

For full orders `R⊆R_max` and `Λ_B⊆Λ_max` there are common central non-zero-divisors `c₀,d₀` with `c₀Λ_max⊆Λ_B` and `d₀R_max⊆R`; powers of a base uniformizer work simultaneously on all factors. If `L=T R_max`, then `d₀L⊆T`. For a central scalar `a, (T∩aL)d₀⊆aT`, so `d₀` kills `ker(T/aT→L/aL)`, uniformly in `a`. This argument includes a unit and `a=0` as separate zero-kernel cases. The zero representation has no positive division factors and is treated separately in the pairing theorem.

Source: [Nekovář, The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), 6.4.1–6.4.3 pp.38–40. The rectangular normal form retains both multiplicities in the passage from simple `B` to division `D`; a reduction without those multiplicities requires multiplicity one. The conductor and corner arguments here supply the precise intermediate statements. They do not prove the sharper functional descent identified below.

The interfaces, in `TauCeti.KolyvaginSystems`, are:

- `divisionValuation`, `divisionIntegers`, `divisionIntegers_eq_integral`, `divisionIntegers_isMaximalOrder`, `divisionIntegers_ideal_eq_pow`, `divisionIntegers_free_of_torsionFree`, `divisionIntegers_finite_decomposition`, and `cyclicHom_card`, with the displayed valuation, ideal and cardinality formulas.
- `endLattice_projective`, `endLattice_centralizer` (the opposite-ring identity just specified), `endLattice_residue_simple`, `endLattice_fullIdempotent`, `maximalOrder_eq_endLattice`, `endLattice_isMaximalOrder`, and `maximalOrder_prod`.
- `latticeSurjection_section`, `rectangularBimodule_normalForm`, `centralizerLatticeOrder_isMaximal`, `centralizerLatticeOrder_commutant`, `centralizer_center_equiv`, `centralConductor_exists`, `overLattice_mul_conductor`, and `reductionKernel_annihilator`.
- `pairingCorner`, `pairingCorner_eval_square`, `pairingCorner_separated_iff`, and `pairingCorner_surjective_iff`, preserving both positive multiplicities and the chosen central reduction scalar.

**Checks.**

- `divisionIntegers.field`: For `F=ℚ₂` and for `F=𝔽₂((t)), Δ=F` gives `O, J=(π)`, ordinary elementary divisors and `#Hom_O(O/π^a,O/π^e)=(#k)^a` for `0≤a≤e`. The endpoints give the zero module and the whole dual.
- `divisionValuation.quaternion`: In the quaternion division algebra over `ℚ_p` for odd `p`, choose `i²=u` nonsquare unit, `j²=p` and `ij=−ji`. Then `w(j)=1/2, J²=pO_Δ` and `O_Δ/J≃𝔽_{p²}`. Thus a division uniformizer need not be central or have base valuation one.
- `divisionIntegers.not_order_overring`: In `ℚ_p(√p), ℤ_p[√p]` is the maximal order, while adjoining `p^{−1/2}` gives a ring unbounded below in valuation and not finite over `ℤ_p`. A subring alone is not an order.
- `maximalOrder_eq_endLattice.matrix`: In `M₂(ℚ_p)`, the stabilizer of `ℤ_p⊕pℤ_p` has lower-left entry in `pℤ_p` and upper-right entry in `p^{−1}ℤ_p`. It and `M₂(ℤ_p)` are distinct maximal orders. Their Iwahori intersection is not maximal; its residue action preserves `𝔽_pe₁`.
- `endLattice_residue_simple.multiplicity`: The column `𝔽_p²` is simple over `M₂(𝔽_p)`, while two copies are not. With `B=M₂(ℚ_p)` on `V=M_{2,3}(ℚ_p)`, the right centralizer is `M₃(ℚ_p)`, and the two corners retain 2 and 3. `B=ℚ_p` on `V=ℚ_p²` has the same scalar-action multiplicity obstruction.
- `maximalOrder_prod.idempotent`: The congruence order `{(a,b)∈O²:a≡b mod π}` omits (1,0) and is not maximal in `F×F`. The putative conductor (1,0) is a zero divisor and cannot control the second factor.
- The zero lattice is projective with an empty basis. A surjection onto it has its unique section, but no residue simplicity or full coordinate idempotent is asserted for rank zero. The column `O²` is projective over `M₂(O)` and is not free over that matrix ring.
- `O_Δ/J⊕O_Δ/J²` needs two cyclic factors and has cardinality `(#O_Δ/J)^3`; replacing it by `O_Δ/J³` changes its annihilator. For `T=πO⊂L=O, π` kills the reduction kernel at every depth; the inclusion after reduction need not be injective.

*Needs:* ClassicalArithmeticCompletion §§7.4, 7.21, 7.56 for the order carrier and maximal-order existence in the `ℚ_p` pairing application; the local division valuation just constructed; Mathlib finite modules and matrix algebra; the Tau Ceti full-idempotent Morita equivalence. For a general nonarchimedean local `F`, the division orders and their matrix products constructed here give existence as well.

### 4.9 Uniform cokernel bound for a separated pairing over orders

Let `V` be a finite-dimensional `ℚ_p`-vector space, `B⊆End_{ℚ_p}(V)` a semisimple `ℚ_p`-algebra, `Λ_B` a `ℤ_p`-order in `B`, and `T⊆V` a full `Λ_B`-stable lattice. Put `D=End_B(V)^op` and `R={d∈D:T d⊆T}`. For `N≥1` let `X` be a finite left `Λ_B/p^NΛ_B`-module and `W` a finite right `R/p^NR`-module. `A ℤ_p`-bilinear pairing `X×W→T/p^NT` is `Λ_B`-linear on `X` and `R`-linear on `W` and induces injective maps `i:W→Hom_{Λ_B}(X,T/p^NT)` and `j:X→Hom_R(W,T/p^NT)`. Choose a maximal order `R_max⊇R` and put `Λ_max={b∈B:b(T R_max)⊆T R_max}`. There exist central non-zero-divisors `c,d` in `R_max` with `cΛ_max⊆Λ_B` and `dR_max⊆R` such that `cd·`Coker`(j)=0`, using the common-center action, uniformly in `N`. More explicitly, given conductor elements `c₀,d₀` with `c₀Λ_max⊆Λ_B` and `d₀R_max⊆R`, the proof below gives `c₀d₀³·`Coker`(j)=0`; take `c=c₀` and `d=d₀³`. In particular, when both orders are maximal, `j` is surjective.

The precise hypotheses are: finite `X` and `W`; characteristic zero and semisimplicity; both separatedness maps; the preceding local maximal-order subsection's common-centre identification and lattice facts. The conductor assertion is for `V≠0`, and the central elements `c,d` must be non-zero-divisors on every simple component. If `V=0`, separatedness forces `X=W=0` and `j` is the unique isomorphism; no nonzero conductor in the zero algebra is required. Neither order nor module is assumed commutative or multiplicity-free.

([Jan Nekovář, The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), §6.4, data6.4.1–6.4.2 and Proposition6.4.3 with proof, pp.38–40 (archived author manuscript)). Uniform `cd` annihilator of the evaluation cokernel; the proof uses a finite decomposition of `W` and maximal-order lattice theory.

Enlarge `T` to `T R_max` and use tensor extension followed by the separated pairing images over the maximal orders. The proof keeps the kernel of tensor extension as well as the reduction kernel. This yields a uniform conductor bound without presuming that every functional extends to the separated image.

For the maximal-order case, decompose `B=∏M_{n_i}(D_i)` and `V=⊕M_{n_i,m_i}(D_i)`; then `D=∏M_{m_i}(D_i)`. The rectangular normal form in 4.8 puts the lattice bimodule in integral form. Apply the left and right full matrix corners using the two full corners of 4.8. At each division-order corner `Δ`, the target is `Q=Δ/p^NΔ` and a finite right `Q`-module `W₀` is a sum of `Δ/J^{a_i}`, where `p^NΔ=J^e` and `a_i≤e`. Thus `#Hom_Δ(W₀,Q)=#W₀`, since the dual of a cyclic summand has cardinality `(#Δ/J)^{a_i}`. The analogous left dual has the same cardinality. The two separatedness injections force equal finite cardinalities, hence both evaluation maps are bijective. Reconstruct by the two Morita equivalences. This explicitly keeps `n_i` and `m_i`; simplicity of `B` does not imply that `D` is a division algebra.

For the general orders put `L=T R_max, Q=L/p^NL` and `Ŵ=W⊗_R R_max`. Extend the pairing to `X×Ŵ→Q`. Let `W′` be the image of `Ŵ` in `Hom_{Λ_B}(X,Q)`, with kernel `K`, and let `X′` be the `Λ_max`-span of the evaluation image of `X` in `Hom_{R_max}(W′,Q)`. Evaluation is well-defined on `W′` for each `x∈X` because `W′` was defined by its evaluations on `X`. The pairing of `X′` and `W′` is separated, so the maximal-order case gives `X′=Hom_{R_max}(W′,Q)`.

Define `α:W→Ŵ` by `w↦w⊗1` and `β:Ŵ→W` by `β(w⊗r)=w(d₀r)`. The latter is well-defined since `d₀R_max⊆R`, and `αβ=d₀` on `Ŵ`. For `z∈K`, all evaluations of `βz` in `T/p^NT` lie in the kernel of `T/p^NT→Q`. The reduction-kernel argument of 4.8 kills this kernel by `d₀`, and separatedness of the original pairing therefore gives `d₀βz=0`. Hence `d₀²z=α(d₀βz)=0`. This controls `K` without assuming `α` injective or `T/p^NT→Q` injective.

For `f∈Hom_R(W,T/p^NT)`, its scalar extension `f̂:Ŵ→Q` exists by the tensor adjunction. Since `d₀²K=0, d₀²f̂` descends to `W′` and therefore belongs to `X′`. Write it as a finite sum `∑λ_i·ev(x_i), λ_i∈Λ_max`. Then `x=∑(c₀λ_i)x_i` is defined in `X` and its evaluation in `Q` equals `c₀d₀²f`. Thus `c₀d₀²f−j(x)` takes values in the `d₀`-killed reduction kernel. Multiplication by `d₀` gives `c₀d₀³f=d₀j(x)`. The last expression is in `j(X)`: explicitly it is `j(∑(c₀d₀λ_i)x_i)`, since `c₀d₀λ_i∈Λ_B`. This also verifies that `c₀d₀³` acts through the original left order. All conductors depend only on the fixed lattice orders, never on `N`.

**The printed constant.** Nekovář's Proposition6.4.3 states the sharper bound `c₀d₀`. Its comparison map `δ` on p.39 has target `Hom_{R_max}(W′,Q)`, but a general `R`-linear functional on `W` reaches that target only if its tensor extension kills `K`, which the proof does not show. With `ι:K→Ŵ` and `π:Ŵ→W′`, tensor adjunction gives `f̂∈Hom_{R_max}(Ŵ,Q)`, and `f̂=g∘π` for some `g∈Hom_{R_max}(W′,Q)` if and only if `f̂∘ι=0`; the bound `d₀²K=0` gives only `d₀²·(f̂∘ι)=0`, and `Q` can contain `d₀`-torsion. The constant `c₀d₀` is therefore not asserted here. The uniform bound needed by 4.13 is the proved `c₀d₀³`, and no counterexample to the sharper statement is claimed.

**Checks.**

- `cokernelBound_restriction_obstruction`: For `A=ℤ/9`, `K=3A` and `f̂=id_A`, one has `3K=0` but `f̂(3)=3≠0`, so the identity does not descend to `A/3A`. An argument that descends functionals using only `d₀²K=0` fails this test; the proof above multiplies by `d₀²` instead.
- `cokernelBound_maximal_orders`: If both orders are maximal then `K=0`, both reduction kernels vanish and `c₀=d₀=1`, so `j` is surjective.
- `cokernelBound_depth`: The conductors depend on the two fixed orders, not on `N`; the statement is for `N≥1`, since at `N=0` all coefficient modules are zero. With `V=0` separatedness gives `X=W=0` separately, and no nonzero conductor in a zero algebra is required.

For `B=ℚ_p, T=ℤ_p, R=Λ_B=ℤ_p` and a perfect finite pairing modulo `p^N, c=d=1` and `j` is an isomorphism.

For `X=W=⊕_{i∈ℕ}𝔽_p` with the coordinate pairing, `i` and `j` are injective but `j` lands in the direct sum inside `Hom(W,𝔽_p)=∏𝔽_p` and is not surjective. The target excludes this infinite example.

A conductor power that works for the two fixed lattice orders works for every `N`; increasing `N` must not increase the proposed annihilator.

For `B=ℚ_p` acting by scalars on `V=ℚ_p², D=M₂(ℚ_p)`; reducing `D` to a division algebra would drop a multiplicity. The rectangular example `B=M₂(ℚ_p), V=M_{2,3}(ℚ_p)` must retain the right order `M₃(ℤ_p)`.

*Needs:* Layer 4.8, including its division-module, rectangular-lattice, conductor and corner targets; ClassicalArithmeticCompletion §§7.4, 7.21, 7.56 (maximal-order existence); the imported Tau Ceti full-idempotent Morita equivalence.

### 4.10 Rubin's selection of primes with large localisation

Let `p > 2`, let `T` satisfy `Hyp(K, T)` with its element `τ`, fix a power `M` of `p`, and let `L/K` be Galois with `G_L` acting trivially on `W_M` and `W_M^*`. `(a)` For `κ ∈ H¹(K, W_M)` and `η ∈ H¹(K, W_M^*)` there is `γ ∈ G_L` with order`(κ(γτ), W_M/(τ − 1)W_M) ≥` order`((κ)_L, H¹(L, W_M))` and the same for `η`. `(b)` For an Euler system `c` with derivative classes `κ_{r,M} = κ_{K,r,M}` and a finite subset `C ⊆ H¹(K, W_M^*)` with `k = |C|`, there are primes `q₁`, …, `q_k` of `K` such that, with `r_i = q₁⋯q_i: q_i ∈ R_{K,M}`; `Fr_{q_i}` is in the class of `τ` in `Gal(K(W_M)/K)`; order`((κ_{r_{i−1},M})_{q_i}, H¹_f(K_{q_i}, W_M)) ≥` order`((κ_{r_{i−1},M})_Ω, H¹(Ω, W_M))`; and every `η ∈ C` vanishing at all `q_i` lies in `H¹(Ω/K, W_M^*)`. Under `Hyp(K, V)` alone the same holds with both orders lowered by `a + 1` for a constant `a` (Lemma V.3.1).

The precise hypotheses are `Hyp(K, T)` for `(a), (b)`; `Hyp(K, V)` for the weakened form; `Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞})`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter V, Lemma 2.3, p. 81). The inductive choice of primes.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter V, Lemma 3.1, p. 87). The weakened form under `Hyp(K, V)`.

`(a)`: the restrictions of the evaluation maps to `G_L` are homomorphisms, and irreducibility gives the required orders of their images. Evaluation on the Frobenius coset `τG_L` is affine. For each of the two classes, the choices with insufficient localisation order form either the empty set or a coset of a proper subgroup of index at least `p`. In a common finite quotient their union has relative size at most `2/p<1`, so a simultaneous good choice exists. This is where `p>2` is used (Rubin, Chapter V, proof of Lemma 2.1, pp.79–81).

`(b)`: choose `q_i` inductively by Chebotarev in the extension of `Ω`-level cut out by `κ_{r_{i−1},M}` and `η_i`, with Frobenius `γτ`; then `q_i ∈ R_{K,M}` by Lemma IV.1.3.

The loss between `K` and `Ω` is `H¹(Ω/K, W_M)` and `H¹(Ω/K, W_M^*)`: the source of `n_W` and `n_W^*`.

With `H¹(Ω/K, W) = H¹(Ω/K, W^*) = 0` the selection has no loss, as in chebotarev-nonvanishing.

The primes avoid `N` and all earlier `q_j`.

*Needs:* Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 4.3 Rubin's hypotheses, index of divisibility and error terms; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; `TauCetiRoadmap.Chebotarev Layer 10`.

### 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections

Let `S` be a sheaf of `R`-modules on a graph `X`. `S` is locally free of `rank r` if all `S(v), S(e)` are free of `rank r` and all `ψ_v^e` are isomorphisms; locally cyclic if all `S(v), S(e)` are cyclic and all `ψ_v^e` are surjective. For `S` locally cyclic, a surjective path from `v` to `w` is a path `(v = v₁, …, v_k = w)` such that each `ψ_{v_{i+1}}^{e_i}` is an isomorphism; it induces a surjection `ψ_P : S(v) → S(w)`. A vertex `v` is a hub if every vertex is reached from `v` by a surjective path. `S` has trivial monodromy if for surjective paths `P, P′` from `v` to `w, w′` joined by an edge `e, ψ_w^e ∘ ψ_P = ψ_{w′}^e ∘ ψ_{P′}`, and `ψ_P = ψ_{P′}` for surjective paths with the same ends (Mazur–Rubin require both). A global section `κ` is primitive if `κ_v` generates `S(v)` for every `v`. Proposition: if `S` is locally cyclic and `v` is a hub, then `Γ(S) → S(v), κ ↦ κ_v`, is injective, and surjective iff `S` has trivial monodromy; `Γ(S)` is isomorphic to a submodule of the cyclic hub stalk `S(v)`. It is isomorphic to an ideal of `R` if the hub stalk is free of rank one, or if `R` is principal artinian (every cyclic module is then isomorphic to an ideal). The ideal conclusion is false for a general complete noetherian local `R`; and if `u` is a hub and `κ_u` generates `JS(u)` for an ideal `J⊆R` then `κ_w` generates `JS(w)` for every `w`. Over a general local ring, a nonzero component at an arbitrary non-hub vertex does not suffice.

The precise hypotheses are `R` local with maximal ideal `m`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.4.2 and Proposition 3.4.4, pp. 26–27). Hubs, monodromy and the evaluation map.

Fix paths `P_w` from the hub; then `κ_w = ψ_{P_w}(κ_v)`, which gives injectivity without local cyclicity. Trivial monodromy extends each hub value to a section. Conversely, local cyclicity makes transport from the hub surjective onto every stalk; surjectivity of evaluation at the hub therefore detects both monodromy identities at every starting vertex.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.GraphSheaf.IsLocallyCyclic`: All stalks and edge modules cyclic, all vertex-to-edge maps surjective.
- `TauCeti.KolyvaginSystems.GraphSheaf.SurjPath`: Surjective paths, built step by step along edges `e = {x, y}` with `ψ_y^e` bijective.
- `TauCeti.KolyvaginSystems.GraphSheaf.SurjPath.transport`: `ψ_P`, the composite of the maps `(ψ_y^e)⁻¹ ∘ ψ_x^e` along the steps.
- `TauCeti.KolyvaginSystems.GraphSheaf.IsHub`: `v` is a hub: every vertex is the end of a surjective path from `v`.
- `TauCeti.KolyvaginSystems.GraphSheaf.HasTrivialMonodromy`: Transports along surjective paths with the same ends agree, and transports to the two ends of an edge agree in its edge module.
- `TauCeti.KolyvaginSystems.GraphSheaf.eval_injective_of_isHub`: For `v` a hub, `κ ↦ κ_v` is injective on `Γ(S)`; local cyclicity is not needed.
- `TauCeti.KolyvaginSystems.GraphSheaf.eval_surjective_iff`: For `S` locally cyclic and `v` a hub, `κ ↦ κ_v` is surjective iff `S` has trivial monodromy.
- `TauCeti.KolyvaginSystems.GraphSheaf.IsPrimitive`: `κ_v` generates `S(v)` for all `v`.
- `TauCeti.KolyvaginSystems.GraphSheaf.generates_of_generates`: If `u` is a hub and `κ_u` generates `JS(u)`, then `κ_w` generates `JS(w)` for every `w`, for any ideal `J` of `R` and `S` locally cyclic. Generation at an arbitrary non-hub vertex is not sufficient over a general local `R`.

**Checks.**

- `monodromy_trivial_loop`: Trivial monodromy forces every surjective loop transport to be the identity.
- `sections_zero_hub`: `A` section of a locally cyclic sheaf vanishing at a hub is zero.
- `isPrimitive_zero_module`: If every stalk is zero, the zero section is primitive.
- `constant_rank_one`: On a connected graph with all stalks and edge modules `R` and all maps `id`, every vertex is a hub, all transports are `id` and monodromy is trivial. A section is a constant `r` and is primitive precisely when `r∈R^×`.
- `TauCeti.KolyvaginSystems.GraphSheaf.hub_surjective_not_trivialMonodromy`: On the triangle `x,y,z` over `𝔽₂`, take vertex stalks `0,𝔽₂,0` and edge stalks `S(xy)=𝔽₂`, `S(yz)=S(zx)=0`. The `y→xy` map is the identity and the other incidence maps are zero. Vertex `x` is a hub and its evaluation is surjective, but transport along `y→z→x→y` is zero while the empty transport at `y` is the identity. The incidence from `x` to `xy` is not surjective, so the sheaf is not locally cyclic.
- `one_way_hub`: Over a DVR `R`, take two vertex stalks `R` and `k` with edge stalk `k` and maps reduction and `id`. The sheaf is locally cyclic; the `R`-vertex is a hub and the `k`-vertex is not. Evaluation identifies sections with `R`. This detects the direction of the isomorphism in a surjective path.
- `monodromy_minus_one`: On a triangle with all stalks `R` and identity maps except for one incidence `−id`, loop transport is `−1`. If `2∈R^×` this is a locally cyclic sheaf with hubs and only the zero section, so its monodromy is not trivial and it has no primitive section.
- `zero_connected_sheaf`: On a connected graph the zero sheaf is locally cyclic, every vertex is a hub and every transport is the unique isomorphism `0→0`; monodromy is trivial. Its zero section is primitive because it generates each zero stalk.
- `rank_two_nonexample`: `A` constant sheaf `R²` on a connected graph is locally free of rank two but is not locally cyclic for nonzero local `R`. A definition testing only surjectivity of incidence maps would accept it.
- `primitive_nonunit`: For the constant `R`-sheaf, 1 is primitive and `π` is not over a DVR; both are nonzero. Generation must not be replaced by nonvanishing.

A locally free sheaf of rank one on a connected graph is locally cyclic and every vertex is a hub.

A locally cyclic sheaf with a hub has a primitive section iff it has trivial monodromy.

Additional arithmetic check: If `S` is locally free of rank one on a connected graph then every vertex is a hub.

Additional arithmetic check: For the constant sheaf `R` with identity maps on a connected graph, `Γ = R` and every nonzero section generating at one vertex is primitive iff it is a unit.

Additional arithmetic check: On the triangle graph with all modules `R = 𝔽₃` and all maps the identity except one vertex-to-edge map equal to `−1`, the sheaf is locally free of rank one but has nontrivial monodromy, `Γ = 0`, and evaluation at a hub is not surjective.

Additional arithmetic check: On the one-vertex graph, take `R=ℤ_p` and `S(v)=ℤ_p/p`. The vertex is a hub and monodromy is trivial, but `Γ(S)=ℤ/p` cannot be isomorphic to any ideal of the domain `ℤ_p`. Injectivity into `S(v)` does not identify `S(v)` with an ideal.

Additional arithmetic check: Let `R=𝔽₃[[x,y]]`, with a two-vertex graph, hub stalk `R`, other stalk and edge `R/(y)`, and edge maps quotient and identity. The section `(x,x mod y)` generates `mS(u)` at the non-hub vertex `u`, but `x` does not generate `mR` at the hub. Thus the arbitrary-vertex assertion of MR04 Proposition 3.4.4(iii) fails at general-local-ring scope.

*Needs:* Layer 4.1 The Selmer graph and the Selmer sheaf.

### 4.12 Core vertices and leading vertices

In the setting of Layer 4.2 Selmer lengths across an edge, a vertex `n ∈ N` is a core vertex if `λ(n, T) = 0` or `λ(n, T^*) = 0` (equivalently for `T̄`). Theorem: for every `n` there is a noncanonical isomorphism `H¹_{F(n)}(ℚ, T) ⊕ R^r ≅ H¹_{F(n)^*}(ℚ, T^*) ⊕ R^s` with `r, s ≥ 0` independent of `n` and `rs = 0`; at a core vertex `H¹_{F(n)}(ℚ, T)` and `H¹_{F(n)^*}(ℚ, T^*)` are free, of ranks `χ(T)` and `χ(T^*)`, which are the core ranks of Layer 0.8 The core rank of a cartesian Selmer structure. With `r₀ = min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)}`: every core vertex has `ν(n) ≥ r₀`, there are core vertices in `N_j` with `ν(n) = r₀` for every `j ≥ k`, and every `m ∈ N_j` divides a core vertex. If `χ(T) > 0`, a leading vertex is a core vertex with `ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*)`. Over a number field with the 2016 hypotheses a core vertex is an `n` with `λ(n) = length H¹_{F(n)^*}(K, T^*) = 0`.

The precise hypotheses are `(H.0)`–`(H.6), R` principal artinian of `length k, P ⊆ P_k`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 4.1.8 and Corollary 4.1.9, p. 38). Core vertices and their existence.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.1.10 and Definition 4.1.11, p. 38). Freeness at core vertices and the core rank.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), §11, p. 22). Core vertices over a number field.

The structure theorem is Layer 0.8 The core rank of a cartesian Selmer structure applied to `(T, F(n))`, which satisfies the hypotheses by Lemma 3.7.4, with independence of `n` from Layer 4.2 Selmer lengths across an edge`(a)`.

Existence: if `m` is not a core vertex, Layer 1.21 Simultaneous nonvanishing of localisations gives `ℓ ∈ P_j` at which nonzero classes of `H¹_{F(m)}(ℚ, T̄)` and of `H¹_{F(m)^*}(ℚ, T̄^*)` localise nontrivially; by Layer 4.2 Selmer lengths across an edge`(c)` both residual lengths drop by one. Iterate.

`ν(n) ≥ r₀` at a core vertex because each step changes `λ(·, T̄)` by at most one.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.selmerLength`: `λ(n, T)` and `λ(n, T^*)` as elements of `ℕ`.
- `TauCeti.KolyvaginSystems.IsCoreVertex`: `λ(n, T) = 0` or `λ(n, T^*) = 0`.
- `TauCeti.KolyvaginSystems.isCoreVertex_iff_residual`: `n` is a core vertex for `T` iff it is one for `T̄ = T/mT`.
- `TauCeti.KolyvaginSystems.free_of_isCoreVertex`: At a core vertex, `H¹_{F(n)}(ℚ, T)` is free of `rank χ(T)` and `H¹_{F(n)^*}(ℚ, T^*)` is free of `rank χ(T^*)`.
- `TauCeti.KolyvaginSystems.exists_isCoreVertex_dvd`: Every `m ∈ N_j (j ≥ k)` divides a core vertex in `N_j`, and there are core vertices with exactly `r₀` prime factors.
- `TauCeti.KolyvaginSystems.IsLeadingVertex`: Core vertices with `ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*)`, for `χ(T) > 0`.
- `TauCeti.KolyvaginSystems.selmerLength_sub`: `λ(n, T) − λ(n, T^*) = k·(χ(T) − χ(T^*))` for every `n`.

**Checks.**

- `isCoreVertex_dual_zero`: `A` vertex of zero dual Selmer length is core.
- `not_isCoreVertex_both_positive`: If both Selmer lengths are positive, the vertex is not core.
- `isCoreVertex_free_rank`: Under finite MR admissibility, level-zero conductor ideals and core rank 1, a core vertex has free rank-one Selmer module.
- `selmerLength_values`: For coefficient `length k`, the zero Selmer module has length 0, a free rank-one module has `length k`, and `R/π` has length 1. In particular the last two lengths differ for `k>1`.
- `leadingVertex_dual_zero`: With positive core rank and residual dual dimension zero, `n=1` is leading, whereas a core vertex with a nonempty conductor is not leading.
- `leadingVertex_minimal_size`: With residual dual dimension two, a core vertex with two prime factors is leading; a core vertex with more factors is not. A conductor with fewer than two factors cannot be core. These test minimality, rather than merely the vanishing defining core vertices.

If `χ(T) > 0` and `H¹_{F^*}(ℚ, T^*) = 0`, then 1 is a core vertex and the only leading vertex. Positive core rank is needed: for `χ(T) = 0` the vanishing of both Selmer groups makes 1 a core vertex, but leading vertices are defined only for `χ(T) > 0`.

The core rank computed at any core vertex equals the integer of Layer 0.8 The core rank of a cartesian Selmer structure computed at `n = 1`.

Additional arithmetic check: For `χ(T) > 0`, 1 is a core vertex iff `H¹_{F^*}(ℚ, T^*) = 0`.

Additional arithmetic check: For `R = k` and `χ(T) = 1, n` is a core vertex iff `dim H¹_{F(n)}(ℚ, T) = 1` iff `H¹_{F(n)^*}(ℚ, T^*) = 0`.

Additional arithmetic check: If `ν(n) < min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)}` then `n` is not a core vertex.

Additional arithmetic check: `rank H¹_{F(n)}(ℚ, T)` at a core vertex equals Layer 0's `χ(T, F)`, defined from `n = 1`.

*Needs:* Layer 4.2 Selmer lengths across an edge; Layer 0.8 The core rank of a cartesian Selmer structure; Layer 1.21 Simultaneous nonvanishing of localisations; Layer 1.9 The Selmer structures `F_a^b(c)`.

### 4.13 All-prime CM-point descent with bounded error

Fix the data of Nekovář §3.1: a totally real field `F`, a quaternion algebra `B` split at one real place, the smooth compactification `N_H^*` of its Shimura curve, an `F`-simple `GL₂`-type quotient `A_j` of `J(N_H^*)` with `End_F(A_j)=O_{L_j}` and the nontrivial Hecke-linear morphism specified in §3.1, a totally imaginary quadratic `K/F` admitting an embedding into `B`, a CM point `x`, and a finite character `α` of `Gal(K(x)/K)` valued in `O_L` with `L⊇L_j`. Let `β` be its faithful factor on `H=K(α)`, and use the `O_L`-linear tensor variety `A=A_j⊗_{O_{L_j}}O_L` and trace point `y` of §3.5, with the polarization and Weil pairing of §5.19. Assume `A_j` acquires no CM over any totally imaginary quadratic extension of `F` contained in `H`, and `e_β(y)` is non-torsion. For each prime ideal `𝔭` of `O_L` above any rational prime `p`, choose `O_𝔭` and a uniformizer `ϖ`, and put `T_𝔭 = T_𝔭(A)`. Assume the arithmetic image hypotheses: (Img₁) for every `𝔭` the image of `G_H` in `Aut(T_𝔭)` contains a scalar `u_𝔭 ∈ ℤ_p^× ∖ {1}`, and for all but finitely many `𝔭` it contains one with `u_𝔭 ≢ 1 (mod p)`; (Img₂) for every `𝔭` there is `c₃(𝔭) ≥ 0`, zero for all but finitely many `𝔭`, with `ϖ^{c₃(𝔭)}End_{O_𝔭}(T_𝔭) ⊆ image(O_𝔭[G_H] → End_{O_𝔭}(T_𝔭))`. Assume also (MW): `A(H)` is finitely generated. There is `C(𝔭)≥0`, independent of `M` and zero for all but finitely many `𝔭`, such that `ϖ^{C(𝔭)}·(S(A/H,A[ϖ^M])^(β)/O_𝔭 κ₁)=0` for all sufficiently large `M`. Here `κ₁=ϖ^{C₁(𝔭)}δ(e_β(y))`, and `ϖ` is the chosen uniformizer, as in §7.2.1. There is no residual irreducibility or odd-prime restriction. The statement is an annihilator/exponent bound, not an equality of lengths or a square-index formula.

The precise hypotheses are Exactly the CM-point and `GL₂`-type setting of §3.1, including the quaternion embedding and the non-CM condition (*); `e_β(y)` non-torsion; the image hypotheses (Img₁)–(Img₂); (MW); `p` arbitrary; `M` sufficiently large for the fixed arithmetic data.

([Jan Nekovář, The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf), Theorem 3.2, pp. 18–19; §3.5, p. 19; §5.19, pp. 33–34; Proposition 6.4.3, pp. 38–40; Theorem 7.3 and §§7.4–7.6, pp. 45–51 (author copy)). CM-point finiteness and uniform annihilator bounds including `p=2`.

Constants `C₀` (point divisibility), `C₁` (local component groups), `C₂` (restriction kernel), `C₃` (order/image conductor), `C₄` (overlap of `β` and `β⁻¹`), `C₅=ord_𝔭[H:K]`, and `C₆=ord_𝔭 deg(ϕ)` depend on fixed data and `𝔭`, not `M`. Derive `C₂` and `C₃` from the image hypotheses: `C₂(𝔭) = ord_𝔭(u_𝔭 − 1)` kills the restriction kernel `H¹(Gal(H_M/H), A[𝔭^M])` by Sah's lemma, since `u_𝔭` is central in that Galois group; `C₃(𝔭) = c₃(𝔭)`. Both vanish for all but finitely many `𝔭`. The point divisibility `C₀(𝔭) = max{c : e_β(y) ∈ A(H)_tors + 𝔭^c A(H)}` is finite for each `𝔭` and zero for all but finitely many `𝔭` by (MW): modulo torsion, `A(H)` is a finitely generated torsion-free `O_L`-module, in which a nonzero element lies in `𝔭^c` times the module for only finitely many pairs `(𝔭, c)` with `c ≥ 1`. Mordell–Weil for abelian varieties over number fields is not supplied by any roadmap earlier in the dependency order, so (MW) is a hypothesis. Sections 6.1–6.4 then bound the restriction and pairing cokernels uniformly. Nekovář derives (Img₁) from Bogomolov's openness theorem and Serre's uniform index bound, and (Img₂) from the non-CM condition, Faltings's isogeny theorem and Dimitrov's almost-everywhere residual irreducibility (Propositions 6.1.1–6.2.2, pp.35–37). No roadmap earlier in the dependency order supplies these image theorems, so here they are hypotheses.

Choose `C₃` large enough for the proved conductor bound of 4.9, using `c₀d₀³` if needed. This can enlarge the source's order constant but is still independent of `M` and zero at every prime where both lattice orders are maximal. The displayed combinations of nonnegative error constants remain valid with that enlargement; no sharpness of `C₃` is asserted.

For `β²=1` the two annihilation relations of Proposition 7.2.3, detected at successive Chebotarev primes, give `C=2C₀+2C₁+4C₂+4C₃+C₅+C₆+21 ord_𝔭(2)` (§7.5).

For `β²≠1`, §7.6.4 chooses the second prime using the five-coordinate determinant-avoidance argument of Proposition 6.6.2. The resulting bound is `C=4C₀+4C₁+7C₂+7C₃+5C₄+2C₅+2C₆+38 ord_𝔭(2)`.

Under (Img₁)–(Img₂) and (MW) every error constant vanishes at almost all `𝔭`. The finite-level annihilator bound passes to Mordell–Weil and Sha finiteness as in Nekovář §7.1.2. The noncommutative pairing step is Layer 4.9 Uniform cokernel bound for a separated pairing over orders, using the local lattice inputs of Layer 4.8. The curve, point and norm/congruence data are explicit arithmetic hypotheses of this application. This does not prove the inherited all-prime square-index length theorem with a constant independent of `K`.

Construct the finite-Selmer quotient and its `β`-component on the stated arithmetic data before applying the uniform annihilator theorem.

*Needs:* Layer 3.1 The norm and Kolyvagin derivative operators; `SelmerIwasawaCohomology Layer 2`; `TauCetiRoadmap.Chebotarev Layer 10`; Layer 4.9 Uniform cokernel bound for a separated pairing over orders; the displayed CM-point arithmetic data and norm/congruence hypotheses.

### 4.14 Rank one from a nonzero Kolyvagin class, with an explicit exponent bound

In the setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants with `α ≠ 1`, let `(T, F, 𝓛) = (T_α, F_ord, 𝓛_E), e_α = r(C₁ + C₂ + C_α)`, and let `ε ∈ {0, 1}` and `M^{(k)}(n)` be as in Layer 4.5 Cassels structure without residual irreducibility. If `κ ∈ KS(T, F, 𝓛)` has `κ₁ ≠ 0` in `H¹(K, T)`, then `ε = 1, H¹_F(K, T) ≅ R`, and for `k ≫ 0` every element of `M^{(k)}(1)` has order < `k`. Quantitatively, let `s = ind(κ₁)` be the largest `j` with `κ₁ ∈ m^j H¹_F(K, T)`; for every `k > s + 3e_α`, writing the image of `κ₁` in `H¹_F(K, T^{(k)})` as `π^s c₁`, the quotient `H¹_F(K, T^{(k)})/Rc₁` is killed by `π^{s+3e_α}`, so `exp M^{(k)}(1) ≤ ind(κ₁) + 3e_α`.

The precise hypotheses are the setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants, (Sc) and (Irr) of Layer 1.14, `α ≠ 1, p` odd; `κ` a Kolyvagin system for `(T_α, F_ord, 𝓛_E)` with `κ₁ ≠ 0`.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.3.1, Theorem 3.3.8 and its proof, (3.8)–(3.10), pp. 21–22 (arXiv v2)). a nonzero Kolyvagin class forces `ε = 1` and rank one, with `π^{s+3e}` killing the quotient by the first class

For `k` large the image of `κ₁` in `H¹_F(K, T^{(k)})` is nonzero with the same index `s`; write it as `π^s c₁` with `Rc₁ ≅ R^{(k)}`. Let `c₂ ∉ Rc₁` and `d` the order of its image modulo `Rc₁`, so `Rc₁ + Rc₂ ⊇ R^{(k)} ⊕ π^{k−d}R^{(k)}`.

Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms`(b)` gives `ℓ ∈ 𝓛^{(k)}` with `ord(loc_ℓ c₁) ≥ k − e_α` and `R·loc_ℓ c₁ + R·loc_ℓ c₂ ⊇ π^{e_α}R^{(k)} ⊕ π^{k−d+2e_α}R^{(k)}`.

The finite–singular relation gives `ord(loc^s_ℓ κ_ℓ) = ord(loc_ℓ κ₁) ≥ k − s − e_α`, with `κ_ℓ ∈ H¹_{F(ℓ)}(K, T^{(k)})` (the class has the modified local structure `F(ℓ)`). Global duality between `T_α` and `T_{α^{-1}}` (complex conjugation maps `κ_ℓ` to the `α^{-1}`-side relaxed group), with `loc_ℓ` of `H¹_F` and `loc^s_ℓ` of the relaxed group exact annihilators (Layer 1.10 The transverse condition is self-dual), yields `k − s − e_α ≤ k − d + 2e_α`, so `d ≤ s + 3e_α`.

Hence `H¹_F(K, T^{(k)})/Rc₁` is killed by `π^{k−1}` when `k > s + 3e_α`, which forces `ε ≤ 1`; `ε = 0` is excluded directly (`c₁` of order `k` in `M^{(k)}(1)^{⊕2}` would give an element of order `k` in the quotient), replacing the source's unjustified torsion-freeness step. The index is the largest `j` with `κ₁ ∈ m^j H¹` (use divisibility by the maximal ideal).

With `ρ_E` surjective (`C₁ = C₂ = 0`, so `e_α = rC_α`), the bound reads `exp M^{(k)}(1) ≤ ind(κ₁) + 3rC_α`.

If `κ₁ = 0` the theorem says nothing; the stub theory of Layer 4.16 The sheaf of stub Selmer modules is needed for systems with vanishing bottom class.

The quantitative exponent bound is the base case `n₀ = 1` of the induction in Layer 4.18 Self-dual descent with explicit error constants.

*Needs:* Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; Layer 1.10 The transverse condition is self-dual; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 4.5 Cassels structure without residual irreducibility; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`.

### 4.15 Leading vertices through a prescribed submodule

In the setting of Layer 4.12 Core vertices and leading vertices suppose `χ(T) > 0`, 1 is not a core vertex, `(H.4a)` holds and the image of `R → End(T)` is contained in the image of `ℤ_p[[G_ℚ]]`. If `L ⊆ H¹_F(ℚ, T)` satisfies `dim_k L[m] = χ(T)`, there are infinitely many leading vertices `n` with `L ⊆ H¹_{F(n)}(ℚ, T)`. For `R = k` and `χ(T) = 1`: for every line `L` in `H¹_F(ℚ, T)` there is a leading vertex `n` with `κ_n` generating `L ⊗ G_n` for any nonzero `κ ∈ KS(T)`.

The precise hypotheses are `(H.0)`–`(H.6), (H.4a)`, image of `R` in `End(T)` inside that of `ℤ_p[[G_ℚ]]`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.1.16, p. 39). Leading vertices through `L`.

Choose homomorphisms `φ_i` on `H¹_F(ℚ, T)` with common kernel `L` and `ψ_i` on `H¹_{F^*}(ℚ, T^*)` with common kernel 0; Layer 1.23 Primes with prescribed localisation kernels gives primes `ℓ_i` realising them; `n = ∏ℓ_i` is a leading vertex by Layer 4.2 Selmer lengths across an edge`(c)`.

Fails without the `End(T)` hypothesis: only `𝔽_p`-rational subspaces occur (Remark 4.1.17).

*Needs:* Layer 4.12 Core vertices and leading vertices; Layer 1.23 Primes with prescribed localisation kernels.

### 4.16 The sheaf of stub Selmer modules

In the setting of Layer 4.12 Core vertices and leading vertices, the stub subsheaf `ℋ′ ⊆ ℋ` has `ℋ′(n) = m^{λ(n,T^*)}ℋ(n) = m^{λ(n,T^*)}H¹_{F(n)}(ℚ, T) ⊗ G_n, ℋ′(e)` the image of `ℋ′(n)` in `ℋ(e)` for `e` joining `n` and `nℓ`, and the restricted maps, which are surjective. `ℋ′(n) = 0` if `λ(n, T^*) ≥ k`, and otherwise `ℋ′(n)` is free of `rank χ(T)` over `R/m^{k−λ(n,T^*)}`. Theorems: (Howard) `Γ(ℋ′) → ℋ′(n)` is surjective for every `n`; if `χ(T) = 1, Γ(ℋ′)` contains a free `R`-module of rank one, and if `χ(T) > 1` it contains free modules of every rank. If `χ(T) = 1, ℋ′` is locally cyclic, the core subgraph `X⁰` (vertices the core vertices) is connected, every `n` with `λ(n, T^*) = 0` is a hub, `ℋ′` has trivial monodromy and `Γ(ℋ′)` is free of rank one. If `χ(T) = 1`, or `R` is a field, or `(H.4a)` holds with the `End(T)` condition, then `Γ(ℋ′) = Γ(ℋ)`: every Kolyvagin system has `κ_n ∈ ℋ′(n)`. If `χ(T) = 0` then `KS(T) = 0`.

The precise hypotheses are `(H.0)`–`(H.6), R` principal artinian of `length k, P ⊆ P_k`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 4.3.1, p. 41). Definition of the stub subsheaf.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.3.4, p. 41). Local cyclicity and hubs.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.4.1, p. 45). Kolyvagin systems are stub sections.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.2.2, p. 40). Vanishing in core rank zero.

Well-definedness and surjectivity of the maps: Layer 4.2 Selmer lengths across an edge`(c)`, third statement. The description of `ℋ′(n)`: the structure theorem of core-vertices.

Local cyclicity and hubs for `χ = 1`: Theorem 4.3.4 via paths in `X⁰` (Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12); then sheaf-monodromy.

`Γ(ℋ′) = Γ(ℋ)`: induction on `λ(n, T̄^*)` using Lemma 4.2.1 and Layer 1.21 Simultaneous nonvanishing of localisations (Theorem 4.4.1). `χ = 0`: Theorem 4.2.2 by the same lemma.

Howard's theorem (Appendix `B` of Mazur–Rubin): construct sections from an element of `∧^{χ+ν(n)}` at a core vertex.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.stubSheaf`: `ℋ′` as a subsheaf of `ℋ`, with `ℋ′(n) = m^{λ(n,T^*)}·ℋ(n)`.
- `TauCeti.KolyvaginSystems.stubSheaf_stalk_eq_bot`: `ℋ′(n) = 0` iff `λ(n, T^*) ≥ k (for χ(T) > 0)`.
- `TauCeti.KolyvaginSystems.stubSheaf_stalk_free`: If `λ(n, T^*) < k, ℋ′(n)` is free of `rank χ(T)` over `R/m^{k − λ(n,T^*)}`.
- `TauCeti.KolyvaginSystems.stubSheaf_isLocallyCyclic`: For `χ(T) = 1` the stub sheaf is locally cyclic and every vertex with `λ(n, T^*) = 0` is a hub.
- `TauCeti.KolyvaginSystems.sections_stubSheaf_eq`: `Γ(ℋ′) = Γ(ℋ)` under any of the three conditions of Theorem 4.4.1.
- `TauCeti.KolyvaginSystems.kolyvaginSystem_eq_bot_of_coreRank_zero`: `χ(T) = 0` implies `KS(T, F, P) = 0`.

**Checks.**

- `stubSheaf_core_vertex`: If the dual Selmer length at `n` is zero, the stub stalk is the whole stalk.
- `stubSheaf_zero_of_large`: For admissible artinian core rank one, a dual length at least the coefficient length gives the zero stub stalk.
- `stubSheaf_field`: Over a field, a vertex with positive dual length has zero stub stalk.

At a core vertex with `λ(n, T^*) = 0, ℋ′(n) = ℋ(n)`.

For `χ(T) > 1` the module `KS(T)` is not finitely generated (Remark 5.1.2), so the rank-one theory uses `ℋ′`.

Additional arithmetic check: If `λ(n, T^*) > 0` and `χ(T) = 1` then `ℋ′(n) ≠ ℋ(n)`: the stalk `ℋ(n) ≅ R ⊕ H¹_{F(n)^*}(ℚ, T^*)` is not cyclic.

*Needs:* Layer 4.12 Core vertices and leading vertices; Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections; Layer 4.2 Selmer lengths across an edge; Layer 1.21 Simultaneous nonvanishing of localisations; Layer 1.23 Primes with prescribed localisation kernels.

### 4.17 Rubin's bound with error terms

Let `c` be an Euler system for `T` (admissible tower). `(a)` If `p > 2` and `T` satisfies `Hyp(K, T)`, then `ℓ_O(S_{Σ_p}(K, W^*)) ≤ ind_O(c) + n_W + n_W^*`. `(b)` If `V` satisfies `Hyp(K, V), T` is not the one-dimensional trivial representation and `c_K ∉ H¹(K, T)_tors`, then `S_{Σ_p}(K, W^*)` is finite (any `p`). `(c)` Let `H¹_f(K_v, V), H¹_f(K_v, V^*)` be orthogonal complements for `v | p` and `loc^s_{Σ_p} : S^{Σ_p}(K, T) → H¹_s(K_p, T) = ⊕_{v|p} H¹_s(K_v, T)`. If `loc^s_{Σ_p}(c_K) ≠ 0`: under the hypotheses of `(b)` and `[H¹_s(K_p, T) : O·loc^s_{Σ_p}(c_K)]` finite, `S(K, W^*)` is finite; under those of `(a), ℓ_O(S(K, W^*)) ≤ ℓ_O(H¹_s(K_p, T)/O·loc^s_{Σ_p}(c_K)) + n_W + n_W^*`. `(d)` If `c` is trivial at a finite set `Σ` of primes not above `p`, then under the hypotheses of `(a), ℓ_O(S_{Σ_p}^Σ(K, W^*)) ≤ ind_O(c) + n_W + n_W^*` with `n_W = ℓ_O(H¹(Ω/K, W) ∩ S_Σ^{Σ_p}(K, W))` and `n_W^*` as before. The constants `n_W, n_W^*` are independent of the torsion exponent `M`, so the finite-level bounds are uniform in `M` before passing to `W^* = colim W_M^*`.

The precise hypotheses are an Euler system for an admissible tower (or rigidity (ii)`′` with `T^{G_{K(1)}} = 0`); `p > 2` and `Hyp(K, T)` for `(a)`; `Hyp(K, V)` for `(b)`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Theorem 2.2, p. 24). The bound with error terms.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter II, Theorem 2.3, p. 24). Finiteness under `Hyp(K, V)`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter V, Lemma 2.5, p. 82). The key estimate on the cokernel of the singular localisation.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix `A`, Corollary 2.6, p. 148). The kernel and cokernel of `q(σ)` on `W_M` are bounded.

Fix `M` with `ord_𝔭 M ≥ n + (k + 1)n_W + ind_O(c)`. Layer 4.10 Rubin's selection of primes with large localisation gives primes `q₁`, …, `q_k` adapted to a generating set of `S_{Σ_p}(K, W_M^*)` and to the derivative classes.

Lemma V.2.5: for such a set `Σ`, the cokernel of `loc^s_{Σ,W_𝔪} : S^{Σ∪Σ_p}(K, W_𝔪) → ⊕_{q∈Σ} H¹_s(K_q, W_𝔪)` has length `≤ ind_O(c) + n_W`; the singular parts of the derivative classes `κ_{r_i,M}` (Layer 3.13 Local behaviour of derivative classes) generate a submodule of bounded index, using Corollary A.2.6 to control `Q_q(Fr_q^{-1})` when coinvariants are not free (the `2b` term).

At the coefficient level of the cokernel estimate, put `D=S_{Σ_p}(K,W_𝔪^*)`, let `j:D→⊕_{q∈Σ}H¹_f(K_q,W_𝔪^*)` be finite localization, and let `C` be the cokernel of primal singular localization at that same level. Poitou–Tate gives `C≃(im j)^∨` and the exact sequence `0→ker j→D→C^∨→0` (Rubin, Theorem I.7.3(iii), pp.17–19; SelmerIwasawaCohomology §2.19). The selected classes in `ker j` lie in the restriction kernel over `Ω`, whose length is bounded by `n_W^*` as in §4.10. Adding this to `length C≤ind_O(c)+n_W` bounds `length D` by all three terms.

`(b)`: the same with the losses `a + 1` of Lemma V.3.1, bounding the exponent rather than the length. `(c)`: Corollary I.7.5 compares `S(K, W^*)` and `S_{Σ_p}(K, W^*)`. `(d)`: Theorem IX.5.3.

Rubin `V` Lemma 2.5, pp. 83–86: in the general case distinguish orders `d_i` after restriction to `Ω` from `d′_i` after passage to `W`. The loss is bounded by `n_W`. The filtration of derivative localizations telescopes; pass to the `m`-torsion submodule and retain the kernel contribution from the base class to cancel the accumulated losses. This gives cokernel length `≤ind(c)+n_W` without assuming `W^{G_K}=0` or `H¹(Ω/K,W)=0`.

Cyclotomic units: with `n_W = n_W^* = 0` the bound is the class-group divisibility of Rubin's Chapter III.

Each of `ind_O(c), n_W, n_W^*` is retained; an application may drop an error term only after proving it vanishes.

**Checks.**

- If `j=0`, then `C=0` and `D=ker j`; the kernel bound is still necessary.
- If `j` is injective, `D≃C^∨` and the cokernel bound controls the whole length.
- For `D=(O/π)²` and `j` projection onto one factor, `ker j` and `C` each have length one, while `D` has length two. Both terms in the exact sequence are needed.

The bound is for `S_{Σ_p}(K, W^*)`, strict at `p`, not for the Bloch–Kato Selmer group; `(c)` is the passage to `S(K, W^*)`.

*Needs:* Layer 4.3 Rubin's hypotheses, index of divisibility and error terms; Layer 4.10 Rubin's selection of primes with large localisation; Layer 3.13 Local behaviour of derivative classes; Layer 1.8 The finite–singular comparison map; `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`.

### 4.18 Self-dual descent with explicit error constants

(Castella–Grossi–Lee–Skinner, Theorem 3.2.1.) Let `E/ℚ` be an elliptic curve of conductor `N, p ∤ 2N` a prime of good ordinary reduction, `K` an imaginary quadratic field of discriminant prime to `Np` with `E(K)[p] = 0, Γ` the Galois group of the anticyclotomic `ℤ_p`-extension, `R` the integers of a finite extension `Φ/ℚ_p, α : Γ → R^×` a character with `α ≠ 1, T_α = T_pE ⊗ R(α), A_α = T_α ⊗ Φ/R`, and `F_ord` the ordinary Selmer structure. If `κ_α ∈ KS(T_α, F_ord, 𝓛_E)` has `κ_{α,1} ≠ 0`, then `H¹_{F_ord}(K, T_α)` has rank one and `H¹_{F_ord}(K, A_α) ≅ (Φ/R) ⊕ M_α ⊕ M_α` with `M_α` finite and `length_R(M_α) ≤ length_R(H¹_{F_ord}(K, T_α)/R·κ_{α,1}) + E_α`, where `E_α ≥ 0` depends only on `C_α, T_pE` and `rank_{ℤ_p}R`. Here `C_α = v_p(α(γ) − α^{-1}(γ))` if `α ≠ α^{-1}` and 0 otherwise, `C_1 = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ im ρ_E|_{G_{K_∞}}}, C_2` is minimal with `p^{C_2}End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ])`, and `e = rank_{ℤ_p}(R)(C_1 + C_2 + C_α)`. Inputs: `(i)` for `c₁, c₂, c₃ ∈ H¹(K, T^{(k)})` with `Rc₁ + Rc₂ ⊇ 𝔪^{d₁}R^{(k)} ⊕ 𝔪^{d₂}R^{(k)}` there are infinitely many `ℓ ∈ 𝓛^{(k)}` with `ord(loc_ℓ c₃) ≥ ord(c₃) − e` and `R·loc_ℓc₁ + R·loc_ℓc₂ ⊇ 𝔪^{d₁+d₂+2e}(R^{(k)})²`; (ii) if `N ⊆ M` are finitely generated torsion `R`-modules then their invariant factors satisfy `d_i(N) ≤ d_i(M)`. When `ρ_E|_{G_K}` is surjective the error can be taken zero; the stronger Howard theorem is a comparison, not a prerequisite of the residual-reducible proof. Residual irreducibility is not assumed. The anticyclotomic character `α` is residually trivial.

The precise hypotheses are as stated; in particular `α ≠ 1` and `(h1) E(K)[p] = 0`; (Sc) and (Irr) of Layer 1.14, which make `C_1`, `C_2` and `E_α` finite; `α` is congruent to the trivial character modulo the maximal ideal of `R`, as in `CGLS` §3.2 (arXiv v2 p.17).

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), Theorem 3.2.1, arXiv v2 p. 17). The bound with the error constant.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), Proposition 3.3.6, arXiv v2 p. 19). The Chebotarev statement with error terms.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), Lemma 3.3.9, arXiv v2 p. 22). The module lemma used in the induction.

Use Layer 4.5 Cassels structure without residual irreducibility (`CGLS` Proposition 3.3.2): residual-invariant vanishing, cartesian ordinary conditions and conjugate self-duality suffice; no Howard absolute residual irreducibility is assumed.

`(i)` replaces Layer 1.21 Simultaneous nonvanishing of localisations: restriction to the field cut out by `T^{(k)}` has kernel killed by `p^{C_1}`-type constants, and the `O`-span of the image of Galois is controlled by `C_2` and `C_α`.

Induction on the number of primes as in Howard's proof, using (ii) and the module lemmas 3.3.10–3.3.11; in the branch `M = 0` the canonical injection 0 `↪ X` is used and no summand is omitted.

The length of `M_α` is bounded, not only its exponent.

`E_α = 0` when `ρ_E` is surjective on `G_K`.

The bound is uniform in `k`: the constants `C_1, C_2, C_α` do not depend on the torsion exponent.

*Needs:* Layer 4.5 Cassels structure without residual irreducibility; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 1.3 Exponents, orders and reducibility depth; Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 4.6 Module lemmas for the self-dual induction over a discrete valuation ring; Layer 4.14 Rank one from a nonzero Kolyvagin class, with an explicit exponent bound.

### 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1

In the setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants: `(a)` there are integers `M₀, E ≥ 0` depending only on `T_pE` and `rank_{ℤ_p} R` such that, for every nontrivial anticyclotomic `α ≡` 1 mod `π^m` with `m ≥ M₀` and every `κ ∈ KS(T_α, F_ord, 𝓛_E)` with `κ₁ ≠ 0, H¹_{F_ord}(K, T_α)` has `R`-rank one and `H¹_{F_ord}(K, A_α) ≅ Φ/R ⊕ M ⊕ M` with `length_R(M) ≤ length_R(H¹_{F_ord}(K, T_α)/Rκ₁) + E`. The error `E` does not depend on `m`, in contrast with `E_α` of Layer 4.18 Self-dual descent with explicit error constants, which grows as `α → 1`. `(b)` (Rescaled systems; `R = ℤ_p`.) Let `𝓛 ⊆ 𝓛_E` contain `𝓛_e = {ℓ : a_ℓ ≡ ℓ + 1 ≡ 0 mod p^e}` for `e ≫ 0`. Suppose `{κ̃_n ∈ H¹(K, T_α/I_nT_α)}_{n∈N(𝓛)}` is a family with `κ̃₁ ≠ 0` and that for some `t ≥ 0`, independent of `n, {p^t κ̃_n}` is a Kolyvagin system for `(T_α, F_ord, 𝓛)`; the family `{κ̃_n}` itself need not be one. Then there are `M₀, E` depending only on `T_pE` such that for `m ≥ M₀, H¹_{F_ord}(K, T_α)` has `ℤ_p`-rank one and `H¹_{F_ord}(K, A_{α^{-1}}) ≅ ℚ_p/ℤ_p ⊕ M ⊕ M` with `length(M) ≤ length(H¹_{F_ord}(K, T_α)/ℤ_p κ̃₁) + E`; the error is independent of `t`, and `E = 0` when `ρ_E` is surjective. `(c)` The same statement as `(a)` holds for the self-dual twist of the Galois lattice of a weight-`2r` newform at an Eisenstein prime, with `C₁` defined through scalar matrices in its image.

The precise hypotheses are the setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; (Sc) and (Irr) of Layer 1.14 for `(a)`–`(b)`, and their analogues for `T` for `(c)`; `α` nontrivial with `α ≡` 1 mod `π^m`; for `(b): R = ℤ_p, 𝓛 ⊇ 𝓛_e` for `e ≫ 0`, and a fixed `t ≥ 0` with `{p^t κ̃_n}` a Kolyvagin system; For the higher-weight branch: `f` is a normalized weight-`2r` newform of trivial nebentype, `p∤2N` is ordinary and Eisenstein, `O` is the coefficient completion, `T` is its chosen self-dual-twist lattice with `H⁰(K,T/πT)=0`, every prime dividing `N` splits in `K, p` splits in `K`, and `D_K` is odd, prime to `Np` and not `−3` (Keller–Yin introduction and §3).

([Francesc Castella, Giada Grossi, Christopher Skinner, Mazur's main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), §6.1, Theorem 6.1.1, p. 22, and §6.4, its proof, pp. 24–28 (arXiv v2)). the Kolyvagin bound for characters close to 1 with error independent of `m`

([Ashay Burungale, Francesc Castella, Giada Grossi, Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/abs/2312.09301v2), §1.3, Theorem 1.3.1 with proof and Remark 1.3.2, pp. 15–16 (arXiv v2)). the extension to families whose fixed `p^t`-multiple is a Kolyvagin system, with error independent of `t` and zero under residual surjectivity

([Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), §3, Theorem 3.0.2 and Lemma 3.0.3, pp. 35–36 (arXiv v2)). the same bound for weight `2r` newforms at Eisenstein primes, the only new input being the constant `C₁`

Rank one: Layer 4.14 Rank one from a nonzero Kolyvagin class, with an explicit exponent bound; its proof gives `M^{(k)}(1) ≅ M₀` for `k > ind(κ₁) + 3r(C₁ + C₂ + m)`, so the `CGLS` error, which contains `C_α ≈ m`, cannot be used directly for the bound.

Work on the `π^m`-torsion with complex conjugation and the Chebotarev loss `e=r(C₁+C₂)`, independent of `α`. `CGS` §6.4 pp.24–28 constructs at most `ρ` steps, `ρ=2(ρ_e(1)−1)`, where `ρ_t` counts cyclic summands of length greater than `t` in both signs. Conditions`(a)`–`(e)` bound the residual number of summands, module-length changes, and class indices; `(f)` increases the threshold by between two and five multiples of `e`, while `(g)` makes the surviving large-summand count drop every two steps. Summing the length/index inequalities yields a bound with `E=(ρ+(s(1)+1+2ρ)(5ρ+1))e` and closeness threshold `M₀=(1+5ρ)e`, with `s(1)=dim_F H¹_F(K,T^(1))−1`. The auxiliary torsion precision `k` is chosen above the initial length, index and `m` terms; only `M₀` and `E` must be independent of `m`. The threshold and summand-count inequalities account for every step in the length estimate.

`(b)`: choose `f ≫ 0` with `κ̃₁ ≢` 0 mod `p^f` and `𝓛_{f+t} ⊆ 𝓛`; the classes `κ̃_n` give a nontrivial Kolyvagin system modulo `p^f` for `𝓛_{f+t}`, and the inductive argument needs only `ord(loc_ℓ κ̃_ℓ) = ord(loc_ℓ κ̃₁) ≥ ord(κ̃₁) − e` at the first prime, which follows from the relation for `p^tκ̃` once `k > t + f`.

For `(c)`, use the stated higher-weight setting and the analogue of (Sc) for `T`, a nontrivial scalar in the image of `G_{K_∞}`; Keller–Yin Lemma3.0.3 derives it from Bogomolov's theorem and Ribet's irreducibility, which no earlier roadmap supplies. Transport the ordinary filtration of the untwisted modular lattice before the self-dual Tate twist; its rank-one quotient is no longer unramified after a nonzero twist. The `α`-independent Chebotarev argument and the module induction then apply with constants depending on `T` and the coefficient rank.

For `ρ_E` surjective, `(b)` with `t = 0` recovers Howard's bound for the Heegner Kolyvagin system with no error term.

Applied at `α = α_m ≡` 1 mod `π^m` with `m → ∞` and combined with control theorems, `(a)` yields the divisibility at the augmentation prime of Layer 8.36 `Λ`-adic divisibility including the augmentation prime.

`(a)` is stated only for `α` close to 1; for `α` far from 1 the bound of Layer 4.18 Self-dual descent with explicit error constants applies with error `E_α`.

*Needs:* Layer 4.14 Rank one from a nonzero Kolyvagin class, with an explicit exponent bound; Layer 4.6 Module lemmas for the self-dual induction over a discrete valuation ring; Layer 4.5 Cassels structure without residual irreducibility; Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits.

### 4.20 The Kolyvagin system bound

`(a)` (`R` principal artinian of `length k, (H.0)`–`(H.6)`, and one of the conditions of Theorem 4.4.1, or `κ` sufficiently liftable.) For `κ ∈ KS(T): length H¹_{F^*}(ℚ, T^*) ≤ sup{i : κ_1 ∈ m^iH¹_F(ℚ, T)} ∈ ℕ∞` (`∞` when `κ_1=0`). `(b)` (`R` a discrete valuation ring, `(H.0)`–`(H.5), H¹(ℚ_ℓ, T)/H¹_F(ℚ_ℓ, T)` torsion-free for `ℓ ∈ Σ(F), P = P_1^{all}`.) For `κ ∈ KS(T)` put `∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(ℚ, T)} ≤ ∞`. Then `length_R H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ)`; in particular if `κ_1 ≠ 0` then `H¹_{F^*}(ℚ, T^*)` is finite. The same holds for `κ̄ ∈ K̄S(T)`. The bound concerns the whole dual Selmer group `H¹_{F^*}(ℚ, T^*)` of the discrete module `T^* = Hom(T, μ_{p^∞})`, not a cotorsion quotient; for `κ_1 = 0` it is vacuous `(∂^{(0)} = ∞)`.

The precise hypotheses are as stated in `(a), (b)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 5.2.2, p. 56). The bound over a discrete valuation ring.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Corollary 4.4.5, p. 47). The artinian bound.

`(a): κ_1 ∈ ℋ′(1) = m^{λ(1,T^*)}H¹_F(ℚ, T)` by stub-sheaf.

`(b): ∂^{(0)}(κ)` is finite when `κ_1 ≠ 0` since `H¹(ℚ, T)` has no nonzero divisible submodule; the image `κ^{(k)} ∈ KS(T/m^k)` has `κ^{(k)}_1 ∈ m^{∂^{(0)}}H¹_F(ℚ, T/m^k)`; `T/m^k` satisfies `(H.6)` by Lemma 3.7.1`(i)`; apply `(a)` and `H¹_{F^*}(ℚ, T^*)[m^k] = H¹_{F^*}(ℚ, T^*[m^k])` (Layer 0.6 Selmer modules of quotients and torsion submodules), then take the union over `k`.

For Kato's system, take `T=T_pE`, `W=E[p^∞]` via the Weil pairing, and `F` canonical (relaxed at `p`), under the hypotheses of `(b)` for this lattice and system. Its global index gives `length Sel_str(E/ℚ)[p^∞]≤length(H¹_F(ℚ,T)/ℤ_pκ₁^Kato)`, where `Sel_str` uses the usual finite conditions away from `p` and zero at `p`. The usual elliptic/Bloch–Kato Selmer bound instead uses the singular-local index and the localization comparison of §4.17(c). (Mazur–Rubin 2004, §6.2; Burungale–Castella–Grossi–Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory, [§3.1.1 and (3.6)–(3.8)](https://arxiv.org/html/2312.09301v2).)

**Checks.**

- Over a DVR with rank-one initial Selmer module, scaling a nonzero initial class by `π` raises its index by one.
- The zero system has infinite divisibility index and gives no finiteness assertion.
- For `F` relaxed at `p`, its dual is strict there: a nonzero class in the usual Selmer group with nonzero localization at `p` is not in the group bounded by the global index. The singular-local version retains this localization contribution.

*Needs:* Layer 4.16 The sheaf of stub Selmer modules; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 0.6 Selmer modules of quotients and torsion submodules; Layer 0.4 Cartesian local conditions.

### 4.21 Bounds for the variants: finite depth and anticyclotomic systems

`(a)` (Finite depth.) Let `0 ≠ M ∈ O` and `c` an Euler system for `W_M`. Suppose `Hyp(K, T)` holds, `n_W = n_W^* = 0` and `W_M^{G_K} = 0`. Put `a₁ = ⋂_{q ∤ p} Ann_O(W^{I_q}/(W^{I_q})_div)` and `a₂ = Ann_O(a₁c_K)` in `H¹(K,W_M)`. Then `((M):a₂)·a₁·S_{Σ_p}(K,W_M^*) = 0`, where `((M):a₂) = {x ∈ O : xa₂ ⊆ (M)}`. Since `a₂` contains `(M)`, this is the integral ideal denoted `M/a₂` in published Theorem9.3.3. For `M=π^m, a₁=(π^a)` and `a₂=(π^b), 0≤b≤m`, the annihilator is `π^{m−b+a}`. For compatible reductions of a nonzero lattice Euler class with uniformly bounded divisibility, these exponents are bounded independently of `m`; the resulting cofinitely generated infinite-depth strict Selmer module is finite. `(b)` (Anticyclotomic.) Let `χ` have exact order `d|p−1` and `c` be a `χ`-anticyclotomic Euler system for `T`, with any of the three alternatives of 2.8. Put `Ω′=K′(1)_χ(μ_{p^∞},(O_{K′}^×)^{1/p^∞},W)`, where adjoining `W` means its field of definition. Suppose `H¹(Ω′/K′,W)=H¹(Ω′/K′,W^*)=0, T⊗k` is irreducible over `G_{K′}`, and `τ∈G_K` satisfies `ε_cyc(τ)=χ(τ), τ^d=1` on `K′(1)_χ(μ_{p^∞},(O_{K′}^×)^{1/p^∞})`, and `T/(τ−ζ)T` is free of rank one over `O` for every `ζ∈μ_d`. If `d>1`, assume further (FS_χ): the `χ`-finite–singular relation of 3.16 holds for the derivative classes of `c` at every refined conductor. Then for every integer `i`,

```text
𝔭^{ind_O(c,χ^i)} S_{Σ_p}(K′,W*)^{χ^{1−i}} = 0,
ind_O(c,χ^i) = sup{n≥0 : c_{K′}^{χ^i} ∈ 𝔭^n H¹(K′,T)+H¹(K′,T)_tors}.
```

The `χ`-projectors use `d⁻¹` and the displayed index is taken modulo torsion. If the component is torsion, its index is `∞` and `𝔭^∞` denotes the zero ideal, so the assertion gives no finite bound. For a component nonzero modulo torsion the finite index bounds the exponent of the opposite eigenspace. This is published Theorem9.4.3, pp.181–182, with all its root conditions; its proof sketch uses the `χ`-finite–singular relation without proof, so for `d>1` that relation is the hypothesis (FS_χ), while for `d=1` it is 3.13 and no extra hypothesis is needed. Its construction uses `R_{K′,M,τ}` of 3.16, not the whole broad set. No restriction to `d=2` or to split primes is imposed.

The precise hypotheses are as stated, including (FS_χ) when `d>1`.

([Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter IX, Theorem 3.3, p.137 (1999 draft); corrected by published Theorem9.3.3, pp.179–180, published complementary-annihilator convention). The finite-depth bound, with the complementary ideal from the published edition; the draft formula is not used.

([Karl Rubin, Euler Systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), published Theorem9.4.3 and proof sketch, pp.181–183). The anticyclotomic exponent bound; the weaker single-root condition of draft IX.4.3, p.139, is not used.

`(a)`: use published Theorem9.3.3, pp.179–180, correcting draft IX.3.3 (published complementary-annihilator convention). The derivative finite–singular relation persists at depth `M`. Multiplication by `a₁` gives the required local finite conditions away from the derivative conductor, by Corollary IV.6.5; duality bounds the strict Selmer exponent by the complementary ideal `((M):a₂)`, with the additional `a₁` loss. For a fixed lattice class of divisibility `s, b=m−`a`−s` at sufficiently large `m` and the bound is `π^{2a+s}`; pass through compatible local conditions and finite generation to obtain finiteness. The annihilator of a finite-depth class alone must not be substituted for its complementary index.

`(b)`: Layer 3.16 Derivative classes of `χ`-anticyclotomic Euler systems with `r = 1` gives classes in the `χ^{i−1}`-part ramified at one prime, with ramification governed by the `χ^i`-part of `c_{K′}`; they annihilate `S_{Σ_p}(K′, W^*)^{χ^{1−i}}` by global duality.

The `χ`-bound in `(b)` consumes `chiUniversalDerivativeDescent` on the refined set, where refined universal invariance and the no-invariants descent are proved in 3.16, and the `χ`-finite–singular relation: 3.13 for `d=1`, the hypothesis (FS_χ) for `d>1`. For `d>1` the residual-irreducibility hypothesis here supplies the required invariant vanishing (`chiUniversalDerivativeDescent.irreducible_refined`), so `chiCompatibleCochainLifts` is not needed. The third-rigidity-only branch assumes the specified integral congruence. Neither the exponent bound nor the residue-unit calculation proves (FS_χ).

([Karl Rubin, Euler Systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), published Theorem9.3.3, pp.179–180). The complementary ideal is essential; the earlier draft has the reversed factor.

Finite-depth zero control: if `a₁=O` and `c_K=0`, then `a₂=O` and `((π^m):a₂)=(π^m)`, giving only the automatic coefficient annihilator. It does not force the strict Selmer group to vanish.

Finite-depth primitive control: if `a₁=O` and `c_K` has exact order `π^m`, then `a₂=(π^m)` and `((π^m):a₂)=O`; the strict Selmer group vanishes. Greater class order must strengthen the bound.

Finite-depth bounded-divisibility control: for `a₁=(π^a)` and a compatible lattice class of divisibility `s`, the eventual annihilator exponent is `2a+s`, independent of `m`; a single nonzero class at one depth is not by itself this compatible-family argument.

**Checks.**

- `chiExponentBound.all_roots`: At `d=2` both `T/(τ−1)T` and `T/(τ+1)T` must be free of rank one. A trivial rank-one representation satisfies the first condition and fails the second. At `d=1` there is only the `ζ=1` condition; rank zero satisfies neither free-rank-one condition.
- `chiExponentBound.torsion_index`: `A` torsion bottom component has infinite index in the displayed quotient and gives only the zero-ideal annihilator. A primitive nontorsion component has index zero and forces the indicated dual eigenspace to vanish. Omitting the torsion quotient would give a different index.
- `chiExponentBound.exponent_not_length`: `A` module `(O/𝔭^n)^m` has exponent `n` and length `mn`. The bound is independent of `m` and supplies no general length bound for `d>2`. For `p=2` only `d=1` is within the character-order contract.

For `d = 1, (b)` is the exponent form of Layer 4.17 Rubin's bound with error terms with zero error terms.

For Heegner points `(d = 2)` the induction to a length bound uses `T^* ≅ T` and is carried out in Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring.

*Needs:* Layer 4.17 Rubin's bound with error terms; Layer 3.16 Derivative classes of `χ`-anticyclotomic Euler systems; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor.

### Examples

For distinct `q₁,q₂`, the vertices 1 and `q₁q₂` are not adjacent.

On a one-vertex graph, sections equal the sole stalk.

A family whose two restrictions at an edge disagree is not a section.

### Dependencies

This layer uses Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.8 The finite–singular comparison map; `SimpleGraph`; the supplier finite Greenberg–Wiles formula; `SelmerIwasawaCohomology Layer 2`; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 2.2 The module of Euler systems; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; `SelmerIwasawaCohomology §2.9 (Compact and rational Galois Selmer groups)`; Layer 1.11 `γ`-associated places and `(S, γ)`-abundant tuples; Layer 1.3 Exponents, orders and reducibility depth; Layer 1.6 The field cut out by a Selmer module and saturation of `θ_S`; Layer 1.15 Existence of abundant tuples under the corrected span hypothesis; Layer 0.4 Cartesian local conditions; `Module.equiv_directSum_of_isTorsion`; `Module.length`; `IsDiscreteValuationRing`; Layer 3.8 Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at `p`; Layer 1.10 The transverse condition is self-dual; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; `TauCetiRoadmap.Chebotarev Layer 10`; Layer 3.7 The finite–singular relation with its Frobenius operator; `ClassicalArithmeticCompletion Layer 7 (existence of maximal orders)`; Layer 4.8 Local maximal orders and the pairing’s lattice interfaces; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 4.3 Rubin's hypotheses, index of divisibility and error terms; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 4.1 The Selmer graph and the Selmer sheaf; Layer 4.2 Selmer lengths across an edge; Layer 0.8 The core rank of a cartesian Selmer structure; Layer 1.21 Simultaneous nonvanishing of localisations; Layer 3.1 The norm and Kolyvagin derivative operators; Layer 4.9 Uniform cokernel bound for a separated pairing over orders; the displayed CM-point arithmetic data and norm/congruence hypotheses; Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; Layer 4.5 Cassels structure without residual irreducibility; Layer 4.12 Core vertices and leading vertices; Layer 1.23 Primes with prescribed localisation kernels; Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections; Layer 4.10 Rubin's selection of primes with large localisation; Layer 3.13 Local behaviour of derivative classes; Layer 4.6 Module lemmas for the self-dual induction over a discrete valuation ring; Layer 4.14 Rank one from a nonzero Kolyvagin class, with an explicit exponent bound; Layer 4.16 The sheaf of stub Selmer modules; Layer 0.6 Selmer modules of quotients and torsion submodules; Layer 4.17 Rubin's bound with error terms; Layer 3.16 Derivative classes of `χ`-anticyclotomic Euler systems; Layer 2.8 Variants: rigidity conditions, finite depth and anticyclotomic systems; Layer 3.10 Derivative classes are unramified away from `pr`, finite up to a bounded factor.

The proof also uses Mazur–Rubin 2004 Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12, Theorem 4.4.3 and Appendix `B`; Rubin Chapter V §2 general case of Lemma 2.5.

The classical square-index formula with a constant independent of `K` has the additional arithmetic hypotheses specified in §4.13. The exponent bound of Layer 4.13 does not supply that length or square-index assertion.

## Layer 5: Primitivity and self-dual structure

### 5.1 Divisibility indices, elementary divisors and primitivity

For a module `M` over a commutative local ring `(R,m)`, first define the elementwise, untruncated index `TauCeti.KolyvaginSystems.divisibilityIndex(x)` as `sup{j∈ℕ : x∈m^jM}` in `ℕ∞`. It is `∞` for zero, and can also be `∞` for nonzero elements when the `m`-adic filtration is not separated. For a chosen uniformizer in a DVR this agrees with `ordAt` of Layer 1.3. The finite-artinian cyclic-image invariant below is a separate, truncated notion; it is not this elementwise supremum. This definition uses powers of the maximal ideal and their action on a submodule, rather than a chosen generator of `m`.

Let `(T, F, P)` be a Selmer triple and `κ ∈ KS(T)`. `(a) R` principal artinian of `length k: ∂^{(r)}(κ) = min{k − length(Rκ_n) : n ∈ N, ν(n) = r}` and `e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ)` for `i ≥ 0`. `(b) R` a discrete valuation ring: `∂^{(r)}(κ) = max{j : κ_n ∈ m^j H¹_{F(n)}(K, T/I_nT) ⊗ G_n for every n ∈ N with ν(n) = r} ∈ ℕ ∪ {∞}, ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(K, T)}, e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ)` for `i ≥ ord(κ)`, and `∂^{(∞)}(κ) = min{∂^{(r)}(κ) : r ≥ 0}`. `κ` is primitive if its image in `KS(T/mT)` is nonzero. In the DVR case, the index `∂^{(0)}(κ)` is `∞` when `κ_1=0`. In the artinian case use the truncated definition `k−length(Rκ_1)`, which equals `k` for `κ_1=0`, not `∞`. The two conventions agree through limits for nonzero DVR systems under the rank-one admissibility hypotheses.

The precise hypotheses are For the definitions: `R` principal artinian `(length k)` or a DVR, with its specified Kolyvagin-system carrier; For monotonicity, scaling, elementary-divisor and order characterisations: the admissibility hypotheses of Layer 5.3 Kolyvagin systems in core rank one and `χ(T)=1`; use nonzero `κ` for DVR elementary divisors.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 5.2.11, pp. 57–58). The invariants over a discrete valuation ring.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 4.5.5, p. 49). Primitivity.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 4.5.7, p. 49). The artinian invariants.

In the artinian case `length(Rκ_n) = k −` (largest `j` with `κ_n ∈ m^j` of a free stalk); the two definitions agree in the limit: `∂^{(s)}(κ) = lim_k ∂^{(s)}(κ^{(k)})` (Theorem 5.2.12`(i)`).

Primitivity uses the reduction map `KS(T) → KS(T/mT)` of Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; for core rank one it is equivalent to `κ` generating `KS(T)`, and to `κ_n` generating the stub stalk `ℋ′(n)` for one `n` with `ℋ′(n) ≠ 0`, or for all `n` (Corollary 4.5.4).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.divisibilityIndex`: The elementwise supremum in `ℕ∞` over powers of the maximal ideal; zero has index `∞`, and an element outside `mM` has index zero. On a DVR this agrees with `ordAt` for a uniformizer.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex`: `∂^{(r)}(κ) ∈ ℕ∞` for `r ≥ 0`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_zero`: `∂^{(0)}(κ) = sup{j : κ_1 ∈ m^j H¹_F(K, T)}`; it is `⊤` iff `κ_1 = 0` (`R` a discrete valuation ring, `H¹_F` torsion-free).
- `TauCeti.KolyvaginSystems.KolyvaginSystem.elementaryDivisor`: `e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ)`, defined for `i ≥ ord(κ)`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndexInfty`: `∂^{(∞)}(κ) = inf_r ∂^{(r)}(κ)`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.IsPrimitive`: The image of `κ` in `KS(T/mT)` is nonzero.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_smul`: Under the rank-one admissibility hypotheses, over a DVR `∂^{(r)}(πκ)=∂^{(r)}(κ)+1` with `∞+1=∞`. Over a principal artinian ring of `length k, ∂^{(r)}(πκ)=min(k,∂^{(r)}(κ)+1)`.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.not_isPrimitive_smul`: `π·κ` is not primitive.
- `TauCeti.KolyvaginSystems.KolyvaginSystem.ord_eq`: For nonzero `κ` under the rank-one admissibility hypotheses: over a DVR `ord(κ)=min{r:∂^{(r)}(κ)<∞}`; over a principal artinian ring `ord(κ)=min{r:∂^{(r)}(κ)<k}`. Set `ord(0)=∞` in both cases.

**Checks.**

- `divisibilityIndex.zero`: Zero has elementwise index `∞` even over `ℤ/p²`; its truncated artinian system invariant instead equals 2.
- `divisibilityIndex.residue_nonzero`: If `x∉mM`, its elementwise index is zero. In particular `1∈R` has index zero for every nonzero local ring.
- `divisibilityIndex.padic_power`: In `ℤ_p` the element `p^j` has index `j` for each `j≥0`; `p³` becomes an element of index 5 after multiplication by `p²`. In `M=ℚ_p` viewed as a `ℤ_p`-module, 1 has index `∞`, detecting an unjustified separation claim.
- `divIndex_zero_order`: The zero system has infinite order.
- `divIndex_zero_artinian`: In a length-`k` artinian ring, the zero system has partial invariant `k` at every nonempty conductor-size level.
- `divIndex_scaling`: Over a DVR with torsion-free size-zero stalks, initial index 3 becomes 5 after multiplication by `π²`.

Over a DVR under rank-one admissibility, `∂^{(r)}(πκ)=∂^{(r)}(κ)+1` and `e_i(πκ)=e_i(κ)` for their finite range. Over length-`k` artinian rings the values truncate at `k`, so elementary divisors need not remain unchanged.

The order uses threshold `∞` over a DVR and `k` over an artinian ring.

Additional arithmetic check: For `κ=0` over a DVR, `∂^{(r)}=∞` for all `r`; over a principal artinian ring of `length k, ∂^{(r)}=k`. In both cases `ord(κ)=∞` and `κ` is not primitive.

Additional arithmetic check: For `R = k` a field, `κ` is primitive iff `κ ≠ 0`.

Additional arithmetic check: Over a DVR, for primitive `κ₀` with `(κ₀)_1≠0, πκ₀` has nonzero initial class and is not primitive. In an artinian quotient the initial class can be killed by `π`, so nonvanishing must be checked separately.

*Needs:* Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 4.16 The sheaf of stub Selmer modules; `Module.length`.

### 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5

Let `K` be an imaginary quadratic field, `τ` a complex conjugation, `R` a coefficient ring (complete noetherian local, finite residue field of characteristic `p`; in §1.5 principal artinian, in §1.6 a discrete valuation ring) and `T` an `R`-module with continuous `G_K`-action. `𝓛₀` is the set of rational primes `ℓ` inert in `K` (prime to `p` and to the ramification of `T`), `λ` the prime of `K` above `ℓ`; `I_ℓ` is the smallest ideal of `R` containing `ℓ + 1` for which `Fr_λ` acts trivially on `T/I_ℓT`; `𝓛_k = {ℓ ∈ 𝓛₀ : I_ℓ ⊆ p^kR}`; `G_ℓ = k_λ^×/k_ℓ^×`; `I_n = Σ_{ℓ | n} I_ℓ` and `G_n = ⊗_{ℓ | n} G_ℓ`. The transverse condition at `λ` is defined by the maximal `p`-subextension `L` of `K[ℓ]_λ/K_λ, K[ℓ]` the ring class field of conductor `ℓ`. Since `Gal(K[ℓ]/K[1]) ≅ G_ℓ/image(O_K^×)` and the principal prime `λ` splits in `K[1]/K`, `L/K_λ` is totally tamely ramified. Assume `p ∤ [O_K^×:O_ℓ^×]` at every `ℓ ∈ 𝓛₀`; then its group is the `p`-part of `G_ℓ`, of order `(ℓ+1)_p`. It is maximal totally tamely ramified abelian of `p`-power degree when also `p∤(ℓ−1)`, since the full local residue-unit group has order `ℓ²−1`. For odd `p` this extra condition holds at every active prime `ℓ∈𝓛₁`, where `p|ℓ+1`. For odd `p` the unit-index hypothesis excludes exactly `K = ℚ(√−3)` with `p = 3`, since `[O_K^×:O_ℓ^×]` is 2 for `ℚ(i)`, 3 for `ℚ(√−3)` and 1 otherwise.

**Inert finite–singular comparison.** For `ℓ ∈ 𝓛₀` and a quotient `A = T/JT` with `I_ℓ ⊆ J` (so `Fr_λ` acts trivially on `A` and `(ℓ+1)A = 0`), define `TauCeti.KolyvaginSystems.SelfDual.finiteSingular` as the composite `φ^fs_ℓ : H¹_f(K_λ, A) ≅ A ≅ H¹_s(K_λ, A) ⊗ G_ℓ`. The first map evaluates cocycles at `Fr_λ`; the second is inverse to `c ⊗ α ↦ c(σ_α)`, where `σ_α` is the local Artin symbol in `Gal(L/K_λ)` of the `p`-part of `α`, identified through the ring-class reciprocity of Layer 2.9 under the unit hypothesis above. For nonzero `A`, `(ℓ+1)A=0` forces `p|ℓ+1`, so odd `p` gives `p∤(ℓ−1)` and `L` has the required maximality; for `A=0` both cohomology groups are zero. Both maps are isomorphisms (Howard Proposition 1.1.7), so `φ^fs_ℓ` is an isomorphism, of free rank-two `R/J`-modules when `A` is free. It is not the polynomial map of Layer 1.8: at such `λ`, `P = det(1 − Fr_λX | A) = (1 − X)²`, so `Q = X − 1` and `Q(Fr_λ^{-1}) = 0`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1), §1.1, Proposition 1.1.7, Definition 1.1.8 and Proposition 1.1.9, pp. 5–6 (arXiv v1); §1.2, the comparison `φ^fs_ℓ` before Definition 1.2.3, p. 7). The evaluation isomorphisms, the finite–singular map and the transverse splitting at an inert prime.

- `TauCeti.KolyvaginSystems.SelfDual.finiteSingular`: `φ^fs_ℓ : H¹_f(K_λ, A) ≃ H¹_s(K_λ, A) ⊗ G_ℓ` for `A = T/JT` with `I_ℓ ⊆ J`.
- `TauCeti.KolyvaginSystems.SelfDual.finiteSingular_generator`: For a generator `σ` of the `p`-part of `G_ℓ`, `φ^fs_ℓ(c) = φ_σ(c) ⊗ σ` with `φ_σ(c)(σ_σ) = c(Fr_λ)`, and `φ_{σ^a} = a^{-1}φ_σ`; the tensor-valued map does not depend on `σ`.
- `TauCeti.KolyvaginSystems.SelfDual.finiteSingular_conj`: Complex conjugation acts on `G_ℓ = k_λ^×/k_ℓ^×` by inversion, since it induces `x ↦ x^ℓ` on `k_λ` and `x^{ℓ+1} ∈ k_ℓ^×`. When the action of `G_K` on `A` extends to `G_ℚ`, `φ^fs_ℓ` is `τ`-equivariant for the diagonal action on `H¹_s ⊗ G_ℓ`.
- `TauCeti.KolyvaginSystems.SelfDual.finiteSingular_reduce`: `φ^fs_ℓ` commutes with the reductions `T/JT → T/J′T` for `J ⊆ J′`.

**Checks.**

- `SelfDual.ringClass_not_maximal`: For `K=ℚ(i)`, `p=5` and `ℓ=11`, the unit index is 2 and `[K[11]:K]=6`, so `L=K_λ`. Yet Teichmüller lifts from `k_λ=𝔽₁₂₁` give `μ₅⊂K_λ`, and adjoining a root of the Eisenstein polynomial `X⁵−11` gives a cyclic totally tame extension of degree 5. Here `I₁₁=R` because `ℓ+1=12` is a unit; no nonzero coefficient quotient with `I₁₁⊆J` enters the comparison.
- `SelfDual.finiteSingular_rank_two`: For `R = 𝔽_p` and `A = 𝔽_p²` with trivial `Fr_λ` at an inert `ℓ` with `p | ℓ+1`, `φ^fs_ℓ` is an isomorphism of two-dimensional spaces, whereas Layer 1.8's polynomial map is zero.
- `SelfDual.finiteSingular_generator_change`: Replacing `σ` by `σ²` (`p` odd) halves `φ_σ`, while `φ_σ(c) ⊗ σ` is unchanged because `σ²` is twice `σ` in `G_ℓ ⊗ ℤ_p`.
- `SelfDual.finiteSingular_conj_sign`: For `ℓ = 5`, inert in `ℚ(√−7)`, and `p = 3`, `G_5 = 𝔽_{25}^×/𝔽_5^×` is cyclic of order 6 and `τ` acts by `x ↦ x⁵ = x^{-1}`, so by `−1` on its `3`-part. Hence `φ^fs_ℓ` carries the `τ = ±1` part of `H¹_f` to the `τ = ∓1` part of `H¹_s`, tensored with `G_ℓ`.
- `SelfDual.exceptional_units_excluded`: For `K = ℚ(√−3)`, `p = 3`, `ℓ = 2` (inert), `R = 𝔽₃` and `T = R²` locally trivial at `λ`, `I₂ = 0` and `|k_λ^×/k_ℓ^×| = 3`. But `ζ₃` maps onto `𝔽₄^×`, so `[O_K^×:O_2^×] = 3`, the order of conductor 2 has class number 1 and `K[2] = K`. The would-be transverse condition is zero although `H¹_s(K_λ,T) ≠ 0`; the unit hypothesis excludes this datum.

A Selmer triple `(T, F, 𝓛)` has `𝓛 ⊆ 𝓛₀` disjoint from `Σ(F)`; Kolyvagin systems `κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n, n ∈ N(𝓛)`, satisfy the finite–singular relations `loc^s_ℓ(κ_{nℓ}) = (φ^fs_ℓ ⊗ 1)(loc_ℓ κ_n)` in `H¹_s(K_λ, T/I_{nℓ}T) ⊗ G_{nℓ}` at every `ℓ` with `nℓ ∈ N(𝓛)`, with `φ^fs_ℓ` the inert comparison above (Howard Definition 1.2.3). The same map is used in Layers 5.7–5.13, 8.28 and 8.31–8.32. Hypotheses: `H`.0 `T` is free of rank two. `H`.1 `T̄` is absolutely irreducible. `H`.2 there is a Galois extension `F/ℚ` containing `K` with `G_F` acting trivially on `T` and `H¹(F(μ_{p^∞})/K, T̄) = 0`. `H`.3 `F` is cartesian on `Quot(T)` at every `v ∈ Σ(F)`. `H`.4 there is a perfect symmetric `R`-bilinear pairing ( , ) : `T × T → R(1)` with `(s^σ, t^{τστ^{-1}}) = (s, t)^σ`, and `F` is its own exact orthogonal complement under the induced pairings `H¹(K_v, T) × H¹(K_{v̄}, T) → R`. `H`.5 `(a)` the action of `G_K` on `T̄` extends to `G_ℚ` and `τ` splits `T̄` into one-dimensional eigenspaces `T̄^±`; `(b) F` on `T̄` is stable under `G_ℚ`; `(c)` the residual pairing satisfies `(s^τ, t^τ) = (s, t)^τ`.

The precise hypotheses are `K` imaginary quadratic; `p` odd; `p ∤ [O_K^×:O_ℓ^×]` for `ℓ ∈ 𝓛₀`, that is `(K, p) ≠ (ℚ(√−3), 3)`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), §1.3, hypotheses `H`.0–`H`.5, p. 1446). The hypothesis list.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), §1.3, hypothesis `H`.4, p. 1446). The self-duality hypothesis.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Definition 1.2.3, p. 1445). Kolyvagin systems over an imaginary quadratic field.

Howard Proposition 1.1.7 identifies `H¹_f(K_λ,T) ≅ T/(Fr_λ−1)T` and `H¹_s(K_λ,T) ⊗ k_λ^× ≅ T^{Fr_λ=1}`; Proposition 1.1.9 gives the transverse splitting `H¹ = H¹_f ⊕ H¹_tr` and the exact orthogonality of both summands (`p` odd). When the inert conductor ideal vanishes these groups are free of rank two. Derive the ring-class restriction kernel and the `k_λ×/k_ℓ×` reciprocity comparison from the conductor-change calculation of Layer 2.9 and local ClassFieldTheory, under the unit hypothesis above. They are distinct from the rank-one-coinvariant Mazur–Rubin polynomial construction, which is not instantiated at an inert rank-two prime.

Howard Remark 1.3.1 supplies admissible scalar changes and Lemma 1.5.1 supplies modification at primes whose conductor ideal vanishes. This interface makes same-coefficient modification with `I_n=0` and scalar quotient `R/I` explicit; arbitrary coefficient changes require the corresponding dictionary and retained hypotheses.

For `R = ℤ_p, T = T_pE` and `(s, t) = e(s, t^τ)` with `e` the Weil pairing, `H`.4 holds (Remark 1.3.2).

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.SelfDual.Hypotheses`: The record `H`.0–`H`.5, one field for each hypothesis, with the pairing of `H`.4 as data.
- `TauCeti.KolyvaginSystems.SelfDual.inertPrimes`: `𝓛_k(T)` for `k ≥ 0` and the ideals `I_ℓ ∋ ℓ + 1`.
- `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.modify`: For `n` with inert conductor ideal `I_n=0`, the same-coefficient modification preserves `H`.0–`H`.5.
- `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.baseChange`: Admissible quotient `R→R/I` preserves the displayed Howard hypotheses, with explicit propagated local structures.
- `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.ofWeilPairing`: The Weil pairing combined with conjugation constructs the perfect symmetric pairing data; local exact self-orthogonality is a separate hypothesis for `H`.4.

**Checks.**

- `SelfDual.conductorIdeal_one`: The inert conductor-one ideal is zero.
- `SelfDual.tame_group_inert`: At a rational inert prime `ℓ, k_λ×/k_ℓ×` has order `ℓ+1`, not `ℓ²−1`.
- `SelfDual.conductorIdeal_inert`: For `q` above an inert `ℓ` in `𝓛_k, ℓ+1` lies in `pᵏR`.
- `SelfDual.hypotheses_rank`: Zero and rank-one modules fail `H`.0; a trivial rank-two residual module satisfies the rank field but fails absolute irreducibility `H`.1. Satisfying a ring-class prime condition does not repair either failure.
- `SelfDual.pairing_conjugation`: With Weil matrix `J=[[0,1],[−1,0]]` and complex conjugation `diag(1,−1)`, the matrix of `e(s,t^τ)` is `[[0,−1],[−1,0]]`, symmetric and invertible. `J` itself is alternating and is not symmetric when 2 is invertible, so the untwisted Weil pairing is not `H`.4 data.
- `SelfDual.residual_signs`: In odd residue characteristic, `diag(1,−1)` gives one line in each `τ`-eigenspace; the identity on a two-dimensional residual module fails `H`.5`(a)`. At `p=2` these signs coincide, which is why the stated odd-prime convention is required.

These hypotheses differ from Mazur–Rubin's by the self-duality `H`.4 and by the absence of an analogue of `(H.4a)/(p > 4)`: they are a separate record.

With `H`.4, `χ`-type invariants are replaced by the parity `ε ∈ {0, 1}` of Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`.

Additional arithmetic check: For `ℓ ∈ 𝓛_k` and `R = ℤ/p^k, H¹_f(K_λ, T)` and `H¹_tr(K_λ, T)` are free of rank two, in contrast with rank one at Mazur–Rubin's primes.

Additional arithmetic check: An inert prime `ℓ ∈ 𝓛_k` is not in Mazur–Rubin's `P_k` for `K: T/(Fr_λ − 1)T` is free of rank two, not one.

Additional arithmetic check: For `R` a field `H`.3 is automatic.

*Needs:* Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 1.5 The transverse local condition; Layer 2.9 Anticyclotomic Euler systems over ring class fields; Layer 0.4 Cartesian local conditions; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; `TauCetiRoadmap.ClassFieldTheory Layer 7`; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence.

### 5.3 Kolyvagin systems in core rank one

Let `(T, F, P)` satisfy `(H.0)`–`(H.6)` with `χ(T) = 1`. `(a) R` principal artinian of `length k: KS(T)` is free of rank one over `R`; for a core vertex `n, κ ↦ κ_n` is an isomorphism `KS(T) ≅ ℋ(n)`; if `κ_m ≠ 0` generates `m^jℋ′(m)` then `κ_n` generates `m^jℋ′(n)` for every `n`; for `j ≥ k` restriction `KS(T, P) → KS(T, P ∩ P_j)` is an isomorphism; for `j ≤ k` reduction `KS(T) → KS(T/m^jT)` is surjective; and `KS(T) → K̄S(T)` is an isomorphism. `(b) R` a discrete valuation ring, `(H.0)`–`(H.5)`, torsion-free local quotients, `P = P_1: KS(T) ≅ lim_k KS(T/m^kT, P_k) ≅ K̄S(T)`, and `KS(T)` is free of rank one, generated by a primitive `κ`. If `χ(T) = 0` then `KS(T) = 0` in both cases; if `χ(T) ≥ 2` and `R` is artinian, `KS(T)` contains free modules of every rank.

The precise hypotheses are `(H.0)`–`(H.6)` (artinian), or `(H.0)`–`(H.5)` with torsion-free local quotients (discrete valuation ring); `χ(T) = 1` for the main statements.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Corollary 4.5.2, p. 48). The artinian statement.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 5.2.10, p. 57). The statement over a discrete valuation ring.

`(a): KS(T) = Γ(ℋ′)` (Layer 4.16 The sheaf of stub Selmer modules), a locally cyclic sheaf with trivial monodromy and hubs at the core vertices; apply Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections.

`(b)`: injectivity of `KS(T) →` lim `KS(T/m^k)` (Lemma 5.2.7); surjectivity by assembling `κ_n` from `κ^{(j)}_n` with `j` maximal such that `n ∈ N_j`; the transition maps are surjective by Lemma 5.2.8.

For `T = ℤ_p(1) ⊗ ρ^{-1}, ρ` even nontrivial: `KS(T)` is free of rank one, generated up to a unit by the cyclotomic-unit system when that system is primitive.

Reduction surjectivity: every Kolyvagin system modulo `m^j` lifts.

*Needs:* Layer 4.16 The sheaf of stub Selmer modules; Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections; Layer 4.12 Core vertices and leading vertices; Layer 5.1 Divisibility indices, elementary divisors and primitivity.

### 5.4 The Kolyvagin-constructed dual Selmer group

Let `S` be a sheaf on `X(P)` with isomorphisms `S(e_{n,nℓ}) ≅ S(e_ℓ)` for all edges (for the Selmer sheaf with `I_ℓ = 0` for all `ℓ ∈ P`, given by generators of the `G_ℓ`). For a vertex `n` let `ψ_n : S(n) → ⊕_{ℓ | n} S(e_ℓ)` be the sum of the vertex-to-edge maps. For a global section `κ, Sel^*(κ; n) = (⊕_{ℓ | n} S(e_ℓ))/Σ_{d | n} ψ_d(Rκ_d)` and `Sel^*(κ) = colim_n Sel^*(κ; n)`. For the Selmer sheaf there is a canonical map `H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p)` with kernel `∩_n H¹_{(F^*)_n}(ℚ, T^*)`, the classes vanishing at every prime of `P`. Theorem: if `χ(T) = 1, (H.4a)` holds, the image of `R → End(T)` lies in that of `ℤ_p[[G_ℚ]]` and `κ` is primitive, this map is an isomorphism. For general `(T, F, P), Sel^*_∞(κ) = lim_k Sel^*(κ^{(k)})`.

The precise hypotheses are `I_ℓ = 0` for `ℓ ∈ P` (after reduction modulo `m^k` and restriction to `P_k`).

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Definition 3.3.1, p. 25). Definition of `Sel^*(κ; n)`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.5.12, p. 51). The isomorphism under primitivity.

Global duality for `F_n ≤ F` (Layer 1.9 The Selmer structures `F_a^b(c)`; SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)) gives `0 → H¹_{(F^*)_n} → H¹_{F^*} → Hom(⊕_{ℓ|n} H¹_s(ℚ_ℓ, T)/image(H¹_{F^n}(ℚ, T)), ℚ_p/ℤ_p)`, and `κ_d ∈ H¹_{F^n}` for `d | n`.

Surjectivity under primitivity: Lemmas 4.5.13–4.5.14 and Proposition 4.5.15, walking through core vertices.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.kolyvaginDualSelmer`: `Sel^*(κ; n)` and `Sel^*(κ) = colim_n Sel^*(κ; n)`.
- `TauCeti.KolyvaginSystems.kolyvaginDualSelmer_map`: For `n | m` the natural map `Sel^*(κ; n) → Sel^*(κ; m)`.
- `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual`: The canonical map `H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p)`.
- `TauCeti.KolyvaginSystems.ker_dualSelmerToKolyvaginDual`: Its kernel is `⨅_n H¹_{(F^*)_n}(ℚ, T^*)`.
- `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual_bijective`: Bijective when `χ(T) = 1, (H.4a)`, the `End(T)` condition and `κ` primitive.

**Checks.**

- `kolyvaginDualSelmer_one`: The finite dual edge presentation at conductor one is zero.
- `kolyvaginDualSelmer_zero_system`: For `κ=0`, the presentation is the direct sum of the designated edge modules.
- `kolyvaginDualSelmer_scaled_edge`: `A` free DVR edge modulo multiplication by its uniformizer is nonzero; a scaled nonprimitive system cannot force that edge quotient to vanish.

The construction recovers the Pontryagin dual of the whole dual Selmer group, as a module, from the classes `κ_n`.

For a non-primitive `κ` the map need not be surjective.

Additional arithmetic check: For `κ = πκ₀` with `κ₀` primitive and `H¹_{F^*}(ℚ, T^*) = 0, Sel^*(κ; ℓ) = S(e_ℓ)/πS(e_ℓ) ≠ 0` at a core edge, so the map from 0 is not surjective.

*Needs:* Layer 4.1 The Selmer graph and the Selmer sheaf; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 1.9 The Selmer structures `F_a^b(c)`; `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.10 (Pontryagin duals with the contragredient action)`.

### 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`

Let `K` be imaginary quadratic, `p` odd, and `R` a coefficient ring that is principal artinian of `length k` and `(T, F, 𝓛)` satisfy `H`.1, `H`.3 and `H`.4 (with vanishing residual invariants). `(a)` For positive integers `s, t` with `s + t ≤ k` there is a pairing ( , )`_{s,t} : H¹_F(K, T/m^sT) × H¹_{F^*}(K, T^*[m^t]) → R` whose left and right kernels are the images of `H¹_F(K, T/m^{s+t}T)` and of `π^s : H¹_{F^*}(K, T^*[m^{s+t}]) → H¹_{F^*}(K, T^*[m^t])`. `(b)` There are an `R`-module `M` and `ε ∈ {0, 1}` with `H¹_F(K, T) ≅ R^ε ⊕ M ⊕ M`. `(c)` Under `H`.0–`H`.5 with `𝓛 ⊆ 𝓛_k`, for `n ∈ N(𝓛)` write `H¹_{F(n)}(K, T) ≅ R^ε ⊕ M(n) ⊕ M(n)`; then `ε ≡ ρ(n) = ρ(n)^+ + ρ(n)^−` (mod 2), where `ρ(n)^± = dim H¹_{F(n)}(K, T̄)^±`, and `ε` is independent of `n`: if `loc_ℓ(H̄(n)^±) ≠ 0` then `ρ(nℓ)^± = ρ(n)^± − 1`, and otherwise `ρ(nℓ)^± = ρ(n)^± + 1`.

The precise hypotheses are `K` imaginary quadratic; `p` odd; `H`.1, `H`.3, `H`.4 with vanishing residual invariants; `R` a principal-artinian coefficient ring; `H`.0–`H`.5 and `𝓛 ⊆ 𝓛_k` for `(c)`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Proposition 1.4.1, p. 1448). The pairing.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Theorem 1.4.2 and its proof, pp. 1448–1450). Alternating successive-quotient pairings and the doubled-module structure.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Lemma 1.5.3, p. 1450). Parity is constant on the graph.

`(a)`: Flach's construction of the Cassels–Tate pairing by lifting cocycles; the kernels by global duality.

`(b)`: with `H=H¹_F(K,T)`, for `1≤s<k` the spaces `V_s=H[m^s]/mH[m^{s+1}]` have alternating pairings whose radical is `V_{s−1}`, by Howard Theorem 1.4.2, `H`.4 and the torsion identifications. The quotients `V_s/V_{s−1}` carry nondegenerate alternating pairings and are even-dimensional; induction gives even dimension of `V_s` for `0≤s<k`. The free length-`k` summands are not subject to this parity constraint; their multiplicity is absorbed into `M` up to its parity. The finite-module structure theorem then gives the doubled nonfree summand and `ε∈{0,1}`.

`(c)`: Lemma 1.5.3 by global duality for `F_ℓ(n) ≤ F(n), F(nℓ) ≤ F^ℓ(n)` on each eigenspace.

For `T = E[p^k]` with the classical structure: `Sel_{p^k} ≅ (ℤ/p^k)^ε ⊕ M ⊕ M`.

Self-duality replaces the core rank: `ε` is a parity, not a rank difference.

*Needs:* Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 0.6 Selmer modules of quotients and torsion submodules; `SelmerIwasawaCohomology Layer 2`.

### 5.6 Structure of the dual Selmer group from a Kolyvagin system

Let `χ(T) = 1` and `0 ≠ κ ∈ KS(T)`. `(a) R = k` a field: dim `KS(T) = 1, κ_n ≠ 0` iff `n` is a core vertex, and `dim_k H¹_{F^*}(ℚ, T^*) = ord(κ)`. `(b) R` principal artinian of `length k, κ_1 ≠ 0: ∂^{(0)}(κ) ≥ ∂^{(1)}(κ) ≥` ⋯, `e_0(κ) ≥ e_1(κ) ≥ ⋯ ≥ 0` and `H¹_{F^*}(ℚ, T^*) ≅ ⊕_{i ≥ 0} R/m^{e_i(κ)}`; if `κ` is primitive and `κ_1 ≠ 0` then `length H¹_{F^*}(ℚ, T^*) = k − length(Rκ_1) = max{i : κ_1 ∈ m^iH¹_F(ℚ, T)}`, and if `κ` is primitive and `κ_1 = 0` then `length H¹_{F^*}(ℚ, T^*) ≥ k`. `(c) R` a discrete valuation ring: `∂^{(s)}(κ)` is nonincreasing and finite for `s ≥ ord(κ)`; the `e_i(κ)` are nonincreasing, nonnegative and independent of `κ ≠ 0`, as is `ord(κ)`; `corank_R H¹_{F^*}(ℚ, T^*) = ord(κ)`; `H¹_{F^*}(ℚ, T^*)/(H¹_{F^*}(ℚ, T^*))_div ≅ ⊕_{i ≥ ord(κ)} R/m^{e_i(κ)}`; its length is `∂^{(ord κ)}(κ) − ∂^{(∞)}(κ)`; and `κ` is primitive iff `∂^{(∞)}(κ) = 0`. Hence: `length H¹_{F^*}(ℚ, T^*)` is finite iff `κ_1 ≠ 0`; `length H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ)`; when `κ_1 ≠ 0`, equality holds iff `κ` is primitive; and `length H¹_{F^*}(ℚ, T^*) = length(H¹_F(ℚ, T)/L(T))` for the module of `L`-values `L(T)`.

The precise hypotheses are the hypotheses of Layer 5.3 Kolyvagin systems in core rank one in each case; `χ(T) = 1`.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 5.2.12, p. 58). The structure theorem over a discrete valuation ring.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Corollary 5.2.13, p. 58). Sharpness under primitivity.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.5.9, p. 50). The artinian structure theorem.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Theorem 4.5.6, p.49 (authors’ 2003 copy)). The primitive-system hypothesis governs both branches of the leading-term length comparison.

`(b)`: if `κ_m` generates `m^jℋ′(m)`, then `∂^{(r)}(κ) = min{k, j + Σ_{i>r} d_i}` for `H¹_{F^*}(ℚ, T^*) ≅ ⊕R/m^{d_i}` (Proposition 4.5.8), because the minimum of `λ(n, T^*)` over `n` with `ν(n) = r` is `Σ_{i>r} d_i` by Layer 4.2 Selmer lengths across an edge and Layer 1.21 Simultaneous nonvanishing of localisations.

`(c)`: pass to the limit over `T/m^k` using Layer 5.3 Kolyvagin systems in core rank one`(b)` and `∂^{(s)}(κ) = lim ∂^{(s)}(κ^{(k)})`.

The final equality: `KS(T)` is generated by a primitive `κ, L(T) = Rκ_1`, and `H¹_F(ℚ, T)` is free of rank `corank H¹_{F^*} + 1`.

Three separate conclusions: `κ_1 ≠ 0` gives finiteness and an upper bound; in that finite case primitivity characterizes equality; an analytic formula needs in addition an identification of `κ_1` with an `L`-value.

**Checks.**

- `sharpness_nonzero_leading` (computation): In a rank-one DVR stalk with primitive leading value `π^s` and dual `length s`, multiplication of the system by `π` changes the leading index to `s+1` while the dual length stays `s`. This detects the strict inequality for a nonprimitive system with nonzero leading term.
- `sharpness_infinite_length` (negative control): If a nonzero system has zero leading term, its dual Selmer group has positive corank. Both `κ` and the nonprimitive system `πκ` have leading index `∞` and dual `length ∞`. Thus equality of extended lengths cannot imply primitivity here.
- `sharpness_zero_system` (degenerate): The zero system has index `∞` regardless of whether the dual Selmer module is zero or has positive corank. The nonzero-system hypothesis is needed for the corank conclusion. These same controls apply to Stark systems and their regulator images in Layers 6.6 and 6.8.

The higher `e_i` give every elementary divisor of the dual Selmer group, not only its exponent or length.

Do not apply the zero-leading-term lower bound to an arbitrary nonprimitive system: in the `R=ℤ/p²` stalk model with primitive leading term `p`, multiplying the system by `p` gives zero leading term while the corresponding dual length remains 1, less than `length(R)=2`. This is an algebraic test of the inference, not an asserted arithmetic realization.

*Needs:* Layer 5.3 Kolyvagin systems in core rank one; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 4.20 The Kolyvagin system bound; Layer 4.2 Selmer lengths across an edge; Layer 1.21 Simultaneous nonvanishing of localisations.

### 5.7 Stub Selmer modules in the self-dual setting

In the setting of Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M(c)` put `λ(n) = length M(n)` and the stub Selmer module `S(n) = m^{λ(n)}H¹_{F(n)}(K, T)`. Then for `nℓ ∈ N(𝓛): loc_ℓ(S(n)) = 0` implies `loc_ℓ(S(nℓ)) = 0`. Moreover, with `a, b, δ ≥ 0` the lengths in Howard's Lemma 1.5.8 for the diamond of `H_ℓ(n) ⊆ H(n), H(nℓ) ⊆ H^ℓ(n)`, one has `λ(nℓ) = λ(n) + k −` a `− b − δ`.

The precise hypotheses are `H`.0–`H`.5, `R` principal artinian of `length k, 𝓛 ⊆ 𝓛_k`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Definition 1.5.4, p. 1451). The self-dual stub module.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Proposition 1.5.9, proof, p. 1452). Vanishing of localisation propagates along an edge.

`H^ℓ(n)/(H(n) + H(nℓ)) ≅ (R/m^δ)²` (Lemma 1.5.7) and the local modules are free of rank two; compare lengths in the diamond as in Layer 4.2 Selmer lengths across an edge, using the structure `R^ε ⊕ M ⊕ M` at both vertices.

This is the self-dual replacement for Layer 4.2 Selmer lengths across an edge`(c)` and Lemma 4.2.1 of Mazur–Rubin.

*Needs:* Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 4.2 Selmer lengths across an edge.

### 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting

Let `K` be imaginary quadratic, `R` principal artinian of `length k` with residue characteristic `p`, and `(T, F, 𝓛)` a Selmer triple such that `(T, F)` and `(T*, F*)` satisfy `H`.0–`H`.5 of Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5, with `𝓛 ⊆ 𝓛_k(T)`. `(a)` Let `s ≥ 1` and `c₁`, …, `c_n ∈ H¹(K, T̄)` nonzero residual classes, where `T̄ = T/mT`, with `c_i` in the `ε_i`-eigenspace of complex conjugation `τ`. If `p > n`, a positive proportion of primes `ℓ ∈ 𝓛_s(T)` satisfy `loc_ℓ(c_i) ≠ 0` for every `i`. `(b)` Let `p > 3, H(n) = H¹_{F(n)}(K, T), ρ(n)^± = dim_{R/m} H(n)[m]^±` and `r(n) = max(ρ(n)⁺, ρ(n)⁻)`. If `n ∈ N(𝓛)` has `r(n) > 1` and `0 ≠ c ∈ H(n)`, and `𝓛` contains `𝓛_t(T)` for some `t ≥ max(k, s)`, a positive proportion of `ℓ ∈ 𝓛_t(T)` outside the prime factors of `n` satisfy `loc_ℓ(c) ≠ 0` and `r(nℓ) < r(n)`.

The precise hypotheses are `H`.0–`H`.5 for `(T, F)` and `(T*, F*)`; `𝓛 ⊆ 𝓛_k(T)`; `(a): p > n`; `(b): p > 3`; In `(a)` all classes have coefficients `T̄`. In `(b)` deep primes must belong to `𝓛`, not merely to the ambient set `𝓛_s(T)`.

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.2, Lemma 2.2.10 and its proof, pp. 15–16 (arXiv v1)). simultaneous nonvanishing of localisations of `n` eigenclasses for `p > n`, following Howard's Lemma 1.6.2

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.2, Corollary 2.2.11, pp. 16–17 (arXiv v1)). a prime that keeps a class nonzero and lowers `r(n)`, for `p > 3`

`(a)`: with `F` the field of `H`.2 and `L` the Galois closure of `K(T/m^s, μ_{p^s})` over `ℚ`, restriction `H¹(K, T̄) → Hom(G_L, T̄)^{Gal(L/K)}` is injective by `H`.2. Each `c_i` cuts out `E_i/L` with an `F_p`-vector space `G_i = Gal(E_i/L)` split into `τ`-eigenspaces; `c_i` is nonzero on `G_i^+` because otherwise `R·c_i(G_i)` would be a proper `G_K`-submodule contradicting `H`.1 and `H`.5`(a)`.

The bad sets `H_i = {η ∈ G_L^+ : c_i(η) = 0}` have Haar measure at most `1/p`, so for `p > n` their union is not everything; write a good `η` as `(τσ)²` and use Chebotarev for Frobenius `τσ` in `Gal(E₁⋯E_n/ℚ)`; such `ℓ` lie in `𝓛_s(T)` as in Mazur–Rubin, Lemma 3.5.6`(i)`. This is Howard's Lemma 1.6.2 argument with `n` classes.

`(b)`: if both `ρ(n)^± ≥ 1` identify residual modified Selmer groups with `H(n)[m]` by cartesianness and Howard Lemma 1.3.3, then apply `(a)` to nonzero residual eigenclasses from both signs and a nonzero socle multiple of `c` (three classes, so `p > 3`), and use Howard's parity Lemma 1.5.3 to get `ρ(nℓ)^± = ρ(n)^± − 1`; if `ρ(n)^∓ = 0` apply `(a)` to two residual classes. Choose primes in `𝓛_t ⊆ 𝓛` outside `n`, so `nℓ` remains an allowed conductor.

For `n = 1` and `p > 1, (a)` is the single-class Chebotarev selection in each eigenspace.

For `n = 4, (a)` requires `p > 4`, which is why the connectivity of core vertices in Layer 5.11 Rigidity of self-dual Kolyvagin systems at core vertices assumes `p > 4`.

In the odd-parity branch `ε=1`, iterating `(b)` from `n` with a nonzero class reaches a core vertex in at most `r(n)−1` steps: total residual dimension is odd, so `r=1` forces one sign to have dimension 1 and the other 0. In the even-parity branch this inference is unavailable. The residual pattern `(ρ(n)^+,ρ(n)^−)=(1,1)` has `r(n)=1` but total dimension 2, so it is not a core vertex. This is a negative control on the stopping criterion.

*Needs:* Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 1.2 Finite and singular parts at an unramified prime; `TauCetiRoadmap.Chebotarev Layer 10`.

### 5.9 Scaling, vanishing leading class and a non-primitive arithmetic system

`(a)` Scaling: for `κ` primitive with `κ_1 ≠ 0` over a discrete valuation ring `(χ(T) = 1), length H¹_{F^*}(ℚ, T^*) = ∂^{(0)}(κ)`; for `κ′ = πκ, ∂^{(0)}(κ′) = ∂^{(0)}(κ) + 1 > length H¹_{F^*}(ℚ, T^*)`, the `e_i` are unchanged and `κ′` is not primitive: the bound for `κ′` is true and not sharp. `(b) A` nonzero Kolyvagin system with `κ_1 = 0` is a valid element of `KS(T)`; for it `∂^{(0)} = ∞`, the bound is vacuous, and by the structure theorem `H¹_{F^*}(ℚ, T^*)` is infinite when `χ(T) = 1`. For `κ=0` the bound remains vacuous and gives no finiteness conclusion. `(c)` Kato's Kolyvagin system for `T_pE`: if `L(E, 1) ≠ 0, p` satisfies the hypotheses of Mazur–Rubin 2004 Theorem 6.2.4(ii) and `p` divides a Tamagawa factor `c_ℓ` for some `ℓ ≠ p`, then `κ^{Kato}` is not primitive: it is a Kolyvagin system for the finer structure `F_u` with unramified conditions away from `p`, whose dual Selmer group is larger by the Tamagawa defect. The defect is recorded as a length.

The precise hypotheses are `χ(T) = 1`; for `(c)` the hypotheses of Theorem 6.2.4(ii) of the source.

([Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Proposition 6.2.6, p. 75). A naturally occurring non-primitive system.

`(a), (b)`: Layer 5.1 Divisibility indices, elementary divisors and primitivity and Layer 5.6 Structure of the dual Selmer group from a Kolyvagin system. `(c)`: Remark A.5 — the classes lie in `H¹_{(F_u)(n)}`; apply the bound for `F_u` and compare `H¹_{F_u^*}` with `H¹_{F_can^*}`.

A nonzero point or class is not automatically primitive.

Sharpness is a property of the system, checked through reduction modulo `m`, not of the representation.

*Needs:* Layer 5.6 Structure of the dual Selmer group from a Kolyvagin system; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 3.17 The map from Euler systems to Kolyvagin systems.

### 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring

Let `R` be a discrete valuation ring with fraction field `Φ, D = Φ/R, (T, F, 𝓛)` a Selmer triple satisfying `H`.0–`H`.5 with `𝓛_s(T) ⊆ 𝓛` for `s` large, and `A = T ⊗ D` with the propagated structure. If there is a Kolyvagin system `κ ∈ KS(T, F, 𝓛)` with `κ_1 ≠ 0`, then `H¹_F(K, T)` is free of rank one over `R` and there is a finite `R`-module `M` with `H¹_F(K, A) ≅ D ⊕ M ⊕ M` and `length_R(M) ≤ length_R(H¹_F(K, T)/R·κ_1)`. The conclusion is about the discrete module `A`: its corank is one and its cotorsion quotient is `M ⊕ M`, so its length is twice that of `M`, bounded by twice the index of `κ_1`. This is the single owner of the self-dual descent used for Heegner points and for generalised Heegner cycles; the `Λ`-adic version (Howard, Theorem 2.2.10) belongs to layer Layer 8.

The precise hypotheses are `H`.0–`H`.5; `𝓛_s(T) ⊆ 𝓛` for `s ≫ 0`; `κ_1 ≠ 0`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf), Theorem 1.6.1, p. 1453). The theorem.

Reduce modulo `m^k: κ^{(k)} ∈ KS(T^{(k)}, F, 𝓛^{(k)})` and `H¹_{F(n)}(K, T^{(k)}) ≅ (R^{(k)})^ε ⊕ M^{(k)}(n) ⊕ M^{(k)}(n)` (Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`).

Lemma 1.6.4: `κ_n ∈ S^{(k)}(n) ⊗ G_n` for `n ∈ N^{(2k−1)}`, by induction using Layer 5.7 Stub Selmer modules in the self-dual setting and a Chebotarev choice of `ℓ` at which a class in each `τ`-eigenspace localises nontrivially (Lemma 1.6.2, from `H`.1, `H`.2, `H`.5).

Hence `κ_1 ∈ m^{λ^{(k)}(1)}H¹_F(K, T^{(k)})`; as `κ_1 ≠ 0, ε = 1` and `λ^{(k)}(1)` is bounded by the index of `κ_1`; pass to the limit over `k`.

For `T = T_pE` and the Heegner point Kolyvagin system: Kolyvagin's theorem, rank one and `#Ш[p^∞]` dividing the square of the index (Howard, Theorem 1.6.5).

Distinct from the Mazur–Rubin equality under primitivity: here the bound is an inequality for `M` with `H¹_F(K, A)_{/div} = M ⊕ M`, and the factor two comes from self-duality, not from a general principle.

*Needs:* Layer 5.7 Stub Selmer modules in the self-dual setting; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; `TauCetiRoadmap.Chebotarev Layer 10`.

### 5.11 Rigidity of self-dual Kolyvagin systems at core vertices

Let `R` be principal artinian of `length k` with `p > 4, (T, F, 𝓛)` as in Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting with `ε = 1` in the Cassels decomposition of Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M` (odd rank), and `𝓛 ⊇ 𝓛_s(T)` for some `s ≥ 1`. A core vertex is `n ∈ N` with `ρ(n) = 1`, equivalently `H¹_{F(n)}(K, T) ≅ R`. `(a)` For a core vertex `n` and `nℓ ∈ N` the following are equivalent: `nℓ` is a core vertex; `loc_ℓ` is injective on `H(n)`; `loc_ℓ` is injective on `H(nℓ)`; `loc_ℓ H̄(n) ≠ 0`; `loc_ℓ H̄(nℓ) ≠ 0`, where `H̄` denotes the modified Selmer group with coefficients `T̄`, identified with `H(−)[m]`; and then `(loc̄^s_ℓ)⁻¹ ∘ φ̄^fs_ℓ ∘ loc̄_ℓ : H̄(n) ≃ H̄(nℓ)` is a residual isomorphism, with `φ^fs_ℓ` the inert comparison `SelfDual.finiteSingular` of Layer 5.2. `(b)` The graph of core vertices, with edges `n` — `nℓ`, is connected. `(c)` For every `κ ∈ KS(T, F, 𝓛)` there is `0 ≤ d ≤ k` with `κ_nR = m^d H(n)` at every core vertex `n`, and `d = k` iff `κ = 0`.

The precise hypotheses are `R` principal artinian, `p > 4, H`.0–`H`.5 for `(T, F)` and `(T*, F*)`, odd rank, `𝓛 ⊇ 𝓛_s(T)`.

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.2, Proposition 2.2.8 and Corollary 2.2.9, pp. 14–15 (arXiv v1)). equivalent criteria for neighbouring core vertices, the residual isomorphism (2.2.h), and equality of cyclic component lengths

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.2, Theorem 2.2.12, Corollary 2.2.13 and Proposition 2.2.14, pp. 17–18 (arXiv v1)). connectivity of the core-vertex graph for `p > 4`, the common index `d` at core vertices, and `d = k` iff `κ = 0`

For `(a)`, cartesianness and Howard Lemma 1.3.3 identify the residual strict Selmer group with the socle of the full strict group. A finite module over a local artinian ring is zero iff its socle is zero. Thus nonzero localization of the one-dimensional residual `H̄(n)` is equivalent to injectivity on the cyclic full `H(n)`; nonzero localization of `H(n)` alone is insufficient. The parity formula then characterizes `nℓ` as a core vertex. The residual localizations identify the one-dimensional Selmer socles with the appropriate conjugation eigenspaces in the two-dimensional local modules, giving the residual comparison.

`(b)`: induct on `ν(lcm(n, m)) − ν(gcd(n, m))`; if `nℓ` is not a core vertex, Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting`(a)` with four classes `(p > 4)` gives `r` with `nrℓ, nr` and `mr` core vertices, joining `n` to `m` by paths.

`(c)`: for adjacent core vertices, put `a=length_R(Rκ_n)−1` when `κ_n≠0`. The nonzero socle class `π^aκ_n` has nonzero finite–singular image by `(a)`. The edge relation and injectivity of singular localization give `π^aκ_{nℓ}≠0` and `π^{a+1}κ_{nℓ}=0`. Thus the two cyclic components have equal lengths; the reverse direction handles a zero lower component. Connectivity gives the common `d`; if `d = k` then every `κ_n` vanishes, by induction on `r(n)` using Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting`(b)` and the Kolyvagin relation.

For `R = R/m (k = 1), (c)` says `κ_n ≠ 0` at one core vertex iff at all core vertices.

`(c)` is the self-dual analogue of Mazur–Rubin's rigidity at core vertices (Layer 4.12 Core vertices and leading vertices, Layer 5.3 Kolyvagin systems in core rank one); it does not assume core rank one over `ℚ`.

Without `p > 4` the connectivity argument in `(b)` has no prime satisfying the four localisation conditions; the theorem is not claimed for `p = 3`.

**Checks.**

- For `k=1`, a nonzero component at one core vertex is nonzero at every core vertex.
- Over `R=ℤ/p²`, multiplication by `p` is nonzero but not injective and vanishes on the socle `pR`, distinguishing full-group and residual nonvanishing.
- For odd `p` and `R=ℤ/p²`, the primitive lines `R(1,p)` and `R(1,−p)` in `R²` have the same residual line and are mutual annihilators for `B((a,b),(c,d))=ad+bc`, but are distinct: their first coordinates force the scalar to be 1 and `2p≠0`. Residual image agreement alone therefore gives no integral image equality.

*Needs:* Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 5.7 Stub Selmer modules in the self-dual setting; Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`.

### 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems

Let `R` be a discrete valuation ring with `p > 4` and `(T, F, 𝓛)` a Selmer triple over an imaginary quadratic `K` with `(T, F)` and `(T*, F*)` satisfying `H`.0–`H`.5 (Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5) and `𝓛 ⊇ 𝓛_s(T)` for some `s ≥ 1`. For `κ ∈ KS(T, F, 𝓛)` and `k ≥ 1` let `κ^{(k)}` be its reduction in `KS(T^{(k)}, F, 𝓛^{(k)}), H^{(k)}(n) = H¹_{F(n)}(K, T^{(k)})`, and `ρ(n)` the residual Selmer rank of Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting. Define: `(i)` for `n ∈ N, M(n) = ind(κ_n) = max{j : κ_n ∈ m^j H¹(K, T/I_nT)}` (`∞` if `κ_n = 0`), in the residual-surjective anticyclotomic elliptic setting, `M_r = min{M(n) : ν(n) = r}` and `M_∞(κ) = lim_{r→∞} M_r`, which exists because `M_r ≥ M_{r+1}`; (ii) use the truncated index `ind_k(x) = max{0 ≤ a ≤ k : x ∈ m^a H^{(k)}(n)}`, so `ind_k(0) = k`, and set `δ_k = min_{n∈N^{(k)}} ind_k(κ_n^{(k)}), ∂^{(∞)}(κ) = sup_k δ_k`; (iii) `d_k = ind_k(κ_n^{(k)})` at any core vertex `n ∈ N^{(k)}` and `d(κ) = lim_k d_k`. The indices satisfy `d_k = min(d(κ), k)`, so their stable value, rather than each finite-level index, is independent of `k`. `κ` is primitive if `∂^{(∞)}(κ) = 0`, equivalently if its reduction in `KS(T/mT, F, 𝓛)` is nonzero. Properties: `d(κ) ≥ ∂^{(∞)}(κ)`; `d(κ) = 0` if and only if `κ` is primitive; `d(κ) = ∞` if and only if `κ = 0`; assuming odd rank in the general self-dual setting, `κ_n^{(k)}R^{(k)} = m^{d(κ)+length(M^{(k)}(n))}H^{(k)}(n)` for `n ∈ N^{(2k−1)}`. In the anticyclotomic elliptic setting with residual surjectivity, `d(κ) = M_∞(κ)` whenever `κ₁ ≠ 0`. Moreover, in the anticyclotomic elliptic setting of Layer 1.14 Anticyclotomic twists of a Tate module and their error constants with residual surjectivity and `p ≥ 3`, the stable index can be computed on any `𝓛_e = {ℓ : a_ℓ ≡ ℓ + 1 ≡ 0 mod p^e} ⊆ 𝓛` with `e ≫ 0: M_{∞,N(𝓛_e)}(κ) = M_{∞,N(𝓛)}(κ)`. This extends Layer 5.1 Divisibility indices, elementary divisors and primitivity from Mazur–Rubin's systems over `ℚ` to Howard's self-dual systems over `K`.

The precise hypotheses are `R` a discrete valuation ring, `p > 4`; `H`.0–`H`.5 for `(T, F)` and `(T*, F*)`; `𝓛 ⊇ 𝓛_s(T)`; for the computation on `𝓛_e`: the elliptic anticyclotomic setting with residual surjectivity and `p ≥ 3`; For the stub formula and `d_k` core construction: odd `rank ε = 1`, as in Zanarella Lemma 2.3.1. Nonzero `κ₁` implies this in the structure theorem. `M_r` and `M_∞` monotonicity are asserted only in the `BCGS` elliptic setting.

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.3, Lemma 2.3.1, Definition 2.3.2 and Propositions 2.3.3–2.3.4, pp. 18–20 (arXiv v1)). the invariants `d(κ)` and `∂^{(∞)}(κ)`, primitivity, and the criteria `d = 0` iff primitive and `d = ∞` iff `κ = 0`

([Ashay Burungale, Francesc Castella, Giada Grossi, Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/abs/2312.09301v2), §2.2.1, definitions of `M(n), M_{r,N′}` and `M_∞`, pp. 16–17; Lemma 2.2.4, p. 18 (arXiv v2)). the divisibility profile `M(n), M_r, M_∞` and the formula for `κ_n^{(k)}` on `N^{(2k−1)}`

([Ashay Burungale, Francesc Castella, Giada Grossi, Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/abs/2312.09301v2), §2.2.2, Proposition 2.2.1, p. 17, and its proof, pp. 17–18 (arXiv v2)). independence of the stable index from the choice of the subset `𝓛_e` of Kolyvagin primes

Compatibility of truncated core indices: by Layer 5.11 Rigidity of self-dual Kolyvagin systems at core vertices there are `d_k` with `κ_n^{(k)}R^{(k)} ≅ m^{d_k}R^{(k)}` at every core vertex `n ∈ N^{(k)}`; `d_k ≤ d_{k+1}`, with equality when `d_k < k`; `d(κ) = lim d_k`.

The formula on `N^{(2k−1)}` is proved by induction on `k + max(ρ(n)⁺, ρ(n)⁻)` using Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting`(b)`, the Kolyvagin relation, Layer 5.7 Stub Selmer modules in the self-dual setting and the stub refinement `loc_ℓ(m^d S(n)) = 0 ⇔ loc_ℓ(m^d S(nℓ)) = 0`.

`d(κ) = 0 ⇔` primitive: if `κ^{(1)} ≠ 0` some `κ_n^{(1)} ≠ 0` and the formula with `k = 1` forces `d = 0`. `d(κ) = ∞ ⇔ κ = 0` by the vanishing criterion of Layer 5.11 Rigidity of self-dual Kolyvagin systems at core vertices. The identification with `M_∞` uses the core-vertex computation of the refined structure theorem (`BCGS`, proof of Theorem 2.2.2).

Computation on `𝓛_e`: if the minimum `M_r` is attained at `n` with a prime `ℓ₀ | n` outside `𝓛_e`, take the residual eigencomponent `κ̄^s` of `κ_n^{(δ+1)}` and a nonzero class `c` of the opposite eigenspace with no condition at `ℓ₀` (global duality, as in Layer 1.16 Residual detection of two classes and classes with prescribed ramification`(b)`); Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms`(c)`, with zero loss under residual surjectivity, gives `ℓ ∈ 𝓛_e` with `loc_ℓ κ̄^s ≠ 0` and `loc_ℓ c ≠ 0`. The Kolyvagin relations and the sum of local pairings of `c` with `κ̄_ℓ` over `ℓ` and `ℓ₀` show `M(nℓ/ℓ₀) = M(n)`; repeat.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystems.SelfDual.index`: `M(n) = ind(κ_n)`, with value `∞` when `κ_n = 0`.
- `TauCeti.KolyvaginSystems.SelfDual.minIndex`: In the residual-surjective anticyclotomic elliptic setting, `M_r = min{M(n) : ν(n) = r}`, antitone in `r`.
- `TauCeti.KolyvaginSystems.SelfDual.stableIndex`: In that elliptic setting, `M_∞(κ) = lim_r M_r(κ)`.
- `TauCeti.KolyvaginSystems.SelfDual.coreDivisibility`: `d(κ) = lim_k d_k`, with `d_k = min(d(κ), k)`, where `d_k` is the common truncated index at finite-level core vertices.
- `TauCeti.KolyvaginSystems.SelfDual.IsPrimitive`: `κ` is primitive iff its reduction mod `m` is a nonzero Kolyvagin system iff `d(κ) = 0`.
- `TauCeti.KolyvaginSystems.SelfDual.coreDivisibility_eq_top_iff`: `d(κ) = ∞` iff `κ = 0`.
- `TauCeti.KolyvaginSystems.SelfDual.coreDivisibility_smul`: `d(πκ) = d(κ) + 1`.
- `TauCeti.KolyvaginSystems.SelfDual.stableIndex_eq_coreDivisibility`: In the anticyclotomic elliptic setting with residual surjectivity, if `κ₁ ≠ 0` then `M_∞(κ) = d(κ)`.
- `TauCeti.KolyvaginSystems.SelfDual.isPrimitive_iff_divisibilityInvariants`: For systems that are Mazur–Rubin systems in core rank one, primitivity agrees with Layer 5.1 Divisibility indices, elementary divisors and primitivity.

**Checks.**

- `coreDivisibility_zero`: For `κ = 0, d(κ) = M_∞(κ) = ∞`.
- `coreDivisibility_scaled`: If `κ` is primitive then `d(π^aκ) = a` and `π^aκ` is primitive only for `a = 0`.
- `primitive_not_nonzero_bottom`: Start with a primitive `κ` whose bottom class is nonzero. Since the DVR lattice Selmer module is torsion-free, `π·κ` still has nonzero bottom class, but `d(π·κ)=1` and it is not primitive. This detects replacing primitivity by nonvanishing; it does not assert that every primitive system has nonzero bottom class.
- `primitive_residual`: `κ` is primitive iff some `κ_n` has nonzero image in `H¹(K, T/mT) ⊗ G_n`.
- `coreDivisibility_truncation`: For `κ` primitive, the core indices of `π²κ` are `d₁ = 1, d₂ = 2` and `dₖ = 2` for `k ≥ 3`; the stable index is 2. Zero reductions at small levels have index `k`, not `∞`.

Scaling: `d(πκ) = d(κ) + 1` and `πκ` is not primitive.

`κ = 0` has `d = ∞, M_∞ = ∞` and `∂^{(∞)} = ∞`.

For the Heegner Kolyvagin system of `E/K` of analytic rank one, `d(κ) = ∂^{(∞)}(κ)` follows from Layer 5.13 Exact length of the Tate–Shafarevich module from a self-dual Kolyvagin system and Kolyvagin's Theorem D (Zanarella, Remark 2.3.5).

*Needs:* Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 5.7 Stub Selmer modules in the self-dual setting; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting; Layer 5.11 Rigidity of self-dual Kolyvagin systems at core vertices; Layer 1.16 Residual detection of two classes and classes with prescribed ramification; Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 1.14 Anticyclotomic twists of a Tate module and their error constants.

### 5.13 Exact length of the Tate–Shafarevich module from a self-dual Kolyvagin system

Let `R` be a discrete valuation ring with fraction field `Φ, D = Φ/R, (T, F, 𝓛)` a Selmer triple over an imaginary quadratic `K` with `(T, F)` and `(T*, F*)` satisfying `H`.0–`H`.5, `p > 4` and `𝓛 ⊇ 𝓛_s(T)` for some `s ≥ 1`. If `κ ∈ KS(T, F, 𝓛)` has `κ₁ ≠ 0`, then `H¹_F(K, T)` is free of rank one, `H¹_F(K, A) ≅ D ⊕ M ⊕ M` for a finite `R`-module `M`, and `length_R(M) = length_R(H¹_F(K, T)/R·κ₁) − d(κ)`, with `d(κ)` of Layer 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems. In particular `length_R(M) ≤ length_R(H¹_F(K, T)/R·κ₁)`, with equality iff `κ` is primitive. In the elliptic setting of Burungale–Castella–Grossi–Skinner (anticyclotomic twists `T_pE ⊗ R(α)` with `α ≡` 1 mod `m^m, p > 3` and residual surjectivity), where `d(κ) = M_∞(κ)`, this reads `length_R Ш(W_{α^{-1}}/K) = 2(M₀(κ) − M_∞(κ))` with `M₀(κ) = ind(κ₁)` and `M_∞(κ)` the stable index.

The precise hypotheses are `R` a DVR, `p > 4` (`p > 3` in the elliptic setting with residual surjectivity), `H`.0–`H`.5 for `(T, F)` and `(T*, F*), 𝓛 ⊇ 𝓛_s(T)`; `κ₁ ≠ 0`.

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.3, Theorem 2.3.6 and its proof, p. 20 (arXiv v1)). the exact formula `length(M) = length(H¹_F(K,T)/Rκ₁) − d(κ)`, with equality iff `κ` is primitive

([Ashay Burungale, Francesc Castella, Giada Grossi, Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/abs/2312.09301v2), §2.2.2, Theorem 2.2.2, p. 17, with Lemma 2.2.4 and the proof, pp. 18–20 (arXiv v2)). length of the Tate–Shafarevich module equals 2`(M₀(κ) − M_∞(κ))` in the anticyclotomic elliptic setting with residual surjectivity

Freeness of `H¹_F(K, T)` and the decomposition `H¹_F(K, A) ≅ D ⊕ M ⊕ M` are Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring.

For `k` large `H^{(k)}(1) ≅ R/m^k ⊕ M ⊕ M` with `λ = length(M) = λ^{(k)}(1)`; the formula of Layer 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems at `n = 1` gives `κ₁^{(k)}R^{(k)} = m^{d(κ)+λ}H^{(k)}(1)`, and for `k > d(κ) + λ` the injectivity of `H(1)/m^k → H^{(k)}(1)` gives `κ₁R = m^{λ+d(κ)}H(1), i`.`e`. `λ = ind(κ₁) − d(κ)`.

The equality case follows from `d(κ) = 0` iff `κ` is primitive. In `BCGS`'s form, the induction of Castella–Grossi–Skinner's Theorem 6.1.1 with zero error (residual surjectivity) reaches a core vertex `n_ρ` with `ind(κ_{n_ρ}) = M_∞(κ)`, and Lemma 2.2.4 gives `ind(κ₁) = M_∞ + length(M)`, so `length(M ⊕ M) = 2(M₀ − M_∞)`.

Primitive `κ: length(M)` equals the index of `κ₁`, so the Kolyvagin bound of Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring is sharp.

`κ′ = π^aκ` for primitive `κ`: index of `κ′₁` grows by `a` and `d` grows by `a`, so `length(M)` is unchanged, as it must be.

For `E/ℚ` of analytic rank one over `K` and the Heegner system, combined with Gross–Zagier this gives the exact `p`-part of `#Ш(E/K)` up to the defect `2M_∞`, which vanishes exactly when the system is primitive.

*Needs:* Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring; Layer 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems; Layer 5.11 Rigidity of self-dual Kolyvagin systems at core vertices; Layer 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1.

### Examples

The zero system has infinite order.

In a length-`k` artinian ring, the zero system has partial invariant `k` at every nonempty conductor-size level.

Over a DVR with torsion-free size-zero stalks, initial index 3 becomes 5 after multiplication by `π²`.

### Dependencies

This layer uses Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 4.16 The sheaf of stub Selmer modules; `Module.length`; Layer 1.5 The transverse local condition; Layer 1.8 The finite–singular comparison map; Layer 0.4 Cartesian local conditions; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; the ClassFieldTheory ring-class correspondence and residue-unit exact sequence; Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections; Layer 4.12 Core vertices and leading vertices; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 4.1 The Selmer graph and the Selmer sheaf; Layer 1.9 The Selmer structures `F_a^b(c)`; `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology §2.10 (Pontryagin duals with the contragredient action)`; Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 0.6 Selmer modules of quotients and torsion submodules; Layer 5.3 Kolyvagin systems in core rank one; Layer 4.20 The Kolyvagin system bound; Layer 4.2 Selmer lengths across an edge; Layer 1.21 Simultaneous nonvanishing of localisations; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 1.2 Finite and singular parts at an unramified prime; `TauCetiRoadmap.Chebotarev Layer 10`; Layer 5.6 Structure of the dual Selmer group from a Kolyvagin system; Layer 3.17 The map from Euler systems to Kolyvagin systems; Layer 5.7 Stub Selmer modules in the self-dual setting; Layer 5.8 Simultaneous localisation of eigenclasses in Howard's self-dual setting; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; Layer 5.11 Rigidity of self-dual Kolyvagin systems at core vertices; Layer 1.16 Residual detection of two classes and classes with prescribed ramification; Layer 1.22 Chebotarev selection of Kolyvagin primes with error terms; Layer 1.14 Anticyclotomic twists of a Tate module and their error constants; Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring; Layer 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems; Layer 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1.

The proof also uses Mazur–Rubin 2004 Lemmas 4.5.13–4.5.14, Proposition 4.5.15, Lemmas 5.2.7–5.2.8; Howard Lemmas 1.5.6–1.5.8 and 1.6.2–1.6.4.

The proof also uses Zanarella Lemma 2.2.2, Corollary 2.2.4 and Proposition 2.2.5 (stub lengths across an edge) as separate statements.

## Layer 6: Stark systems and exterior biduals

### 6.1 Exterior biduals of Selmer modules

For a Selmer structure `F` on a finite free `G_K`-representation `A` over a commutative coefficient ring `R`, define the exterior bidual on `H¹_F(K,A): B^r_F(A) = Hom_R(⋀^r Hom_R(H¹_F(K,A),R),R)`. The Selmer specialization of its canonical evaluation map is `ξ_F : ⋀^r H¹_F(K,A) → B^r_F(A)`. For a finite free Selmer module `ξ_F` is an isomorphism. Evaluation against a wedge of Selmer functionals is the determinant of their values. Use the shared bidual, evaluation and naturality of IntegralIwasawaTheory §12.6. This subsection adds the finite-projective comparison, general semisimple-order rationalization and Selmer specializations, using Mathlib exterior powers and duals.

The precise hypotheses are `R` commutative; `A` a continuous finite free `G_K`-representation; `F` a Selmer structure.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Definition 2.1, p. 7). The definition, the map `ξ` and the contraction maps.

([Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3), §1.2, p. 8). The lattice form over `ℤ[G]`, in Rubin's original normalisation.

For any `R`-module `X`, use the supplied `exteriorBidual R r X = Hom_R(⋀^r Hom_R(X,R),R)` and `toExteriorBidual`, the transpose of Mathlib's `exteriorPower.pairingDual`; specialize to the actual Selmer kernel `H¹_F(K,A)`.

The supplied functoriality dualizes twice. Prove that evaluation is an isomorphism for finite projective `X`. For the rational lattice comparison let `O` be a Dedekind domain with fraction field `Q`, `R` a commutative finite torsion-free `O`-algebra with `Q⊗_O R` semisimple, and `X` a finite `R`-module torsion-free over `O`. Prove that biduals commute with rationalization; the rational module is finite projective over the semisimple algebra, so evaluation identifies the bidual with the rational exterior elements whose determinants against all integral `R`-functionals lie in `R`. Finite presentation over the noetherian order gives the required localization of duals. The finite abelian group-ring comparison is supplied by IntegralIwasawaTheory §12.6; this general-order extension belongs here. BSS II Definition 2.1 and the following finite-projective observation, pp.7–8, give evaluation; §4.3, pp.21–22, fixes the semisimple order setting. Proposition 2.2 concerns injections and Fitting ideals.

The definition exposes the following operations and relations.

- `TauCeti.StarkSystems.exteriorBidual` (supplied): For a commutative ring `R` and `R`-module `X, ⋂^r_R X=Hom_R(⋀^r Hom_R(X,R),R)`.
- `TauCeti.StarkSystems.toExteriorBidual` (supplied): Determinant evaluation from `⋀^r_R X`, natural in `X`.
- `TauCeti.StarkSystems.toExteriorBidual_bijective_of_projective`: This map is an isomorphism for finite projective `X`.
- `TauCeti.StarkSystems.exteriorBidual_integral`: For the stated semisimple generic fibre, order and finite `O`-torsion-free `X`, rationalization of the bidual is determinant evaluation on the rational exterior power; its integral submodule is exactly the determinant-integral lattice.
- `TauCeti.StarkSystems.selmerBidual`: `B^r_F(A)` is the exterior bidual of `H¹_F(K,A)`.
- `TauCeti.StarkSystems.selmerToBidual`: `ξ_F : ⋀^r H¹_F(K,A) →ₗ[R] B^r_F(A)`, the determinant evaluation map.
- `TauCeti.StarkSystems.selmerToBidual_det`: `ξ_F(c₁∧⋯∧c_r)(φ₁∧⋯∧φ_r)=det(φ_i(c_j))`.
- `TauCeti.StarkSystems.selmerToBidual_bijective`: If `H¹_F(K,A)` is finite free, `ξ_F` is bijective.

**Checks.**

- `TauCeti.StarkSystems.selmerBidual_free_three`: Given `H¹_F(K,T)≃R³`, its degree-two bidual has rank 3.
- `TauCeti.StarkSystems.selmerBidual_zero_degree`: The degree-zero Selmer bidual is `R`.
- `nonsemisimple_generic_fibre`: For `R=O[ε]/(ε²)`, `X=(R/(ε))²` and `r=2`, all functional values lie in `Oε`, so determinant evaluation is zero. The determinant-integrality subset of the rational exterior line is all of `Q`, whereas the abstract bidual is `Hom_R(O,R)=Oε≃O`. Thus a Gorenstein order alone does not provide this identification.
- `TauCeti.StarkSystems.selmerBidual_torsion`: For `R=ℤ_p` and `a=p`, a Selmer module `R⊕R/(p)` has degree-one evaluation killing the nonzero torsion summand. Over self-injective `R` this conclusion need not hold.

`⋂^r_R R^n ≅ ⋀^r_R R^n`, free of `rank` (`n` choose `r`).

For `R = ℤ[G], G` finite, and `X = ℤ^r` with trivial action `(r ≥ 1): ⋂^r_R X = |G|^{-(r−1)}·⋀^r_ℤ X` inside `ℚ ⊗ ⋀^r X`; for `r ≥ 2` and `G ≠ 1` the exterior power is a proper sublattice of index `|G|^{r−1}`.

*Needs:* `IntegralIwasawaTheory §12.6`; `PadicMeasuresIwasawaAlgebras Layer 6`; `SelmerIwasawaCohomology Layer 2`.

### 6.2 The Burns–Sakamoto–Sano hypotheses

Let `(R, 𝔭)` be a commutative noetherian self-injective local ring with finite residue field `k` of characteristic `p, A` a free `R`-module of finite rank with continuous `G_K`-action, `M = min{p^n : p^nR = 0}, K_M = K(μ_M, (O_K^×)^{1/M})K(1)` and `K(A)_M = K(A)K_M`. Hypothesis 3.2: `(i) A ⊗ k` is an irreducible `k[G_K]`-module; (ii) there is `τ ∈ G_{K_M}` with `A/(τ − 1)A ≅ R`; (iii) `H¹(K(A)_M/K, A) = H¹(K(A)_M/K, A^*(1)) = 0`. Hypothesis 3.3: `(A ⊗ k)^{G_K} = ((A ⊗ k)^*(1))^{G_K} = 0`. The prime set `P` is the set of `q ∉ S` with `Fr_q` conjugate to `τ` in `Gal(K(A)_M/K)`. Hypothesis 4.2: there is `n ∈ N` with `H¹_{(F^*)_n}(K, A^*(1)) = 0` and `H¹_{F^n}(K, A)` free of `rank r + ν(n)`. For a local Gorenstein `O`-order `R` and `T` free over `R` with `T̄ = T/𝔭T`, Hypothesis 4.7: `(i) T̄` is an irreducible `(R/𝔭)[G_K]`-module; (ii) there is `τ ∈ G_{K_{p^∞}}, K_{p^∞} = ⋃_m K_{p^m}`, with `T/(τ − 1)T ≅ R` (the element fixes `K_{p^∞}`; it need not fix the field cutting out `T`); (iii) `H¹(K(T)_{p^∞}/K, T̄) = H¹(K(T)_{p^∞}/K, T̄^∨(1)) = 0`. Hypothesis 4.7 implies 3.2 and 3.3 for every `T/p^mT`. These are properties of `(T, F)`, proved in each application; they do not follow from `R` being Gorenstein. The structure theorems for Kolyvagin systems additionally require `p > 3`.

The precise hypotheses are `R` commutative noetherian self-injective local with finite residue field, as in 0.2, or a local Gorenstein order. This retains the noetherian convention of BSS II §2, p.7.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Hypothesis 3.2, p. 13). The finite-level hypotheses.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Hypothesis 4.2, p. 20). Existence of a relaxed core vertex.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Hypothesis 4.7, p. 22). The hypotheses over a Gorenstein order.

Each item is a separate field. Hypothesis 4.2 replaces the cartesian condition and the core rank: it asserts the existence of a relaxed core vertex of the expected free rank.

Remark 4.3: under 4.2, `H¹_{F^m}(K, A)` is free of `rank r + ν(m)` at every `m` with `H¹_{(F^*)_m} = 0`. Remark 4.9: 4.7 `⇒` 3.2, 3.3 modulo `p^m`.

For `R` principal artinian, Hypotheses 3.2 and 3.3 follow from Mazur–Rubin's `(H.1)`–`(H.3)`, and 4.2 from `(H.5)`–`(H.6)` by Corollary 3.5(ii) of Mazur–Rubin 2016.

For the corrected MR16 record, `K(A)_M⊆E=L·H_M(A)`; thus residual inflation into `H¹(E/K,−)` is injective. Filter `A` and `A^*(1)` by powers of the maximal ideal. Each nonzero graded piece is a copy of the corresponding residual module, so `(H.3)` and the long exact cohomology sequences give `H¹(E/K,A)=H¹(E/K,A^*(1))=0`. Inflation then gives 3.2(iii) over `K(A)_M`. The same `τ` fixes `K_M⊆H_M` and has the required coinvariants, while `(H.1)` supplies 3.3 directly. For a DVR quotient perform this argument over `E_k` from 1.13, not over an unrelated auxiliary field. If `L` is not contained in `K(A)_M`, the full BSS Frobenius set need not lie in the given MR prime set. Compare systems on the common refinement `P(E,τ)`, using the prime-selection proof of 1.13 for the core-vertex and transition arguments; do not assert containment for that larger BSS prime set.

The definition exposes the following operations and relations.

- `TauCeti.StarkSystems.BSSHypothesis32`: Fields irreducible, `tau`, h1Vanishing.
- `TauCeti.StarkSystems.BSSHypothesis33`: Vanishing of the residual invariants of `A` and `A^*(1)`.
- `TauCeti.StarkSystems.BSSHypothesis42`: `A` vertex `n` with vanishing strict dual Selmer module and `H¹_{F^n}` free of `rank r + ν(n)`.
- `TauCeti.StarkSystems.BSSHypothesis47`: The three conditions for a Gorenstein order.
- `TauCeti.StarkSystems.BSSHypothesis47.toFiniteLevel`: Hypothesis 4.7 for `T` gives 3.2 and 3.3 for `T/p^mT` for every `m ≥ 1`.
- `TauCeti.StarkSystems.BSSHypothesis42.free_of_core`: Under 4.2, `H¹_{F^m}(K, A)` is free of `rank r + ν(m)` whenever `H¹_{(F^*)_m}(K, A^*(1)) = 0`.

**Checks.**

- `TauCeti.StarkSystems.not_bss33_trivial`: The trivial rank-one representation has nonzero residual invariants and fails Hypothesis 3.3.
- `TauCeti.StarkSystems.bss32_rank_one`: At the level of Hypothesis 3.2`(i)`–(ii), a rank-one module has irreducible reduction and `τ=1` gives coinvariants `R`. The arithmetic family of Theorem 7.1 below supplies the additional `H¹`-vanishing field; these two elementary tests alone do not supply it.
- `TauCeti.StarkSystems.bss32_bad_coinvariants`: Over a field of odd characteristic, a scalar `τ=2` on a rank-one module has zero coinvariants, not `R`; the zero module and a trivial rank-two module also fail 3.2. These detect accepting an arbitrary `τ` or dropping irreducibility.
- `TauCeti.StarkSystems.bss33_cyclotomic`: For `p` odd, `A=k(1)` over `ℚ` has no invariants but its Tate dual is trivial and has invariants `k`, so 3.3 fails. For `A=k(χ)` with `χ` and `χ⁻¹ω` both nontrivial, both invariant spaces are zero and 3.3 holds.
- `TauCeti.StarkSystems.bss33_zero`: `A=0` satisfies 3.3 but fails 3.2; the predicates must remain separate.
- `TauCeti.StarkSystems.bss42_rank_zero`: For the zero representation with `r=0, n=1` has both Selmer groups zero and witnesses 4.2; the same representation with `r=1` does not satisfy the required free-rank equality at any `n`.
- `TauCeti.StarkSystems.bss42_freeness`: For `R=ℤ/p²`, a proposed core datum with zero strict dual and relaxed module `R/(p)` is rejected for every rank: this module is not free. In contrast the arithmetic core vertices under MR `(H.1)`–`(H.7)` have relaxed module `R^{r+ν(n)}` and satisfy 4.2.
- `TauCeti.StarkSystems.bss47_rank_one`: For a rank-one Gorenstein-order lattice, the first two fields of 4.7 hold with `τ=1`; the arithmetic induced-character example of BSS Theorem 7.1 supplies the cohomological vanishing as well.
- `TauCeti.StarkSystems.bss47_nonexamples`: The zero lattice fails irreducibility and the rank-one coinvariant condition; the trivial rank-two lattice fails both too. A rational rank-one coinvariant quotient with nonzero integral torsion, as in the unipotent matrix of Layer 4.3, fails 4.7(ii).

Satisfied by `A = (ℤ/p^m)(1) ⊗ χ^{-1} ⊗ ℤ_p[Gal(F/K)]` under the hypotheses of Theorem 7.1.

Not implied by the ring-theoretic hypotheses: for `A` with trivial residual representation 3.3 fails over every `R`.

Additional arithmetic check: For `R` principal artinian, `(H.1)`–`(H.3)` of Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field give Hypotheses 3.2 and 3.3 with the same `τ`.

Additional arithmetic check: For `R = k` and `χ(A) = r`: any core vertex `n` has `dim H¹_{F^n}(K, A) = r + ν(n)`, so 4.2 holds.

Additional arithmetic check: If `rank_R T = 1` then 4.7`(i)` holds and 4.7(ii) holds with `τ = 1`.

*Needs:* Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; `PadicMeasuresIwasawaAlgebras Layer 6`.

### 6.3 Selmer contractions and coefficient change

Let `R` be a commutative noetherian self-injective local ring and `A` finite free, with all Selmer modules here finitely generated. Use functional-first contraction: on a bidual `x`, `ι_v(x)(Φ)=x(v∧Φ)`; determinant evaluation then intertwines it with `ι_v(c₁∧⋯∧c_d)=Σ_i(−1)^{i−1}v(c_i)c₁∧⋯∧ĉ_i∧⋯∧c_d`. Successive degree-one contractions satisfy `ι_v ι_w = −ι_w ι_v`. If `F′≤F` and the change-of-condition map `H¹_F(K,A) → R^s` has kernel `H¹_F′(K,A)`, contraction by its ordered `s` components maps `B^{r+s}_F(A)` to `B^r_F′(A)`. For one component `v_q, r≥1, B^r_F′(A)` identifies with the kernel of `v_q:B^r_F(A)→B^{r−1}_F(A)`. Membership in `B^r_F′(A)` is detected by every `(r−1)`-fold contraction. Given a quotient `R→S` of self-injective rings and the actual coefficient-reduction square into a finite free ambient cohomology module satisfying BSS II Corollary 2.7, the change map constructed here induces `B^r_F(A)→B^r_G(A⊗S)`. No assertion of unconditional base-change isomorphism is made.

The precise hypotheses are `R` noetherian and self-injective; every dualized module finitely generated; The ordered maps are actual localizations for `F′≤F`; coefficient change has the free ambient square and injective bottom map of BSS II Corollary 2.7.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Proposition 2.3, p. 8). The map into the bidual of a kernel.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Proposition 2.4, p. 8). Rank reduction.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Corollary 2.7, pp. 10–11). Coefficient change.

Use the exact Selmer change sequence supplied by SelmerIwasawaCohomology Layer 2 to identify the kernel.

Build kernel contraction, rank reduction and coefficient-change maps from the self-injective duality and the specified free-ambient square, then specialize them to this sequence. The coefficient-change map is independent of the chosen free embedding; it is not an unconditional bidual base-change isomorphism.

For `R = k` a field these are standard facts about exterior powers. For `R=ℤ/p²`, a zero map `X→R` has kernel `X` and zero contraction, whereas projection `R²→R` gives kernel `Re₂` and contraction `e₁∧e₂↦e₂`. These distinguish the kernel submodule from an arbitrary image. Reduction `R→R/(p)` uses the actual free-ambient square; no isomorphism is inferred for a nonprojective module from tensoring its dual.

The transition maps of Stark systems are instances of this coefficient-change map.

*Needs:* Layer 6.1 Exterior biduals of Selmer modules; `SelmerIwasawaCohomology Layer 2`; `PadicMeasuresIwasawaAlgebras Layer 6`.

### 6.4 `T`-modified `S`-units, the order map and Rubin's lattice

Let `H/F` be a finite abelian CM extension with `F` totally real, `G` its Galois group and `c` complex conjugation. Let `S₀` contain the infinite and ramified places, let `T` be a disjoint finite smoothing set, and let `V={v₁,…,v_r}` be `r≥1` finite primes splitting completely in `H`, disjoint from `S₀∪T`, with chosen primes `w_j` above `v_j`. Assume the `T`-modified unit group is torsion-free. Distinguish `S₀`, used in the Stickelberger element, from `V`, used in the unit group: `U_{V,T}` consists of elements congruent to 1 above `T` whose valuations vanish outside primes above `V`. On the rational minus component, the order map `ord_G` sends `u₁∧⋯∧u_r` to `det(Σ_{σ∈G}[σ⁻¹]ord_{w_j}(σu_i))_{i,j}` and is an isomorphism onto `ℚ[G]⁻`. Rubin’s lattice is the rational minus component intersected with the integral `ℤ[G]`-exterior bidual of the full `U_{V,T}`; membership means every determinant of `r` integral group-ring functionals has coefficients in `ℤ`. The integral dual is taken before the minus projection, so the definition does not use the nonintegral idempotent `(1−c)/2`.

The precise hypotheses are `H/F` abelian, `H` CM and `F` totally real; `c` is actual complex conjugation; `r≥1`; the `v_j` are distinct, split completely, and lie outside `S₀∪T`; The `T`-congruence subgroup is torsion-free.

([Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3), §1.2, (8)–(10), p. 8). The unit group and the order map.

([Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3), §1.2, p. 8). Rubin's lattice.

`ord_G` is the determinant of the `ℚ[G]`-linear maps `u ↦ Σ_σ [σ^{-1}] ord_{w_j}(σu)`; on minus parts the unit group of `H` contributes nothing, so `ℚU_{V,T}^−` is free of `rank r` over `ℚ[G]^−` on a basis dual to the `w_j`, which gives the isomorphism.

Use IntegralIwasawaTheory §12.6’s `rubinStarkUnitLattice`, `rubinOrderMap` and `rubinLattice` with the same extension, ordered split-place data and smoothing set. Here `modifiedUnits` and `ordG` are transparent adapters; their determinant and sign API uses the supplied maps. The lattice comparison of §6.1 specializes to this same supplied intersection for `R=ℤ[G]` and `X=U_{V,T}`.

The definition exposes the following operations and relations.

- `TauCeti.RubinStark.modifiedUnits`: Adapter for the supplied `rubinStarkUnitLattice`, with carrier `U_{V,T}` as a `ℤ[G]`-module.
- `TauCeti.RubinStark.ordG`: Adapter for the supplied `rubinOrderMap`, `ord_G : ⋀^r_{ℚ[G]} ℚU_{V,T}^− → ℚ[G]^−`.
- `TauCeti.RubinStark.ordG_ιMulti`: `ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_σ [σ^{-1}]·ord_{w_j}(σ u_i))`.
- `TauCeti.RubinStark.ordG_bijective`: `ord_G` is an isomorphism of `ℚ[G]`-modules.
- `TauCeti.RubinStark.rubinLattice` (supplied by IntegralIwasawaTheory §12.6): `𝓛 = (⋀^r ℚU^−) ⊓ ⋂^r_{ℤ[G]} U_{V,T}`.
- `TauCeti.RubinStark.rubinLattice_rank_one`: For `r = 1, 𝓛 = U_{V,T}^−`.

**Checks.**

- `TauCeti.RubinStark.rubinLattice_nonintegral_functional`: `A` nonintegral coefficient of a determinant functional excludes a rational minus element from the Rubin lattice.
- `TauCeti.RubinStark.modifiedUnits_T_condition`: `A` unit failing congruence to 1 at a prime over `T` is not a `(V,T)`-unit.
- `TauCeti.RubinStark.rubinLattice_half_determinant`: Over `ℚ[C₂]`, half of `(1−c)²` equals `1−c`; integral determinant testing therefore differs from requiring an integral minus projector.
- `TauCeti.RubinStark.modifiedUnits_congruence_excluded`: For `H = ℚ(i)`, `F = ℚ`, `V = {5}` and `T = {3}` (so `3` is inert and `5 = (2+i)(2−i)` splits), `i` is excluded by the congruence condition, since `i − 1 ∉ 3ℤ[i]`; no root of unity other than 1 is `≡ 1 (mod 3)`, so the `T`-modified group is torsion-free.
- `TauCeti.RubinStark.modifiedUnits_valuation_excluded`: In the same data `4 ≡ 1 (mod 3)`, but `4` has valuation 4 at the prime above `2 ∉ V`, so it is excluded.
- `TauCeti.RubinStark.modifiedUnits_admitted`: In the same data `x = i(2+i)/(2−i) = (−4+3i)/5` is admitted: `x − 1 = 3(−3+i)/5` lies in `3` times the local ring at `3`, and `x` has valuations `1, −1` at `(2+i), (2−i)` and 0 elsewhere.

For `r = 1, 𝓛 = U_{V,T}^−` (`U_{V,T}` is reflexive), and membership of the element is the Brumer–Stark statement.

For `r ≥ 2` the lattice `𝓛` is in general strictly larger than the image of `⋀^r_{ℤ[G]} U_{V,T}^−`.

Additional arithmetic check: Replacing `w_j` by `g·w_j` multiplies `ord_G` by `[g⁻¹] ∈ G` (a unit of `ℚ[G]`); so `𝓛`-membership statements do not depend on the `w_j`.

Algebraic bidual test, outside the CM arithmetic carrier (where `G ≠ 1`, since `H` is CM and `F` totally real): over `ℤ[G]` with `G = 1`, `⋂^r_ℤ U = ⋀^r_ℤ U` for `U` free.

Additional arithmetic check: Algebraic minus-part test: let `G=C₂=⟨σ⟩` act by `−1` on `X=ℤ²`. Then `Hom_{ℤ[G]}(X,ℤ[G])` has values in `ℤ(1−σ)`, and `(1−σ)²=2(1−σ)`. Thus the determinant-integrality lattice in `⋀²_{ℚ[G]}ℚX` is `(1/2)⋀²_ℤX`, strictly larger than the exterior-power image. This tests the minus-part normalization without claiming `X` is a specific arithmetic unit lattice.

For a sign witness take `G=C₃×C₂`, with `g` of order three and complex conjugation `c` of order two. A rational minus valuation vector with values 1 at `w, −1` at `cw` and zero elsewhere has order sum `1−c`. Replacing `w` by `gw` gives `g⁻¹(1−c)`, distinct from `g(1−c)`. Swapping two ordered split primes negates the degree-two determinant.

*Needs:* `IntegralIwasawaTheory §12.6`; Layer 6.1 Exterior biduals of Selmer modules.

### 6.5 Stark systems

`(a)` (Mazur–Rubin 2016; `R` principal artinian of `length k`, Selmer data `(T, F, P, r)` with `I_q = 0` for `q ∈ P`.) For `n ∈ N` put `W_n = ⊕_{q | n} Hom(H¹_tr(K_q, T), R)`, free of `rank ν(n)`, and `Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n`. For `m | n` the square of `H¹_{F^m} ⊆ H¹_{F^n}` with the transverse localisations is cartesian and induces `Ψ_{n,m} : Y_n → Y_m`, with `Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″}`. `SS_r(T) = SS_r(T, F, P) = lim_{n ∈ N} Y_n`. For `R` a discrete valuation ring, `SS_r(T) = lim_k SS_r(T/m^kT, P_k)`. `(b)` (Burns–Sakamoto–Sano; `R` commutative noetherian self-injective local with finite residue field, as in 0.2, `A` free of finite rank.) `SS_r(A, F) = lim_{n ∈ N} ⋂^{r+ν(n)}_R H¹_{F^n}(K, A)`, after fixing isomorphisms `λ_q:H¹_{/f}(K_q,A)≃R` for all auxiliary primes and a total ordering of those primes, with transition maps `v_{m,n} = sgn(m,n) C_{v,m/n}`, where `C_{v,m/n}(x)(Φ) = x(v_{q₁} ∧ ⋯ ∧ v_{q_s} ∧ Φ)` for the increasingly ordered primes of `m/n`. Here `sgn(m,n)` is the sign of the permutation from the concatenated ordered lists `(primes of m/n, primes of n)` to the ordered primes of `m`. Here `v_q : H¹_{F^m}(K, A) → H¹_{/f}(K_q, A) ≅ R` is localization followed by the fixed trivialization, and these signs give `v_{m′,n} = v_{m,n} ∘ v_{m′,m}`. In particular, removing the `i`th prime of `m` gives `v_{m,m/q_i} = (−1)^{i−1}ι_{v_{q_i}}`; the transition from a one-prime conductor to 1 is positive. For `ε ∈ SS_r(A, F)` and `i ≥ 0, I_i(ε) = Σ_{ν(n) = i} im(ε_n) ⊆ R`, each `ε_n` being a homomorphism `⋀^{r+ν(n)}H¹_{F^n}(K, A)^* → R`. For a local Gorenstein order `R` and `T` free over `R, SS_r(T, F) = lim_m SS_r(T/p^mT, F)` and `I_i(ε) = lim_m I_i(ε^{(m)})`.

The precise hypotheses are as in `(a)` or `(b)`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 6.8, p. 14). Stark systems over principal artinian rings.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §4.1, p. 19). Stark systems in exterior biduals.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Definition 4.1, p. 20). The ideals `I_i(ε)`.

`(a): Ψ_{n,m}` is contraction against `h_{s+1} ∘ loc^tr_{q_{s+1}}`, …, `h_t ∘ loc^tr_{q_t}` tensored with `h₁ ∧ ⋯ ∧ h_t ↦ h₁ ∧ ⋯ ∧ h_s`; it is independent of the generators `h_i` and of the ordering (Mazur–Rubin 2016, Proposition A.3).

([David Burns and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems](https://arxiv.org/abs/1612.06187v1), §3.1, the definition of `v_{m,n}`). The permutation signs for functional-first transitions.

`(b): v_{m,n}` lands in the bidual of the kernel `H¹_{F^n}` by the coefficient-change map of Layer 6.3.

Layer 6.9 compares the two definitions over principal artinian coefficients through the determinant-twisted bidual stalk `X_n=(⋂^{r+ν(n)}H¹_{F^n})⊗det W_n`. The chosen `λ_q` and ordering trivialize `det W_n`, giving the plain bidual stalk in `(b)`. The component maps `C_n` use functional-first contraction as in §6.3 and commute with transitions; the comparison with this plain model is relative to these choices, and free cofinal core vertices identify the inverse limits.

The definition exposes the following operations and relations.

- `TauCeti.StarkSystems.stalk`: `Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n` (Mazur–Rubin), and `⋂^{r+ν(n)} H¹_{F^n}(K, A)` (Burns–Sakamoto–Sano).
- `TauCeti.StarkSystems.transition`: `Ψ_{n,m} : Y_n → Y_m` for `m | n`, and `v_{m,n}` on biduals.
- `TauCeti.StarkSystems.transition_comp`: `Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″}` and `Ψ_{n,n} = id`.
- `TauCeti.StarkSystems.StarkSystem`: `SS_r =` the submodule of `∏_n Y_n` of families with `Ψ_{n,m}(ε_n) = ε_m`.
- `TauCeti.StarkSystems.StarkSystem.ideal`: `I_i(ε) = Σ_{ν(n)=i} im(ε_n)`, an ideal of `R`; `I_∞(ε) = ⋃_i I_i(ε)`.
- `TauCeti.StarkSystems.StarkSystem.eval_one`: `ε ↦ ε_1 ∈ ⋀^r H¹_F(K, T)` (resp. `⋂^r H¹_F(K, A)`).

**Checks.**

- `TauCeti.StarkSystems.stalk_one`: The MR conductor-one Stark stalk is the degree-`r` exterior power of `H¹_F`.
- `TauCeti.StarkSystems.rank_one_free_stalk`: `A` relaxed Selmer module free of `rank r+ν(n)` makes the degree-`r` Stark stalk free of rank one.
- `TauCeti.StarkSystems.not_product`: `A` family with nonzero component at 1 and zero component at `q` violates the transition relation.
- `TauCeti.StarkSystems.stalk_exterior_degree`: In a free model of relaxed `rank d`, the MR stalk is zero if `r+ν(n)>d` and has rank binomial`(d,r+ν(n))` otherwise; a `rank d=r+ν(n)+1` model has `rank d`, not one.
- `TauCeti.StarkSystems.transition_identity_and_zero`: The empty transition is the identity. On `Re₁⊕Re₂`, contraction by the zero functional is zero, whereas contraction by `e₁*` sends `e₁∧e₂` to `e₂` and its reverse to `−e₂`.
- `TauCeti.StarkSystems.transition_order`: On `e₁∧e₂∧e₃`, applying `ι_{e₁*}` then `ι_{e₂*}` gives `e₃`; the reverse order gives `−e₃`. The ordered determinant factors must compensate when the primes are reordered.
- `TauCeti.StarkSystems.system_constant_model`: In a diagram with every stalk `R` and every transition the identity, coherent families are exactly constant families, giving `SS≃R`; the zero family belongs and `(ε₁,ε_q)=(1,0)` does not. This is a diagram test, not a claimed arithmetic realization.
- `TauCeti.StarkSystems.ideal_image_values`: `A` zero component has image ideal 0; a component with value `π^a` on a free rank-one dual has image `(π^a)`, and a unit value has image `R`. Multiplying a family by `π` scales every `I_i` by `(π)`.
- `TauCeti.StarkSystems.ideal_sum`: Over the self-injective ring `R=k[x,y]/(x²,y²)`, two components whose images are `(x)` and `(y)` contribute `(x,y)`, rather than their intersection `(xy)` or either single principal ideal.

For `n = 1: Y_1 = ⋀^r H¹_F(K, T)`, and `ε_1` is the leading term of the Stark system.

The zero family is a Stark system.

Additional arithmetic check: If `H¹_{(F^*)_n}(K, T^*) = 0` and `r = χ(T)`, then `H¹_{F^n}(K, T)` is free of `rank r + ν(n)` and `Y_n` is free of rank one.

Additional arithmetic check: For `n = q, m = 1, r = 1` and `H¹_{F^q}` free with basis `c₁, c₂: Ψ_{q,1}(c₁ ∧ c₂ ⊗ h) = h(loc^tr_q c₁)c₂ − h(loc^tr_q c₂)c₁` with contraction convention `ι_h(c₁∧c₂)=h(c₁)c₂−h(c₂)c₁`, an element of `H¹_F(K, T)`.

For the contraction convention, on `Re₁⊕Re₂` with `h(e₁)=1` and `h(e₂)=0` one obtains `ι_h(e₁∧e₂)=e₂`; reversing the wedge gives `−e₂`. This fixes the rank-two, one-prime transition sign.

*Needs:* Layer 6.1 Exterior biduals of Selmer modules; Layer 6.3 Selmer contractions and coefficient change; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.5 The transverse local condition; Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field.

### 6.6 Freeness of Stark systems and control of the dual Selmer group

`(a)` (Mazur–Rubin 2016; `(H.1)`–`(H.7), R` principal artinian.) `SS_r(T)` is free of rank one over `R`, and the image of `SS_r(T) → Y_n` is `Y′_n = m^{length H¹_{(F^*)_n}(K, T^*)} Y_n`; for `R` a discrete valuation ring with `(H.1)`–`(H.6), SS_r(T, P)` is free of rank one, generated by `ε` with nonzero image in `SS_r(T/mT)`, and `SS_r(T, P) → SS_r(T/m^k, P_k)` is surjective. With `φ_ε(n) = max{j : ε_n ∈ m^jY_n}, ∂φ_ε(i) = min{φ_ε(n) : ν(n) = i}, ∂φ_ε(∞) = min_i ∂φ_ε(i), ord(ε) = min{ν(n) : ε_n ≠ 0}` and, only for `i≥ord(ε), d_ε(i) = ∂φ_ε(i) − ∂φ_ε(i + 1)`: for `R` a discrete valuation ring and `ε ≠ 0, corank H¹_{F^*}(K, T^*) = ord(ε), H¹_{F^*}(K, T^*)`/div `≅ ⊕_{i ≥ ord ε} R/m^{d_ε(i)}, ε` is primitive iff `∂φ_ε(∞) = 0`, and `length H¹_{F^*}(K, T^*) ≤ ∂φ_ε(0) = max{s : ε_1 ∈ m^s ⋀^r H¹_F(K, T)}` with equality iff `ε` is primitive provided `ε_1 ≠ 0`. If `ε_1=0`, both sides of this extended-length inequality are `∞` and equality does not characterize primitivity. `(b)` (Burns–Sakamoto–Sano; Hypothesis 4.2.) For `n` with `H¹_{(F^*)_n}(K, A^*(1)) = 0, SS_r(A, F) → ⋂^{r+ν(n)}H¹_{F^n}(K, A)` is bijective, so `SS_r(A, F)` is free of rank one; for all `ε` and `i: I_i(ε) ⊆ I_{i+1}(ε), I_∞(ε) = R` iff `ε` is a basis, and `I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, A^*(1))^*)`. For a local Gorenstein order under Hypothesis 4.7 and Hypothesis 4.2 of fixed `rank r` for `(T/p^mT,F,P_m)` at every `m≥1, SS_r(T, F)` is free of rank one with `I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, T^∨(1))^∨)`. The ideals commute with the admissible scalar reductions of Layer 6.3 for every `r≥0`, under its exact coefficient-change hypotheses; the regulator commutes with these reductions for `r≥1`.

The precise hypotheses are `(H.1)`–`(H.7)` of Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field for `(a)`; Hypothesis 4.2 (finite level) and 4.7 plus 4.2 for every `T/p^mT` with the same `r` (orders) of Layer 6.2 The Burns–Sakamoto–Sano hypotheses for `(b)`.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Theorem 6.10, p. 15). Freeness over principal artinian rings.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Theorem 8.9, p. 19). The structure theorem.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Theorem 4.6, p. 21). Freeness and Fitting ideals over self-injective rings.

`(a): Y_n` is free of rank one when `H¹_{(F^*)_n} = 0` (Corollary 3.5), such `n` exist and are cofinal (Layer 1.21 Simultaneous nonvanishing of localisations), and `Ψ_{n,m}(Y_n) = Y′_m` (Lemma 6.9); the structure theorem follows from `∂μ(t) = Σ_{i>t} e_i` for `H¹_{F^*} ≅ ⊕R/m^{e_i}`.

`(b)`: Theorem 4.6, combining Burns–Sano and Sakamoto; Fitting ideals of the dual Selmer module are generated by the images of Stark systems at vertices with `i` primes (Corollary 4.5) using the exact-dual contraction and image-ideal comparison of Layer 6.3.

For `r = 1` and `R` a discrete valuation ring this recovers Layer 5.6 Structure of the dual Selmer group from a Kolyvagin system through the regulator isomorphism.

For `i<ord(ε), ∂φ_ε(i)=∞`, so no difference `∞−∞` is formed. At `i≥ord(ε)`, these indices are finite and their differences are nonnegative. The zero system has `ord=∞` and no elementary-divisor differences.

Over a non-domain order the statement is an equality of ideals, not a valuation formula.

*Needs:* Layer 6.5 Stark systems; Layer 6.2 The Burns–Sakamoto–Sano hypotheses; Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field; Layer 1.21 Simultaneous nonvanishing of localisations; `PadicMeasuresIwasawaAlgebras Layer 6`.

### 6.7 Kolyvagin systems of `rank r` and the regulator map

`(a)` (Mazur–Rubin 2016.) The rank-`r` Selmer sheaf on `X(P)` has stalks `S(n) = ⋀^r H¹_{F(n)}(K, T/I_nT) ⊗ G_n`, edge modules `S(e) = H¹_tr(K_q, T/I_{nq}T) ⊗ ⋀^{r−1}H¹_{F_q(n)}(K, T/I_{nq}T) ⊗ G_{nq}` for `e = {n, nq}`, and vertex-to-edge maps the contractions against `loc^f_q` (finite projection followed by `φ^fs_q`) from `n` and against `loc^tr_q` from `nq`. `KS_r(T, F, P) = Γ(S)`; for `r = 1` this is Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits. The stub subsheaf has `S′(n) = m^{λ(n)}S(n), λ(n) = length H¹_{F(n)^*}(K, T^*)`, and `KS′_r(T) = Γ(S′)`. `(b)` (Burns–Sakamoto–Sano; `r≥1`.) `KS_r(A, F)` is the module of families `κ_n ∈ ⋂^r_R H¹_{F(n)}(K, A) ⊗ G_n` with `v_q(κ_n) = φ^fs_q(κ_{n/q})` in `⋂^{r−1}_R H¹_{F_q(n/q)}(K, A) ⊗ G_n` for `q | n`; with generators of the `G_q` fixed, `I_i(κ) = Σ_{ν(n)=i} im(κ_n)`. For a Gorenstein order, `KS_r(T, F) = lim_m KS_r(T/p^mT, F)`. `(c)` For `r≥1`, the regulator: `Reg_r : SS_r(A, F) → KS_r(A, F), ε ↦ ((−1)^{ν(n)} C_{φ,n}(ε_n))_n`; in Mazur–Rubin's setting `Π : SS_r(T) → KS′_r(T), ε ↦ ((−1)^{ν(n)}Π_n(ε_n))_n`.

The precise hypotheses are as in Layer 6.5 Stark systems, with `r≥1` for both Kolyvagin-system constructions and their regulators, at finite level and in every order limit. Stark systems in §§6.5–6.6 retain `r≥0`; the degree `r−1` edge contraction here has no rank-zero instance.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Definition 10.4, p. 21). Kolyvagin systems of `rank r`.

([David Burns and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems](https://arxiv.org/abs/1612.06187v1), §4.2, the definition before Proposition 4.3 and its proof). The signed regulator with the functional-first transitions of §6.5.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §5.2, p. 25). The regulator and its arithmetic setting, transported to these contraction conventions.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Proposition 12.3, p. 24). The map `Π`.

For `n = q₁⋯q_d` in increasing order, `C_{φ,n}(x)(Φ) = x(φ^fs_{q₁} ∧ ⋯ ∧ φ^fs_{q_d} ∧ Φ)`, retaining the ordered tame tensor factors. Thus it applies the first contraction first. For `q = q_i`, put `s = (−1)^{i−1}`. The Stark relation is `s ι_{v_q}(ε_n) = ε_{n/q}`. Anticommuting `ι_{v_q}` past the `d` regulator contractions contributes `(−1)^d`; moving `φ^fs_q` to the last position among those functionals contributes `(−1)^{d−i}`. Consequently `v_q(Reg_r(ε)_n) = s C_{φ,n}(ε_{n/q}) = (−1)^{d−1} φ^fs_q(C_{φ,n/q}(ε_{n/q})) = φ^fs_q(Reg_r(ε)_{n/q})`. The conductor sign is essential even when `d = 1`.

All contractions use §6.3. Reordering primes changes both the Stark determinant trivialization and the ordered contraction by the corresponding permutation sign. The same conductor sign appears in `Π`; the published unsigned Stark comparison of §6.9 is retained.

The definition exposes the following operations and relations.

- `TauCeti.StarkSystems.KolyvaginSystemRank`: For `r≥1`, `KS_r(T, F, P) = Γ` of the rank-`r` Selmer sheaf; `KS_r(A, F)` in biduals.
- `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv`: At a fixed finite coefficient level with `I_q=0` for every selected prime and reflexive modified Selmer modules, the degree-one bidual Kolyvagin module is equivalent to the ordinary module. The exterior-power MR version needs no reflexivity in degree one.
- `TauCeti.StarkSystems.KolyvaginSystemRank.stub`: `KS′_r(T) ≤ KS_r(T)`, sections of the stub subsheaf.
- `TauCeti.StarkSystems.regulator`: For `r≥1`, `Reg_r : SS_r → KS_r`, the `R`-linear signed ordered contraction above, with the same positive rank at every coefficient level.
- `TauCeti.StarkSystems.regulator_eval_one`: `Reg_r(ε)_1 = ε_1`.
- `TauCeti.StarkSystems.KolyvaginSystemRank.ideal`: `I_i(κ) = Σ_{ν(n)=i} im(κ_n)`.

**Checks.**

- `TauCeti.StarkSystems.regulator_zero`: For `r≥1`, the regulator takes the zero system to zero.
- `TauCeti.StarkSystems.rank_zero_stark_only`: `⋂⁰_R X≃R`, so the Stark carrier admits `r=0`. The Kolyvagin edge formula would require degree `−1` at this rank and is excluded; replacing it by truncated natural subtraction and degree zero does not define a rank-zero Kolyvagin system.
- `TauCeti.StarkSystems.rank_system_not_product`: `A` family with zero upper localization and nonzero lower localization fails the rank-`r` edge equation.
- `TauCeti.StarkSystems.stub_stalk_zero_field`: At field coefficients, positive dual length and a nonzero rank-`r` exterior stalk give zero stub stalk strictly smaller than the full stalk.
- `TauCeti.StarkSystems.rank_two_stalk`: On a rank-two free Selmer model and `r=2`, the exterior and bidual vertex stalks are both `R(e₁∧e₂)`; degree three gives zero. In degree one the exterior version is the original Selmer module, while the bidual version requires the stated reflexivity comparison.
- `TauCeti.StarkSystems.stub_length_zero`: `A` vertex with dual length zero has full stub stalk. For `R=ℤ/p³` and a free rank-one stalk, dual lengths 1 and 3 give the distinct stub stalks `pR` and 0, respectively.
- `TauCeti.StarkSystems.regulator_leading_and_scale`: The leading regulator component equals `ε₁`. Scaling `ε` by `a` multiplies every regulator component by `a`.
- Over a field of odd characteristic, let `r = 1`, `X = ke₁ ⊕ ke₂`, `v = e₁*`, `φ = e₂*` and `ε_q = e₁∧e₂`. Then `ε₁ = ι_v(ε_q) = e₂`, `Reg_1(ε)_q = −ι_φ(ε_q) = e₁` and `v(Reg_1(ε)_q) = 1 = φ(ε₁)`. The unsigned value `−e₁` fails this edge equation.
- `TauCeti.StarkSystems.rank_system_constant_model`: `A` one-vertex sheaf has all of its stalk as sections; on a two-vertex identity-edge model, sections are the diagonal. Thus (1,1) satisfies the relation and (1,0) fails it.
- `TauCeti.StarkSystems.rank_ideal_values`: `A` zero component contributes 0, a free rank-one bidual component with coefficient `π^a` contributes `(π^a)`, and a unit coefficient contributes `R`. For two components with values `x` and `y`, the image ideal is `(x,y)`, including over non-principal coefficient rings.

For `r = 1: KS_1 = KS` and `Reg_1(ε)_1 = ε_1`.

`Reg_r` commutes with `R → R/(p^m)` and with restriction of `P`.

Additional arithmetic check: For `r = 1` the edge module is `H¹_tr(K_q, T/I_{nq}T) ⊗ G_{nq} ≅ H¹_s ⊗ G_{nq}` and the relation is (5) of Mazur–Rubin 2004.

Additional arithmetic check: For `n = q`, `Reg_r(ε)_q = −ι_{φ^fs_q}(ε_q) ∈ ⋂^r H¹_{F(q)}(K, A) ⊗ G_q`, and `v_q(Reg_r(ε)_q) = φ^fs_q(ε_1)`. At two primes `q₁ < q₂`, the Stark transitions are `ι_{v_{q₁}}` and `−ι_{v_{q₂}}`; both paths to 1 give `ι_{v_{q₂}}ι_{v_{q₁}}`, and the regulator has conductor sign +1. In characteristic 2 these signs coincide, so the odd-characteristic one-prime check distinguishes the conventions.

*Needs:* Layer 6.5 Stark systems; Layer 6.1 Exterior biduals of Selmer modules; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 4.1 The Selmer graph and the Selmer sheaf; Layer 1.8 The finite–singular comparison map.

### 6.8 The regulator isomorphism and structure of Kolyvagin systems of `rank r`

`(a)` (Mazur–Rubin 2016; `(H.1)`–`(H.7), R` principal artinian.) There are core vertices; any two are joined by a path through core vertices along which all vertex-to-edge maps are isomorphisms; `S′` is locally cyclic with every core vertex a hub and trivial monodromy; `KS′_r(T)` is free of rank one and `κ ↦ κ_n` is an isomorphism onto `S′(n)` at core vertices; `Π : SS_r(T) → KS′_r(T)` is an isomorphism. For `R` a discrete valuation ring (`(H.1)`–`(H.6)`), `KS′_r(T, P) ≅ lim_k KS′_r(T/m^k, P_k)` is free of rank one, and for `0 ≠ κ ∈ KS′_r(T)` the conclusions of Layer 6.6 Freeness of Stark systems and control of the dual Selmer group`(a)` hold with `ε` replaced by `κ`; in particular `length H¹_{F^*}(K, T^*) ≤ max{s : κ_1 ∈ m^s ⋀^r H¹_F(K, T)}`, with equality iff `κ` is primitive provided `κ_1 ≠ 0`; when `κ_1=0` the extended-length equality `∞=∞` gives no primitivity criterion. `(b)` (Burns–Sakamoto–Sano; `r≥1`, Hypotheses 3.2, 3.3, 4.2 and `p > 3`.) `Reg_r : SS_r(A, F) → KS_r(A, F)` is an isomorphism, so `KS_r(A, F)` is free of rank one; for `κ ∈ KS_r(A, F)` and `n ∈ N, im(κ_n) ⊆ Fitt⁰_R(H¹_{F(n)^*}(K, A^*(1))^*)`, with equality if `κ` is a basis; and `I_i(κ) ⊆ Fitt^i_R(H¹_{F^*}(K, A^*(1))^*)`, with equality if `R` is a principal ideal ring and `κ` is a basis. The same holds over a local Gorenstein order under Hypothesis 4.7, Hypothesis 4.2 of fixed `rank r` for every `(T/p^mT,F,P_m)`, and `p > 3` for `KS_r(T, F)` and `H¹_{F^*}(K, T^∨(1))^∨`. The restriction `p > 3` is part of the statements for Kolyvagin systems; it is not needed for Stark systems.

The precise hypotheses are as stated, with `r≥1` in both branches and their DVR or Gorenstein-order limits; `p > 3` in `(b)`. These positivity hypotheses apply to the regulator isomorphism, freeness and every Kolyvagin-system Fitting assertion.

([Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1), Theorem 12.4, p. 25). Stark systems and stub Kolyvagin systems.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Theorem 5.2, pp. 25–26). The regulator isomorphism and Fitting bounds.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Theorem 5.25, p. 36). The statement over a Gorenstein order.

`(a)`: Theorem 11.6 (proved in §14 by the Chebotarev lemmas) and Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections; `Π` is surjective onto each `S′(n)` (Lemma 12.2) between free modules of rank one.

`(b)`: Theorem 5.2 — connectivity of the core graph `X⁰` (Theorem 5.18, where `p > 3` is used to find a common prime for two pairs of classes via Lemma 3.9 with `s + t < p`) and the computation of `im(κ_n)` at core vertices (Theorem 5.20); pass to the limit for orders (Theorem 5.25).

BSS II §§5.4–5.5: Lemmas 5.14–5.17 connect minimal and nonminimal core vertices by detecting at most four classes `(p>3)`; Lemma 5.19 makes edge contractions isomorphisms. Theorem 5.20 obtains surjectivity from Stark evaluation and proves injectivity by induction on residual dual dimension, choosing detecting primes and using rank reduction to force a nonzero edge value. Lemmas 5.22–5.23 then give higher Fitting containments, with equality requiring a faithful Selmer element; the principal-ring argument supplies it.

For `r = 1` over a discrete valuation ring: `KS(T)` free of rank one, as in Layer 5.3 Kolyvagin systems in core rank one.

Over a non-principal Gorenstein ring only the inclusion `I_i(κ) ⊆ Fitt^i` is asserted for `i > 0`.

*Needs:* Layer 6.7 Kolyvagin systems of `rank r` and the regulator map; Layer 6.6 Freeness of Stark systems and control of the dual Selmer group; Layer 6.2 The Burns–Sakamoto–Sano hypotheses; Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections; Layer 1.21 Simultaneous nonvanishing of localisations; `PadicMeasuresIwasawaAlgebras Layer 6`.

### 6.9 Comparison of exterior-power and bidual Stark systems

Let `R` be principal artinian local, `A` finite free over `R, F` cartesian, signed core `rank r≥0`, and `Q` an infinite subset of the admissible Kolyvagin primes of sufficient level admitting core vertices, in the setting of Sakamoto §4.5 and Mazur–Rubin 2016. Let `W′_n=⊕_{q|n}Hom_R(H¹_tr(K_q,A),R), W_n=⊕_{q|n}Hom_R(H¹(K_q,A)/H¹_f(K_q,A),R)`, and `j_n:det W′_n≃`det `W_n` be induced by the inverse of the transverse-to-singular restriction isomorphism. First use `X_n=(⋂^{r+ν(n)}H¹_{F^n})⊗det W_n`. With the tensor factors in the order of §6.5(a), use the published functional-first convention of Sakamoto: `C̃_n=ξ_{H¹_{F^n}}⊗j_n:Y_n→X_n`. Ordinary tensor symmetry transports the published factor order and contributes no degree sign. Fix the isomorphisms `λ_q:H¹_{/f}(K_q,A)≃R` and prime ordering of §6.5(b). They give `t_n:det W_n≃R` by sending the ordered wedge of the dual basis `λ_q` to 1. Then `C_n=(id⊗t_n)∘C̃_n` lands in the plain bidual stalk. Transport the determinant-twisted transitions on `X_n` through `id⊗t_n`; they are the ordered functional-first localization contractions of §6.5(b), with the permutation signs needed for composition. These component maps induce an `R`-linear isomorphism `SS^MR_r(A,F,Q)≃SS^bidual_r(A,F,Q)` relative to the fixed local choices. Component maps need only be isomorphisms at the cofinal free core vertices; they are not claimed bijective at every vertex.

The precise hypotheses are Sakamoto §4.5 hypotheses: principal artinian `R`, cartesian `F`, `r=χ(F)≥0`, `Q` infinite of sufficient level with core vertices, and the fixed local isomorphisms and ordering for the plain model. The determinant-twisted comparison itself does not require these trivializations.

([Ryotaro Sakamoto, Stark systems over Gorenstein local rings](https://msp.org/ant/2018/12-10/ant-v12-n10-p02-s.pdf), published version, Lemma 4.13 and Proposition 4.14, pp. 2313–2314). The compatible comparison of the two Stark definitions. Sakamoto §4.1 and Definition 4.2 retain `det W_n`; Definition 4.9 chooses the local trivializations.

Lemma 4.13 proves that `ξ` commutes with the one-dimensional kernel contraction; its proof decomposes the finite module as `Rm⊕N₀` with `N=Im⊕N₀` and checks the determinant formula.

Apply it successively to localizations to obtain compatibility of `C̃_n` with the determinant-twisted transitions. Functional-first contraction agrees with the `v_q∧Φ` evaluation in BSS II §6.5; the regulator uses these same ordered contractions together with the conductor sign of §6.7. Conjugating transitions by `id⊗t_n` gives compatibility of `C_n` with the plain model; changes of local basis and ordering act on both components and transitions.

At a core vertex the relaxed Selmer module is free and `ξ` is bijective; cofinality and evaluation of both inverse limits at such vertices give Proposition 4.14.

The comparison is between arithmetic inverse systems, with determinant evaluation and commuting ordered transitions.

**Checks.**

- At `n=1`, `det W_1=R` and `t_1=id`; the component map is `ξ`, an isomorphism at a free core vertex.
- For `r=1`, `n=q`, a free relaxed module `Re₁⊕Re₂` and localization `e₁*`, both paths around the one-prime square send `e₁∧e₂⊗λ_q` to `ξ(e₂)`: `ι_{e₁*}ξ(e₁∧e₂)(e₂*)=det([[1,0],[0,1]])=1`. An extra minus sign in `C_q` would break this square in odd characteristic.
- At `n=q`, changing `λ_q` to `uλ_q` changes `t_q` by `u⁻¹` and the plain component map by `u⁻¹`; the transition from `q` to 1 is multiplied by `u`, cancelling the change of the component map. A plain-stalk comparison independent of this choice is not asserted.
- At two primes, swapping their order negates the determinant basis and the corresponding ordered contraction. The two sign changes agree, so the transition square still commutes.

*Needs:* Layer 6.5 Stark systems; Layer 6.6 Freeness of Stark systems and control of the dual Selmer group; `PadicMeasuresIwasawaAlgebras Layer 6`.

### Examples

Given `H¹_F(K,T)≃R³`, its degree-two bidual has rank 3.

The degree-zero Selmer bidual is `R`.

For `R=ℤ_p` and `a=p`, a Selmer module `R⊕R/(p)` has degree-one evaluation killing the nonzero torsion summand. Over self-injective `R` this conclusion need not hold.

### Dependencies

This layer uses `IntegralIwasawaTheory §12.6`; `PadicMeasuresIwasawaAlgebras Layer 6`; `SelmerIwasawaCohomology Layer 2`; Layer 1.13 The Mazur–Rubin 2016 hypotheses `(H.1)`–`(H.7)` over a number field; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 6.1 Exterior biduals of Selmer modules; Layer 6.3 Selmer contractions and coefficient change; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 1.5 The transverse local condition; Layer 6.5 Stark systems; Layer 6.2 The Burns–Sakamoto–Sano hypotheses; Layer 1.21 Simultaneous nonvanishing of localisations; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 4.1 The Selmer graph and the Selmer sheaf; Layer 1.8 The finite–singular comparison map; Layer 6.7 Kolyvagin systems of `rank r` and the regulator map; Layer 6.6 Freeness of Stark systems and control of the dual Selmer group; Layer 4.11 Locally cyclic sheaves, hubs, monodromy and primitive sections.

Layer 0.2 here constructs both the Gorenstein-order lattice duality (`FiniteSelmerDuality.gorensteinOrderDual`) and the finite self-injective arithmetic comparison; PadicMeasuresIwasawaAlgebras Layer 6 supplies character rings, involutions and Fitting algebra and states no Gorenstein duality. IntegralIwasawaTheory §12.6 supplies the shared bidual and finite-CM Rubin-lattice core. Layers 6.1 and 6.3 add the finite-projective and Selmer comparisons, contractions and coefficient change; normalized integral transfer and compatible functional lifts are constructed in Layer 7.2.

The proof also uses Mazur–Rubin 2016 Appendix `A`/§14 and the Burns–Sakamoto–Sano and Sakamoto auxiliary lemmas.

## Layer 7: Higher-rank descent

### 7.1 Euler systems of `rank r`

Let `R` be a semilocal Gorenstein `O`-order in a finite-dimensional semisimple commutative algebra over a finite extension of `ℚ_p, T` a free `R`-module of finite rank with continuous `R`-linear `G_K`-action, `S ⊇ S_∞ ∪ S_p ∪ S_ram(T)` finite, `P_q(x) = det(1 − Fr_q^{-1}x | T^*(1))` for `q ∉ S, 𝒦/K` an abelian pro-`p` extension in which all archimedean places split completely, `Ω(𝒦/K)` the set of finite subextensions, `S(F) = S ∪ S_ram(F/K)` and `𝒢_F = Gal(F/K)`. Hypothesis 6.1: `(i) H¹(O_{F,S(F)}, T)` is a reflexive `R[𝒢_F]`-module for every `F` (equivalently free over `O`); (ii) `H⁰(F, T) = 0` for every `F`. An Euler system of `rank r` for `(T, 𝒦)` is a family `c_F ∈ ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F)}, T), F ∈ Ω(𝒦/K)`, with `Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1})) c_F` in `⋂^r_{R[𝒢_F]} H¹(O_{F,S(F′)}, T)` for `F ⊆ F′`. `ES_r(T, 𝒦)` is the `R[[Gal(𝒦/K)]]`-module of such families. Hypothesis 6.7: `𝒦` contains `K(q)` for every `q ∉ S` and a `ℤ_p^d`-extension of `K` in which no finite place splits completely. For `r = 1` on the common towers satisfying Hypothesis 6.7, under Hypothesis 6.1`(i)` and the universal-norm/unramified comparison, `⋂^1 H¹ = H¹` and `ES_1(T, 𝒦)` is Layer 2.2 The module of Euler systems with coefficients `R`.

The precise hypotheses are `R` a semilocal Gorenstein order; Hypothesis 6.1 for the comparison with rank one.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Definition 6.4, p. 37). The definition.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Hypothesis 6.1, p. 37). Reflexivity and vanishing of invariants.

`Cor` on biduals is induced by corestriction `H¹(O_{F′,S(F′)}, T) → H¹(O_{F,S(F′)}, T)`, which is `R[𝒢_{F′}]`-linear onto an `R[𝒢_F]`-module; functoriality of `⋂^r` (Layer 6.1 Exterior biduals of Selmer modules, map) and change of group ring.

Reflexivity fails for torsion unit examples (`T = ℤ_p(1)` with `μ_p ⊆ F`); then a `T`-modified cohomology is used, with its own comparison (Remark 6.3). The theory here assumes Hypothesis 6.1 throughout.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.HigherEulerSystem`: `ES_r(T, 𝒦) ≤ ∏_F ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F)}, T)`, cut out by the corestriction relations.
- `TauCeti.EulerSystems.HigherEulerSystem.eval`: `c ↦ c_F`.
- `TauCeti.EulerSystems.HigherEulerSystem.rank_one_equiv`: On common towers satisfying 6.7, under 6.1 and the universal-norm/unramified comparison, `ES_1(T,𝒦)≃ES(T,𝒦,N)`, with `N` containing the finite primes of `S`. The comparison includes the transport from `S(F)`-ramified cohomology to global `H¹` and the coefficient/Euler-polynomial dictionaries.
- `TauCeti.EulerSystems.BSSHypothesis61`: Reflexivity of `H¹(O_{F,S(F)}, T)` over `R[𝒢_F]` and `H⁰(F, T) = 0`, for all `F`.
- `TauCeti.EulerSystems.BSSHypothesis61.iff_free`: 6.1`(i)` holds iff every `H¹(O_{F,S(F)}, T)` is free over `O`.
- `TauCeti.EulerSystems.HigherEulerSystem.cor_eval`: `Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1}))·c_F`.

**Checks.**

- `TauCeti.EulerSystems.HigherEulerSystem.zero_mem`: The zero higher-rank family satisfies every norm relation.
- `TauCeti.EulerSystems.HigherEulerSystem.rank_one_norm`: In degree one on the common tower, bidual evaluation identifies `Cor(c_{F′})=P(Fr⁻¹)c_F` with the ordinary Rubin relation, including its nonunit Euler factor; it does not identify corestriction with the identity.
- `TauCeti.EulerSystems.HigherEulerSystem.failed_norm`: In any actual tower edge with zero upper class and `P(Fr⁻¹)c_F≠0`, the family fails the higher Euler-system relation. Checking only conductors with no new ramification would miss this edge.
- `TauCeti.EulerSystems.HigherEulerSystem.scalar_norm_model`: For an edge on which the normalized transfer sends a chosen bidual basis at the upper level to `d` times the chosen lower basis, the relation on coefficients is `da=Pb`. The choice `(a,b,P)=(1,1,d)` passes; `(0,1,d)` fails whenever `d≠0`. This tests the specified transfer, without replacing it by a plain exterior power.
- `TauCeti.EulerSystems.BSSHypothesis61_zero`: `T=0` has all `H⁰` and `H¹` zero, hence satisfies 6.1. The zero Euler system also exists for every allowed nonzero `T`, so existence of a system does not certify 6.1.
- `TauCeti.EulerSystems.BSSHypothesis61_invariants`: For `T=O` with trivial action, `H⁰(F,T)=O≠0` at every field, so 6.1(ii) fails irrespective of freeness in `(i)`.
- `TauCeti.EulerSystems.not_BSSHypothesis61_torsion`: `A` nonzero ramified-cohomology class annihilated by a nonzero scalar contradicts the torsion-free form of Hypothesis 6.1`(i)`.

For `R = O = ℤ_p, T = ℤ_p(1)`: Hypothesis 6.1`(i)` says the `p`-completion of `O_{F,S(F)}^×` is torsion-free for all `F`.

The zero family is an Euler system of `rank r`.

Additional arithmetic check: For `r = 1, R = O` and Hypothesis 6.1: the relation is Rubin's, with `P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = P(Fr_q^{-1} | T^*; x)` in Rubin's notation.

Additional arithmetic check: For `T = ℤ_p(1)` and `F ⊇ μ_p, H¹(O_{F,S(F)}, T) ⊇ μ_{p^∞}(F)` has torsion, so Hypothesis 6.1`(i)` fails: reflexivity is not automatic.

*Needs:* Layer 6.1 Exterior biduals of Selmer modules; Layer 2.2 The module of Euler systems; Layer 2.1 Euler polynomials and their conventions; `PadicMeasuresIwasawaAlgebras Layer 6`.

### 7.2 The higher Kolyvagin derivative

Let `r ≥ 1`. Assume Hypotheses 6.1, 6.7 and 6.11 (`Fr_q^{p^k} − 1` is injective on `T` for every `q ∈ P` and `k ≥ 0`). Fix a power `M` of `p`, a field `E ∈ Ω(𝒦/K)` unramified outside `S` with `K(1) ⊆ E`, and put `R̄ = R/(M), ℛ = R̄[Gal(E/K)], A = Ind_{G_E}^{G_K}(T/MT)`, a free `ℛ`-module. For `n ∈ N` let `E(n) = E·K(n), H_n = Gal(E(n)/E), B=T/MT` (uninduced), `c_n=c_{E(n)}`, and `c̄_n` its image in `⋂^r_{R̄[Gal(E(n)/K)]} H¹(O_{E(n),S_n},B)`. The reduction is the map (9) of §6.3. The full Galois group ring is used; no splitting `Gal(E(n)/K)≃Gal(E/K)×H_n` is assumed. `H_n`-invariant descent identifies the resulting class with `⋂^r_ℛ H¹(O_{E,S_n},B)`, then with `⋂^r_ℛ H¹(O_{K,S_n},A)` by Shapiro. Then `D_n·c̄_n` is `H_n`-invariant and defines the Kolyvagin derivative `κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A)`. With `𝓘_n` the augmentation ideal of `ℤ[H_n]` and `G_n ≅ ⟨∏_{q | n}(σ_q − 1)⟩ ⊆ 𝓘_n^{ν(n)}/𝓘_n^{ν(n)+1}`, write `P_q^m` for the image of `P_q(Fr_q^{-1})` in `R̄⊗𝓘_m/𝓘_m²` when `q∤m`. For `m=q₁⋯q_t` define `Δ_m=det(B_m)`, where `(B_m)_{ij}=0` if `i=j` and `P_{q_j}^{q_i}` otherwise; put `Δ_1=1` (empty determinant) and `Δ_q=0`. Define `κ(c)_n=Σ_{d|n}(κ′(c_d)⊗∏_{q|d}(σ_q−1))Δ_{n/d}`, transporting `κ′(c_d)` to `S_n` and multiplying the disjoint augmentation factors. This is the explicit correction formula of §6.4, p.41; and Theorem: `κ(c)_n ∈ ⋂^r_ℛ H¹_{F_can(n)}(K, A) ⊗ ⟨∏_{q | n}(σ_q − 1)⟩` and `v_q(κ(c)_n) = φ^fs_q(κ(c)_{n/q})` for every `q | n`; so `κ(c) ∈ KS_r(A, F_can)`. For a subfield `F` of `E/K` and `A_F = Ind_{G_F}^{G_K}(T/MT)` this gives the canonical homomorphism `D_r = D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can)`, independent of `E` and of the generators `σ_q`, with `D_r(c)_1 = c_F (mod M)`.

The precise hypotheses are `r ≥ 1`; Hypotheses 6.1, 6.7, 6.11; `M` a power of `p`.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Theorem 6.12, p. 41). The derivative classes form a Kolyvagin system of `rank r`.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Corollary 6.13, p. 42). The homomorphism `D_r`.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Proposition 6.10, p. 40). The uncorrected derivative.

Invariance: `(σ_q − 1)D_q = |G_q| − N_{G_q}` (Layer 3.1 The norm and Kolyvagin derivative operators) and the Euler system relation, as in Layer 3.4 Invariance of the derivative of the universal class, now in the bidual (Lemma 6.9); descent to `K` uses Hypothesis 6.1 (Proposition 6.10): reflexivity and `H⁰ = 0` identify invariants of the bidual with the bidual over the base.

Local properties and the correction: reduce to rank one by the rank-reduction formalism (the compatible-functional-lift construction below and the contractions of Layer 6.3) applied to `Φ ∈ ⋀^{r−1}`, then use Layer 3.13 Local behaviour of derivative classes and the correction of Layer 3.17 The map from Euler systems to Kolyvagin systems (Mazur–Rubin Appendix `A`), whose hypothesis `(b)` is Hypothesis 6.11.

Independence of generators: the class is recorded in the tensor factor `⟨∏(σ_q − 1)⟩ ≅ G_n`.

BSS II §6.5, Lemma 6.20: lift each `(r−1)`-fold functional at a finite level first across `E(n)/E` using self-injective duality, then through coefficient reduction, then to a compatible global tower family. Rank reduction tests all these functionals. Rank-one local compatibility proves membership and the finite–singular edge relation, whose contraction sign `(−1)^{r−1}` occurs on both sides and cancels. For the integral normalization, construct the injection `i: ⋂^r_{R[G/H]} M^H → ⋂^r_{R[G]} M` for a finite abelian `G`, subgroup `H` and `O`-free `R[G]`-lattice `M`, and the induced `r`-fold norm `N_H^r`. They satisfy `i(N_H^r x)=N_H x` for `r≥1`; `i` is not the unscaled map of exterior powers induced by `M^H⊆M`. The functional restriction is surjective because `M/M^H` is `O`-torsion-free and the Gorenstein dual is exact on these lattices (Layer 0.2, `FiniteSelmerDuality.gorensteinOrderDual`). This is Sano 2014 Lemmas 2.10–2.11 and Remark 2.12, pp.5–7, with the order-valued extension justified by self-injective duality. For finite coefficients use the free-ambient reduction square of Layer 6.3 and BSS §6.3 map (9), rather than asserting an arbitrary invariants/base-change equivalence. Lemma 6.20 then provides `Ψ` with `Φ(κ′(c_d))=κ′(Ψ(c)_d)` simultaneously for every `d|n`. Build the inverse-limit lift with these compatible restriction and reduction maps, not independent choices at each level.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystems.rawHigherDerivative`: `κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A)`.
- `TauCeti.EulerSystems.deltaCorrection`: The determinant `Δ_m` of the zero-diagonal matrix with off-diagonal entries `P_{q_j}^{q_i}`, in the indicated disjoint augmentation factors; `Δ₁=1` and `Δ_q=0`.
- `TauCeti.EulerSystems.higherDerivative`: `D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can)`.
- `TauCeti.EulerSystems.higherDerivative_one`: `D_r(c)_1 = c_F` modulo `M`, under `⋂^r_{R̄[𝒢_F]} H¹(O_{F,S}, T/M) ≅ ⋂^r_{R̄[𝒢_F]} H¹(O_{K,S}, A_F)`.
- `TauCeti.EulerSystems.higherDerivative_singular`: `v_q(D_r(c)_n) = φ^fs_q(D_r(c)_{n/q})` for `q | n`.
- `TauCeti.EulerSystems.higherDerivative_indep`: For fixed `E`, the corrected classes are independent of cyclic generators in the intrinsic tame tensor factor. For `E⊆E′` over a fixed target `F`, restriction of the corrected family through the normalized transfer and the coefficient/Shapiro maps gives the same `D_r^F` (Corollary 6.13).
- `TauCeti.EulerSystems.higherDerivative_rank_one`: At conductor one in rank one, the raw descended class agrees with coefficient reduction of the Rubin initial component under Shapiro and bidual evaluation. The full corrected-family comparison, with Euler and augmentation conventions, is stated in Layer 7.5.

**Checks.**

- `TauCeti.EulerSystems.higherCorrection_empty`: The empty correction determinant `Δ₁` equals 1.
- `TauCeti.EulerSystems.higherCorrection_one_prime`: For one prime, the zero-diagonal correction determinant is zero.
- `TauCeti.EulerSystems.higherDerivative_two_primes`: For two primes, `Δ=−P_{q₂}^{q₁}P_{q₁}^{q₂}`, retaining the negative cross-term in the corrected derivative.
- `TauCeti.EulerSystems.higherDerivative_zero`: The higher derivative takes the zero Euler system to zero.
- `finite_bidual_coefficients`: For `X=𝔽_p`, the positive-degree exterior bidual over `ℤ_p` is zero because `Hom_{ℤ_p}(X,ℤ_p)=0`, whereas its degree-one bidual over `𝔽_p` is `𝔽_p`. Integral bidual reduction and the bidual of reduced cohomology are related by §6.3’s specified coefficient map, not identified by changing the base ring silently.
- `TauCeti.EulerSystems.higherDerivative_needs_611`: `A` nonzero trivial rank-one representation fails Frobenius injectivity 6.11 at every selected prime.

Rank zero is excluded from Theorem 6.12: its proof contracts `r−1` functionals. For `r = 1, K = ℚ, R = O, E = ℚ: D_1` is the map of Layer 3.17 The map from Euler systems to Kolyvagin systems reduced modulo `M`, after the dictionary `P_q(Fr_q^{-1})` between the conventions (Layer 2.6 Changing the Euler factors).

`D_r` is `R[[Gal(𝒦/K)]]`-semilinear through `Gal(𝒦/K) → Gal(F/K)`.

Additional arithmetic check: For `n = 1: κ′(c_1) = c̄_E`, the image of `c_E`.

Additional arithmetic check: For `n = q: κ(c)_q = κ′(c_q) ⊗ (σ_q − 1)`, with singular part `φ^fs_q(c_F mod M)` at `q`.

*Needs:* Layer 7.1 Euler systems of `rank r`; Layer 6.7 Kolyvagin systems of `rank r` and the regulator map; Layer 6.3 Selmer contractions and coefficient change; Layer 3.1 The norm and Kolyvagin derivative operators; Layer 3.13 Local behaviour of derivative classes; Layer 3.17 The map from Euler systems to Kolyvagin systems; Layer 0.7 The canonical and the unramified Selmer structures; Layer 2.6 Changing the Euler factors.

### 7.3 The Rubin–Brumer–Stark element and Rubin's conjecture

In the setting of Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice let `Θ_{S₀,T} ∈ ℚ[G]^−` be the Stickelberger element for `S₀ ⊇ S_∞ ∪ S_ram` and `T`. The Rubin–Brumer–Stark element is the unique `u_RBS ∈ ⋀^r_{ℚ[G]} ℚU_{V,T}^−` with `ord_G(u_RBS) = Θ_{S₀,T}`. It depends on the choice of the `w_j` only up to multiplication by an element of `G`. Rubin's conjecture is the proposition `u_RBS ∈ 𝓛`; its validity is independent of the `w_j`. It is stated here as a proposition and is a hypothesis of any application of the higher-rank machinery to these elements: a conjectural Rubin–Stark element is an Euler system of `rank r` only once its integrality (membership in the bidual lattices) and its norm relations along `Ω(𝒦/K)` are proved. Dasgupta–Kakde prove its prime-to-2 part (Theorem 1.6); that theorem is not imported here. Applications assume the specified Rubin–Stark integrality and norm relations at every tower level.

The precise hypotheses are as in Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice; `Θ_{S₀,T} ∈ ℚ[G]^−` defined by the partial zeta values at 0.

([Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3), §1.2, p. 8). Definition of `u_RBS`.

([Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3), Conjecture 1.5, p. 8). Rubin's conjecture.

Existence and uniqueness: `ord_G` is an isomorphism (Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice).

Dependence on `w_j`: replacing `w_j` by `g·w_j` multiplies `ord_G` by a group element.

The definition exposes the following operations and relations.

- `TauCeti.RubinStark.rubinBrumerStark`: `u_RBS = ord_G⁻¹(Θ_{S₀,T})`.
- `TauCeti.RubinStark.ordG_rubinBrumerStark`: `ord_G(u_RBS) = Θ_{S₀,T}`.
- `TauCeti.RubinStark.rubinBrumerStark_change_w`: For another choice of the `w_j, u_RBS` changes by multiplication by an element of `G`.
- `TauCeti.RubinStark.RubinConjecture`: The proposition `u_RBS ∈ 𝓛`, with no instance provided.
- `TauCeti.RubinStark.rubinConjecture_indep`: RubinConjecture does not depend on the choice of the `w_j`.

**Checks.**

- `TauCeti.RubinStark.rubinBrumerStark_zero`: Zero `Θ` gives zero Rubin–Brumer–Stark element and satisfies the integrality conjecture.
- `TauCeti.RubinStark.rubinBrumerStark_unique`: Any minus element with `ord_G(x)=Θ` equals the Rubin–Brumer–Stark element.
- `TauCeti.RubinStark.rubinConjecture_not_projector`: The minus projector `(1−c)/2` over `ℚ[C₂]` is not the coefficientwise image of an integral group-ring element.

For `r = 1: u_RBS` is the Brumer–Stark unit and Rubin's conjecture is the Brumer–Stark conjecture.

Layer 7.7 Archimedean and minus-unit Rubin–Stark dictionaries records the dictionary and the parity boundary; BSS Theorem 7.1 is a separate conditional application.

Additional arithmetic check: For `r = 1, u_RBS` is the element of `ℚU_{V,T}^−` with `Σ_σ [σ^{-1}] ord_w(σu) = Θ_{S₀,T}`: the Brumer–Stark unit, and RubinConjecture is `u ∈ U_{V,T}`.

Additional arithmetic check: RubinConjecture is not the statement `u_RBS ∈` image of `⋀^r_{ℤ[G]} U_{V,T}^−`: Layer 6.1 Exterior biduals of Selmer modules integrality can be weaker when `r≥2`. Use the explicit minus-part lattice computation of Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice as an algebraic witness; strictness is not asserted for every arithmetic unit lattice.

*Needs:* Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice; Layer 7.1 Euler systems of `rank r`.

### 7.4 Fitting-ideal control from higher-rank Euler systems

Let `p > 3, r ≥ 1, c ∈ ES_r(T, 𝒦), F = F_can, F` a subfield of `E/K` and `A_F = Ind_{G_F}^{G_K}(T/MT)`. Assume Hypotheses 6.1, 6.7, 6.11 and Hypotheses 3.2, 3.3, 4.2 for `A_F` and `F_can`, and let `κ(c) = D_r^F(c)`. Then `(i)` for `n ∈ N, im(κ(c)_n) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F(n)^*}(K, A_F^*(1))^*)`; in particular `im(c_F) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*)`; (ii) for every `i ≥ 0, I_i(κ(c)) ⊆ Fitt^i_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*)`. In `(i)`, equality holds whenever `κ(c)` is a basis of `KS_r`, without a principal-ring assumption. For the higher `I_i` in (ii), equality for a basis is asserted when `R̄[𝒢_F]` is a principal ideal ring. These are containments of ideals of the group ring `R̄[𝒢_F]`, which is not a domain: they are not valuation formulas and do not reduce to orders of underlying groups.

The precise hypotheses are `p > 3`; Hypotheses 6.1, 6.7, 6.11; 3.2, 3.3, 4.2 for `A_F`.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Corollary 6.15, p. 42). The Fitting-ideal bounds.

Apply Layer 6.8 The regulator isomorphism and structure of Kolyvagin systems of `rank r(b)` to `κ(c) ∈ KS_r(A_F, F_can)`, with `κ(c)_1 = c_F`.

For the Rubin–Stark setting (Theorem 7.1): `im(η^χ_{L/K,S}) ⊆ Fitt⁰_O((ℤ_p ⊗ Cl(O_L))^χ)`, conditionally on the Rubin–Stark conjecture.

For `r = 1` over a discrete valuation ring this is the bound of Layer 4.20 The Kolyvagin system bound in Fitting-ideal form.

*Needs:* Layer 7.2 The higher Kolyvagin derivative; Layer 6.8 The regulator isomorphism and structure of Kolyvagin systems of `rank r`; Layer 6.2 The Burns–Sakamoto–Sano hypotheses; `PadicMeasuresIwasawaAlgebras Layer 6`.

### 7.5 Rank-one specialisation of the higher-rank theory

On common admissible towers satisfying 6.7, under Hypothesis 6.1 and the universal-norm/unramified comparison, `ES_1(T, 𝒦)` is the module of Layer 2.2 The module of Euler systems with coefficients `R`, with the dictionary `P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) =` Rubin's `P(Fr_q^{-1} | T^*; x)`; `KS_1(A, F)` is Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits for `A`; `D_1` is the map of Layer 3.17 The map from Euler systems to Kolyvagin systems modulo `M` (over `ℚ`) and supplies that map over a general number field `K` under Hypotheses 6.1, 6.7 and 6.11; and for `R` a discrete valuation ring the bound `I_0(κ) ⊆ Fitt⁰` is `length H¹_{F^*} ≤ ∂^{(0)}(κ)` of Layer 4.20 The Kolyvagin system bound. The conventions differ in two places, both explicit: the Euler factor (Layer 2.1 Euler polynomials and their conventions) and the identification `G_q ≅ ⟨σ_q − 1⟩ ⊆ 𝓘/𝓘²` (Mazur–Rubin's `ρ_q`).

The precise hypotheses are Hypotheses 6.1 and 6.7 on a common tower, plus the cohomology/unramified and coefficient dictionaries; Hypothesis 6.11 for the derivative comparison; rank-one admissibility and a DVR for the length/Fitting comparison.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), Remark 6.5, p. 37). Rank-one Euler systems are the classical ones.

`⋂^1 =` identity on reflexive modules (Layer 6.1 Exterior biduals of Selmer modules); compare definitions termwise.

The correction terms of Theorem 6.12 for `r = 1` are those of Mazur–Rubin's Appendix `A`, cited by the source.

For `T = ℤ_p(1) ⊗ χ^{-1}` over `ℚ` both constructions give the cyclotomic-unit Kolyvagin system modulo `M`.

*Needs:* Layer 7.2 The higher Kolyvagin derivative; Layer 3.17 The map from Euler systems to Kolyvagin systems; Layer 2.1 Euler polynomials and their conventions; Layer 4.20 The Kolyvagin system bound.

### 7.5a Arithmetic determinantal systems and derivative surjectivity

Use the coefficient order `R`, representation `T`, ramification sets `S(F)` and tower `𝒦/K` of §7.1, with odd `p`, Hypothesis 6.1 at every finite level and `Y_K(T)=⊕_{v∈S_∞(K)}H⁰(K_v,T^*(1))` free of rank `r≥1`. Fix an ordered basis of `Y_K(T)`. In Burns–Sano I the coefficient is the dual lattice `T^*(1)`; its Euler classes therefore have coefficients `T`, as here. Take its smoothing set `Σ=∅`. The arithmetic determinant constructions in this subsection belong to this roadmap. They use the supplied determinant functor and compact-support duality on the actual cohomology complexes.

**Vertical determinants and basic Euler systems.** Construct the perfect complexes `C_{F,U}(T)=RHom_R(RΓ_c(O_{F,U},T^*(1)),R)[−2]` with their contragredient group-ring action, for finite `F⊆𝒦` and `U⊇S(F)`. Establish their cohomology, derived coefficient-change and localization triangles. Put `VS(T,𝒦)=lim_F det_{R[Gal(F/K)]} C_{F,S(F)}(T)`. The downward transition is the determinant norm followed by localization and the evaluation trivialization of each added finite local two-term complex; the group-ring involution is retained. Prove transitivity and surjectivity of the finite determinant transitions and freeness of `VS` of rank one over `R[[Gal(𝒦/K)]]`. Construct `θ:VS(T,𝒦)→ES_r(T,𝒦)` from determinant evaluation using the chosen archimedean basis, prove its integral bidual range and every Euler norm relation, and define the basic Euler systems `Eᵇ(T,𝒦)=im θ`. These constructions require Hypothesis 6.1 and the displayed archimedean freeness, rather than any conjectural special-value element.

([David Burns and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems](https://arxiv.org/abs/1612.06187v1), §2.4, Definition 2.8 and Proposition 2.10; Hypotheses 2.11 and 2.15, Theorem 2.17, Definition 2.18 and §2.6). The arithmetic determinant systems and their integral Euler-system map, with the dual-lattice dictionary above.

- `TauCeti.EulerSystems.verticalDeterminantSystem`: `VS(T,𝒦)` on the actual compact-support complexes with the stated norm/localization transitions.
- `TauCeti.EulerSystems.basicEulerSystemMap`: The map `θ`; `TauCeti.EulerSystems.basicEulerSystems` is its image in `ES_r(T,𝒦)`.

**Checks.**

- The transition for `F=F′` is the identity. For `F⊆F′⊆F″`, the two downward determinant maps agree with the direct one, including the local evaluation factors.
- If `F′/F` adds exactly one ramified prime `q`, the constructed Euler classes satisfy `Cor(c_{F′})=P_q(Fr_q⁻¹)c_F`; omitting the localization factor would instead give an incorrect norm relation when this Euler factor is a nonunit.
- Zero in `VS` gives the zero Euler family. A unit change of the archimedean determinant basis rescales `θ` by a unit and preserves its image; the construction asserts no distinguished special-value basis.

**Horizontal determinants and the regulator square.** At a coefficient level `M=p^m`, take `E` as in §7.2, `A_E=Ind_{G_E}^{G_K}(T/MT)` and `R_E=(R/MR)[Gal(E/K)]`. Assume Hypotheses 6.7 and 6.11, and 3.2, 3.3 and 4.2 for `A_E` with the common refined prime set of BSS II Remark 6.16. Assume also `H⁰(K_v,A_E^*(1))=0` for every finite `v∈S`. Construct `HS(A_E)=lim_n det_{R_E} C_{K,S_n}(A_E)` from derived reduction of the preceding complexes; its transitions are induced by the local singular-cohomology triangles and their rank-one determinant trivializations. Build the natural surjection `π_M:VS(T,𝒦)→HS(A_E)` and the isomorphism `h_M:HS(A_E)≃SS_r(A_E,F_can)`. Identify the full-at-`S` structure in Burns–Sano with `F_can` under the displayed local vanishing. Prove the arithmetic comparison `D_r^E∘θ=Reg_r∘h_M∘π_M` as a square of maps out of `VS`, including the Euler–Stark congruences, the correction determinants of §7.2, and the functional-first contractions of §6.3 with the signed regulator of §6.7. Normalize `h_M` by the ordered determinant trivializations and removed-primes-first transitions of §§6.5 and 6.9; use the same order in the Euler–Stark congruences. Componentwise the square reads `(D_r^E(θ(z)))_n = (−1)^{ν(n)} C_{φ,n}((h_M(π_M(z)))_n)`. This normalization transports the arithmetic comparison, including its permutation signs. The maps commute with reduction `p^{m+1}→p^m`, admissible enlargement of `E` and restriction to `F⊆E`; these are comparisons of the arithmetic constructions, not arbitrary choices of rank-one module maps.

([David Burns and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems](https://arxiv.org/abs/1612.06187v1), Definition 3.2, Theorem 3.11(ii), §4.3.2 and the proof of Theorem 4.16; [Burns–Sakamoto–Sano II](https://arxiv.org/abs/1805.08448v1), proof of Corollary 6.17, pp.43–44). The horizontal systems, vertical-to-horizontal surjection and comparison with the higher derivative; the local vanishing implies the horizontal local obstruction is zero.

- `TauCeti.EulerSystems.horizontalDeterminantSystem`: `HS(A_E)` with its localization transitions.
- `TauCeti.EulerSystems.verticalToHorizontal_surjective`: Surjectivity of `π_M` under these hypotheses.
- `TauCeti.EulerSystems.determinantRegulatorSquare`: `D_r^E∘θ=Reg_r∘h_M∘π_M`, compatible with the stated coefficient and field maps.

**Checks.**

- At conductor one the comparison gives `(D_r^E(θ(z)))₁=θ(z)_E mod M`; the Stark regulator has the same leading component.
- At one prime `q`, `Δ_q=0` and `Δ₁=1`; the comparison gives `(D_r^E(θ(z)))_q = −ι_{φ^fs_q}((h_M(π_M(z)))_q)`. On the free model `v=e₁*`, `φ=e₂*`, `ε_q=e₁∧e₂`, its value is `e₁` and its edge value is `1=φ(ε₁)`; there is no additional diagonal term.
- Reducing a vertical determinant system directly modulo `p^m` or via `p^{m+1}` gives the same horizontal Stark and Kolyvagin systems. Changing the auxiliary field `E` and descending to the same `F` also gives the same system.

**Surjectivity of the higher derivative.** Under all the preceding finite-level hypotheses and `p>3`, prove `D_r^F:ES_r(T,𝒦)→KS_r(A_F,F_can)` surjective for every `F⊆E`; indeed its restriction to `Eᵇ(T,𝒦)` is surjective. The square, surjectivity of `π_M`, the isomorphisms `h_M` and `Reg_r`, and the coefficient map from `A_E` to `A_F` prove this assertion. For `p=3` assume the residual representation `T̄` is not isomorphic to `T̄^*(1)` on every local coefficient factor, and use the Mazur–Rubin prime-selection theorem as in BSS II Remark 6.19; the same surjectivity conclusion holds. For a Gorenstein order assume Hypothesis 4.7, Hypothesis 4.2 of the same positive rank at every `p^m` level of the induced representations, and `H⁰(E_w,(T/pT)^∨(1))=0` for every finite `w|S`, as in Corollary 6.18(iii). Construct the compatible derivative into `KS_r(T_F,F_can)` and prove its surjectivity. Reduce first modulo `p`, lift a basis through the arithmetic determinant square, and apply Nakayama to the free rank-one order module; coefficient compatibility makes the lifted Euler system a basis at every level. For semilocal orders apply this argument on each local factor. This supplies the basis needed for unconditional all-system Fitting equalities; the Rubin–Stark conjecture is needed only to select its particular arithmetic family.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), proof of Corollary 6.17, pp.43–44; Corollary 6.18(iii) and Remark 6.19, pp.44–45). The derivative-surjectivity argument and its order and nonselfdual variants.

- `TauCeti.EulerSystems.higherDerivative_surjective`: Surjectivity at finite level with the archimedean freeness and finite-place vanishing above.
- `TauCeti.EulerSystems.higherDerivative_order_surjective`: Surjectivity into the positive-rank order Kolyvagin module, with its compatible finite-level maps under the displayed order hypotheses.

**Checks.**

- A map with image `pO⊊O` into a rank-one Kolyvagin module satisfies the general Fitting inclusions but contains no basis. The determinant square must rule out this image; the existence of a derivative map alone does not do so.
- A basis of `KS_r(A_F)` lifts to a basic Euler system; multiplying that system by a nonunit need not retain a basis. The ideal generated by all systems includes the original basis and is unchanged by including such multiples.
- Over a local order a compatible derivative whose reduction modulo `p` generates is itself a basis by Nakayama. Unrelated preimages at separate finite levels do not define a single Euler system in the order limit.

*Needs:* Layers 7.1–7.2; Layer 6.8; IntegralIwasawaTheory §12.6; PadicMeasuresIwasawaAlgebras §5.1; ArithmeticGaloisDuality §§D7.1, D7.3–D7.7; SelmerIwasawaCohomology §§2.21–2.24, 3.10.

### 7.6 Euler-system and Rubin–Stark class-group bounds

Let `p` be odd, `χ` a nontrivial finite character of `G_K` of order prime to `p` with `χ≠ω, L` its fixed field, `O=ℤ_p[im χ], T_χ=O(1)⊗χ⁻¹`, and `r=|S_∞(K)`|. Every archimedean place of `K` splits in `L`. Fix `S⊇S_∞(K)∪S_ram(L/K), |S|>r`, an ordered set of archimedean places and places above them, and the pro-`p` abelian tower `𝒦/K` of BSS II §7 satisfying Hypothesis 6.7 for `S∪S_p`. No `p`-adic place splits completely in `L/K`, and `p>3` or `χ²≠ω`. Write `C_χ=(ℤ_p⊗Cl(O_L))^χ` and `I_i(T_χ)` for the `O`-ideal generated by `I_i(κ(c))` as `c` ranges over every rank-`r` Euler system on this tower. Then `I_i(T_χ)⊆Fitt^i_O(C_χ)` for every `i≥0`. If no finite place of `S` splits completely in `L/K`, equality holds for every `i` and `C_χ≃⊕_{i≥0}I_{i+1}(T_χ)/I_i(T_χ)`. If Rubin–Stark Conjecture `B′` holds for `LF/K` for every finite `F⊆𝒦`, its elements have integral `χ`-components in the cohomological biduals and the norm relations make a rank-`r` Euler system `c^RS`; hence `im(η^χ_{L/K,S})⊆Fitt⁰_O(C_χ)`. Only this last conclusion assumes the conjecture. No Leopoldt hypothesis is imposed.

The precise hypotheses are Every displayed character, archimedean splitting, tower, `S`, and `p` hypothesis; The Rubin–Stark conclusion assumes the full Conjecture `B′` at every finite `LF/K`, including rationality and integral bidual membership of the elements characterized by the ordered archimedean regulator. Integrality at `L` alone is insufficient.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §7, equation (14) and Theorem 7.1`(i)`–(iii), pp. 47–50; Remarks 7.2–7.3, p. 50). Character assumptions, class-group identification, unconditional all-system ideals and conditional Rubin–Stark element.

Kummer theory identifies the canonical dual Selmer module with the `χ`-class group of `O_L[1/p]` (BSS equation (14)). The no-`p`-splitting condition makes its projection from `C_χ` an isomorphism.

Rank-one `T_χ` and `χ≠1,ω` verify the representation and freeness conditions; the archimedean splitting and local non-splitting give core `rank r` and the local hypotheses of Corollary 6.18.

Apply Corollary 6.18`(ii)` for every higher-`i` inclusion; `(i)` is its leading-term case. With no finite split `S`-place, the hypotheses of §7.5a give a basic Euler system whose derivative is a basis, and Corollary 6.18`(iii)` gives equality. Here `O` is a DVR, so the ordinary ideals `I_i` suffice. The invariant-factor formula then follows from these successive Fitting ideals; it uses no Rubin–Stark conjecture.

Conjecture `B′` at every tower level gives rational Rubin–Stark elements characterized by the ordered archimedean regulator, with integral `χ`-components. Their source norm relations and the unit/Kummer dictionaries give `c^RS`. Apply the zeroth Fitting bound at its base component. This interface records a rational family with norm relations as input, then the integral-range predicate; it does not construct that family unconditionally from complex `L`-values.

*Needs:* Layer 7.5a Arithmetic determinantal systems and derivative surjectivity; Layer 7.4 Fitting-ideal control from higher-rank Euler systems; Layer 7.1 Euler systems of `rank r`; Layer 6.2 The Burns–Sakamoto–Sano hypotheses; `SelmerIwasawaCohomology Layer 2`; the explicitly assumed archimedean Rubin–Stark family and its regulator/norm relations.

### 7.7 Archimedean and minus-unit Rubin–Stark dictionaries

The two constructions share the integral bidual condition but have different character and regulator data. BSS II §7 takes `T_χ=O(1)χ⁻¹, r=|S_∞(K)`| and `χ` trivial on every real decomposition group: for totally real `K` these are even characters and the ordered regulator uses archimedean places. `DK` §1.2 takes a CM abelian `H/F` with `F` totally real, projects to the minus part (characters odd on complex conjugation), and `rank r` counts chosen finite split primes; `ord_G` is the determinant of their valuations and `u_RBS=ord_G⁻¹Θ_{S₀,T}`. Their lattice is the rational minus component intersected with the integral `ℤ[G]`-bidual, followed by `p`-adic/character projection for odd `p`. Thus `DK` Theorem 1.6 proves the specialized minus-unit integrality away from 2; this roadmap does not import it, and it is not an instance of BSS Theorem 7.1. Applying the general higher-rank derivative/Fitting machinery to `DK` families requires separate integrality at every level, actual norm relations, and the appropriate Selmer/tower hypotheses. Neither an equality between the two elements nor a class-group bound from Theorem 7.1 is inferred across these incompatible parity hypotheses.

The precise hypotheses are The BSS §7 setting for the first dictionary; the CM minus and finite split-prime `DK` setting for the second; `p` odd when projecting `DK` integrality away from 2; no assertion at `p=2`.

([David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1), §7, pp. 48–50). Archimedean splitting, `χ, r` and conditional tower elements.

([Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3), §1.2, equations (8)–(10), Conjecture 1.5 and Theorem 1.6, pp. 7–9). Minus units, finite split primes, valuation regulator and away-from-2 integrality.

Read the regulator-defining equations in BSS §7 and `DK` §1.2: archimedean splitting forces even real character parity, whereas the minus projector forces odd parity.

Use the integral bidual lattice identification of Layer 6.1 to express both integrality conditions; the chosen ranks and regulator maps remain those of their separate arithmetic inputs.

`DK` Theorem 1.6 yields membership after inverting 2. General Euler-system applications still require a norm-compatible integral family and the BSS hypotheses, not just a base-level unit.

*Needs:* Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice; Layer 7.3 The Rubin–Brumer–Stark element and Rubin's conjecture; Layer 7.6 Euler-system and Rubin–Stark class-group bounds; `PadicMeasuresIwasawaAlgebras Layer 6`.

### Examples

The zero higher-rank family satisfies every norm relation.

A nonzero ramified-cohomology class annihilated by a nonzero scalar contradicts the torsion-free form of Hypothesis 6.1`(i)`.

The empty correction determinant `Δ₁` equals 1.

### Dependencies

This layer uses Layer 6.1 Exterior biduals of Selmer modules; Layer 2.2 The module of Euler systems; Layer 2.1 Euler polynomials and their conventions; `PadicMeasuresIwasawaAlgebras Layer 6`; Layer 7.1 Euler systems of `rank r`; Layer 6.7 Kolyvagin systems of `rank r` and the regulator map; Layer 6.3 Selmer contractions and coefficient change; Layer 3.1 The norm and Kolyvagin derivative operators; Layer 3.13 Local behaviour of derivative classes; Layer 3.17 The map from Euler systems to Kolyvagin systems; Layer 0.7 The canonical and the unramified Selmer structures; Layer 2.6 Changing the Euler factors; Layer 6.4 `T`-modified `S`-units, the order map and Rubin's lattice; Layer 7.2 The higher Kolyvagin derivative; Layer 6.8 The regulator isomorphism and structure of Kolyvagin systems of `rank r`; Layer 6.2 The Burns–Sakamoto–Sano hypotheses; Layer 4.20 The Kolyvagin system bound; Layer 7.4 Fitting-ideal control from higher-rank Euler systems; `SelmerIwasawaCohomology Layer 2`; the explicitly assumed archimedean Rubin–Stark family and its regulator/norm relations; Layer 7.3 The Rubin–Brumer–Stark element and Rubin's conjecture; Layer 7.6 Euler-system and Rubin–Stark class-group bounds.

For `T=ℤ_p(1)` over a field containing `μ_p`, the unmodified cohomology can have torsion and fail Hypothesis 6.1`(i)`. `A Σ`-modified theory needs an additional comparison before the conclusions can apply; it is outside the assertions under Hypothesis 6.1 here (BSS Remark 6.3).

Layer 7.2 constructs modulo-`M` transfer and compatible functional lifting. The ordered archimedean regulator family is an explicit arithmetic hypothesis in Layer 7.6, with its parity and character dictionary in Layer 7.7.

## Layer 8: Rank-one Iwasawa variation

### 8.1 `Z_p^d`-extensions in which no finite prime splits completely

Let `K` be a number field and `p` a prime. `A Z_p^d`-extension of `K` is an abelian extension `K∞/K`, inside a fixed algebraic closure `K̄`, together with the profinite group `Γ = Gal(K∞/K)` and a topological isomorphism `Γ ≅ Z_p^d` for some `d ≥ 1`. It is admissible (Rubin's standing hypothesis of Definition II.1.1(ii) and of Chapter II §3) when no finite prime of `K` splits completely in `K∞/K`; equivalently, for every finite prime `v` of `K` the decomposition group `D_v ⊂ Γ` is infinite. The finite subextensions `K ⊂_f F ⊂ K∞` form a directed set; for a complete discrete valuation ring `O` finite over `Z_p` put `Λ_F = O[Gal(F/K)]` and `Λ = O[[Γ]] = lim_F Λ_F` (the completed group ring of PadicMeasuresIwasawaAlgebras L1), with the `O`-algebra involution `ι` induced by `γ ↦ γ^{-1}` (Rubin's `η ↦ η^•`).

The precise hypotheses are `d ≥ 1`; the trivial extension is excluded; Admissibility is a property of `K∞/K` alone, not of any representation; It fails for the anticyclotomic `Z_p`-extension of an imaginary quadratic field, where every rational prime inert in `K` and away from `p` splits completely; that tower is handled by Howard's `Λ`-adic Kolyvagin systems (Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10)) or by Rubin's condition (*) (Layer 8.11 Rubin's condition (*) at completely split primes), never by this definition.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §1, Definition 1.1(ii), p. 21 (published: Definition 2.1.1(ii))). The definition and its standing admissibility hypothesis.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §1, Remark 1.2, p. 22). The characterisation by infinite decomposition groups (the API item `noSplitPrimes_iff`).

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, opening paragraph and Notation, pp. 26–27). The setting of all Iwasawa-theoretic statements of this layer; `Λ = O[[Γ]] = lim Λ_F` is fixed in the same Notation paragraph.

A closed subgroup of `Z_p^d` is finite only if it is trivial, so a finite prime `v` splits completely in `K∞/K` exactly when `D_v = 1`; this is Rubin's Remark II.1.2.

`K∞/K` is unramified at every finite `v ∤ p`: by class field theory (Tau Ceti ClassFieldTheory layer 12) the inertia subgroup of `Γ` at `v` is the image of the pro-`p` completion of `O_v^×`, which is finite for `v ∤ p`, and `Γ` is torsion-free.

If `K∞` contains the cyclotomic `Z_p`-extension `K^cyc`, the decomposition group of `v` in `Γ` surjects onto that in `Gal(K^cyc/K)`. For `v ∤ p` the Frobenius of `v` acts on `μ_{p^∞}` by `Nv ∈ Z_p^×`, which is not a root of unity since `Nv > 1`, so its image in `Gal(K^cyc/K) ≅ Z_p` is nonzero and generates an infinite subgroup; for `v | p` the extension `K^cyc/K` is ramified at `v` with infinite inertia. Hence `K∞/K` is admissible (Remark II.1.2).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.ZpdExtension`: `A Z_p^d`-extension of `K`: an abelian extension `K∞ ⊂ K̄` with a topological group isomorphism `Gal(K∞/K) ≅ Z_p^d, d ≥ 1`.
- `TauCeti.EulerSystem.ZpdExtension.NoSplitPrimes`: The predicate that no finite prime of `K` splits completely in `K∞/K`.
- `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_iff_infinite_decompositionGroup`: NoSplitPrimes holds iff the decomposition group `D_v ⊂ Γ` is infinite for every finite prime `v` of `K`.
- `TauCeti.EulerSystem.ZpdExtension.unramified_of_not_dvd_p`: `K∞/K` is unramified at every finite prime `v` not above `p`.
- `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_of_cyclotomic_le`: If `K∞` contains the cyclotomic `Z_p`-extension of `K` (built from Mathlib's IsCyclotomicExtension tower), then NoSplitPrimes holds.
- `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_mono`: If `K∞ ⊂ K∞`' are `Z_p^d`- and `Z_p^{d'}`-extensions of `K` and `K∞/K` is admissible then so is `K∞`'/`K`, since decomposition groups surject.
- `TauCeti.EulerSystem.ZpdExtension.iwasawaAlgebra`: `Λ = O[[Γ]] = lim_F O[Gal(F/K)]` over the finite subextensions `F`, with projections `Λ → Λ_F` and the involution `ι`.
- `TauCeti.EulerSystem.ZpdExtension.layer_finite`: Every finite subextension `F` has `Gal(F/K)` a finite abelian `p`-group, and the `F` form a cofinal directed system indexed by the open subgroups of `Γ`.

**Checks.**

- `TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes`: For `p` odd, the cyclotomic `Z_p`-extension `Q∞/Q` is admissible: the Frobenius of a prime `ℓ ≠ p` maps to the image of `ℓ` in `Z_p^×/μ_{p−1} ≅ Z_p`, which has infinite order, and `p` is totally ramified.
- `TauCeti.EulerSystem.ZpdExtension.inert_p_need_not_split`: For `K=ℚ(√−7)` and `p=3`, the prime above 3 is inert and cannot split completely in the anticyclotomic `ℤ₃`-extension. There is only one prime above 3, and the tower is unramified away from 3; complete splitting would give an infinite everywhere unramified abelian extension, contradicting finiteness of the class group.
- `TauCeti.EulerSystem.ZpdExtension.anticyclotomic_not_noSplitPrimes`: For `K = Q(√−7), p = 3` and `K∞` the anticyclotomic `Z_3`-extension of `K`, the prime 5 is inert in `K` and splits completely in `K∞/K`: a Frobenius of 5 lies in the coset of `Gal(K∞/Q)` acting on `Γ` by inversion, so its square, the Frobenius of `5O_K`, is trivial.
- `TauCeti.EulerSystem.ZpdExtension.split_iff_decompositionGroup_trivial`: For every finite prime `v, v` splits completely in `K∞/K` iff `D_v = 1` iff `D_v` is finite.
- `TauCeti.EulerSystem.ZpdExtension.trivial_excluded`: The trivial extension `K/K` is not a `Z_p^d`-extension (`d ≥ 1` is required); in it every prime splits completely, so no admissibility statement is made about it.

For `K = Q, p` odd, the cyclotomic `Z_p`-extension is admissible.

For `K = Q(√−7), p = 3` and `K∞` the anticyclotomic `Z_3`-extension, the prime 5 (inert in `K`) splits completely, so this `K∞/K` is not admissible.

*Needs:* `PadicMeasuresIwasawaAlgebras Layer 1`; `TauCetiRoadmap.ClassFieldTheory Layer 12`.

### 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`

Let `K∞/K` be admissible, `T` a free `O`-module of finite rank with a continuous action of `G_K` unramified outside finitely many primes, `V = T ⊗_O Φ, k = O/ϖ`, and `K(1)` the maximal `p`-extension of `K` inside the Hilbert class field. `Hyp(K∞, T): (i)` there is `τ ∈ G_{K∞}` acting trivially on `μ_{p^∞}`, on `(O_K^×)^{1/p^∞}` and on `K(1)`, such that `T/(τ−1)T` is free of rank one over `O`; (ii) `T ⊗ k` is an irreducible `k[G_{K∞}]`-module. `Hyp(K∞, V): (i)` there is such a `τ` with `dim_Φ V/(τ−1)V = 1`; (ii) `V` is an irreducible `Φ[G_{K∞}]`-module. These are the hypotheses `Hyp(K, T), Hyp(K, V)` of EulerSystemsAndKolyvaginSystems Layer 4 (Rubin's Theorem II.2.2) with `G_K` replaced by `G_{K∞}`, and `Hyp(K∞, T) ⇒ Hyp(K∞, V), Hyp(K∞, T) ⇒ Hyp(K, T), Hyp(K∞, V) ⇒ Hyp(K, V)`.

The precise hypotheses are Irreducibility is required over `G_{K∞}`, not over `G_K`: irreducibility over `G_K` is strictly weaker; `τ` is an element of `G_{K∞}`; Rubin's Chapter VII fixes it once and for all; These are Rubin's hypotheses; Mazur–Rubin's `(H.0)`–`(H.6)` and Kato's hypotheses `(i)`–`(v)` of his Theorem 13.4 are different records; relating them requires separate implication lemmas (Layer 1.17 for the Mazur–Rubin records), and none is imported for Kato's hypotheses.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Hypotheses `Hyp(K∞, T)`, p. 27 (published p. 41)). The definition of `Hyp(K∞, T)` with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, p. 27). The relation to the finite-level hypotheses of Layer 4.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §2, Remark 2.4, p. 24). The rank-one example (stated for `Hyp(K, T)`; the same argument applies over `G_K∞`).

`Hyp(K∞, T)(i) ⇒ Hyp(K∞, V)(i): V/(τ−1)V = (T/(τ−1)T) ⊗ Φ`.

`Hyp(K∞, T)`(ii) `⇒ Hyp(K∞, V)`(ii): a `G_{K∞}`-stable `Φ`-subspace `V′ ≠ 0, V` gives the saturated sublattice `T ∩ V′`, whose reduction is a proper nonzero `G_{K∞}`-submodule of `T ⊗ k`.

Replacing `G_{K∞}` by the larger group `G_K` preserves both clauses, giving the implications to `Hyp(K, ·)`.

Since `τ` fixes `μ_{p^∞}, dim_Φ V*/(τ−1)V* = 1` as well (Rubin, Chapter VII §1), where `V* = Hom(V, Φ(1))`.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.IwasawaHypT`: The record `Hyp(K∞, T)`: an element `τ` of `G_{K∞}` with the three triviality conditions, a proof that `T/(τ−1)T` is free of rank one over `O`, and irreducibility of `T ⊗ k` over `G_{K∞}`.
- `TauCeti.EulerSystem.IwasawaHypV`: The record `Hyp(K∞, V): τ ∈ G_{K∞}` with the triviality conditions and `dim_Φ V/(τ−1)V = 1`, and irreducibility of `V` over `G_{K∞}`.
- `TauCeti.EulerSystem.IwasawaHypT.toHypV`: `Hyp(K∞, T)` implies `Hyp(K∞, V)` with the same `τ`.
- `TauCeti.EulerSystem.IwasawaHypT.toBase`: `Hyp(K∞, T)` implies Layer 4's `Hyp(K, T)`, and `Hyp(K∞, V)` implies `Hyp(K, V)`.
- `TauCeti.EulerSystem.IwasawaHypV.dual`: Under `Hyp(K∞, V)(i), dim_Φ V*/(τ−1)V* = 1` for `V* = Hom(V, Φ(1))`.
- `TauCeti.EulerSystem.IwasawaHypT.of_rank_one`: If `rank_O T = 1` then `Hyp(K∞, T)` holds with `τ = 1`.
- `TauCeti.EulerSystem.IwasawaHypT.twist_iff`: For a character `ρ` of `Γ, Hyp(K∞, T⊗ρ) ⇔ Hyp(K∞, T)` and `Hyp(K∞, V⊗ρ) ⇔ Hyp(K∞, V)`, because `G_{K∞}` acts on `T⊗ρ` as on `T`.
- `TauCeti.EulerSystem.IwasawaHypT.aTau_eq_one`: Under `Hyp(K∞, T)` the constant `a_τ` of Layer 8.10 Rubin's evaluation maps and the constant `a_τ` equals 1 (Rubin, Lemma VII.1.3(ii)).

**Checks.**

- `TauCeti.EulerSystem.IwasawaHypT.rank_one_example`: For `T = O_{χ^{-1}}(1)` with `χ` a finite-order character, `Hyp(Q∞, T)` holds with `τ = 1`.
- `TauCeti.EulerSystem.IwasawaHypT.elliptic_surjective`: For `E/Q` with `ρ_{E,p}: G_Q → GL_2(Z_p)` surjective and `p` odd, `Hyp(Q∞, T_pE)` holds: take `τ ∈ G_{Q(μ_{p^∞})}` with `ρ(τ) =` (1 1; 0 1), so `det ρ(τ) = 1, τ` fixes `μ_{p^∞}` and the `p`-power roots of `±1, K(1) = Q, T/(τ−1)T ≅ Z_p`, and `E[p]` is irreducible over `G_{Q∞}` because `ρ̄(G_{Q∞}) ⊇ SL_2(F_p)`.
- `TauCeti.EulerSystem.IwasawaHypV.cm_fails`: For `E/Q` with complex multiplication and `p` odd, no `τ ∈ G_{Q(μ_{p^∞})}` has dim `V_pE/(τ−1)V_pE = 1`: on the Cartan part `τ` has eigenvalues `u, u^{-1}`, both 1 or neither; off it, `det ρ(τ) = 1` and trace 0 force eigenvalues `±√−1`. So `Hyp(Q∞, V_pE)(i)` fails.
- `TauCeti.EulerSystem.IwasawaHypV.irreducible_K_not_Kinf`: For `p` odd, `K`' the first layer of `K∞/K` and `ψ` a character of `G_{K'}` with `ψ^σ ≠ ψ` for a generator `σ` of `Gal(K'/K), V = Ind_{K'}^{K} ψ` is irreducible over `G_K`, but `V` restricted to `G_{K∞}` is a sum of characters, so `Hyp(K∞, V)`(ii) fails while `Hyp(K, V)`(ii) holds.

Rank one: for `rank_O T = 1` both hypotheses hold with `τ = 1`.

Elliptic curves: for `E/Q` with `ρ_{E,p}` surjective onto `GL_2(Z_p), p` odd, and `K∞ = Q∞, Hyp(Q∞, T_pE)` holds with `ρ(τ)` unipotent.

CM elliptic curves fail `Hyp(Q∞, V_pE)(i)`.

*Needs:* Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; Layer 0.1 Selmer triples and squarefree conductors; Layer 4.3 Rubin's hypotheses, index of divisibility and error terms.

### 8.3 The Iwasawa module `X∞` of the restricted Selmer groups

Let `K∞/K` be admissible, `W* = Hom(T, μ_{p^∞})` and `D = Φ/O`. For `K ⊂_f F ⊂ K∞` let `S_{Σp}(F, W*) ⊂ H¹(F, W*)` be Rubin's restricted Selmer group: classes whose localisation is 0 at every prime above `p` and lies in `H¹_f(F_w, W*)` at every other place (the Selmer module of SelmerIwasawaCohomology L2 with the strict condition on `Σ_p`). Define `S_{Σp}(K∞, W*) = colim_F S_{Σp}(F, W*)` along restriction, a discrete `Λ`-module, and `X∞ = Hom_O(S_{Σp}(K∞, W*), D)` with the contragredient action `(γφ)(s) = φ(γ^{-1}s)`, a compact `Λ`-module. Together with the Iwasawa cohomology `H¹_∞(K, T) = lim_F H¹(F, T)` along corestriction (SelmerIwasawaCohomology L3) this is Rubin's Definition II.3.1.

The precise hypotheses are `X∞` is built from the restricted Selmer groups `(strict at p)`. The true Selmer group, with chosen local conditions at `p`, is Layer 8.8 The true Iwasawa Selmer group and the singular local term at `p`; the two are related by Proposition II.3.7; The `Λ`-action on `X∞` is the contragredient one; with the other convention every characteristic ideal is replaced by its image under `ι`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Definition 3.1, p. 28 (published Definition 2.3.1)). The construction with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §4, proof of Lemma 4.1, p. 110). The coinvariants identity recorded as an API item.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §2, proof of Lemma 2.4, p. 103). The contragredient convention for duals used throughout Chapter VII.

The restriction maps `S_{Σp}(F, W*) → S_{Σp}(F', W*)` for `F ⊂ F`' are compatible, so the colimit is a discrete `O[[Γ]]`-module, `Γ` acting through the conjugation action on each `H¹(F', W*)` (SelmerIwasawaCohomology §2.4 (Functoriality of Selmer modules)).

`X∞` is its Pontryagin dual (SelmerIwasawaCohomology §2.10 (Pontryagin duals with the contragredient action)) with the stated action; it is a finitely generated `Λ`-module by `x`-infinity-finitely-generated.

For `F = K`, and every `d ≥ 1`, Pontryagin duality gives `X∞/JX∞ = Hom(S_{Σp}(K∞, W*)^{Γ}, D)` for the augmentation ideal `J`, the identity used in Rubin's Lemma VII.4.1.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.restrictedSelmerInf`: `S_{Σp}(K∞, W*) = colim_F S_{Σp}(F, W*)`, a discrete `Λ`-module.
- `TauCeti.EulerSystem.Xinf`: `X∞ = Hom_O(S_{Σp}(K∞, W*), D)` with `(γφ)(s) = φ(γ^{-1}s)`, a compact `Λ`-module.
- `TauCeti.EulerSystem.restrictedSelmerInf.res`: The restriction maps `S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{Gal(K∞/F)}`.
- `TauCeti.EulerSystem.Xinf_coinvariants`: For every `F, X∞ ⊗_Λ Λ_F ≅ Hom_O(S_{Σp}(K∞, W*)^{Gal(K∞/F)}, D)`; for `F = K` this is `X∞/JX∞`.
- `TauCeti.EulerSystem.Xinf_finitelyGenerated`: `X∞` is a finitely generated `Λ`-module (Layer 8.20 `X∞` is finitely generated over `Λ`).
- `TauCeti.EulerSystem.Xinf_twist`: For `ρ: Γ → O^×, X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ` as `Λ`-modules (Rubin, Proposition VI.2.1(ii) and proof of Theorem VI.4.1).
- `TauCeti.EulerSystem.Xinf_eq_mazurRubin`: For `K = Q` and `K∞ = Q∞`, Shapiro's lemma identifies `X∞` with Mazur–Rubin's `X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p)` for the canonical `Λ`-adic Selmer structure of Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures: at `ℓ ≠ p` the conditions `H¹_f` vanish in the colimit because every `ℓ ≠ p` has infinite decomposition group. The identification is semilinear for the involution `ι`: with `G_Q` acting on `Λ` through `Ψ` and `Λ` acting on a Pontryagin dual by `(λφ)(x) = φ(λx)`, Mazur–Rubin's `X∞` is this `X∞` with `Λ` acting through `ι`, so its characteristic ideal is `ι(char X∞)`.

**Checks.**

- `TauCeti.EulerSystem.Xinf_rat_Zp1`: For `K = Q, p` odd, `K∞ = Q∞` and `T = Z_p(1)` (so `W* = Q_p/Z_p`), `S_{Σp}(Q_n, Q_p/Z_p)` is the dual of the Galois group of the maximal abelian `p`-extension of `Q_n` unramified everywhere and split completely at `p`; since `p` is totally ramified in `Q∞/Q` and `h(Q) = 1`, the class numbers of the `Q_n` are prime to `p` and `X∞ = 0`.
- `TauCeti.EulerSystem.Xinf_coinvariants_rank_one`: For `d = 1, X∞/(γ − 1)X∞` is the Pontryagin dual of `S_{Σp}(K∞, W*)^Γ`, for `γ` a topological generator of `Γ`.
- `TauCeti.EulerSystem.Xinf_not_true_selmer`: `X∞` is not in general the dual of the true Selmer group: for `T = T_pE (E/Q)` with `H¹_f(F_w, V) = 0` at `p`, the kernel `H¹_{∞,s}(Q_p, T)/loc^s(H¹_∞(Q, T))` of Proposition II.3.7 has `Λ`-rank at least `2 − 1 = 1`, since `H¹_∞(Q_p, T)` has `Λ`-rank 2 by the local Euler characteristic formula while `rank_Λ H¹_∞(Q, T) = rank T^- = 1` once `X∞` is torsion (Mazur–Rubin, Remark 5.3.18); so `Hom(S(Q∞, W*), D)` is not torsion although `X∞` is.
- `TauCeti.EulerSystem.Xinf_contragredient`: If `X∞ ≅ Λ/fΛ` with the contragredient action, then with the naive action `(γφ)(s) = φ(γs)` the same group is `Λ/ι(f)Λ`; the two conventions agree on characteristic ideals iff `char(X∞) = ι(char(X∞))`.

For `K = Q, K∞ = Q∞` and `T = Z_p(1), X∞ = 0`.

Twisting `T` by a character `ρ` of `Γ` replaces `X∞` by `X∞ ⊗ ρ`.

*Needs:* Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; `SelmerIwasawaCohomology §2.2 (Compact and rational Selmer kernel)`; `SelmerIwasawaCohomology §2.10 (Pontryagin duals with the contragredient action)`; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; `SelmerIwasawaCohomology §3.1 (Iwasawa cohomology)`; `PontryaginDual`.

### 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system

Let `c` be an Euler system for `(T, 𝒦, N)` in the sense of EulerSystemsAndKolyvaginSystems Layer 2 (Rubin, Definition II.1.1), with `K∞ ⊂ 𝒦` admissible. For `K ⊂_f F ⊂_f F`' `⊂ K∞`, no prime outside `N` ramifies in `F`'/`F`, so the Euler relation reads `Cor_{F'/F}(c_{F'}) = c_F`. Hence `c_{K,∞} = (c_F)_{K ⊂_f F ⊂ K∞} ∈ H¹_∞(K, T)`, and more generally `c_{L,∞} = (c_{LF})_F ∈ H¹_∞(L, T) = lim_F H¹(LF, T)` for `K ⊂_f L ⊂ 𝒦`. The map `ES(T, 𝒦, N) → H¹_∞(K, T), c ↦ c_{K,∞}`, is `O[[Gal(𝒦/K)]]`-linear, `Gal(𝒦/K)` acting on `H¹_∞(K, T)` through `Γ`, and `c_{K,∞}` lies in `lim_F S^{Σp}(F, T)` (classes unramified at every `v ∤ p`).

The precise hypotheses are The Euler factors at primes of `N` do not intervene because `N` is divisible by `p` and by every prime where `T` is ramified (Rubin, discussion after Remark II.1.2); The unramifiedness of `c_{K,∞}` away from `p` uses admissibility (infinite decomposition groups); without it Rubin's condition (*) is needed (Layer 8.11 Rubin's condition (*) at completely split primes).

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §1, discussion after Remark 1.2, p. 22). The norm-coherence that makes `c_{K,∞}` an element of `H¹_∞(K, T)`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Definition 3.1, p. 28). The construction with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI §2, p. 91). The variant `c_{L,∞}` used for twisting.

Universal norms: if `K ⊂_f F ⊂_f F`' `⊂ FK∞` then `Σ(F'/F)` is empty, so `Cor_{F'/F}(c_{F'}) = c_F` (Rubin, p. 22).

Linearity: `σ ∈ Gal(𝒦/K)` acts on Euler systems by `(σc)_F = σ(c_F)`, compatibly with corestriction.

Unramifiedness: every `v ∤ p` has infinite decomposition group in `K∞/K`, so the norm-coherent family is unramified at `v` (SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from `p`) (ii)); Rubin records `cK ∈ S^{Σp}(K, T)` via Corollary B.3.4 and Lemma I.3.5(ii).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.iwasawaClass`: The map `ES(T, 𝒦, N) → H¹_∞(K, T), c ↦ c_{K,∞} = (c_F)_F`.
- `TauCeti.EulerSystem.iwasawaClassAt`: For `K ⊂_f L ⊂ 𝒦, c ↦ c_{L,∞} = (c_{LF})_F ∈ H¹_∞(L, T)`.
- `TauCeti.EulerSystem.iwasawaClass_proj`: The image of `c_{K,∞}` under the projection `H¹_∞(K, T) → H¹(F, T)` is `c_F`; for `F = K` it is `c_K`.
- `TauCeti.EulerSystem.iwasawaClass_smul`: `c ↦ c_{K,∞}` is linear over `O[[Gal(𝒦/K)]]`, acting on `H¹_∞(K, T)` through `Gal(𝒦/K) → Γ`.
- `TauCeti.EulerSystem.iwasawaClass_zero`: The zero Euler system maps to 0.
- `TauCeti.EulerSystem.iwasawaClass_mem_unramified`: `c_{K,∞}` lies in `lim_F S^{Σp}(F, T)`.
- `TauCeti.EulerSystem.iwasawaClass_twist`: For `ρ: Γ → O^×` and the twisted Euler system `c^ρ` of Layer 8.9 Twisting Euler systems by characters of infinite order, `(c^ρ)_{K,∞}` is the image of `c_{K,∞} ⊗ ξ_ρ` under `H¹_∞(K, T) ⊗ ρ ≅ H¹_∞(K, T ⊗ ρ)`.
- `TauCeti.EulerSystem.iwasawaClass_eq_kappaOne`: For `K = Q, K∞ = Q∞`, the Euler-system-to-Kolyvagin-system map of Layer 8.17 From Euler systems to `Λ`-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3) sends `c` to `κ` with `κ_1 = (c_{Q_n})_n = c_{Q,∞}`.

**Checks.**

- `TauCeti.EulerSystem.iwasawaClass_zero_index`: For the zero Euler system `c_{K,∞} = 0`, and hence `ind_Λ(c) = 0`: Theorems II.3.2–II.3.4 say nothing (Rubin, Remark II.2.8).
- `TauCeti.EulerSystem.iwasawaClass_norm_coherent`: For `K ⊂ F ⊂ F`' `⊂ K∞, Cor_{F'/F}(c_{F'}) = c_F`. A restriction-compatible family `(res_{F'/F}(c_F) = c_{F'})` fails this test as soon as `([F′:F]−1)c_F ≠ 0` for some transition, since `Cor_{F'/F}∘res_{F'/F}` is multiplication by `[F′:F]`; the zero family passes both tests.
- `TauCeti.EulerSystem.iwasawaClass_proj_base`: The projection of `c_{K,∞}` to `H¹(K, T)` is `c_K`, the class whose index `ind_O(c)` Layer 4 uses.
- `TauCeti.EulerSystem.iwasawaClass_cyclotomic`: For the cyclotomic-unit Euler system for `T* = O_{χ^{-1}}(1)` over `Q∞` (an input family, Rubin Chapter III §2), the component of `c_{Q,∞}` at `Q_n` is the Kummer image of the `χ`-part of the norm of the cyclotomic `p`-units of `L_n`, so `Λc_{Q,∞}` corresponds to `C_{∞,χ}` (Rubin, Proposition III.2.6(i)).

Its projection to `H¹(K, T)` is `c_K`.

The zero Euler system maps to 0.

*Needs:* Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; Layer 2.2 The module of Euler systems; `SelmerIwasawaCohomology §3.1 (Iwasawa cohomology)`; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`.

### 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures

Let `K∞/K` be a `Z_p`-extension `(d = 1)` with `Γ = Gal(K∞/K), Λ = O[[Γ]], Ψ: G_K ↠ Γ ⊂ Λ^×` the tautological character, and `T` a free `O`-module of finite rank with a continuous `G_K`-action unramified outside a finite set. Put `𝐓 = T ⊗_O Λ` with `G_K` acting on both factors (on `Λ` through `Ψ`), so that Shapiro's lemma gives `H^i(K, 𝐓) ≅ lim_n H^i(K_n, T)` along corestriction (SelmerIwasawaCohomology §3.2 (Shapiro’s lemma for Iwasawa cohomology), which pins the twist), and `𝐓* = Hom(𝐓, μ_{p^∞})`. `A Λ`-adic Selmer structure `F_Λ` on `𝐓` is a Selmer structure over `R = Λ` (SelmerIwasawaCohomology L2, dual-selmer-structure): a finite set `Σ(F_Λ)` of places containing `∞`, the primes above `p` and the primes where `T` ramifies, and `Λ`-submodules `H¹_{F_Λ}(K_v, 𝐓) ⊂ H¹(K_v, 𝐓), v ∈ Σ(F_Λ)`; `F_Λ*` is its dual on `𝐓*` and `X = Hom(H¹_{F_Λ*}(K, 𝐓*), Q_p/Z_p)`. Two instances: `(a)` the canonical structure (Mazur–Rubin, Definition 5.3.2, `K = Q, K∞ = Q∞`): `H¹_{F_Λ}(K_v, 𝐓) = H¹(K_v, 𝐓)` for all `v ∈ Σ`, so `H¹_{F_Λ}(K, 𝐓) = H¹(K, 𝐓)`; `(b)` the ordinary structure (Howard, Definition 2.2.6; Castella–Grossi–Lee–Skinner §3.4): given `Fil_v T ⊂ T` at `v | p, H¹_{F_Λ}(K_v, 𝐓) =` image of `H¹(K_v, Fil_v T ⊗ Λ)`, and the unramified (Howard) or full (Castella et al.) condition at `v ∤ p`. `F_Λ` induces Selmer structures on the quotients `𝐓/I𝐓` by propagation.

The precise hypotheses are For the canonical structure, every `v ∤ p` must have infinite decomposition group in `K∞/K` (true for the cyclotomic `Z_p`-extension), so that `H¹(K_v, 𝐓) = H¹_ur(K_v, 𝐓)` and the structure does not depend on `Σ` (Mazur–Rubin, Lemma 5.3.1(ii)); The induced structure on a quotient `𝐓/I𝐓` is in general smaller than the full local cohomology: for a nonzero principal ideal `I = (f)`, the cokernel of `H¹(K_p, 𝐓) → H¹(K_p, 𝐓/f𝐓)` is `H²(K_p, 𝐓)[f]`. For a nonprincipal `I` no `I`-torsion formula is asserted: the cokernel is governed by the derived specialization `RΓ(K_p, 𝐓) ⊗^L_Λ Λ/I` and its `Tor` terms; Fix the `G_K`-action on `Λ` through `Ψ` and the specialized character `α_𝔓=Ψ` mod `𝔓`. Source formulas using `Ψ^{-1}` require simultaneous transport by `ι`; With `G_K` acting on `Λ` through `Ψ`, the Shapiro isomorphism `H¹(K, 𝐓) ≅ lim_n H¹(K_n, T)` is semilinear for the involution `ι`: multiplication by `γ ∈ Γ` on `𝐓` corresponds to the conjugation action of `γ^{-1}` on `lim_n H¹(K_n, T)` (SelmerIwasawaCohomology §3.2 (Shapiro’s lemma for Iwasawa cohomology): `𝓕_Γ(M)^ι ≅ (M ⊗ R̄)⟨1⟩`). Comparisons with Rubin's `H¹_∞(K, T), ind_Λ` and `X∞` in the first part of this layer therefore pass through `ι`; both sides of every divisibility are transported together, so the theorems agree.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Definition 5.3.2, p. 60). The canonical structure `(a)`.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, after Definition 5.3.2, p. 60). The propagation caveat.

([Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1), §2.2, Definition 2.2.6, p. 25). The ordinary structure `(b)`.

The local and global Shapiro identifications are SelmerIwasawaCohomology §§3.1–3.2 (Iwasawa cohomology and Shapiro); for `v ∤ p` with infinite decomposition group every norm-coherent family is unramified (universal-norms-unramified), which gives Mazur–Rubin's Lemma 5.3.1(ii) and makes `(a)` independent of `Σ`.

For `(b), Fil_v T ⊗ Λ ⊂ 𝐓` is `G_{K_v}`-stable; when `Fil_v T` is its own exact orthogonal complement under a pairing `T × T → O(1)`, the conditions on `𝐓` and `𝐀` are exact orthogonal complements under Howard's pairing `e_Λ` (Howard, Proposition 2.2.4 and the comment after Definition 2.2.5).

Propagation to quotients is SelmerIwasawaCohomology §2.5 (Propagating local conditions); for `I = (f)` with `f ≠ 0` the defect at `p` comes from the cohomology sequence of `0 → 𝐓 → 𝐓 → 𝐓/f𝐓 → 0`, multiplication by `f` being injective on the free `Λ`-module `𝐓`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystem.lambdaRep`: `𝐓 = T ⊗_O Λ` with the diagonal `G_K`-action through `Ψ`.
- `TauCeti.KolyvaginSystem.lambdaRep_cohomologyEquiv`: `H^i(K, 𝐓) ≅ lim_n H^i(K_n, T)` and `H^i(K_v, 𝐓) ≅ lim_n ⊕_{w|v} H^i(K_{n,w}, T)`, semilinear for `ι: λ ∈ Λ` acting on `𝐓` corresponds to `ι(λ)` acting through the conjugation action of `Γ` on the limits.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure`: `A` Selmer structure over `R = Λ` on `𝐓: Σ(F_Λ)` and `Λ`-submodules of local cohomology.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical`: The canonical structure: full local cohomology at every `v ∈ Σ`.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure.ordinary`: The ordinary structure attached to filtrations `Fil_v T` at `v | p`.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_selmer_eq`: For the canonical structure, `H¹_{F_Λ}(K, 𝐓) = H¹(K, 𝐓) = H¹(K_Σ/K, 𝐓)`.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure.quotient`: The induced structure on `𝐓/I𝐓` for an ideal `I ⊂ Λ`, by propagation.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure.dualX`: `X = Hom(H¹_{F_Λ*}(K, 𝐓*), Q_p/Z_p)`, a finitely generated `Λ`-module.
- `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_X_eq`: For `K = Q, K∞ = Q∞` and the canonical structure, `X` is Rubin's `X∞` of Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups with `Λ` acting through `ι` (the duals carrying `(λφ)(x) = φ(λx)`), so `char X = ι(char X∞)`.

**Checks.**

- `TauCeti.KolyvaginSystem.canonical_rat_selmer`: For `K = Q, K∞ = Q∞` and the canonical structure, `H¹_{F_Λ}(Q, 𝐓) = lim_n H¹(Q_n, T) = lim_n H¹(Q_Σ/Q_n, T)`.
- `TauCeti.KolyvaginSystem.canonical_unramified_away_from_p`: For `ℓ ≠ p, H¹(Q_ℓ, 𝐓) = H¹_ur(Q_ℓ, 𝐓)` (Mazur–Rubin, Lemma 5.3.1(ii)); a definition requiring the unramified condition at `ℓ ∈ Σ` therefore gives the same structure.
- `TauCeti.KolyvaginSystem.quotient_not_full`: For `T = Z_p(1)` over `Q∞` and `I = J` the augmentation ideal, `H²(Q_p, 𝐓) ≅ Z_p` with trivial `Γ`-action, so the induced condition `H¹_{F_Λ}(Q_p, Z_p(1))` has cokernel `H²(Q_p, 𝐓)[J] ≅ Z_p` in `H¹(Q_p, Z_p(1))`; the induced structure on `𝐓/J𝐓 = Z_p(1)` is not the full local cohomology.
- `TauCeti.KolyvaginSystem.quotient_maximal_ideal`: For odd `p`, `T = Z_p(1)` over `Q∞` and the maximal ideal `I = 𝔐 = (p, γ − 1)`, `H²(Q_p, 𝐓)[𝔐] = 0` because `H²(Q_p, 𝐓) ≅ Z_p`. The propagated condition is the image of the universal norms `p^{Z_p}`, the line spanned by the Kummer class of `p` in `H¹(Q_p, μ_p) ≅ 𝔽_p²`, so the cokernel is `𝔽_p`. The principal-ideal formula does not extend to `𝔐`.
- `TauCeti.KolyvaginSystem.ordinary_selfOrthogonal`: For `T = T_pE` with `E` ordinary at `v | p` and `Fil_v T = ker(T_pE → T_pẼ)`, the ordinary conditions on `𝐓` and `𝐀` are exact orthogonal complements under `e_Λ` (Howard, §2.2).

For the canonical structure over `Q∞, H¹_{F_Λ}(Q, 𝐓) = lim_n H¹(Q_n, T)`.

For `T = Z_p(1)` and `I = J` the augmentation ideal, `H¹_{F_Λ}(Q_p, Z_p(1)) ⊊ H¹(Q_p, Z_p(1))`.

For the `Γ`-convention witness, take a specialization over `ℤ₅` with `γ↦6`. Its involuted character has `γ↦1/6`, which is different from 6. The pair of factors `γ−6` and `γ−1/6` are exchanged up to a unit by `ι`; transporting just one side would change the divisibility.

*Needs:* `SelmerIwasawaCohomology §3.2 (Shapiro’s lemma for Iwasawa cohomology)`; `SelmerIwasawaCohomology §3.1 (Iwasawa cohomology)`; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`; `SelmerIwasawaCohomology §2.13 (Dual Selmer structures)`; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`; Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely.

### 8.6 Rubin's hypothesis `Hyp(K∞/K)`

For an admissible `Z_p^d`-extension `K∞/K` and `V = T ⊗ Φ: Hyp(K∞/K)` holds unless `rank_{Z_p} Γ = 1, G_{K∞}` acts on `V` either trivially or by the cyclotomic character, and `K` is neither a totally real field satisfying Leopoldt's conjecture (the `p`-adic completion of `O_K^×` injects into `(O_K ⊗ Z_p)^×`) nor an imaginary quadratic field. Equivalently: if `rank_{Z_p} Γ = 1` and `G_{K∞}` acts on `V` trivially or by `ε_cyc`, then `K` is totally real with Leopoldt's conjecture, or `K` is imaginary quadratic.

The precise hypotheses are The condition rules out a very special family of bad cases, all of rank one: by `Hyp(K∞, V)`(ii) the action of `G_{K∞}` on `V` can be scalar only if `dim V = 1`; It holds for `K = Q` (`O_Q^×` is finite, so Leopoldt's conjecture is trivially true).

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Hypothesis `Hyp(K∞/K)`, p. 27 (published p. 41)). The hypothesis with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, p. 27). Its role and the case `K = Q`.

It is used only through Lemma VII.3.7 (Layer 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7)), which shows `X∞/Ann_Λ(T)X∞` (resp. `X∞/Ann_Λ(T(−1))X∞`) finite in the two exceptional actions.

It depends only on the action of `G_{K∞}` on `V`, so it is invariant under twisting by characters of `Γ` (Rubin, proof of Theorem VI.4.1).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.LeopoldtTowerHyp`: The predicate `Hyp(K∞/K)` on `(K, K∞, V)`.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.of_two_le_rank`: If `rank_{Z_p} Γ ≥ 2` then `Hyp(K∞/K)` holds vacuously.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.of_action_not_scalar`: If `G_{K∞}` acts on `V` neither trivially nor by `ε_cyc` (in particular if `dim V ≥ 2` and `Hyp(K∞, V)`(ii) holds) then `Hyp(K∞/K)` holds.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.rat`: For `K = Q, Hyp(K∞/K)` holds for every `V`.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.imaginaryQuadratic`: For `K` imaginary quadratic, `Hyp(K∞/K)` holds for every `V`.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.twist_iff`: `Hyp(K∞/K)` holds for `V` iff it holds for `V ⊗ ρ, ρ` a character of `Γ`.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.of_totallyReal`: For `K` totally real satisfying Leopoldt's conjecture (the `p`-adic completion of `O_K^×` injects into `(O_K ⊗ Z_p)^×`), `Hyp(K∞/K)` holds for every `V`. Leopoldt's conjecture for abelian `K` (Brumer's `p`-adic Baker theorem with Ax's reduction) is not supplied by any roadmap earlier in the dependency order; abelian applications take it as a hypothesis.

**Checks.**

- `TauCeti.EulerSystem.LeopoldtTowerHyp.rat_cyclotomic_Zp1`: `K = Q, K∞ = Q∞, T = Z_p(1): Hyp(Q∞/Q)` holds, since `Q` is totally real and `O_Q^× = {±1}` is finite.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.pure_cubic_fails`: `K = Q(∛2)`, which has one real and one complex place, `K∞` its cyclotomic `Z_p`-extension and `T = Z_p(1): G_{K∞}` acts on `V` by `ε_cyc, rank Γ = 1`, and `K` is neither totally real nor imaginary quadratic, so `Hyp(K∞/K)` fails.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.Zp2_vacuous`: `K` imaginary quadratic and `K∞` its `Z_p²`-extension: `rank_{Z_p} Γ = 2`, so the hypothesis is vacuous.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.elliptic`: For `T = T_pE` with `Hyp(K∞, V)` and `dim V = 2, G_{K∞}` cannot act by a scalar character, so `Hyp(K∞/K)` holds for every `K`.

`K = Q` with its cyclotomic `Z_p`-extension satisfies the hypothesis for every `T`.

A cubic field with one complex place, with its cyclotomic `Z_p`-extension and `T = Z_p(1)`, does not.

*Needs:* Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`.

### 8.7 The `Λ`-adic index of divisibility `ind_Λ`

For `x ∈ H¹_∞(K, T)` let `ind_Λ(x) = {φ(x) : φ ∈ Hom_Λ(H¹_∞(K, T), Λ)}`, an ideal of `Λ`; for an Euler system `c, ind_Λ(c) = ind_Λ(c_{K,∞})` (Rubin, Definition II.3.1). For an ideal `𝔞` and a finitely generated torsion `Λ`-module `B`, '`char(B)` divides `𝔞`' means `𝔞 ⊂ char(B)`; `ind_Λ(c)` need not be principal.

The precise hypotheses are `H¹_∞(K, T)` is a finitely generated `Λ`-module (SelmerIwasawaCohomology L3), so `Hom_Λ(H¹_∞(K, T), Λ)` is finitely generated and `ind_Λ(x)` is a finitely generated ideal; `ind_Λ` is the `Λ`-analogue of Layer 4's `ind_O` (Rubin, Definition II.2.1); it is not Mazur–Rubin's principal ideal `Ind` (Layer 8.19 Mazur–Rubin's principal index `Ind(c)`), though divisibility by a principal ideal is the same for both.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Definition 3.1, p. 28). The definition with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), Ch. 2 §3, proof of Theorem 2.3.8, p. 43). The divisibility convention for a non-principal ideal, in the published text.

Every `φ` is `Λ`-linear, so `ind_Λ(λx) = λ·ind_Λ(x)` and `ind_Λ(x)` is an ideal.

Every `φ` kills the `Λ`-torsion; conversely, if `x` is not torsion then, `Λ` being a noetherian domain, `H¹_∞/torsion` embeds in a free module of finite rank and some coordinate of `x` is nonzero. Hence `ind_Λ(x) = 0` iff `x` is `Λ`-torsion.

For `d = 1`, the reflexive hull of `H = H¹_∞/torsion` is free over the two-dimensional regular local ring `Λ` (PadicMeasuresIwasawaAlgebras L4, reflexive-free-over-regular-local), `Hom_Λ(H, Λ) = Hom_Λ(H**, Λ)`, and in coordinates `x ↦ (a_1, …, a_r): ind_Λ(x) = (a_1, …, a_r)`, so a principal ideal `(f)` contains `ind_Λ(x)` iff `f` divides `gcd(a_i)`.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.lambdaIndex`: `ind_Λ(x) =` Ideal.`span {φ x | φ ∈ Module.Dual Λ H¹_∞(K, T)}`.
- `TauCeti.EulerSystem.lambdaIndex_smul`: `ind_Λ(λx) = λ · ind_Λ(x)`.
- `TauCeti.EulerSystem.lambdaIndex_eq_bot_iff`: `ind_Λ(x) = 0` iff `x ∈ H¹_∞(K, T)_{Λ-tors}`.
- `TauCeti.EulerSystem.apply_mem_lambdaIndex`: For every `φ ∈ Hom_Λ(H¹_∞(K, T), Λ), φ(x) ∈ ind_Λ(x)`.
- `TauCeti.EulerSystem.lambdaIndex_of_rank_one`: If `H¹_∞(K, T)`/torsion `≅ Λ` via `ψ` then `ind_Λ(x) = (ψ(x))`.
- `TauCeti.EulerSystem.lambdaIndex_le_span_iff`: For `d = 1` and `f ∈ Λ, ind_Λ(x) ⊂ (f)` iff `f` divides Mazur–Rubin's `Ind(x)` of Layer 8.19 Mazur–Rubin's principal index `Ind(c)` computed in the same module (across the `ι`-semilinear Shapiro identification with `H¹(Q, 𝐓)`, apply `ι`); so `char(B) | ind_Λ(x)` iff `char(B) | Ind(x)`.
- `TauCeti.EulerSystem.lambdaIndex_twist`: `Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c)` for `ρ: Γ → O^×` (Rubin, proof of Theorem VI.4.1).
- `TauCeti.EulerSystem.lambdaIndex_map_le`: For a `Λ`-linear `f: H¹_∞(K, T) → H′, ind_Λ(f x) ⊂ ind_Λ(x)` (every functional on `H′` pulls back).

**Checks.**

- `TauCeti.EulerSystem.lambdaIndex_free_rank_one`: If `H¹_∞(K, T) ≅ Λ` with `c_{K,∞} ↦ f`, then `ind_Λ(c) = fΛ`.
- `TauCeti.EulerSystem.lambdaIndex_not_principal`: If `H¹_∞(K, T) ≅ Λ² (d = 1)` and `x ↦ (p, γ − 1)`, then `ind_Λ(x) = (p, γ − 1)`, the maximal ideal of `Z_p[[Γ]]` when `O = Z_p`, which is not principal; a definition as `char(H¹_∞/Λx)` gives 0 (the quotient has rank one) and is wrong.
- `TauCeti.EulerSystem.lambdaIndex_torsion`: If `x` is `Λ`-torsion, `ind_Λ(x) = 0`.
- `TauCeti.EulerSystem.lambdaIndex_dvd_iff_Ind`: For `d = 1` and `x ↦ (a_1, …, a_r)` in a free reflexive hull, `(f) ⊇ ind_Λ(x)` iff `f | gcd(a_1, …, a_r)`, the generator of Mazur–Rubin's `Ind(x)`.

`H¹_∞ ≅ Λ` with `x ↦ f` gives `ind_Λ(x) = (f)`.

`H¹_∞ ≅ Λ²` with `x ↦ (p, γ − 1)` gives the non-principal `ind_Λ(x) = (p, γ − 1)`.

*Needs:* Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; `SelmerIwasawaCohomology §3.3 (Descent and control for Iwasawa cohomology)`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.6`; `Module.Dual`; `Ideal.span`.

### 8.8 The true Iwasawa Selmer group and the singular local term at `p`

For every `K ⊂_f F ⊂ K∞`, take the natural conjugation actions on local cohomology and require the local-condition input to be Galois equivariant: `g(H¹_f(F_w,V)) = H¹_f(F_{gw},V)` for every `g ∈ Gal(F/K)` and `w | p`. The actions commute with restriction, corestriction and localization along the tower, with `g′ ∈ Gal(F′/K)` acting downstairs through its restriction to `F`. Suppose there are subspaces `H¹_f(F_w, V) ⊂ H¹(F_w, V)` and `H¹_f(F_w, V*) ⊂ H¹(F_w, V*)` that are orthogonal complements under the local Tate pairing, with `Cor_{F'_{w'}/F_w} H¹_f(F'_{w'}, V) ⊂ H¹_f(F_w, V)` and `Res_{F'_{w'}/F_w} H¹_f(F_w, V*) ⊂ H¹_f(F'_{w'}, V*)` for `F ⊂ F`', `w`' | `w`. Propagate them to `T` and `W*` (SelmerIwasawaCohomology L2) and put `H¹_s = H¹/H¹_f, H¹(F_p, ·) = ⊕_{w|p} H¹(F_w, ·)`. Define `S(K∞, W*) = colim_F S(F, W*), H¹_{∞,s}(K_p, T) = lim_F H¹_s(F_p, T)`, and `loc^s_{Σp}: H¹_∞(K, T) → H¹_{∞,s}(K_p, T)` the localisation (Rubin, Remark II.3.6).

The precise hypotheses are orthogonal local conditions, Galois equivariance and compatible tower actions as above. Equivariance of the local Tate pairing gives `g(H¹_f(F_w,V*)) = H¹_f(F_{gw},V*)` for the dual condition. The two restriction/corestriction inclusions are equivalent by adjointness and orthogonality; equivariance is a separate input. The construction depends on the chosen `H¹_f` at `p`; ordinary, Bloch–Kato and unit conditions are inputs of the applications; SelmerIwasawaCohomology L2 and L4 supply their generic local carriers.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Remark 3.6, pp. 28–29 (published Remark 2.3.6, p. 42)). The data of the construction.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Remark 3.6, p. 29). The two modules with the same hypotheses and conclusion, expressed in roadmap notation.

The compatibilities give equivariant maps `S(F, W*) → S(F', W*)` and `H¹_s(F'_p, T) → H¹_s(F_p, T)`. Galois equivariance makes the semilocal conditions stable under permutation of places and conjugation; propagation to `T` and `W*` preserves this property. The continuous tower actions therefore induce the `Λ`-module structures on the compact inverse limit and the Pontryagin dual of the discrete direct limit. Localization descends to the singular quotients and is `Λ`-linear.

Each `H¹_s(F_w, T)` is `O`-torsion-free, as it injects into `H¹_s(F_w, V)` (Rubin, proof of Theorem II.2.10).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.trueSelmerInf`: `S(K∞, W*) = colim_F S(F, W*)` for compatible Galois-equivariant orthogonal conditions at `p`, with its continuous tower action.
- `TauCeti.EulerSystem.singularLocalInf`: `H¹_{∞,s}(K_p, T) = lim_F ⊕_{w|p} H¹_s(F_w, T)` as a compact `Λ`-module under the equivariant local-condition hypotheses.
- `TauCeti.EulerSystem.locSingularInf`: For the equivariant local-condition input above, `loc^s_{Σp}: H¹_∞(K, T) → H¹_{∞,s}(K_p, T)` is `Λ`-linear.
- `TauCeti.EulerSystem.restrictedSelmerInf_le_true`: `S_{Σp}(K∞, W*) ⊂ S(K∞, W*)`.
- `TauCeti.EulerSystem.compatible_cor_iff_res`: Corestriction-stability of `H¹_f(·, V)` is equivalent to restriction-stability of `H¹_f(·, V*)`.
- `TauCeti.EulerSystem.singularLocal_torsionFree`: Each `H¹_s(F_w, T)` is `O`-torsion-free.
- `TauCeti.EulerSystem.singularLocalInf_eq_zero_of_full`: If `H¹_f(F_w, V) = H¹(F_w, V)` for all `w | p`, then `H¹_{∞,s}(K_p, T) = 0` and `S(K∞, W*) = S_{Σp}(K∞, W*)`.

**Checks.**

- `TauCeti.EulerSystem.singularLocalInf_full_condition`: With `H¹_f(F_w, V) = H¹(F_w, V)` at all `w | p, H¹_f(F_w, V*) = 0`, the propagated condition on `W*` is 0, so `S(K∞, W*) = S_{Σp}(K∞, W*)` and `H¹_{∞,s}(K_p, T) = 0`.
- `TauCeti.EulerSystem.singularLocal_strict_condition`: With `H¹_f(F_w, V) = 0` at all `w | p, H¹_f(F_w, T)` is the torsion of `H¹(F_w, T)` and `H¹_s(F_w, T) = H¹(F_w, T)/H¹(F_w, T)_tors`.
- `TauCeti.EulerSystem.singularLocalInf_cyclotomic`: For `T* = O_{χ^{-1}}(1)` over `Q∞` with the unit condition, `H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ`, which is `O` if `χ(p) = 1` and 0 otherwise (Rubin, Proposition III.2.6(ii)).
- In the regular modules `O[C_{p^n}]` with quotient-group transition maps, the lines `O·[1]` are compatible but a nonidentity group element moves `[1]` outside its line. Their inverse limit `O·1 ⊂ O[[Γ]]` is not a `Λ`-submodule. Taking orthogonal complements under the dual evaluation pairings preserves the adjoint transition compatibility and still does not make these lines stable. Such conditions fail the Galois-equivariance input.
- `TauCeti.EulerSystem.singularLocal_not_torsion`: The `O`-torsion of `H¹(F_w, T)` is `H⁰(F_w, W)/image H⁰(F_w, V)`. For odd `p`, `F_w = ℚ_p` and `T` of rank one, unramified, with arithmetic Frobenius acting by `1+p`, this quotient is `O/p`; for trivial `T = O` it is zero although `H⁰(F_w, W) = W ≠ 0`. But `H¹_s(F_w, T)` never has torsion: a definition of `H¹_s` as `H¹(F_w, T)` modulo the image of `H¹_f(F_w, V)` without saturation fails this.

If `H¹_f(F_w, V) = H¹(F_w, V)` at every `w | p`, then `H¹_{∞,s}(K_p, T) = 0` and `S(K∞, W*) = S_{Σp}(K∞, W*)`.

*Needs:* Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`; `SelmerIwasawaCohomology §2.13 (Dual Selmer structures)`; `SelmerIwasawaCohomology §2.2 (Compact and rational Selmer kernel)`.

### 8.9 Twisting Euler systems by characters of infinite order

Let `c` be an Euler system for `(T, 𝒦, N)` with `K∞ ⊂ 𝒦` admissible, and `ρ: Gal(𝒦/K) → O^×` a continuous character factoring through a finite extension of `K∞` (for instance a character of `Γ`, possibly of infinite order). Write `T ⊗ ρ = T ⊗_O O_ρ` and fix a generator `ξ_ρ` of `O_ρ`. When `ρ` factors through `Γ = Gal(K∞/K)`, let `Tw_ρ: Λ → Λ` be the `O`-algebra automorphism induced by `γ ↦ ρ(γ)γ`; for a `ρ` that does not factor through `Γ`, `Tw_ρ` is not defined on `Λ` and no `Λ`-semilinear statement is made. `(a)` For `K ⊂_f L` and `ρ` a character of `Gal(LK∞/K)`, the cocycle map induces `G_K`-isomorphisms `H¹_∞(L, T) ⊗ ρ ≅ H¹_∞(L, T ⊗ ρ)` and `S_Σ(LK∞, W) ⊗ ρ ≅ S_Σ(LK∞, W ⊗ ρ)` for every finite `Σ ⊇ Σ_p` (Rubin, Proposition VI.2.1); when `ρ` factors through `Γ`, these are `Λ`-linear for the diagonal action on the twisted source. Using `ξ_ρ` to identify the source with its underlying untwisted module gives a `Tw_{ρ⁻¹}`-semilinear forward map `F`, satisfying `F(γb)=ρ(γ)⁻¹γF(b)`. `(b)` Choose `L ⊂ 𝒦` finite over `K` with `ρ` factoring through `Gal(LK∞/K)` and `LK∞/K` ramified only at `N, ∞` and the conductor of `ρ`. For `K ⊂_f F ⊂ 𝒦` let `c^ρ_F` be the image of `c_{FL,∞} ⊗ ξ_ρ` under `H¹_∞(FL, T) ⊗ ρ ≅ H¹_∞(FL, T ⊗ ρ) → H¹(FL, T ⊗ ρ) → H¹(F, T ⊗ ρ)`, the last map being `Cor_{FL/F}`. Then `c^ρ` is an Euler system for `(T ⊗ ρ, 𝒦, fN), f` the finite prime-to-`p` part of the conductor of `ρ`, independent of `L` (Definition VI.3.1, Remark VI.3.2, Theorem VI.3.5).

The precise hypotheses are `ρ` must factor through a finite extension of `K∞`; if needed one enlarges `K∞` to the compositum of all `Z_p`-extensions of `K` in `𝒦` (Rubin, Definition VI.3.1); There is in general no map `H¹(L, T) → H¹(L, T ⊗ ρ)` (Rubin, Remark VI.2.2): the construction must pass through `H¹_∞`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI, introduction, p. 89). The purpose of the construction.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI §3, Theorem 3.5, p. 93). Part `(b)` with the same hypotheses and conclusion, expressed in roadmap notation (Rubin's `K` is the field `𝒦` here).

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI §2, Proposition 2.1, p. 91). Part `(a)`.

`(a)` Write `LK∞ = ∪ L_n` with `ρ` trivial modulo `p^n` on `G_{L_n}`; then `H¹(L_n, T/p^n) ⊗ ρ ≅ H¹(L_n, (T⊗ρ)/p^n)`, and passing to the limit (Lemma B.3.1) gives the first isomorphism; for the Selmer groups one checks that the finite conditions at `w ∤ p` correspond, using that `ρ` is unramified at `w ∤ p` (Rubin, Proposition VI.2.1).

`(b)` The Euler relation for `c^ρ` follows from that of `c` and `det(1 − Fr_q^{-1}x | (T⊗ρ)*) = P(Fr_q^{-1}|T*; ρ(Fr_q)x)`, the primes ramified in `F`'`L` but not in `FL` being those ramified in `F`' but not in `F` and not dividing `fN` (Rubin, Theorem VI.3.5).

Independence of `L`: for `L ⊂ L`', `FL`'/`FL` is unramified outside `N, ∞` and the conductor of `ρ`, so `Cor_{FL'/FL}(c_{FL'}) = c_{FL}` (Remark VI.3.2).

For `ρ` of finite order, taking `L` the field cut out by `ρ` recovers Layer 2's finite-order twist (Remark VI.3.4); and `(c^ρ)^{ρ'} = c^{ρρ'}` when every divisor of `f_ρ f_{ρ'}` divides `f_{ρρ'}N` (Lemma VI.3.6).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.twistGamma`: `c ↦ c^ρ`, an Euler system for `(T ⊗ ρ, 𝒦, fN)`.
- `TauCeti.EulerSystem.twistGamma_eulerRelation`: The Euler factors of `c^ρ` are `P(Fr_q^{-1}|(T⊗ρ)*; x) = P(Fr_q^{-1}|T*; ρ(Fr_q)x)`.
- `TauCeti.EulerSystem.twistGamma_twistGamma`: `(c^ρ)^{ρ'} = c^{ρρ'}` when every divisor of `f_ρ f_{ρ'}` divides `f_{ρρ'}N`; in particular `(c^ρ)^{ρ^{-1}} = c` when `f_ρ | N`.
- `TauCeti.EulerSystem.twistGamma_of_finiteOrder`: For `ρ` of finite order, `c^ρ` is Layer 2's finite-order twist (Rubin, Definition II.4.1).
- `TauCeti.EulerSystem.iwasawaCohomologyTwistEquiv`: `H¹_∞(L,T)⊗ρ ≅ H¹_∞(L,T⊗ρ)` for `ρ` a character of `Gal(LK∞/K)`, `Λ`-linear for the diagonal source action when `ρ` factors through `Γ`; the forward map from the underlying untwisted module is `Tw_{ρ⁻¹}`-semilinear after choosing `ξ_ρ`.
- `TauCeti.EulerSystem.selmerTwistEquiv`: `S_Σ(LK∞,W)⊗ρ ≅ S_Σ(LK∞,W⊗ρ)` for finite `Σ⊇Σ_p`, and the same for `W*`, with the same diagonal linearity and underlying `Tw_{ρ⁻¹}`-semilinearity conventions as the cohomology comparison.
- `TauCeti.EulerSystem.exists_good_twist`: (Rubin, Lemma VI.1.3) `(i)` For `B` free of finite rank over `O` and subgroups `J_1`, …, `J_k` of `G_K` with infinite image in `Γ`, the `ρ ∈ Hom(Γ, O^×)` with `(B ⊗ ρ)^{J_i^{p^n}} = 0` for all `i, n` contain an open dense subset; (ii) for `B` a finitely generated torsion `Λ`-module, the `ρ` with `(B ⊗ ρ) ⊗_Λ Λ_F` finite for every `F` are dense.
- `TauCeti.EulerSystem.twistGamma_tate`: For `K∞` the cyclotomic `Z_p`-extension, twisting by `ω^{-n}ε_cyc^n` agrees with SelmerIwasawaCohomology §3.7 (Twisting Iwasawa cohomology) (Rubin, Chapter VI §5.1).

**Checks.**

- `underlying_twist_inverse`: For odd `p`, `B=Λ=ℤ_p[[Γ]]` and `ρ(γ)=1+p`, the underlying forward map satisfies `F(γb)=(1+p)⁻¹γF(b)`. A `Tw_ρ` rule would instead multiply by `1+p`. For the torsion test `B=Λ/(γ−1)`, the twisted characteristic generator is `γ−(1+p)`, and `Tw_ρ` sends it to the unit multiple `(1+p)(γ−1)`, confirming `Tw_ρ(char(B⊗ρ))=char(B)`.
- `TauCeti.EulerSystem.twistGamma_one`: For `ρ = 1, c^ρ = c`.
- `TauCeti.EulerSystem.twistGamma_eulerFactor_rank_one`: For `T = O(1), T* = O` and `P(Fr_q^{-1}|T*; x) = 1 − x`; for `T ⊗ ρ` the Euler factor is `1 − ρ(Fr_q)x`.
- `TauCeti.EulerSystem.twistGamma_not_pointwise`: For `ρ` nontrivial on `G_F, c^ρ_F` is not obtained from `c_F` alone: `H¹(F, T)` has no natural map to `H¹(F, T ⊗ ρ)` (Rubin, Remark VI.2.2); the definition through `c_{FL,∞}` is needed.
- `TauCeti.EulerSystem.twistGamma_finiteOrder_agrees`: For `ρ` of finite order with `L` the field cut out by `ρ, c^ρ` equals the twist of Rubin's Definition II.4.1 owned by Layer 2.
- `TauCeti.EulerSystem.twistGamma_not_Gamma_character`: For `K = ℚ`, `p = 5`, `K∞ = ℚ∞` and `ρ` the quadratic character of `ℚ(√2)`, `ρ` factors through the finite extension `ℚ(√2)ℚ∞` of `K∞`, so `c^ρ` is defined by `(b)`; but `Γ ≅ ℤ₅` has no nontrivial quadratic character, so `Tw_ρ` is undefined and the `Λ`-semilinear comparison does not apply.

`ρ = 1` gives `c^1 = c`.

For rank-one `T = O(1)` the Euler factor of `c^ρ` at `q` is `1 − ρ(Fr_q)x`.

*Needs:* Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; Layer 2.5 Twisting Euler systems by characters of finite order; Layer 2.1 Euler polynomials and their conventions; `SelmerIwasawaCohomology §3.1 (Iwasawa cohomology)`; `PadicMeasuresIwasawaAlgebras Layer 1`.

### 8.10 Rubin's evaluation maps and the constant `a_τ`

Assume `Hyp(K∞, V)` and fix `τ ∈ G_K` as in `Hyp(K∞, V)(i)`, fixing `K(1), K∞, μ_{p^∞}` and `(O_K^×)^{1/p^∞}`. Fix `θ*: W*/(τ−1)W* ≅ D`. Let `Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞}), Ω∞ = K∞Ω` and `Ω∞^{⟨τ⟩}` the fixed field of `τ`. The evaluation map `Ev*: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W*), D)` is `Ev*(σ)([c]) = θ*(c(σ))`. With `q_τ(x) = det(1 − τx | T)/(x − 1) ∈ O[x]`, the dual `θ: (W^{τ=1})_div ≅ D` of `θ*` (extended to `W^{τ=1}`) and `θ̄ = θ ∘ q_τ(τ^{-1}): W/(τ−1)W ↠ D`, the map `Ev: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W), D)` is `Ev(σ)([c]) = θ̄(c(σ))`; for `q ∈ R_{F,M,τ}` (primes whose Frobenius is conjugate to `τ` in `Gal(FΩ_M/K)`), `Ev_q(c) = θ(c(σ_q))`. Their `Λ_{F,M}`-valued forms `Ev`~ are the images under the `O`-isomorphism `Hom_O(B, O/M) ≅ Hom_Λ(B, Λ_{F,M}), ψ ↦ Σ_η ψ(ηb)η^{-1}`. Finally `a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{|Z|, |Z*|}`, where `Z` (resp. `Z*`) is the largest `G_{K∞}`-stable submodule of `(τ−1)W` (resp. `(τ−1)W*`) (Rubin, Definitions VII.1.1, 1.2, 2.1–2.5).

The precise hypotheses are The extension of `θ` to `W^{τ=1}` is not unique; two choices differ by an element of `Hom(W^{τ=1}/(W^{τ=1})_div, D)`, which `a_τ` kills; `Ev` and `Ev*` are not `Λ`-module maps: `G_{Ω∞}` is not a `Λ`-module. They are equivariant only for an action of `Z_p[[Γ_0]]` on `Gal(L/Ω∞), Γ_0 ⊂ Γ` of finite index, twisted by characters `χ, χ*` (Rubin, Proposition VII.5.1).

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Definition 1.2, p. 98). The constant `a_τ` with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Lemma 1.3, p. 98). Finiteness and the integral case.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Definition 1.1, p. 97). The map `Ev*`.

`Ev*` is well defined: `σ ∈ G_{Ω∞^{⟨τ⟩}}` acts on `W*` through `Gal(Ω∞/Ω∞^{⟨τ⟩})`, topologically generated by `τ`, so `(σ−1)W* ⊂ (τ−1)W* = ker θ*`; the cocycle relation makes it a homomorphism.

`a_τ` is finite: an infinite `Z` (resp. `Z*`) would give a proper `G_{K∞}`-stable subspace of `V` (resp. `V*`), against `Hyp(K∞, V)`(ii), and `[W^{τ=1} : (W^{τ=1})_div]` is finite since `W` has finite `corank` (Lemma VII.1.3(i)).

Under `Hyp(K∞, T)`, irreducibility of `T/ϖT` forces `Z = Z* = 0` and `W^{τ=1}` is divisible (Proposition A.2.5), so `a_τ = 1` (Lemma VII.1.3(ii)).

Lemma VII.2.4: composition with `Σ a_η η ↦ a_1` inverts `ψ ↦ ψ`~, and `(σψ)`~ `= σ^{-1}ψ`~, so the bijection is not `Λ_{F,M}`-linear.

Relations used in Propositions VII.1.4–1.6 and Theorem II.3.2 (proved from Layer 3's Theorems IV.5.1 and IV.5.4 and SelmerIwasawaCohomology L2's Theorem I.7.3): `Ev`~`(Fr_q)(κ_{F,r,M}) = Ev`~`_q(κ_{F,rq,M})` (Theorem VII.2.6) and `a_τ Ev`~`_q(S^{Σ_prq}(F, W_M)) Ev*(Fr_q) = 0` on `S_{Σ_pr}(F, W*_M)` (Theorem VII.2.7), whence `a_τ Ev`~`(γ)(κ_{F,r,M}) Ev*(γ) = 0` for `γ ∈ τG_{Ω∞}` (Corollary VII.2.8).

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.evalStar`: `Ev*: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W*), D), σ ↦ ([c] ↦ θ*(c(σ)))`.
- `TauCeti.EulerSystem.rubinEval`: `Ev: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W), D), σ ↦ ([c] ↦ θ̄(c(σ)))`.
- `TauCeti.EulerSystem.evalAt`: `Ev_q: H¹(F, W)_M → D` for `q ∈ R_{F,M,τ}, c ↦ θ(c(σ_q))`.
- `TauCeti.EulerSystem.aTau`: `a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{|Z|, |Z*|} ∈ Z_{>0}`.
- `TauCeti.EulerSystem.aTau_eq_one`: Under `Hyp(K∞, T), a_τ = 1`.
- `TauCeti.EulerSystem.groupRingDualEquiv`: `Hom_O(B, O/MO) ≅ Hom_Λ(B, Λ_{F,M})` as `O`-modules, `ψ ↦ (b ↦ Σ_η ψ(ηb)η^{-1})`, with `(σψ)`~ `= σ^{-1}ψ`~.
- `TauCeti.EulerSystem.rubinEval_frobenius_derivative`: `Ev`~`(Fr_q)(κ_{F,r,M}) = Ev`~`_q(κ_{F,rq,M})` for `r ∈ R_{F,M}` and `q ∈ R_{F,M,τ}` prime to `r` (Rubin, Theorem VII.2.6).
- `TauCeti.EulerSystem.rubinEval_pairing`: `a_τ Ev`~`_q(S^{Σ_prq}(F, W_M)) · Ev*_{S_{Σ_pr}(F, W*_M)}(Fr_q) = 0`, and `a_τ Ev`~`(γ)(κ_{F,r,M}) Ev*(γ) = 0` for `γ ∈ τG_{Ω∞}` (Rubin, Theorem VII.2.7, Corollary VII.2.8).
- `TauCeti.EulerSystem.rubinEval_semilinear`: There are `Γ_0 ⊂ Γ` of finite index, characters `χ, χ*: Γ_0 → O^×` and an abelian `L ⊃ Ω∞` such that `Ev|G_{Ω∞}` and `Ev*|G_{Ω∞}` factor through `Gal(L/Ω∞)`. For the induced maps on this quotient, `γ∈Gal(L/Ω∞)` and `η∈Γ_0`, one has `Ev(γ^η)=χ(η)η(Ev(γ))` and `Ev*(γ^η)=χ*(η)η(Ev*(γ))` (Rubin, Proposition VII.5.1).

**Checks.**

- `TauCeti.EulerSystem.aTau_rank_one`: For `rank_O T = 1` and `τ = 1: W^{τ=1} = W` is divisible and `(τ−1)W = 0`, so `a_τ = 1`.
- `TauCeti.EulerSystem.aTau_unipotent_lower_bound`: For `T = O²` with `τ` acting by the matrix `(1 ϖ^m; 0 1), m ≥ 1: W^{τ=1} = D ⊕ D[ϖ^m], (W^{τ=1})_div = D ⊕` 0, so `[W^{τ=1} : (W^{τ=1})_div] = |k|^m` divides `a_τ`; here `T/(τ−1)T ≅ O ⊕ O/ϖ^m` is not free, so `Hyp(K∞, T)(i)` fails although `dim V/(τ−1)V = 1`.
- `TauCeti.EulerSystem.evalStar_wellDefined`: `Ev*(σ)` does not depend on the cocycle representing `[c]`: changing `c` by a coboundary changes `c(σ)` by `(σ−1)w ∈ (τ−1)W* = ker θ*`.
- `evaluation_restriction_domain`: If `σ∈G_{Ω∞^{⟨τ⟩}}` has nontrivial restriction to `Ω∞`, it cannot represent an element of `Gal(L/Ω∞)`. Only `G_{Ω∞}` has the restriction quotient used by the factorization.
- `TauCeti.EulerSystem.rubinEval_not_Lambda_linear`: On `Gal(L/Ω∞)`, the induced `Ev` is not `Λ`-linear for the naive action: for `η ∈ Γ_0, Ev(γ^η) = χ(η)η(Ev(γ))` with the character `χ` of Proposition VII.5.1, which is nontrivial when the centre of `Gal(K(W)/K)` acts on `W` by a nontrivial scalar.

Rank one with `τ = 1: a_τ = 1`.

For `T = O²` with `τ` acting by `(1 ϖ^m; 0 1), m ≥ 1, |k|^m` divides `a_τ`.

*Needs:* Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`; Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 4.10 Rubin's selection of primes with large localisation; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.13 Local behaviour of derivative classes; Layer 3.14 Kolyvagin's congruence; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`.

### 8.11 Rubin's condition (*) at completely split primes

Let `K∞/K` be a `Z_p^d`-extension, not necessarily admissible, and `c` a collection satisfying all conditions of an Euler system for `(T, 𝒦, N)` except possibly the no-complete-splitting clause of Definition II.1.1(ii). Condition (*): for every prime `q` of `K` that splits completely in `K∞/K` and every finite extension `F` of `K` in `𝒦, (c_F)_q ∈ H¹_ur(F_q, T)`. Under (*), Theorems II.3.2, II.3.3 and II.3.4 hold without the assumption that no finite prime splits completely in `K∞/K`.

The precise hypotheses are Rubin gives the replacement argument as a remark (Chapter IX §2): (*) replaces the use of non-splitting in Proposition IV.6.1 and Corollary B.3.4, and the completely split primes, a set of density zero, are removed from the set `R` of auxiliary primes; Proposition II.3.7 is not claimed under (*): at a completely split prime the local Iwasawa cohomology is not unramified, so `H¹_∞(K, T) ≠ lim S^{Σp}(F, T)` in general.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. IX §2, p. 136). The condition with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. IX §2, p. 136). The replacement argument.

`(i)` For `q ∤ p`, unramifiedness of `(c_F)_q` at primes with infinite decomposition group is SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from `p`), part (ii); at completely split `q` it is (*). At primes above `p` the proofs use their stated relaxed local conditions; universal norms do not in general lie in the unramified local subgroup there.

(ii) For auxiliary primes the Chebotarev arguments of Layer 1 and Chapter VII only need a set of primes of positive density with prescribed Frobenius; deleting the density-zero set of completely split primes from `R` does not affect them.

The proofs of Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2) and Layer 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9) then go through unchanged.

The definition exposes the following operations and relations.

- `TauCeti.EulerSystem.UnramifiedAtSplitPrimes`: The predicate (*) on a collection `c` and a `Z_p^d`-extension `K∞/K`.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_of_noSplitPrimes`: If `K∞/K` is admissible, (*) holds for every collection.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_mem`: Under (*), `(c_F)_q ∈ H¹_ur(F_q, T)` for every prime `q ∤ p` of `K` and every `F` (combining with SelmerIwasawaCohomology L3 at primes with infinite decomposition group).
- `TauCeti.EulerSystem.splitPrimes_density_zero`: The set of primes of `K` splitting completely in `K∞/K` has Dirichlet density zero.
- `TauCeti.EulerSystem.weakLeopoldt_of_unramifiedAtSplitPrimes`: Under (*) in place of admissibility, the conclusions of Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2), Layer 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3) and Layer 8.38 Divisibility up to a power of `p` (Rubin, Theorem II.3.4) hold.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_kummer`: Kummer images of points of an abelian variety with good reduction at `q ∤ p` satisfy (*) at `q`.

**Checks.**

- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_vacuous`: For the cyclotomic `Z_p`-extension of `Q` no prime splits completely, so (*) holds for every collection.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_anticyclotomic`: For `K = Q(√−7), p = 3` and the anticyclotomic `Z_3`-extension, (*) is a genuine condition at the prime `5O_K`, which splits completely.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_kummer_example`: For an elliptic curve `E/K` with good reduction at `q ∤ p` and points `P_F ∈ E(F)`, the Kummer classes `c_F = δ(P_F) ∈ H¹(F, T_pE)` satisfy (*) at `q`.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_not_selmer_limit`: At a completely split prime `q ∤ p` the local limit `lim_F ⊕_{w|q} H¹(F_w, T) ≅ Λ ⊗ H¹(K_q, T)` can contain ramified classes. For `K = Q(√−7)`, its anticyclotomic `Z₃`-extension, `q = 5O_K` and `T = Z₃(1)`, the Kummer class of `5` at one fixed place above `q`, extended norm-coherently by zero at the other places, is ramified. So (*) is not automatic for norm-coherent families and Proposition II.3.7'`s` identity `H¹_∞(K, T) = lim S^{Σp}(F, T)` can fail. Ramification of `T` at `q` does not produce such classes by itself: for `T = Z₃(χ)` with `χ` the quadratic character of `Q(√5)`, tame inertia at `q` acts by `−1`, so `H⁰` and `H²` of every `T/3^n` at `K_q` vanish and `H¹(K_q, T) = 0`.

At `q|p` no automatic unramifiedness follows: for `T=ℤ_p(1), H¹_ur(ℚ_p,T)=0`, whereas the norm-coherent cyclotomic `p`-units obtained from `1−ζ_{p^{n+1}}` have bottom norm `p`, whose Kummer class in `H¹(ℚ_p,T)` is nonzero. This negative control keeps the universal-norm assertion restricted to `q ∤ p`.

If `K∞/K` is admissible, (*) is vacuous.

Kummer classes of points of an abelian variety with good reduction at `q ∤ p` are unramified at `q`, so (*) holds at such completely split `q`.

*Needs:* Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 4.10 Rubin's selection of primes with large localisation.

### 8.12 `Λ`-adic Kolyvagin systems

For a `Λ`-adic Selmer structure `F_Λ` on `𝐓` and a set `P` of auxiliary primes disjoint from `Σ(F_Λ)` (with the finite–singular comparison maps `φ^fs_ℓ` and ideals `I_ℓ` of EulerSystemsAndKolyvaginSystems Layer 1), `KS(𝐓, F_Λ, P)` is the `Λ`-module of Kolyvagin systems of Layer 4 over `R = Λ`: collections `κ = {κ_n ∈ H¹_{F_Λ(n)}(K, 𝐓/I_n𝐓) ⊗ G_n : n ∈ N(P)}` with `(κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n)` in `H¹_s(K_ℓ, 𝐓/I_{nℓ}𝐓) ⊗ G_{nℓ}` (Mazur–Rubin, Definition 3.1.3). The generalized module is `KS‾(𝐓, F_Λ, P) = lim_k colim_j KS(𝐓/𝔐^k𝐓, F_Λ, P ∩ P_j), P_j` the primes with `𝐓/(𝔐^j𝐓 + (Fr_ℓ − 1)𝐓)` free of rank one over `Λ/𝔐^j` and `I_ℓ ⊂ 𝔐^j` (Definition 3.1.6), with the natural map `KS → KS‾`. Elements of either are `Λ`-adic Kolyvagin systems; the bottom class is `κ_1 ∈ H¹_{F_Λ}(K, 𝐓) (for KS‾, κ̄_1 ∈ lim_k H¹_{F_Λ}(K, 𝐓/𝔐^k𝐓) = H¹_{F_Λ}(K, 𝐓))`.

The precise hypotheses are `KS → KS‾` need be neither injective nor surjective (Mazur–Rubin, Definition 3.1.6); the statements of this layer hold for both modules (Remark 5.3.11), and Euler systems land in `KS‾` (Layer 8.17 From Euler systems to `Λ`-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3)); Over `Λ` the ideals `I_n` are generally of finite index, so each `κ_n` is a class with coefficients in a finite quotient of `𝐓` (Mazur–Rubin, proof of Theorem 5.3.3).

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §3.1, Definition 3.1.3, p. 20). The definition, applied to `R = Λ`.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §3.1, Definition 3.1.6, p. 21). The generalized module and the comparison map (the overline is lost in the text layer of the author copy).

([Kâzım Büyükboduk, Λ-adic Kolyvagin systems](https://arxiv.org/pdf/0706.0377v2), §3.2, Remark 3.24, p. 27). The terminology.

The module structure, the functoriality in the ring `(KS(T, F) ⊗_R R' → KS(T ⊗_R R', F ⊗ R') for R → R')`, in `P` (restriction to `P`' `⊂ P`) and in `F` (inclusion for `F`' `≤ F`) are Mazur–Rubin's Remark 3.1.4, owned for general `R` by Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; here they are applied to `R = Λ` and its quotients `Λ/I, Λ/𝔐^k` and `S_𝔓`.

The bottom class of `κ̄ ∈ KS‾` is well defined because `κ̄_1` is compatible in `k` and `lim_k H¹_{F_Λ}(K, 𝐓/𝔐^k𝐓) = H¹_{F_Λ}(K, 𝐓)` for the finitely generated, `𝔐`-adically complete module `H¹_{F_Λ}(K, 𝐓)`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystem.lambdaKS`: `KS(𝐓, F_Λ, P)`, the `Λ`-module of Kolyvagin systems over `R = Λ`.
- `TauCeti.KolyvaginSystem.lambdaKSBar`: `KS‾(𝐓, F_Λ, P) = lim_k colim_j KS(𝐓/𝔐^k𝐓, F_Λ, P ∩ P_j)`.
- `TauCeti.KolyvaginSystem.lambdaKS_toBar`: The natural map `KS(𝐓) → KS‾(𝐓)`.
- `TauCeti.KolyvaginSystem.bottomClass`: `κ ↦ κ_1 ∈ H¹_{F_Λ}(K, 𝐓), Λ`-linear, compatible with `KS → KS‾`.
- `TauCeti.KolyvaginSystem.lambdaKS_baseChange`: For a ring map `Λ → R`', `KS(𝐓, F_Λ) ⊗_Λ R`' `→ KS(𝐓 ⊗_Λ R', F_Λ ⊗ R')`, compatible with composition; in particular reductions to `𝐓/I𝐓`.
- `TauCeti.KolyvaginSystem.lambdaKS_restrictPrimes`: For `P`' `⊂ P`, the restriction `KS(𝐓, P) → KS(𝐓, P')`.
- `TauCeti.KolyvaginSystem.lambdaKS_ext`: Two `Λ`-adic Kolyvagin systems are equal iff all their components `κ_n` agree.
- `TauCeti.KolyvaginSystem.bottomClass_zero`: The zero system has `κ_1 = 0`.

**Checks.**

- `TauCeti.KolyvaginSystem.zero_mem`: The zero collection is a `Λ`-adic Kolyvagin system, with `κ_1 = 0`; it satisfies every relation and certifies nothing.
- `TauCeti.KolyvaginSystem.transverse_condition_required`: Weak derivative systems already satisfy the finite–singular relation. At a prime `ℓ` dividing `n` their finite localization may be nonzero, so they need not lie in the transverse local condition of `KS`. Appendix `A` removes this finite part while retaining the edge relation; a definition accepting every weak system as a Kolyvagin system loses transversality.
- `TauCeti.KolyvaginSystem.edge_relation_required`: In a rank-one edge model with `φ^fs=id`, lower value 1 and upper singular value 0 fail the equation `0=1` even when the upper finite part is zero. Transversality alone therefore does not define a system.
- `TauCeti.KolyvaginSystem.cyclotomic_free_rank_one`: For `T = O(1) ⊗ ρ^{-1}, ρ` an even character of prime-to-`p` order with `ρ(p) ≠ 1` and `ρ` unramified at `p`, the cyclotomic-unit `Λ`-adic Kolyvagin system generates the free rank-one module `KS‾(T ⊗ Λ, F_can, P)` (Büyükboduk, Proposition 4.1).
- `TauCeti.KolyvaginSystem.bottomClass_specialize`: The image of `κ_1` under `H¹(Q, 𝐓) → H¹(Q, 𝐓/J𝐓) = H¹(Q, T)` is the bottom class of the reduction of `κ` to `KS(T)`; for `κ` coming from an Euler system `c` it is `c_Q`.

The zero system is allowed and has `κ_1 = 0`.

For `T = O(1) ⊗ ρ^{-1}, ρ` even of prime-to-`p` order, unramified at `p`, with `ρ(p) ≠ 1, KS‾(T ⊗ Λ, F_can, P)` is free of rank one, generated by the cyclotomic-unit system (Büyükboduk, Theorem 3.23 and Proposition 4.1).

*Needs:* Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; Layer 1.8 The finite–singular comparison map; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; `PadicMeasuresIwasawaAlgebras Layer 1`.

### 8.13 The exceptional set `Σ_Λ` of height-one primes

For `K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ` and `Σ ⊇ {p, ∞, primes where T ramifies}: Σ_Λ = {𝔓 : H²(Q_Σ/Q, 𝐓)[𝔓] is infinite} ∪ {𝔓 : H²(Q_p, 𝐓)[𝔓] is infinite} ∪ {pΛ}`, a set of height-one primes of `Λ` (Mazur–Rubin, Definition 5.3.12, with `Λ = Z_p[[Γ]]`; for `Λ = O[[Γ]]` with `O` ramified over `Z_p, pΛ` is replaced by the prime `ϖΛ`). It is finite. For a number field `K` and a `Z_p`-extension the same definition with `H²(K_Σ/K, 𝐓)` and `H²(K_v, 𝐓), v | p`, is used under the finite-generation hypotheses of SelmerIwasawaCohomology §3.13. Local `H²` torsion is additionally assumed for any conclusion using its generic rank zero; for the ordinary structure of Howard the exceptional set is the finite set of his Proposition 2.2.8, defined by the failure of the control bounds.

The precise hypotheses are `Σ_Λ` depends only on `T` and the tower, not on any Kolyvagin system; the blind spot (Layer 8.24 The blind spot and `Λ`-primitive Kolyvagin systems) depends on `κ`; Finiteness needs `H²(Q_Σ/Q, 𝐓)` and `H²(Q_p, 𝐓)` finitely generated over `Λ` (Mazur–Rubin, Lemma 5.3.4; supplied by SelmerIwasawaCohomology L3).

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Definition 5.3.12, p. 62). The definition with the same hypotheses and conclusion, expressed in roadmap notation.

For a finitely generated `Λ`-module `M` and a height-one prime `𝔓 ≠ pΛ, M[𝔓]` is infinite iff `𝔓` divides `char(M_tors)` (structure theorem, PadicMeasuresIwasawaAlgebras L4); a finitely generated module has finitely many such `𝔓`.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystem.exceptionalSet`: `Σ_Λ` as a set of height-one primes of `Λ`.
- `TauCeti.KolyvaginSystem.exceptionalSet_finite`: `Σ_Λ` is finite.
- `TauCeti.KolyvaginSystem.p_mem_exceptionalSet`: `pΛ ∈ Σ_Λ`.
- `TauCeti.KolyvaginSystem.mem_exceptionalSet_iff`: For `𝔓 ≠ pΛ, 𝔓 ∈ Σ_Λ` iff `𝔓` divides `char(H²(Q_Σ/Q, 𝐓)_tors) · char(H²(Q_p, 𝐓)_tors)`. In a general tower use the torsion submodule of every local `H²` in this membership criterion; finite generation suffices for finiteness of the exceptional set, without forcing local generic rank zero.
- `TauCeti.KolyvaginSystem.exceptionalSet_twist`: For a continuous `ρ:Γ→O^×` and `φ=Tw_ρ`, `Σ_Λ(T⊗ρ)={φ(𝔓):𝔓∈Σ_Λ(T)}`, where `φ(𝔓)` is the direct image ideal. Equivalently, `𝔔∈Σ_Λ(T⊗ρ) ↔ φ⁻¹(𝔔)∈Σ_Λ(T)`. With the `Ψ` action of §8.5, `t⊗λ↦(t⊗e_ρ)⊗φ(λ)` is a Galois-equivariant `φ`-semilinear equivalence `𝐓(T)→𝐓(T⊗ρ)`, so annihilator ideals of its global and local `H²` move by `φ`. The vertical ideal is fixed. This is distinct from §8.9’s conjugation-action convention.

**Checks.**

- `TauCeti.KolyvaginSystem.exceptionalSet_Zp1`: For `T = Z_p(1)` over `Q∞, H²(Q_p, 𝐓) ≅ lim_n H²(Q_{n,p}, Z_p(1)) ≅ Z_p` with trivial `Γ`-action, so `H²(Q_p, 𝐓)[J] = Z_p` is infinite and `J ∈ Σ_Λ`.
- `TauCeti.KolyvaginSystem.exceptionalSet_twist_orientation`: For odd `p`, `T=ℤ_p(1)` and `ρ(γ)=u=1+p`, the local factor `Λ/(γ−1)` transports to `Λ/(uγ−1)`, whose ideal is `Tw_ρ((γ−1))`; `Λ/(u⁻¹γ−1)` has the opposite orientation. The primes `Tw_ρ^{2n}((γ−1))=(γ−u^{-2n})` are distinct, so a finite exceptional set containing `(γ−1)` cannot obey both transport rules.
- `TauCeti.KolyvaginSystem.p_mem_exceptionalSet_test`: `pΛ ∈ Σ_Λ` for every `T`, by definition, whatever the cohomology.
- `TauCeti.KolyvaginSystem.exceptionalSet_not_blindSpot`: `Σ_Λ` is not the blind spot: for the cyclotomic-unit system `κ^{ρ,∞}` of Büyükboduk's Proposition 4.1 `(ρ(p) ≠ 1)` the blind spot contains no height-one prime, while `pΛ ∈ Σ_Λ`.
- `split_padic_place_H2`: At a completely split `v|p` and `T=ℤ_p(1)`, local duality gives `H²(K_v,T⊗Λ)≃Λ`, a free module. Its `𝔓`-torsion is zero, but `H²/𝔓=Λ/𝔓` is infinite at every nonvertical height-one prime, so finiteness of the exceptional set does not imply local `H²` torsion or generic `H⁰` vanishing. Such a tower exists for `K=ℚ(i,√2)`, `p=17`: `K_v=ℚ₁₇`, global reciprocity gives its maximal `ℤ₁₇`-extension rank at least `4−1=3`: the semilocal principal units have rank 4 and the closure of global units has rank at most 1. The decomposition group at `v` has rank at most 2, the rank of the pro-17 completion of `ℚ₁₇^×`. A `ℤ₁₇` quotient killing that group makes `v` split completely. This computation uses ArithmeticGaloisDuality §D7.4’s compact local duality and ClassFieldTheory Layers 7 and 12 and the Dirichlet unit-rank input of GlobalNumberFields.
- `TauCeti.KolyvaginSystem.exceptionalSet_free_H2`: If `H²(Q_Σ/Q, 𝐓)` and `H²(Q_p, 𝐓)` are finite, then `Σ_Λ = {pΛ}`.

`pΛ ∈ Σ_Λ` always.

For `T = Z_p(1), H²(Q_p, 𝐓) ≅ Z_p` with trivial action, so the augmentation ideal `J` lies in `Σ_Λ`.

*Needs:* Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; `SelmerIwasawaCohomology Layer 3`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.3`.

### 8.14 Invariance of the Iwasawa-theoretic statements under twisting

Let `c` be an Euler system for `(T, K∞)` and `ρ: Γ → O^×` a character, with `c^ρ` the twisted Euler system of twisting-by-characters-of-gamma. Then `X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ, Tw_ρ(char X∞(T ⊗ ρ)) = char X∞(T), Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c)`, and `Hyp(K∞, T), Hyp(K∞, V), Hyp(K∞/K)` hold for `T` iff they hold for `T ⊗ ρ`. Consequently Theorems II.3.2, II.3.3 and II.3.4 for `(T, c)` are equivalent to the same theorems for `(T ⊗ ρ, c^ρ)`.

The precise hypotheses are `ρ` is a character of `Γ = Gal(K∞/K)`, so `G_{K∞}` acts on `T ⊗ ρ` as on `T`; The equalities of characteristic ideals use that `Tw_ρ` preserves heights of ideals of `Λ`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI §4, Theorem 4.1, p. 94). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI §4, proof of Theorem 4.1, p. 94). The invariance of the hypotheses.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VI §1, Lemma 1.2, p. 89). The twisting rule for characteristic ideals.

The hypotheses depend only on the action of `G_{K∞}` (Rubin, proof of Theorem VI.4.1).

`(W ⊗ ρ)* = W* ⊗ ρ^{-1}`, so Proposition VI.2.1(ii) gives `S_{Σp}(K∞, (W⊗ρ)*) ≅ S_{Σp}(K∞, W*) ⊗ ρ^{-1}` and `X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ`.

For a finitely generated torsion `Λ`-module `B, f·(b ⊗ ξ_ρ) = (Tw_ρ(f)b) ⊗ ξ_ρ`, so `Tw_ρ(char(B ⊗ ρ)) = char(B)` and `Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B)` (Rubin, Lemma VI.1.2; twisting of characteristic ideals is supplied by PadicMeasuresIwasawaAlgebras L4).

The same identity applied to `H¹_∞(K, T) ⊗ ρ ≅ H¹_∞(K, T ⊗ ρ)` and `c^ρ_{K,∞} = c_{K,∞} ⊗ ξ_ρ` gives `Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c)`.

Twisting by `ρ` and then by `ρ^{-1}` returns the original statements `(for f_ρ | N)`.

*Needs:* Layer 8.9 Twisting Euler systems by characters of infinite order; Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`; Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`; Layer 8.6 Rubin's hypothesis `Hyp(K∞/K)`; `PadicMeasuresIwasawaAlgebras Layer 4`; `PadicMeasuresIwasawaAlgebras §4.6`.

### 8.15 Kernels and cokernels of restriction along the tower

Let `N` be the ideal of an Euler system for `(T, K∞)` and assume, after twisting by a character of `Γ` (Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting), that for every prime `λ | N` the decomposition group of `λ` in `G_K` contains `γ_λ` with `T^{γ_λ^{p^n}=1} = (T*)^{γ_λ^{p^n}=1} = 0` for all `n ≥ 0`. Define the ideals `A_glob = Ann_Λ(W^{G_{K∞}})` if `rank Γ > 1` and `Ann_Λ(W^{G_{K∞}}/(W^{G_{K∞}})_div)` if `Γ ≅ Z_p`, the local `A_v` (`v | p`, using `K_{∞,w}`; `v ∤ p`, using inertia), `A_N = ∏_{v|N} A_vΛ`, and `A*_glob, A*_N` with `W*` in place of `W` (Rubin, Definition VII.3.1); these ideals have height at least two. Then for `K ⊂_f F ⊂ K∞` and `M` a power of `p: (i) ker(H¹(F, W) → H¹(K∞, W)^{G_F})` is finite and killed by `A_glob`; (ii) `ker(H¹(F, W_M) → H¹(F, W)_M)` is finite, bounded independently of `M`, and killed by `Ann_Λ(W^{G_{K∞}})`; (iii) `coker(S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{G_F})` is finite and killed by `A*_glob A*_N`; (iv) if `S_{Σp}(K∞, W*)^{G_F}` is finite, then for every power `M ≥ M_F` of `p, A*_glob A*_N` kills `coker(S_{Σp}(F, W*_M) → S_{Σp}(K∞, W*)^{G_F})`; `(v) coker(S_{Σp}(F, W*_M) → S_{Σp}(F, W*)_M)` is finite and bounded independently of `M` (Rubin, Proposition VII.3.4). Moreover `H^i(K∞/F, W^{G_{K∞}}), H^i(K∞/F, (W*)^{G_{K∞}})` and the local `H^i(K_{∞,w}/F_w, (W*)^{G_{K_{∞,w}}}) (w | p)` are finite and killed by `A_glob, A*_glob, A*_v` respectively, for `i ≥ 1` (Lemma VII.3.3).

The precise hypotheses are The twist assumption (5) is available by Lemma VI.1.3(i) applied to `T ⊕ T*`; Lemma VII.3.7 is proved without it; Pseudo-nullity here means annihilated by an ideal of height at least two; for `d ≥ 2` a pseudo-null module need not be finite, but every error term in this theorem is moreover finite.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §3, Proposition 3.4(iii), p. 107). Part (iii) with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §3, Lemma 3.2, p. 106). The height statement.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §3, opening, pp. 105–106). The twist assumption (5).

Lemma VII.3.3: `Γ` is abelian, so the annihilator of `W`' kills `H^i(G, W')`; with `f(x) = det(1 − γx | T ⊕ T*), f(γ̄^{-1})` kills `W`' and `G` acts trivially on `H^i(G, W')`, so `f(1) ≠ 0` kills it and finiteness follows; for `Γ ≅ Z_p, H^i(G, W'_div) = 0` for `i ≥ 1` and the annihilator of `W`'/`W`'`_div` suffices.

`(i)` is inflation–restriction (ArithmeticGaloisDuality R02.2) with Lemma VII.3.3(i); (ii) is Lemma I.2.2(i): the kernel is `W^{G_F}/MW^{G_F}`, a quotient of `W^{G_F}/(W^{G_F})_div`.

(iii): the cokernel of restriction is killed by `A*_glob` (Lemma VII.3.3(ii)); since `K∞/F` is unramified outside `p`, the preimage of `S_{Σp}(K∞, W*)^{G_F}` lies in `S^{Σ_pN}(F, W*)`, and the defect is controlled by `⊕_{w|p} H¹(F_{∞,w}/F_w, (W*)^{G_{F∞,w}}) ⊕ ⊕_{w|N, w∤p} H¹_ur(F_w, W*)/H¹_f(F_w, W*)`, killed by `A*_v` and finite by Lemma I.3.5(iii).

(iv) follows from (iii) since `S_{Σp}(F, W*) = colim_M S_{Σp}(F, W*_M)`; `(v)`: by Lemma I.5.4 the defect is a subquotient of `⊕_{w|p} (W*)^{G_{F_w}}/M(W*)^{G_{F_w}}`, bounded by the finite group `(W*)^{G_{F_w}}/((W*)^{G_{F_w}})_div`.

Every error ideal has height `≥ 2`, so the errors never affect characteristic ideals.

For `T = Z_p`, so `W* = μ_{p^∞}`, the cokernel in (iii) for `F = K` is finite even though the twist assumption (5) fails for `W`, because it holds for `W*` (the case used in the proof of Lemma VII.3.7).

*Needs:* Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; Layer 8.9 Twisting Euler systems by characters of infinite order; `ArithmeticGaloisDuality §R02.2.1 (The Hochschild–Serre spectral sequence)`; `SelmerIwasawaCohomology §2.6 (From V to T and W; saturation)`; `SelmerIwasawaCohomology §2.15 (Finite against unramified classes at bad primes)`; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; `Ideal.height`.

### 8.16 The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7)

With the data of Layer 8.8 The true Iwasawa Selmer group and the singular local term at `p` there is an exact sequence of `Λ`-modules `0 → H¹_{∞,s}(K_p, T)/loc^s_{Σp}(H¹_∞(K, T)) → Hom_O(S(K∞, W*), D) → X∞ → 0`.

The precise hypotheses are No hypothesis on `T` or on an Euler system is needed; It uses that `H¹_∞(K, T) = lim_F S^{Σp}(F, T)`, which needs admissibility (every `v ∤ p` has infinite decomposition group).

([Karl Rubin, Euler systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), Ch. 2 §3, Proposition 2.3.7 and proof, pp. 42–43). The proof in the published text (the 1999 draft cites Corollary B.3.4 here).

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Proposition 3.7, p. 29). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

`H¹_∞(K, T) = lim_F S^{Σp}(F, T)` (Rubin, Corollary B.3.5; SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from `p`) (ii)–(iii)).

For each `F` and `M`, Corollary I.7.5 (SelmerIwasawaCohomology §2.20 (Poitou–Tate for the Selmer group of `W*`)) gives `S(F, W*)/S_{Σp}(F, W*) ≅ Hom_O(coker(loc^s_{Σp}: S^{Σp}(F, T) → H¹_s(F_p, T)), D)`.

Pass to the direct limit over `F` and apply `Hom_O(·, D)`; exactness of Pontryagin duality turns the colimit of the Selmer sequences into the limit of the local cokernels.

If `H¹_f = H¹` at `p`, the left term vanishes and `Hom(S(K∞, W*), D) = X∞`.

For `T* = O_{χ^{-1}}(1)` over `Q∞` with the unit condition, the left term is a quotient of `Y∞^χ/U∞^χ`, which is `O` if `χ(p) = 1` and 0 otherwise.

*Needs:* Layer 8.8 The true Iwasawa Selmer group and the singular local term at `p`; Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`; `PontryaginDual`.

### 8.17 From Euler systems to `Λ`-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3)

Let `K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ` with the canonical structure `F_Λ, P` a set of primes `ℓ ≠ p` at which `T` is unramified, and `𝒦` an abelian extension of `Q` containing the maximal abelian `p`-extension of `Q` unramified outside `p` and `P`. Suppose `(a) T/(Fr_ℓ − 1)T` is a cyclic `O`-module for every `ℓ ∈ P`, and `(b) Fr_ℓ^{p^k} − 1` is injective on `T` for every `ℓ ∈ P` and every `k ≥ 0`. Then there is a canonical homomorphism `ES(T, 𝒦, P) → KS‾(𝐓, F_Λ, P)` sending `c` to `κ` with `κ_1 = {c_{Q_n}}_n ∈ lim_n H¹(Q_n, T) = H¹(Q, 𝐓)`.

The precise hypotheses are Mazur–Rubin's Euler systems use the factors `P_ℓ(Fr_ℓ^{-1})` with `P_ℓ(x) = det(1 − Fr_ℓ x | T)` (their Definition 3.2.2), not Rubin's `P(Fr_q^{-1}|T*; Fr_q^{-1})`; Layer 2's normalization dictionary transports between them (Mazur–Rubin, Remark 3.2.3; Rubin §IX.6); This is the rank-one map over the cyclotomic tower of `Q`; over other bases and for the anticyclotomic tower the `Λ`-adic Kolyvagin systems of the applications are explicit inputs; Mazur–Rubin state the theorem inside §5.3, whose standing assumptions are `(H.0)`–`(H.4)` and `P = P_1`; their proof (Appendix `A`, as for Theorem 3.2.4) uses only `(a), (b)` and the containment of the ray-class tower in `𝒦`, so the statement here carries only those.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Theorem 5.3.3, p. 61). The hypotheses with the same hypotheses and conclusion, expressed in roadmap notation.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Theorem 5.3.3, p. 61). The conclusion (the target is the generalized module `KS‾(𝐓)`; the overline and boldface are lost in the text layer).

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), Appendix `A`, proof of Theorem 5.3.3, pp. 81–82). The proof route.

For `n > 1`, put `J_n = (ℓ − 1, P_ℓ(1) : ℓ | n) ⊆ O` and `I′_n = J_nΛ + (Fr_ℓ − 1 : ℓ | n) ⊆ Λ`. Then `I_n ⊆ I′_n` and both have finite index. Let `F_n ⊂ ℚ∞` be fixed by the closed subgroup generated by `Fr_ℓ` for `ℓ | n`. The quotient of the completed group algebra is `Λ/I′_n ≅ (O/J_n)[Gal(F_n/ℚ)]` as an `O`-algebra. Shapiro, with the induced action of §8.5, identifies `H¹(ℚ, 𝐓/I′_n𝐓) ≅ H¹(F_n, T/J_nT)`. Construct the derivative `κ_n` in this latter group, retaining its tame tensor factor, by §3.9 over `O/J_n`: choose a nonzero generator `a_n` of `J_n`, use Rubin's allowed modulus `a_n ∈ O`, and transport from `W_{a_n}` to `T/a_nT = T/J_nT`. Linearity and the coefficient maps of §3.9 make the result independent of this generator and compatible with further coefficient reduction and the field maps. At conductor one use the bottom tower class `(c_{ℚ_m})_m`.

For each `k` let `A_k = (γ^{p^k} − 1, p^k) ⊂ 𝔐^k` and choose `j ≥ k` such that the image of `H¹(Q_p, 𝐓/A_j𝐓)` in `H¹(Q_p, 𝐓/𝔐^k𝐓)` is `H¹_{F_Λ}(Q_p, 𝐓/𝔐^k𝐓)`; then `I′_n ⊆ A_j` for `n ∈ N_j` and the images `κ_n^{(k)}` form a weak Kolyvagin system for `(𝐓/𝔐^k, P_j)` (Rubin, Theorems IV.5.1 and IV.5.4).

Mazur–Rubin's Theorem A.4 computes the finite parts `(κ_n)_{ℓ,f}`; the correction `κ`'`_n = Σ_{π∈S(n)}` sign`(π) κ_{d_π} ⊗ ∏_{ℓ|n/d_π} ρ_ℓ(P_ℓ(Fr^{-1}_{π(ℓ)}))` (their (33)) has zero finite localization at each divisor of `n` and retains the finite–singular relation already satisfied by the weak derivatives; each `ρ_ℓ` is formed in the original tame group algebra `(Λ/𝔐^k)[G_ℓ]` as in §3.15. This is the correction of Layer 3 (Theorem 3.2.4) carried out over `Λ/𝔐^k`.

The resulting systems are compatible as `k` grows, defining an element of `KS‾(𝐓)`; its bottom class is the image of `(c_{Q_n})_n`.

The cyclotomic-unit Euler system for `O(1) ⊗ ρ^{-1}`, modified as in Rubin §IX.6, gives `κ^{ρ,∞}` (Büyükboduk, §4.1.1).

**Checks.**

- For `p = 3`, `O` the unramified quadratic integers over `ℤ₃`, `T = O(1)` and `n = 7`, `P₇(1) = −6`, `J₇ = 3O` and `I′₇ = (3,Fr₇−1)`. Since `7` topologically generates `1+3ℤ₃`, `F₇ = ℚ` and `Λ/I′₇ ≅ O/3O ≅ 𝔽₉`. No integer cyclic quotient has this characteristic and cardinality. The Frobenius coinvariants are `O/6O`, which is cyclic over `O`, and every `7^(3^j)−1` acts injectively on `T`.
- Changing a generator `a_n` to `u a_n` multiplies the class in `W_{a_n}` by `u⁻¹` and the identification back to `T/J_nT` by `u`; the quotient-valued derivative is unchanged. Reducing this class further agrees with constructing it after the corresponding coefficient reduction.
- For `O = ℤ_p` and `J_n = p^aO`, the coefficient ring reduces to `ℤ/p^a`; for a general `O` the coefficient ring remains `O/J_n`. In both cases Shapiro retains the same finite group `Gal(F_n/ℚ)`.
- At conductor one the bottom class is `(c_{ℚ_m})_m`; the zero Euler system maps to the zero Kolyvagin system.

*Needs:* Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 2.2 The module of Euler systems; Layer 2.1 Euler polynomials and their conventions; Layer 2.4 The conductor-indexed presentations; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.13 Local behaviour of derivative classes; Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts; Layer 3.17 The map from Euler systems to Kolyvagin systems.

### 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes

For a height-one prime `𝔓` of `Λ` let `S_𝔓` be the integral closure of `Λ/𝔓`; it is a discrete valuation ring, `[S_𝔓 : Λ/𝔓]` is finite, and `𝐓 ⊗_Λ S_𝔓 = T ⊗_O S_𝔓` with `G_K` acting on `S_𝔓` through `Ψ` mod `𝔓`. Give `T ⊗ S_𝔓` the canonical Selmer structure `F_can` of Layer 0.7 over the complete discrete valuation ring `S_𝔓`, with `Σ(F_can)` the primes where `T` ramifies together with `p` and `∞`, and away from `p∞` the inertia kernel into `H¹(K_q^{ur}, T ⊗ Frac(S_𝔓))` (Mazur–Rubin §5.3, p. 62); at `𝔓 = (ϖ)` the ring `S_𝔓 = k⟦X⟧` has equal characteristic and this `Frac(S_𝔓)` form is the one used. In the ordinary setting use Howard's `F_𝔓` of his Definition 2.1.2. The inclusion `𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓` induces maps `H¹_{F_Λ}(K_v, 𝐓/𝔓𝐓) → H¹_{F_can}(K_v, T ⊗ S_𝔓)` for every `v`, hence a specialization map `KS(𝐓, F_Λ) → KS(𝐓/𝔓𝐓, F_Λ) → KS(T ⊗ S_𝔓, F_can), κ ↦ κ^{(𝔓)}` (Mazur–Rubin, Corollary 5.3.15), and similarly on `KS‾`. For `𝔓 = (g) ≠ (ϖ)` with `g` a distinguished polynomial, the perturbations `𝔓_N = (g + ϖ^N)Λ` satisfy `Λ/𝔓 ≅ Λ/𝔓_N` as rings for `N` large (Hensel's lemma).

The precise hypotheses are The ring isomorphism `Λ/𝔓 ≅ Λ/𝔓_N` is not `Λ`-linear, and the Galois actions on `T ⊗ S_𝔓` and `T ⊗ S_{𝔓_N}` differ; The bounds of Layer 8.22 Control of Selmer groups at height-one specializations depend on `[S_𝔓 : Λ/𝔓]`, which is why `S_𝔓` rather than `Λ/𝔓` carries the DVR theory of Layer 4–Layer 5.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, p. 62). The ring `S_𝔓` and the specialized representation.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Corollary 5.3.15, p. 64). The specialization map.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, proof of Theorem 5.3.10, p. 66). The perturbations.

`Λ/𝔓` is a one-dimensional complete local domain, finite over `Z_p` or `(for 𝔓 = pΛ)` over `k[[X]]`; its normalization `S_𝔓` is a finite DVR extension (PadicMeasuresIwasawaAlgebras §4.3, with the normalization target of §8.18 here).

Local maps: for `ℓ ∤ p` the image of `H¹_{F_Λ}(K_ℓ, 𝐓/𝔓𝐓)` consists of unramified classes, which lie in `H¹_{F_can}(K_ℓ, T ⊗ S_𝔓)`; at `p` and `∞` the canonical condition is everything (Mazur–Rubin, proof of Lemma 5.3.13).

The Kolyvagin-system maps are the functoriality of Layer 8.12 `Λ`-adic Kolyvagin systems for `Λ → Λ/𝔓` followed by the change of Selmer structure `F_Λ ⊗ Λ/𝔓 ≤ F_can` (Mazur–Rubin, Remark 3.1.4).

Hensel's lemma: for `N ≫ 0` the polynomial `g + ϖ^N` is distinguished, irreducible and has a root in `S_𝔓` arbitrarily close to that of `g`. The resulting `O`-orders agree for sufficiently close roots, giving `Λ/𝔓_N ≅ Λ/𝔓` and constant normalization index. Mazur–Rubin give this argument over `O=ℤ_p` in the proof of Theorem 5.3.10, p.66; the same argument over a finite extension uses its uniformizer `ϖ`. This order isomorphism is not an identification of `Λ`-actions.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystem.specRing`: `S_𝔓 =` integral closure of `Λ/𝔓`, a DVR with `[S_𝔓 : Λ/𝔓] < ∞`.
- `TauCeti.KolyvaginSystem.specRep`: `T ⊗ S_𝔓 = 𝐓 ⊗_Λ S_𝔓` with its canonical (or ordinary) Selmer structure.
- `TauCeti.KolyvaginSystem.specialize`: `κ ↦ κ^{(𝔓)}: KS(𝐓, F_Λ) → KS(T ⊗ S_𝔓, F_can)`, and the same on `KS‾`.
- `TauCeti.KolyvaginSystem.specialize_bottomClass`: `κ^{(𝔓)}_1` is the image of `κ_1` under `H¹(K, 𝐓) → H¹(K, 𝐓/𝔓𝐓) → H¹(K, T ⊗ S_𝔓)`.
- `TauCeti.KolyvaginSystem.specialize_augmentation`: For `𝔓 = J, S_J = O, T ⊗ S_J = T` and `κ^{(J)}` is the reduction of `κ` to `KS(T)`.
- `TauCeti.KolyvaginSystem.specialize_twist`: For `𝔓 = (γ − u), u ∈ 1 + pO, Λ/𝔓 = O` and `T ⊗ S_𝔓 = T ⊗ ρ_u` with `ρ_u(γ) = u`.
- `TauCeti.KolyvaginSystem.perturb`: For `𝔓 = (g) ≠ (ϖ)` with `g` distinguished, `𝔓_N = (g + ϖ^N)`; for `N ≫ 0, 𝔓_N` is a height-one prime and `Λ/𝔓 ≅ Λ/𝔓_N` as `O`-algebras, with constant normalization index.
- `TauCeti.KolyvaginSystem.specializationLength`: For `O` the integers of a finite extension of `ℚ_p`, a finitely generated torsion `Λ`-module `Z` and `𝔓=(g)≠(ϖ)`, put `d=deg g`. For all sufficiently large `m` the specialization is finite and `length_O(Z/(g+ϖ^m)Z)=m d·ord_𝔓 char(Z)+O(1)`. At `𝔓=(ϖ)`, use `Q_m=(T^m+ϖ): length_O(Z/Q_mZ)=m·ord_(ϖ) char(Z)+O(1)`. The constants may depend on `Z` and the fixed prime, but not on `m`. Converting either formula to `ℤ_p`-length multiplies by `[O/ϖ:𝔽_p]`.

For the length comparison, apply the supplier's pseudo-isomorphism to elementary cyclic modules; its finite kernel and cokernel contribute bounded errors after quotienting. On `Λ/(g^a)`, reduction modulo `g+ϖ^m` replaces `g^a` by `ϖ^{ma}` in a free `O`-module of `rank d`, giving `mad`. Every other fixed elementary factor contributes bounded length, since its resultant with `g+ϖ^m` converges to a nonzero resultant. For `Q_m=T^m+ϖ` the quotient is already a DVR with uniformizer `T` and `ϖ=−T^m`. A factor `Λ/(ϖ^a)` therefore contributes `ma`; a fixed distinguished horizontal factor contributes bounded length, as is seen by evaluating `T^m+ϖ` at its finitely many roots. This is the algebraic specialization step in Mazur–Rubin, proof of Theorem5.3.10, p.66, and Howard, proof of Theorem2.2.10, pp.27–28; the uniformizer and residue-degree conversions above give its finite-extension version.

**Checks.**

- `TauCeti.KolyvaginSystem.specRing_augmentation`: For `𝔓 = J = (γ − 1), Λ/J = O = S_J` and `T ⊗ S_J = T`.
- `TauCeti.KolyvaginSystem.specRing_twist`: For `O = Z_p` and `𝔓 = (γ − (1 + p)), Λ/𝔓 = Z_p` and `T ⊗ S_𝔓` is the twist of `T` by the character `γ ↦ 1 + p` of `Γ`.
- `TauCeti.KolyvaginSystem.specRing_not_quotient`: For `O = Z_p` and `𝔓 = (X² − p³), X = γ − 1: X² − p³` is distinguished and irreducible, `Λ/𝔓 ≅ Z_p[p^{3/2}]` is not integrally closed, and `S_𝔓 = Z_p[p^{1/2}]` with `[S_𝔓 : Λ/𝔓] = p`; using `Λ/𝔓` instead of `S_𝔓` loses the DVR theory.
- `TauCeti.KolyvaginSystem.perturb_height_one`: For `𝔓 = (X − p)` in `Z_p[[X]]` and `N≥1, 𝔓_N = (X − p + p^N)` is prime with `Λ/𝔓_N ≅ Z_p`, and the `𝔓_N` are pairwise distinct and distinct from `𝔓`.
- `TauCeti.KolyvaginSystem.specializationLength_horizontal`: For `Z=Λ/(T^a)` and `Q_m=(T+ϖ^m), length_O(Z/Q_mZ)=ma`. For `a=0` the module and its length are zero.
- `TauCeti.KolyvaginSystem.specializationLength_vertical`: For `Z=Λ/(ϖ^a)` and `Q_m=(T^m+ϖ), length_O(Z/Q_mZ)=ma`. If `O` is ramified, replacing `ϖ` by `p` can destroy the Eisenstein property; the displayed formula keeps `ϖ`.
- `TauCeti.KolyvaginSystem.specializationLength_finite_error`: For `Z=Λ/(ϖ,T)`, every sufficiently deep displayed perturbation has `Z/Q_mZ=O/ϖ` of length 1, while `char(Z)=Λ`. The error is bounded rather than zero.

`𝔓 = J`, the augmentation ideal: `S_J = O` and `𝐓 ⊗ S_J = T`.

`𝔓 = (X² − p³)` in `Z_p[[X]] (O = Z_p, X = γ − 1): Λ/𝔓 ≅ Z_p[p^{3/2}] ⊊ S_𝔓 = Z_p[p^{1/2}]`, of index `p`.

*Needs:* Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 0.7 The canonical and the unramified Selmer structures; `PadicMeasuresIwasawaAlgebras §4.3`; `IsIntegralClosure`; `IsDiscreteValuationRing`; `Polynomial.IsDistinguishedAt`.

The horizontal formula also has the original `p`-power parametrization: with `Q_m = (g + p^m)`,

```text
length_ℤ_p(Z/Q_m Z) = m rank_ℤ_p(Λ/P) ord_P(char_Λ Z) + O(1).
```

Indeed `p = uϖ^e` and `rank_ℤ_p(Λ/P) = e f_O deg g`, so the uniformizer formula gives this identity. The vertical formula keeps `Q_m = (T^m + ϖ)`, giving `length_ℤ_p Λ/(ϖ^a, T^m + ϖ) = a m f_O` and normalization index one. Layer 8.28 supplies the paired elementary-divisor comparison; these perturbation and length comparisons are proved in §8.18 from the supplied height-one and module-structure theory.

### 8.19 Mazur–Rubin's principal index `Ind(c)`

In the cyclotomic setting `K=Q, K∞=Q∞`, assume `H¹(Q,𝐓)` is finitely generated and `Λ`-torsion-free (as provided under MR`(H.0)`–`(H.4)`). For `c` in that module, fix a pseudo-isomorphism `ψ: H¹(Q, 𝐓) → Λ^r` and write `ψ(c) = (a_1, …, a_r)`; `Ind(c)` is the principal ideal generated by `gcd(a_1, …, a_r)`, so `Ind(0) = 0`. For `c ≠ 0` this equals `char((H¹(Q, 𝐓)/Λc)_tors)` (Mazur–Rubin, Definition 5.3.8, with the convention of the zero-class convention below at `c = 0`). For `κ ∈ KS‾(𝐓), Ind(κ) = Ind(κ_1)`.

The precise hypotheses are `Ind(c)` is principal; Rubin's `ind_Λ` (Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`) need not be, but a principal ideal contains `ind_Λ(c)` iff it contains `Ind(c)`, both computed in the same `Λ`-module `H¹(Q, 𝐓)`. Transported along the Shapiro identification `H¹(Q, 𝐓) ≅ H¹_∞(Q, T)`, which is `ι`-semilinear (Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures), `Ind(c_{Q,∞})` is the image under `ι` of the smallest principal ideal containing Rubin's `ind_Λ(c)`; There is an ideal `B` of finite index in `Λ` with `Bc ⊂ Ind(c)H¹(Q, 𝐓)` (Mazur–Rubin, after Definition 5.3.8); The pseudo-isomorphism/gcd construction is on a finitely generated `Λ`-torsion-free module; the arithmetic carrier is supplied under the MR standing hypotheses, not asserted torsion-free for an arbitrary `T`.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Definition 5.3.8, p. 61). The definition as printed.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Definition 5.3.8, p. 61). The gcd description adopted here.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, proof of Theorem 5.3.10, p. 66). The convention `Ind(0) = 0` used by the authors.

Independence of `ψ`: two pseudo-isomorphisms to free modules differ by an automorphism of `Λ^r` up to pseudo-null error, preserving the gcd.

For `c ≠ 0` write `(a_i) = g(b_i)` with `g = gcd(a_i)` and `gcd(b_i) = 1`; the torsion of `Λ^r/Λ(b_i)` is pseudo-null, so `(Λ^r/Λ(a_i))_tors` is an extension of a pseudo-null module by `Λ(b_i)/Λ(a_i) ≅ Λ/g`, and its characteristic ideal is `(g)`.

Over a free reflexive hull, every functional is a `Λ`-combination of coordinates, so `ind_Λ(c) = (a_1, …, a_r) ⊂ (g)` with `(g)` the smallest principal ideal containing it.

The definition exposes the following operations and relations.

- `TauCeti.KolyvaginSystem.ind`: `Ind(c)`, the principal ideal generated by the gcd of the coordinates of `c` in a free pseudo-isomorphic module.
- `TauCeti.KolyvaginSystem.ind_zero`: `Ind(0) = 0`.
- `TauCeti.KolyvaginSystem.ind_eq_char`: For `c ≠ 0, Ind(c) = char((H¹(Q, 𝐓)/Λc)_tors)`.
- `TauCeti.KolyvaginSystem.ind_smul`: `Ind(λc) = λ Ind(c)`.
- `TauCeti.KolyvaginSystem.exists_finiteIndex_mul_mem`: There is an ideal `B` of finite index in `Λ` with `Bc ⊂ Ind(c)H¹(Q, 𝐓)`.
- `TauCeti.KolyvaginSystem.lambdaIndex_le_ind`: `ind_Λ(c) ⊂ Ind(c)`, and for `f ∈ Λ, ind_Λ(c) ⊂ (f)` iff `Ind(c) ⊂ (f)`.
- `TauCeti.KolyvaginSystem.indKS`: `Ind(κ) = Ind(κ_1)` for `κ ∈ KS‾(𝐓)`.

**Checks.**

- `TauCeti.KolyvaginSystem.ind_free_rank_one`: If `H¹(Q, 𝐓) ≅ Λ` and `c ↦ f ≠ 0`, then `Ind(c) = fΛ = char(Λ/fΛ)`.
- `TauCeti.KolyvaginSystem.ind_rank_two`: If `H¹(Q, 𝐓) ≅ Λ²` and `c ↦ (p, γ − 1)`, then `Ind(c) = Λ`, while Rubin's `ind_Λ(c) = (p, γ − 1)` is not principal: the two definitions differ as ideals but give the same divisibility by principal ideals.
- `TauCeti.KolyvaginSystem.ind_zero_convention`: `Ind(0) = 0`; the literal formula `char((H¹/Λ·0)_tors) = char(0) = Λ` would give `Λ` and make Theorem 5.3.10`(i)` false for `κ_1 = 0`.
- `TauCeti.KolyvaginSystem.ind_pseudoIso_invariant`: `Ind(c)` does not change if `H¹(Q, 𝐓)` is replaced by a module pseudo-isomorphic to it carrying `c` to the image of `c`.

`H¹ ≅ Λ, c ↦ f: Ind(c) = (f)`.

`H¹ ≅ Λ², c ↦ (p, γ − 1): Ind(c) = Λ` while `ind_Λ(c) = 𝔐`.

*Needs:* Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`; `SelmerIwasawaCohomology Layer 3`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.6`; `UniqueFactorizationMonoid`.

### 8.20 `X∞` is finitely generated over `Λ`

For every admissible `K∞/K` and every `T`, the `Λ`-module `X∞ = Hom_O(S_{Σp}(K∞, W*), D)` is finitely generated (Rubin, Lemma VII.4.1).

The precise hypotheses are No large-image hypothesis is needed; Rubin's proof uses Proposition VII.3.4(iii), stated after the twist (5); the twist does not change finite generation, since `X∞(T⊗ρ) ≅ X∞(T) ⊗ ρ`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §4, Lemma 4.1 and proof, p. 110). Statement and the Nakayama reduction.

`X∞/JX∞ = Hom(S_{Σp}(K∞, W*)^{G_K}, D)` for the augmentation ideal `J` (Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups).

By Layer 8.15 Kernels and cokernels of restriction along the tower (iii) with `F = K, S_{Σp}(K, W*) → S_{Σp}(K∞, W*)^{G_K}` has finite cokernel, and `Hom(S_{Σp}(K, W*), D)` is finitely generated over `O` (Rubin, Lemma I.5.7(iii); SelmerIwasawaCohomology §2.18 (Selmer groups of `T` and `W` as limits)), so `X∞/JX∞` is finitely generated over `O`.

`X∞` is compact, so topological Nakayama's lemma over `Λ` (supplied by PadicMeasuresIwasawaAlgebras L5) gives finite generation.

For `X∞ = 0` (`T = Z_p(1)` over `Q∞`) the statement is trivial; for `T = O_{χ^{-1}}(1)` over `Q∞, X∞` is the `χ`-part of the Iwasawa module of the `p`-split unramified extension, a finitely generated torsion `Λ`-module.

*Needs:* Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; Layer 8.15 Kernels and cokernels of restriction along the tower; Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; `PadicMeasuresIwasawaAlgebras Layer 5`.

### 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7)

Suppose `Γ ≅ Z_p` and either `K` is imaginary quadratic or `K` is totally real and Leopoldt's conjecture holds for `K`, and that `Hyp(K∞, V)` holds. `(i)` If `G_{K∞}` acts trivially on `T`, then `X∞/Ann_Λ(T)X∞` is finite. (ii) If `G_{K∞}` acts trivially on `T(−1) = T ⊗ O(ε_cyc^{-1})`, then `X∞/Ann_Λ(T(−1))X∞` is finite.

The precise hypotheses are These are exactly the cases singled out by `Hyp(K∞/K)`; `Hyp(K∞, V)`(ii) forces `rank_O T = 1` in both cases, with `T` a twist of `O` or `O(1)` by a character of `Γ`; The lemma is proved without the twist assumption (5) of Layer 8.15 Kernels and cokernels of restriction along the tower, which may fail for `W = Q_p/Z_p`; it holds for `W*` and Proposition VII.3.4(iii) is still available.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §3, Lemma 3.7, p. 109). Statement `(i)` with the same hypotheses and conclusion, expressed in roadmap notation; (ii) is the same for `T(−1)`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §3, proof of Lemma 3.7, p. 109). The Leopoldt step.

Both statements are invariant under twisting by characters of `Γ` (`X∞ ↦ X∞ ⊗ ρ` and `Ann_Λ ↦ Tw_{ρ^{-1}}(Ann_Λ)`, Lemma VI.1.2), so one may take `T = O`, resp. `O(1)`, and `O = Z_p`; then the claim is that `X∞/JX∞` is finite, `J` the augmentation ideal.

`T = Z_p(1): W* = Q_p/Z_p` and `X∞ = Gal(L∞/K∞), L∞` the maximal abelian `p`-extension of `K∞` unramified everywhere and split completely above `p`; `X∞/JX∞ = Gal(L/K∞)` with `L` the maximal subextension abelian over `K`, finitely generated. If `K` is totally real with Leopoldt, `K` has no `Z_p²`-extension; if `K` is imaginary quadratic, no prime above `p` is infinitely split in its `Z_p²`-extension; either way `L/K∞` is finite.

`T = Z_p: W* = μ_{p^∞}`; by Layer 8.15 Kernels and cokernels of restriction along the tower (iii) the map `S_{Σp}(K, μ_{p^∞}) → S_{Σp}(K∞, μ_{p^∞})^{G_K} = Hom(X∞/JX∞, Q_p/Z_p)` has finite cokernel, and `S_{Σp}(K, μ_{p^∞})` is finite by Leopoldt's conjecture (Rubin, Corollary I.6.4, supplied by SelmerIwasawaCohomology §4.18).

`K = Q, K∞ = Q∞, T = Z_p(1): X∞ = 0`, so the quotient is 0.

Without `Hyp(K∞/K)` (a field with `r_2 ≥ 1` not imaginary quadratic, `T = Z_p(1)`) the quotient `X∞/JX∞` can be infinite, since `K` has a `Z_p²`-extension in which the primes above `p` are not infinitely split.

*Needs:* Layer 8.6 Rubin's hypothesis `Hyp(K∞/K)`; Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; Layer 8.15 Kernels and cokernels of restriction along the tower; Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting; `SelmerIwasawaCohomology Layer 4`; `TauCetiRoadmap.ClassFieldTheory Layer 12`.

### 8.22 Control of Selmer groups at height-one specializations

(Mazur–Rubin, canonical structure, `K = Q, K∞ = Q∞, T` satisfying `(H.0)`–`(H.4)`.) For every height-one prime `𝔓` of `Λ` and every place `v`, the inclusion `𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓` induces `H¹_{F_Λ}(Q_v, 𝐓/𝔓𝐓) → H¹_{F_can}(Q_v, T ⊗ S_𝔓)` and `H¹_{F_can*}(Q_v, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q_v, (𝐓/𝔓𝐓)*)`, whose kernels and cokernels, for `𝔓 ∉ Σ_Λ`, are finite of order bounded by a constant depending only on `T` and `[S_𝔓 : Λ/𝔓]` (Lemma 5.3.13). Globally, `π_𝔓: H¹(Q, 𝐓)/𝔓H¹(Q, 𝐓) ↪ H¹_{F_can}(Q, T ⊗ S_𝔓)` is injective for every `𝔓`, and `π*_𝔓: H¹_{F_can*}(Q, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q, 𝐓*)[𝔓]` is defined; for `𝔓 ∉ Σ_Λ, coker π_𝔓, ker π*_𝔓` and `coker π*_𝔓` are finite of order bounded by a constant depending only on `T` and `[S_𝔓 : Λ/𝔓]` (Proposition 5.3.14). (Howard, ordinary structure, `T = T_pE` over the anticyclotomic tower.) The same holds for every height-one `𝔓 ≠ pΛ` locally (Lemma 2.2.7, bounds depending only on `[S_𝔓 : Λ/𝔓]`) and, outside a finite set `Σ_Λ`, globally for `H¹_{F_Λ}(K, 𝐓)/𝔓 → H¹_{F_𝔓}(K, 𝐓_𝔓)` and `H¹_{F_𝔓}(K, 𝐀_𝔓) → H¹_{F_Λ}(K, 𝐀)[𝔓]` (Proposition 2.2.8).

The precise hypotheses are `(H.3)` of Mazur–Rubin §3.5 (Layer 0) gives `H⁰(Q_Σ/Q, T ⊗ (S_𝔓/(Λ/𝔓))) = 0` (their Lemma 3.5.2), used for injectivity; The uniformity of the bounds in `[S_𝔓 : Λ/𝔓]` is essential: along the perturbations `𝔓_N` of Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes this index is constant, so the error is `O(1)` as `N` grows; For any other tower, generic local-rank-zero conclusions require local `H²` torsion as an explicit hypothesis; the split-place Check in §8.13 prevents inferring it from finite generation. Howard's local proof at `v | p` uses that the residue field points `Ẽ(F_v)[p^∞]` are finite and that `K∞,v/K_v` is totally ramified; the generic statement for another ordinary representation must re-verify these inputs.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Proposition 5.3.14, p. 64). The global control statement.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Lemma 5.3.13, p. 62). The local control statement.

([Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1), §2.2, Proposition 2.2.8, p. 26). Howard's ordinary version.

Local, `ℓ ≠ p`: the map factors through `H¹(Q_ℓ^ur/Q_ℓ, T^I) → H¹(Q_ℓ^ur/Q_ℓ, (T/𝔓T)^I)`, surjective because `Gal(Q_ℓ^ur/Q_ℓ)` has cohomological dimension one; the kernel is a quotient of `H⁰(Q_ℓ, T ⊗ (S_𝔓/(Λ/𝔓)))`, of order `≤ [S_𝔓 : Λ/𝔓]^{rank T}`; the cokernel is bounded by |`T ⊗ (S_𝔓/(Λ/𝔓))`| and by `H¹(I, T)_tors ⊗ Λ/(Fr_ℓ − 1)Λ`, using `𝔓 ≠ pΛ`.

Local, `v = p`: the cokernel of `H¹(Q_p, 𝐓) → H¹(Q_p, 𝐓/𝔓𝐓)` is `H²(Q_p, 𝐓)[𝔓]`, finite for `𝔓 ∉ Σ_Λ` and bounded by the maximal finite submodule of `H²(Q_p, 𝐓)`; the passage to `T ⊗ S_𝔓` is controlled by `H^i(Q_p, T ⊗ (S_𝔓/(Λ/𝔓))), i = 0`, 1. Archimedean places likewise.

Global: `G_{Q,Σ}`-cohomology of `0 → 𝐓 → 𝐓 → 𝐓/𝔓𝐓 → 0` gives `H¹(Q, 𝐓)/𝔓 ↪ H¹(Q_Σ/Q, 𝐓/𝔓𝐓)` with cokernel `H²(Q_Σ/Q, 𝐓)[𝔓]`; then `H¹(Q_Σ/Q, 𝐓/𝔓𝐓) → H¹(Q_Σ/Q, T ⊗ S_𝔓)` is injective by Lemma 3.5.2 with cokernel bounded by `H¹(Q_Σ/Q, T ⊗ (S_𝔓/(Λ/𝔓)))`; the local bounds restrict this to the Selmer modules. The dual statements follow by local duality and Mazur–Rubin's Lemma 3.5.3 `(H¹_{F*}(Q, 𝐓*[𝔓]) = H¹_{F*}(Q, 𝐓*)[𝔓])`.

Howard's ordinary case: the same argument, with Mazur–Rubin's Lemma 5.3.13 at `v ∤ p` and, at `v | p`, the composition `H¹(K_v, Fil_v 𝐓) → H¹(K_v, Fil_v T ⊗ Λ/𝔓) → H¹(K_v, Fil_v T_𝔓) → H¹_{F_𝔓}(K_v, T_𝔓)`, controlled by `H²(K_v, Fil_v 𝐓)[𝔓]` (dual to `H⁰(K_v, gr_v A)`, finite), by `H¹(K_v, T ⊗ S_𝔓/(Λ/𝔓))` and by `H⁰(K_v, gr_v A_𝔓)`.

For `𝔓 = J ∉ Σ_Λ`, so that both `H²(Q_Σ/Q, 𝐓)[J]` and `H²(Q_p, 𝐓)[J]` are finite, `H¹(Q, 𝐓)/JH¹(Q, 𝐓) ↪ H¹(Q_Σ/Q, T)` with finite cokernel `H²(Q_Σ/Q, 𝐓)[J]`. Finiteness of the local term alone does not control this global obstruction.

The bounds are uniform along `𝔓_N = (g + p^N), N ≫ 0`.

*Needs:* Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 8.13 The exceptional set `Σ_Λ` of height-one primes; Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 0.7 The canonical and the unramified Selmer structures; Layer 0.6 Selmer modules of quotients and torsion submodules; `SelmerIwasawaCohomology Layer 3`; `SelmerIwasawaCohomology §2.17 (Local duality for the finite conditions on T and W_M)`; `ArithmeticGaloisDuality §R02.4.3 (Poitou–Tate duality and the nine-term exact sequence)`.

### 8.23 The generic core `rank χ(𝐓)` (Mazur–Rubin, Lemma 5.3.16)

Use the Mazur–Rubin cyclotomic coefficient setting `O=Z_p, K=Q` and `K∞=Q∞`, with `T` satisfying `(H.0)`–`(H.4)`. At a height-one prime `𝔓` outside `Σ_Λ`, the canonical specialized core rank equals the dimension of the minus part: `χ(T ⊗ S_𝔓,F_can)=rank_{Z_p}T⁻`. Define `χ(𝐓)` to be this common value. Over a larger coefficient ring `O` the coefficient-linear version uses `rank_O T⁻`, not its `Z_p`-rank; that general Layer 0.8 The core rank of a cartesian Selmer structure formula is the Layer 0/SelmerIwasawaCohomology contract.

The precise hypotheses are Core rank is Layer 0's notion (Mazur–Rubin, Definition 4.1.11), with the formula `χ(T ⊗ S) = rank (T ⊗ S)^- + corank H⁰(Q_p, (T ⊗ S)*)` of their Theorem 5.2.15 for the canonical structure; By Perrin-Riou's Proposition 1.3.2, if the weak Leopoldt conjecture holds for `T` then `rank_Λ H¹(Q, 𝐓) = χ(𝐓)` (Mazur–Rubin, Remark 5.3.18).

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Lemma 5.3.16, p. 65). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Definition 5.3.17, p. 65). The definition of the generic core rank.

`(T ⊗ S_𝔓)^- = T^- ⊗ S_𝔓`, so its `S_𝔓`-rank is `rank_{Z_p} T^`-.

`H⁰(Q_p, (𝐓/𝔓𝐓)*)` is dual to `H²(Q_p, 𝐓/𝔓𝐓) ≅ H²(Q_p, 𝐓)/𝔓H²(Q_p, 𝐓)` (`G_{Q_p}` has cohomological dimension 2), which is finite for `𝔓 ∉ Σ_Λ` because `H²(Q_p, 𝐓)` is a finitely generated torsion `Λ`-module; so `H⁰(Q_p, (T ⊗ S_𝔓)*)` is finite and contributes 0.

`T = T_pE`: rank `T^- = 1`, so `χ(𝐓) = 1`.

`T = O(1) ⊗ ρ^{-1}, ρ` even: complex conjugation acts by `−1` on `O(1)` and trivially through `ρ^{-1}`, so `χ(𝐓) = 1`.

For `O` the integers in an unramified quadratic extension of `Q_p` and `T⁻` free of `O`-rank one, `rank_{Z_p}T⁻=2`. It cannot be substituted for the coefficient-linear rank1; the displayed MR cyclotomic formula is scoped to `O=Z_p`.

*Needs:* Layer 8.13 The exceptional set `Σ_Λ` of height-one primes; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 0.8 The core rank of a cartesian Selmer structure; Layer 0.10 Core rank of the canonical and unramified structures; `SelmerIwasawaCohomology Layer 3`.

### 8.24 The blind spot and `Λ`-primitive Kolyvagin systems

Let `κ ∈ KS‾(𝐓, F_Λ, P)`. The blind spot of `κ` is the set of ideals `I ⊂ Λ` such that the image of `κ` under the reduction map `KS‾(𝐓) → KS‾(𝐓/I𝐓)` is zero. This map is induced levelwise by `KS(𝐓/𝔐^k𝐓, P ∩ P_j) → KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j)`, using `P_j(𝐓) ⊆ P_j(𝐓/I𝐓)`; no map `KS‾(𝐓) → KS(𝐓/I𝐓)` is used. For `κ ∈ KS(𝐓)` take its image in `KS‾(𝐓)`; this recovers Mazur–Rubin's composite `KS(𝐓) → KS(𝐓/I𝐓) → KS‾(𝐓/I𝐓)` (Definition 3.1.6). Equivalently, `I` is not in the blind spot iff for some `k ≥ 1` a representative of the level-`k` component of `κ`, given at some stage `j₀`, has nonzero image in `KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j)` for every `j ≥ j₀`. The blind spot of `KS‾(𝐓)` is the intersection of the blind spots of its elements. `κ` is `Λ`-primitive if its blind spot contains no height-one prime of `Λ` (Definition 5.3.9). It is residually primitive (primitive, Definition 4.5.5, owned by Layer 5) if its image in `KS‾(T̄) = KS‾(𝐓/𝔐𝐓)` is nonzero, `i`.`e`. `𝔐` is not in its blind spot; when `χ(T̄) = 1` the map `KS(T̄) → KS‾(T̄)` is an isomorphism (Mazur–Rubin, Corollary 4.5.3) and this is nonvanishing in `KS(T̄)`.

The precise hypotheses are Residual primitivity implies `Λ`-primitivity (Layer 8.26 Residual primitivity implies `Λ`-primitivity); the two are different conditions and Theorem 5.3.10(iii) needs only `Λ`-primitivity; `A` nonzero `κ`, even with `κ_1 ≠ 0`, need not be `Λ`-primitive.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Definition 5.3.9, p. 61). `Λ`-primitivity and its distinction from primitivity.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §3.1, Definition 3.1.6, p. 21). The blind spot.

If `𝔓` is not in the blind spot of `κ` then `κ^{(𝔓)} ≠ 0` (Mazur–Rubin, Lemma 5.3.20): choose `α, β ∈ Λ/𝔓` with `αS_𝔓 ⊂ Λ/𝔓` and `κ` nonzero modulo `β`; multiplication by `α` injects `H¹(𝐓_𝔓/β)` into `H¹(𝐓_𝔓/αβ)` (Lemma 3.5.2), and the composition through `T ⊗ S_𝔓` is multiplication by `α`.

Scaling: the image of `λκ` in `KS‾(𝐓/I𝐓)` is `λ` times that of `κ`, so if `λ ∈ 𝔓` then `𝔓` is in the blind spot of `λκ`.

The definition exposes the following operations and relations.

- The blind spot is `TauCeti.KolyvaginSystems.blindSpot` of Layer 3.3 at `R = Λ`: the set of ideals `I ⊂ Λ` with `κ ↦ 0` under `KS‾(𝐓) → KS‾(𝐓/I𝐓)`. No separate definition is made here.
- `TauCeti.KolyvaginSystem.mem_blindSpot_iff`: `I ∉` blindSpot `κ` iff there are `k` and a representative of the level-`k` component of `κ` at a stage `j₀` whose image in `KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j)` is nonzero for every `j ≥ j₀`; the condition does not depend on the representative.
- `TauCeti.KolyvaginSystem.IsLambdaPrimitive`: `κ` is `Λ`-primitive iff no height-one prime of `Λ` lies in blindSpot `κ`.
- `TauCeti.KolyvaginSystem.IsLambdaPrimitive.of_isPrimitive`: `A` residually primitive `κ` is `Λ`-primitive (Layer 8.26 Residual primitivity implies `Λ`-primitivity).
- `TauCeti.KolyvaginSystem.specialize_ne_zero_of_not_mem_blindSpot`: If `𝔓 ∉` blindSpot `κ` then `κ^{(𝔓)} ≠ 0` in `KS‾(T ⊗ S_𝔓)` (Mazur–Rubin, Lemma 5.3.20).
- `TauCeti.KolyvaginSystem.blindSpot_smul`: blindSpot `κ ⊂` blindSpot `(λκ)`, and every ideal containing `λ` lies in blindSpot `(λκ)`.
- `TauCeti.KolyvaginSystem.not_isLambdaPrimitive_smul`: If `λ ∈ Λ` is not a unit then `λκ` is not `Λ`-primitive (`λ` lies in a height-one prime, `Λ` being factorial).
- `TauCeti.KolyvaginSystem.blindSpot_zero`: The blind spot of 0 is every ideal.

**Checks.**

- `TauCeti.KolyvaginSystem.cyclotomic_isLambdaPrimitive`: For `T = O(1) ⊗ ρ^{-1}, ρ` even of prime-to-`p` order, unramified at `p`, with `ρ(p) ≠ 1`, the cyclotomic-unit system `κ^{ρ,∞}` is `Λ`-primitive (Büyükboduk, Proposition 4.1).
- `TauCeti.KolyvaginSystem.augmentation_mul_not_primitive`: For any `κ, (γ − 1)κ` has `κ_1` possibly nonzero but `J = (γ − 1)` in its blind spot, so it is not `Λ`-primitive: a definition of `Λ`-primitivity as '`κ_1 ≠ 0`' fails this.
- `TauCeti.KolyvaginSystem.free_rank_one_primitive_iff`: If `KS‾(𝐓)` is free of rank one on a residually primitive `κ_0`, then `λκ_0` is `Λ`-primitive iff `λ ∈ Λ^×` iff `λκ_0` is residually primitive.
- `TauCeti.KolyvaginSystem.zero_not_primitive`: The zero system has every ideal in its blind spot and is not `Λ`-primitive.
- `TauCeti.KolyvaginSystem.blindSpot_zero_ideal`: For `I = 0` the reduction map is the identity of `KS‾(𝐓)`, so `0` lies in the blind spot of `κ ∈ KS‾(𝐓)` iff `κ = 0`. The test needs no representative of `κ` in `KS(𝐓)`, which need not exist since `KS(𝐓) → KS‾(𝐓)` need not be surjective.

The cyclotomic-unit `Λ`-adic system for `O(1) ⊗ ρ^{-1}, ρ` even of prime-to-`p` order, unramified at `p`, with `ρ(p) ≠ 1`, is `Λ`-primitive (Büyükboduk, Proposition 4.1).

`(γ − 1)κ` is never `Λ`-primitive.

*Needs:* Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 5.3 Kolyvagin systems in core rank one; Layer 0.8 The core rank of a cartesian Selmer structure; `PadicMeasuresIwasawaAlgebras §4.3`.

### 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2)

Let `K∞/K` be admissible, `c` an Euler system for `(T, K∞)`, and suppose `V` satisfies `Hyp(K∞, V)`. If `c_{K,∞}` does not belong to the `Λ`-torsion submodule of `H¹_∞(K, T)`, then `X∞` is a torsion `Λ`-module.

The precise hypotheses are No hypothesis on `p` (`p = 2` allowed) and no `Hyp(K∞/K)` are needed; The conclusion is the weak Leopoldt conjecture for `T` (Rubin, Remark II.3.5); Non-torsion of `c_{K,∞}` is a hypothesis to be proved by each application (for instance Kato's Proposition 13.7); this roadmap does not supply it.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Theorem 3.2, p. 28 (published Theorem 2.3.2, p. 41)). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §4, opening, p. 110). The structure of the proof.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Remark 3.5, p. 28). Its name.

`X∞` is finitely generated (Layer 8.20 `X∞` is finitely generated over `Λ`). Suppose it is not torsion. `H¹(Ω∞/K∞, W*)` is `Λ`-torsion (Rubin, Corollary C.2.2 with `F = K∞`; finiteness and character-type of `H¹(Ω/F, W)` for `p`-adic analytic Galois groups, the Appendix `C` input of Layer 4), so by Lemma VII.3.6(iii) some `γ_0 ∈ G_{Ω∞}` has `Ev*(γ_0) ∉ (X∞)_tors`; the set `J = {γ ∈ τG_{Ω∞} : Ev*(γ) ∉ (X∞)_tors}` is nonempty and open, and generates a group containing an open subgroup of `G_{Ω∞}` (Lemma VII.4.2).

For `γ ∈ J`, every `F` and `M`, Corollary VII.2.8 gives `a_τ Ev`~`(γ)(κ_{F,M}) Ev*(γ) = 0` with `κ_{F,M} = κ_{F,1,M}` the image of `c_F` (Layer 3, Lemma IV.4.13). The `Ev`~`(γ)(κ_{F,M})` are compatible under restriction and form an element `λ_γ` of `lim Λ_{F,M} = Λ` with `a_τ λ_γ Ev*(γ) = 0`; since `Ev*(γ)` is not torsion and `a_τ ≠ 0, λ_γ = 0`. As `J` generates a group containing an open subgroup of `G_{Ω∞}`, which has finite index, and `Λ` is torsion-free, `Ev(γ)(κ_{F,M}) = 0` for every `γ ∈ G_{Ω∞}`, every `F` and every `M`.

By Lemma VII.3.6(i), `a_τ Ann_Λ(H¹(Ω∞/K∞, W))` kills the image of `κ_{F,M}` in `H¹(K∞, W)`; by Layer 8.15 Kernels and cokernels of restriction along the tower `(i)`, (ii) a fixed integer `m` kills `m·Ann_Λ(H¹(Ω∞/K∞, W))κ_{F,M}` for all `M`, so `m·Ann(H¹(Ω∞/K∞, W))c_F` is divisible in `H¹(F, T)`, hence 0 (Proposition B.2.4: `H¹(F, T)` has no nonzero divisible elements).

Controlling `H¹(F, T)_tors` by Lemma I.2.2(ii), the nonzero ideal `Ann_Λ(W^{G_{K∞}})Ann_Λ(H¹(Ω∞/K∞, W))` kills `c_{K,∞}`, contradicting non-torsion.

For the cyclotomic-unit Euler system for `O_{χ^{-1}}(1)` over `Q∞, χ` even, nontrivial and of finite order prime to `p` (Rubin, Chapter III §2.2), the hypothesis holds and `X∞` is torsion.

The zero Euler system does not satisfy the hypothesis, and the theorem says nothing about it.

*Needs:* Layer 8.20 `X∞` is finitely generated over `Λ`; Layer 8.10 Rubin's evaluation maps and the constant `a_τ`; Layer 8.15 Kernels and cokernels of restriction along the tower; Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 4.3 Rubin's hypotheses, index of divisibility and error terms; `ArithmeticGaloisDuality §R02.1.3 (Rationalisation of lattice cohomology)`; `Module.IsTorsion`.

### 8.26 Residual primitivity implies `Λ`-primitivity

If `κ ∈ KS‾(𝐓)` has nonzero image in `KS‾(𝐓/𝔐𝐓) = KS‾(T̄)` (equivalently, when `χ(T̄) = 1`, in `KS(T̄)`), then `κ` is `Λ`-primitive.

The precise hypotheses are The converse fails in general: `Λ`-primitivity concerns only height-one primes, primitivity the maximal ideal (Mazur–Rubin, Definition 5.3.9).

([Kâzım Büyükboduk, Λ-adic Kolyvagin systems](https://arxiv.org/pdf/0706.0377v2), §4.1.1, proof of Proposition 4.1, pp. 28–29). The argument, in the cyclotomic-unit case.

For every height-one `𝔓 ⊂ 𝔐` the reduction `KS‾(𝐓) → KS‾(𝐓/𝔐𝐓)` factors as `KS‾(𝐓) → KS‾(𝐓/𝔓𝐓) → KS‾(𝐓/𝔐𝐓)` (functoriality, Layer 8.12 `Λ`-adic Kolyvagin systems); a nonzero image at the end forces a nonzero image at `𝔓`, so `𝔓` is not in the blind spot (Büyükboduk, proof of Proposition 4.1).

Applied to the cyclotomic-unit system for `O(1) ⊗ ρ^{-1}, ρ` even of prime-to-`p` order, unramified at `p`, with `ρ(p) ≠ 1`, which is primitive by Mazur–Rubin's Remark 6.1.8, it gives `Λ`-primitivity.

*Needs:* Layer 8.24 The blind spot and `Λ`-primitive Kolyvagin systems; Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 5.1 Divisibility indices, elementary divisors and primitivity.

### 8.27 Weak Leopoldt from a `Λ`-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6)

Let `K = Q, K∞ = Q∞, T` satisfy `(H.0)`–`(H.4)` of Mazur–Rubin §3.5, and `κ ∈ KS‾(𝐓, F_Λ, P)` with `κ_1 ≠ 0` (`F_Λ` canonical). Then for all but finitely many height-one primes `𝔓` the class `κ^{(𝔓)}_1 ∈ H¹(Q, T ⊗ S_𝔓)` is nonzero (Corollary 5.3.19), and `H¹_{F_Λ*}(Q, 𝐓*)` is a co-torsion `Λ`-module, `i`.`e`. `X∞` is `Λ`-torsion (Theorem 5.3.6).

The precise hypotheses are Theorem 5.3.6 is stated for `KS(𝐓)` and holds with the same proof for `KS‾(𝐓)` (Remark 5.3.11); This is the Kolyvagin-system counterpart of Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2); for `κ` from an Euler system `c, κ_1 = c_{Q,∞}`.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Theorem 5.3.6, p. 61). Theorem 5.3.6 with the same hypotheses and conclusion, expressed in roadmap notation.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Corollary 5.3.19, p. 65). Corollary 5.3.19 with the same hypotheses and conclusion, expressed in roadmap notation.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, proof of Theorem 5.3.6, pp. 65–66). The proof.

`κ_1` is a nonzero element of the finitely generated torsion-free `Λ`-module `H¹(Q, 𝐓)` (Mazur–Rubin, Lemma 5.3.5, supplied by SelmerIwasawaCohomology L3), so `κ_1 ∈ 𝔓H¹(Q, 𝐓)` for only finitely many height-one `𝔓`; injectivity of `π_𝔓` (Layer 8.22 Control of Selmer groups at height-one specializations) gives Corollary 5.3.19.

Choose `𝔓 ∉ Σ_Λ` with `κ^{(𝔓)}_1 ≠ 0`. Mazur–Rubin's Theorem 5.2.2 over the DVR `S_𝔓` (Layer 4) shows `H¹_{F_can*}(Q, (T ⊗ S_𝔓)*)` finite; by Layer 8.22 Control of Selmer groups at height-one specializations, `H¹_{F_Λ*}(Q, 𝐓*)[𝔓]` is finite.

Since `(Λ^∨)[𝔓] = (Λ/𝔓)^∨` is infinite, `H¹_{F_Λ*}(Q, 𝐓*)` is co-torsion.

For the cyclotomic-unit system `κ^{ρ,∞}, X∞` is torsion.

For `κ = 0` nothing is asserted.

*Needs:* Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 8.13 The exceptional set `Σ_Λ` of height-one primes; Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 4.20 The Kolyvagin system bound; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; `SelmerIwasawaCohomology Layer 3`.

### 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10)

Let `K` be imaginary quadratic, `K∞/K` its anticyclotomic `Z_p`-extension, `O` the integers of a finite extension of `Q_p` with uniformizer `ϖ, Λ = O[[Γ]]` with the involution `ι, 𝐓 = T ⊗ Λ, 𝐀 = Hom(𝐓, μ_{p^∞})` with the perfect pairing `e_Λ: 𝐓 × 𝐀 → μ_{p^∞}, e_Λ(λt, a) = e_Λ(t, λ^ι a)`, and `F_Λ` a `Λ`-adic Selmer structure whose local conditions on `𝐓` and `𝐀` are exact orthogonal complements; `X = Hom(H¹_{F_Λ}(K, 𝐀), Q_p/Z_p)`. Assume: `(A) H¹_{F_Λ}(K, 𝐓)` is `Λ`-torsion-free; `(B)` Layer 8.22 Control of Selmer groups at height-one specializations holds for `(𝐓, F_Λ)` with a finite exceptional set `Σ_Λ`; `(C)` for every height-one `𝔓 ≠ ϖΛ` (and the perturbed `𝔔 = (g + ϖ^m)`) outside `Σ_Λ`, the specialized Selmer triple `(T_𝔓, F_𝔓, L_s)` satisfies Howard's hypotheses `H`.0–`H`.5, so that Layer 5's self-dual DVR theorem (Howard, Theorem 1.6.1, Proposition 2.1.3) applies; `(D) char(X_tors) = char(X_tors)^ι`. If for some `s` there is `κ ∈ KS(𝐓, F_Λ, L_s)` with `κ_1 ≠ 0`, then `(a) H¹_{F_Λ}(K, 𝐓)` is torsion-free of rank one; `(b)` there is a torsion `Λ`-module `M` with `char(M) = char(M)^ι` and a pseudo-isomorphism `X ∼ Λ ⊕ M ⊕ M`; `(c) char(M)` divides `char(H¹_{F_Λ}(K, 𝐓)/Λκ_1)`. For `T = T_pE, E/Q` ordinary at `p` with surjective `ρ̄_{E,p}` and Howard's standing hypotheses on `(E, K, p)`, with the ordinary structure, Howard verifies `(A)`–`(D)` in Proposition 2.1.3, Lemma 2.2.7, Proposition 2.2.8 and Lemma 2.2.9, with Nekovář's functional equation `char(X_tors) = char(X_tors)^ι`, and the theorem is then his Theorem 2.2.10. That elliptic instance is an application: no theorem is imported here from a roadmap constructing Heegner classes, and its `(A)`–`(D)` remain explicit hypotheses.

The precise hypotheses are The anticyclotomic tower is not admissible (inert primes away from `p` split completely), so Rubin's Theorem II.3.3 does not apply; this theorem works directly with Kolyvagin systems; `(c)` is a divisibility, with the factor two of the self-dual structure built into `X ∼ Λ ⊕ M ⊕ M`; it is not a universal formula for every `T`; The nonvanishing `κ_1 ≠ 0` is an input; for Heegner points it is the Cornut–Vatsal nonvanishing theorem, an explicit hypothesis here; Howard writes the theorem for `T_pE`; the abstraction `(A)`–`(D)` lists exactly the inputs his proof uses; In the abstract `O`-version use the coefficient prime `(ϖ)`, perturb by `ϖ^m` or `T^m+ϖ`, and measure the asymptotics in `O`-length. The source elliptic instance has `O=Z_p`. Conversion to `Z_p`-length multiplies by the residue degree of `O`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1), §2.2, Theorem 2.2.10, p. 26). The hypotheses and conclusion `(a)`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1), §2.2, Theorem 2.2.10`(b)`–`(c)`, p. 26). Conclusions `(b)`–`(c)`.

([Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1), §2.2, proof of Theorem 2.2.10, p. 27). The method: Mazur–Rubin's perturbation argument (their Theorem 5.3.10).

At every height-one `𝔓 ≠ ϖΛ` the specialization map `KS(𝐓, F_Λ, L_s) → KS(T_𝔓, F_𝔓, L_s(T_𝔓))` is defined (Howard, Remark 1.2.4 and Lemma 2.2.7); by `(B)` and `(A), κ^{(𝔓)}_1` generates an infinite `S_𝔓`-submodule for all but finitely many `𝔓`.

Enlarge `Σ_Λ` by those `𝔓`, the primes dividing `char(X_tors)`, and `ϖΛ`. For `𝔓 ∉ Σ_Λ, (C)` gives `H¹_{F_𝔓}(K, T_𝔓)` free of rank one and `corank H¹_{F_𝔓}(K, A_𝔓) = 1`, so by `(B) H¹_{F_Λ}(K, 𝐓)` has rank one and `H¹_{F_Λ}(K, 𝐀)` corank one: this is `(a)`.

For `𝔓 | f_Λ = char(H¹_{F_Λ}(K, 𝐓)/Λκ_1), 𝔓 ≠ ϖΛ`, with Weierstrass degree `d` and `𝔔 = (g + ϖ^m): length_O(H¹_{F_𝔔}(K, T_𝔔)/S_𝔔κ^{(𝔔)}_1) = m·d·ord_𝔓(f_Λ) + O(1)` and `2·length_O M_𝔔 = m·d·ord_𝔓 char(X_tors) + O(1)`; the finite-level bound `length M_𝔔 ≤ length(H¹/S_𝔔κ_1)` then gives `ord_𝔓 char(X_tors) ≤ 2 ord_𝔓(f_Λ)`; `𝔓 = ϖΛ` with `𝔔 = (T^m + ϖ)`. The length asymptotics along `𝔔` are the specialization-length application of Layer 8.18, using the module structure theorem of PadicMeasuresIwasawaAlgebras L4.

`(b)`: with `X_tors ∼ N ⊕ N_𝔓, N_𝔓 ≅ ⊕ Λ/𝔓^{e_i}`, the maps `N_𝔓 ⊗ S_𝔔 → M_𝔔 ⊕ M_𝔔` have bounded kernels and cokernels as `m` varies, and an elementary argument shows each exponent `e` occurs an even number of times; `(D)` gives `char(M) = char(M)^ι`. Then `(c)` follows from `(b)` and the inequality of the previous step.

For `E/Q` ordinary at `p` with surjective `ρ̄` and the Heegner Kolyvagin system, taken with `(A)`–`(D)` as hypotheses, this is Howard's Theorem B.

Scaling `κ` by `λ` multiplies `char(H¹/Λκ_1)` by `λ` and weakens `(c)` accordingly.

*Needs:* Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; `PadicMeasuresIwasawaAlgebras Layer 4`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.1`.

### 8.29 Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6)

Assume `Hyp(K∞, V)` and `Hyp(K∞/K), c` an Euler system for `(T, K∞)` with `c_{K,∞}` not `Λ`-torsion, so `X∞` is torsion (Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2)), and assume after twisting (Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting) that `X∞ ⊗ Λ_F` and `Λ_F/char(X∞)Λ_F` are finite for every `F` (Rubin's (1)) and that the twist assumption (5) of Layer 8.15 Kernels and cokernels of restriction along the tower holds. Fix an injective pseudo-isomorphism `⊕_{i=1}^{r} Λ/f_iΛ → X∞` with `f_{i+1} | f_i`, so `char(X∞) = ∏ f_iΛ`. `(a)` There are `z_1`, …, `z_r ∈ X∞` and ideals `g_1 ⊂ … ⊂ g_r` of `Λ` with `z_k ∈ Ev*(τG_{Ω∞}), a_τ g_k ⊂ f_kΛ`, split exact sequences `0 → Σ_{i<k} Λz_i → Σ_{i≤k} Λz_i → Λ/g_k → 0`, and `a_τ(X∞/Σ_i Λz_i)` pseudo-null (Proposition VII.1.4). `(b)` With `Z∞ = Σ Λz_i`, a Selmer sequence of `length k` is `(σ_1, …, σ_k)` in `τG_{Ω∞}` with `Ev*(σ_i) − z_i ∈ 𝔐Z∞`; for `M` a power of `p, L_{F,M}` is the fixed field of the common kernel of `S_{Σp}(F, W*_M)` restricted to `FΩ_M`, and a Kolyvagin sequence for `F, M` is `(Q_1, …, Q_k)` with `Q_i` over `q_i ∈ R` and `Fr_{Q_i} = σ_i` on `L_{F,M}`; `Ψ(k, F, M) ⊂ Λ_{F,M}` is the ideal generated by all `ψ(κ_{F,r(π),M}), π` of `length k, ψ ∈ Hom_Λ(Λ_{F,M}κ_{F,r(π),M}, Λ_{F,M})` (Definition VII.1.5). `(c)` There is `h ∈ Λ` prime to `char(X∞)` and, for every `F`, a power `N_F` of `p` such that `h a_τ^5 Ψ(k, F, MN_F)Λ_{F,M} ⊂ f_{k+1}Ψ(k+1, F, M)` for every power `M ≥ N_F` of `p` and `0 ≤ k < r` (Proposition VII.1.6).

The precise hypotheses are Kolyvagin sequences exist by the Chebotarev density theorem applied to the finite extensions `L_{F,M}/K` (EulerSystemsAndKolyvaginSystems Layer 1); `r(π) ∈ R_{F,M}` (Lemma IV.1.3); In the common special case `Hyp(K∞, T), O = Z_p` and `H¹(Ω∞/K∞, W*) = 0, (a)` holds with `g_i = f_iΛ` and any `z_i` realising the pseudo-isomorphism (Rubin, §6, first paragraph); Pseudo-null means annihilated by an ideal of height at least two; for `d ≥ 2` such modules need not be finite.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Proposition 1.6, p. 100). Part `(c)` with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Proposition 1.4, pp. 98–99). Part `(a)`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, after Proposition 1.6, p. 100). Its role.

`(a)`, Proposition VII.5.1: there are `Γ_0 ⊂ Γ` of finite index, characters `χ, χ*: Γ_0 → O^×` and an abelian `L ⊃ Ω∞` with an action of `Z_p[[Γ_0]]` on `Gal(L/Ω∞)` for which `Ev` and `Ev*` are `Tw_χ`-, `Tw_{χ*}`-semilinear.

Proposition VII.5.2: for `X`' `⊂ X∞` with pseudo-null quotient there is an ideal `A`' of height `≥ 2` with `A`' `a_τ Ann_Λ(W^{G_{K∞}})^ι Ann_Λ(H¹(Ω∞/K∞, W))^ι Hom(H¹(F, W_M), D) ⊂ O·Ev((Ev*)^{-1}(X') ∩ G_{Ω∞})`; for `Γ ≅ Z_p` the quotient is finite and the proof is short.

§6: `char(X∞)` is relatively prime (the sum of the two ideals has height at least two) to `Ann_Λ(W^{G_{K∞}}), Ann_Λ(H¹(Ω∞/K∞, W))` and `Ann_Λ(H¹(Ω∞/K∞, W*))^ι` (Lemma 6.1, using Layer 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7)); Lemma 6.3, applied to `X_0 = ΛEv*(τ) + ΛEv*(G_{Ω∞})` with `t = Ev*(τ)` and `B_0 = Ev*(G_{Ω∞})`, gives `x_1 ∈ t + B_0` and `x_2`, …, `x_r ∈ B_0`, and `z_1 = x_1, z_i = x_1 + x_i (i ≥ 2)` lie in `Ev*(τG_{Ω∞})` with the stated divisibilities.

`(c)`, §7: for a Selmer sequence `σ, Z_σ = Σ ΛEv*(σ_i) ≅ ⊕ Λ/g_iΛ` is a direct summand of `Z∞` (Lemma 7.1, by Nakayama); `Ann_Λ(X∞/Z∞)` kills `ker(Z_σ ⊗ Λ_{F,M} → X∞ ⊗ Λ_{F,M})` (Proposition 7.2); Theorems VII.2.6–2.7 compare `Ev`~`_q(κ_{F,rq,M})` with `Ev`~`(Fr_q)(κ_{F,r,M})` (Corollary 7.3, Lemma 7.4, Proposition 7.5, Corollary 7.6); a two-prime Chebotarev choice through Proposition 5.2 gives the divisibility by `f_{k+1}` up to `h a_τ^5` (Proposition 7.7).

Rank one, `Hyp(K∞, T), O = Z_p` and `H¹(Ω∞/K∞, W*) = 0: g_i = f_iΛ` and `a_τ = 1`.

`r = 0` (`X∞` pseudo-null): nothing to induct; `char(X∞) = Λ`.

*Needs:* Layer 8.10 Rubin's evaluation maps and the constant `a_τ`; Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2); Layer 8.15 Kernels and cokernels of restriction along the tower; Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting; Layer 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7); Layer 4.10 Rubin's selection of primes with large localisation; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.13 Local behaviour of derivative classes; Layer 3.14 Kolyvagin's congruence; `PadicMeasuresIwasawaAlgebras §4.1`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras Layer 4`.

### 8.30 The `Λ`-adic Kolyvagin-system bound and its equality criterion (Mazur–Rubin, Theorem 5.3.10)

Let `K = Q, K∞ = Q∞, T` satisfy `(H.0)`–`(H.4), F_Λ` canonical, `X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p)`, and `κ ∈ KS‾(𝐓, F_Λ, P)`. `(i) char(X∞)` divides `Ind(κ)`. (ii) If `χ(𝐓) = 1, κ_1 ≠ 0` and `𝔓` is a height-one prime not in the blind spot of `κ`, then `ord_𝔓 char(X∞) = ord_𝔓 Ind(κ)`. (iii) If `χ(𝐓) = 1, κ_1 ≠ 0` and `κ` is `Λ`-primitive, then `char(X∞) = Ind(κ)`.

The precise hypotheses are `(i)` is a divisibility only; equality needs all three conditions of (iii): generic core rank one, nonvanishing bottom class and `Λ`-primitivity. Nonvanishing alone does not give equality; With `Ind(0) = 0` (Layer 8.19 Mazur–Rubin's principal index `Ind(c)`), `(i)` is trivial when `κ_1 = 0`; For `κ` coming from an Euler system `c` via Layer 8.17 From Euler systems to `Λ`-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3), `Ind(κ) = Ind(c_{Q,∞})` and `(i)` is consistent with rubin-iwasawa-divisibility.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Theorem 5.3.10, p. 62). Parts `(i)`–(ii) in the roadmap conventions.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, Theorem 5.3.10(iii), p. 62). Part (iii) with the same hypotheses and conclusion, expressed in roadmap notation.

([Barry Mazur, Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf), §5.3, proof of Theorem 5.3.10, p. 67). The length comparison along the perturbations.

Assume `κ_1 ≠ 0`, so `X∞` is torsion (Layer 8.27 Weak Leopoldt from a `Λ`-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6)). Fix `𝔓 ≠ pΛ`, a distinguished generator `ρ(U)` of `𝔓, 𝔓_N = (ρ(U) + p^N)`, and a pseudo-isomorphism `X∞ → ⊕_i Λ/𝔓^{m_i} ⊕ ⊕_j Λ/f_j` with `f_j` prime to `𝔓`.

For `N` large: `𝔓_N` is prime with `Λ/𝔓 ≅ Λ/𝔓_N, κ_1` has nonzero image in `H¹(Q, T ⊗ S_{𝔓_N}), coker(H¹(Q, 𝐓)/𝔓_N ↪ H¹_{F_can}(Q, T ⊗ S_{𝔓_N}))` is bounded independently of `N`, and `𝔓_N ∉ Σ_Λ` is prime to every `f_j` (Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes, Layer 8.22 Control of Selmer groups at height-one specializations).

With `d = ord_𝔓 Ind(κ)` and `e` the ramification index of `S_{𝔓_N}/Z_p`, |`∂^{(0)}(κ^{(𝔓_N)}) − Nde| = O(1)`; Mazur–Rubin's Theorem 5.2.2 (Layer 4) gives `length H¹_{F_can*}(Q, (T ⊗ S_{𝔓_N})*) ≤ Ne·d + O(1)`, hence `length_{Z_p} H¹_{F_Λ*}(Q, 𝐓*)[𝔓_N] ≤ Nr·d + O(1), r = rank_{Z_p} S_{𝔓_N}`; on the other side `length_{Z_p}(X∞/𝔓_N X∞) = Nr Σ m_i + O(1) = Nr ord_𝔓 char(X∞) + O(1)` (supplied by PadicMeasuresIwasawaAlgebras L4). Letting `N → ∞` gives `(i)` at `𝔓`; for `𝔓 = pΛ` use `𝔓_N = (U^N + p)`.

(ii): by Lemma 5.3.20 some `κ_n` has nonzero image modulo `𝔪_𝔓^k`; for `N > k` the same holds at `𝔓_N`, so `∂^{(∞)}(κ^{(𝔓_N)}) < k`; `χ(T ⊗ S_{𝔓_N}) = 1` (Layer 8.23 The generic core `rank χ(𝐓)` (Mazur–Rubin, Lemma 5.3.16)) and Mazur–Rubin's Theorem 5.2.12(vii) (Layer 5) give equality in the length bound, hence equality of orders.

(iii) is (ii) at every height-one prime.

Cyclotomic units with `ρ(p) ≠ 1: κ^{ρ,∞}` is `Λ`-primitive and `χ = 1`, so `char(X∞) = Ind(κ^{ρ,∞})` (Büyükboduk, Proposition 4.1, citing this theorem).

Replacing `κ` by `(γ − 1)κ` keeps `(i)` but makes `Ind` larger by `(γ − 1)` and destroys `Λ`-primitivity, so (iii) cannot be applied: a false sharpness claim is excluded.

*Needs:* Layer 8.27 Weak Leopoldt from a `Λ`-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6); Layer 8.19 Mazur–Rubin's principal index `Ind(c)`; Layer 8.24 The blind spot and `Λ`-primitive Kolyvagin systems; Layer 8.23 The generic core `rank χ(𝐓)` (Mazur–Rubin, Lemma 5.3.16); Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 4.20 The Kolyvagin system bound; Layer 5.6 Structure of the dual Selmer group from a Kolyvagin system; `PadicMeasuresIwasawaAlgebras Layer 4`; `PadicMeasuresIwasawaAlgebras §4.6`.

### 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1)

Generic form: in the setting of Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10), retain `(A), (B)` and `(D)`, and replace only `(C)` by `(C')`: at the height-one primes `𝔔 ∉ Σ_Λ` the finite-level error-tolerant theorem of Layer 4 holds, `H¹_{F_𝔔}(K, T_𝔔)` free of rank one, `H¹_{F_𝔔}(K, A_𝔔) ≅ D_𝔔 ⊕ M_𝔔 ⊕ M_𝔔` with `M_𝔔` finite and `length M_𝔔 ≤ length(H¹_{F_𝔔}(K, T_𝔔)/S_𝔔κ^{(𝔔)}_1) + E_𝔔`, where for every height-one `𝔓` outside a finite set `Σ`' containing `(ϖ)` the errors `E_𝔔` at `𝔔 = (g + ϖ^m)` are bounded as `m` varies, where `ϖ` is a uniformizer of `O` and the lengths are over the indicated specialized DVRs. Then `H¹_{F_Λ}(K, 𝐓)` has rank one, `X ∼ Λ ⊕ M ⊕ M` with `M` torsion, and `char(M)` divides `char(H¹_{F_Λ}(K, 𝐓)/Λκ_1)` after inverting the primes of `Σ`', `i`.`e`. `ord_𝔓 char(M) ≤ ord_𝔓 char(H¹_{F_Λ}(K, 𝐓)/Λκ_1)` for every height-one `𝔓 ∉ Σ`'. Instance (Castella–Grossi–Lee–Skinner): `E/Q` of conductor `N, p ∤ 2N` good ordinary, `K` imaginary quadratic with `D_K` prime to `Np`, every prime dividing `N` split in `K, p` split in `K`, and `E(K)[p] = 0` (residual irreducibility not assumed), with (Sc) and (Irr) of Layer 1.14, `𝐓 = T_pE ⊗ Λ` with the ordinary structure (relaxed away from `p` on `𝐓`), `L = L_E, 𝔓_0 = (γ − 1)`: if `κ ∈ KS(𝐓, F_Λ, L_E)` has `κ_1 ≠ 0`, then `H¹_{F_Λ}(K, 𝐓)` has `Λ`-rank one and `X ∼ Λ ⊕ M ⊕ M` with `char_Λ(M) | char_Λ(H¹_{F_Λ}(K, 𝐓)/Λκ_1)` in `Λ[1/p, 1/(γ − 1)]` (Theorem 3.4.1); if moreover `H¹_F(K, E[p^∞])` has `Z_p`-corank one, the divisibility holds in `Λ[1/p]` (Corollary 3.4.2).

The precise hypotheses are The finite-level error-tolerant theorem (Castella et al., Theorem 3.2.1, with error `E_α` depending on `C_α, T_pE` and `rank R`) is owned by Layer 4; the theorem here gives its Iwasawa variation; Near `𝔓_0` the constant `C_α` of the specializations is unbounded, hence the localization at `γ − 1`; Corollary 3.4.2 removes it using control at `𝔓_0`, which the source does not prove: use `augmentationControl` below, `rank_{Z_p} X/𝔓_0X = corank_{Z_p} H¹_F(K, E[p^∞])`; In `Z_p`-lengths the error at `𝔔` is `f_𝔔·E_{α_𝔔}, f_𝔔` the residue degree of `S_𝔔` (the residue-degree conversion); the character `α_𝔓` is `Ψ` mod `𝔓` in the convention of Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2), §3.4, Theorem 3.4.1, p. 26). The elliptic rank-one and paired-structure conclusion, with divisibility after inverting `p` and the augmentation generator.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2), §3.4, Corollary 3.4.2, p. 27). Corollary 3.4.2.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2), §3.4, proof of Theorem 3.4.1, p. 27). The uniformity of the error, which is hypothesis `(C')`.

For the elliptic instance `O=ℤ_p`, specialize at `𝔔 = (g + p^m)` for `𝔓 = (g) ≠ (p), 𝔓_0` and apply `(C')` with `E_{α_𝔔} = E_{α_𝔓}` for `m ≫ 0`, since `rank_{Z_p} S_𝔔 = rank_{Z_p} S_𝔓` and `C_{α_𝔔} = C_{α_𝔓}` (Castella et al., proof of Theorem 3.4.1).

As in Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10), `length_{Z_p}(H¹_{F_𝔔}/S_𝔔κ^{(𝔔)}_1) = md·ord_𝔓(f_Λ) + O(1)` and `2·length_{Z_p}(M_𝔔) = md·ord_𝔓 char(X_tors) + O(1)`; the bounded error disappears as `m → ∞`, giving `ord_𝔓 char(X_tors) ≤ 2 ord_𝔓(f_Λ)` for `𝔓 ≠ (p), 𝔓_0`; `(i)` is shown exactly as in Howard's Theorem 2.2.10.

Corollary 3.4.2: with control at `𝔓_0`, corank one of `H¹_F(K, E[p^∞])` makes `X_tors/𝔓_0X_tors` torsion over `Z_p`, so `ord_{𝔓_0} char(X_tors) = 0`.

**Augmentation control (`augmentationControl`).** In the elliptic instance above (`E/ℚ` good ordinary at `p ∤ 2N`, `(D_K, Np) = 1`, every prime dividing `N` and `p` split in `K`, `E(K)[p] = 0`), with `X = H¹_{F_Λ}(K, M_E)^∨`, restriction `H¹_{F_ord}(K, E[p^∞]) → H¹_{F_Λ}(K, M_E)[γ − 1]` has finite kernel and cokernel. Hence `rank_{Z_p} X/(γ − 1)X = corank_{Z_p} H¹_{F_ord}(K, E[p^∞])`.

The precise hypotheses are those of the elliptic instance; residual irreducibility, (Sc) and (Irr) are not used.

([Ralph Greenberg, Iwasawa theory for elliptic curves](https://arxiv.org/abs/math/9809206), §3, Lemmas 3.1–3.5 and the proof of Theorem 1.2, pp. 22–26 (arXiv; Lecture Notes in Mathematics 1716)). The global and local kernel computations for control of ordinary Selmer groups along a `Z_p`-extension; they are written for the cyclotomic tower and use only that the primes above `p` have open inertia groups and the other bad primes are unramified and finitely decomposed, which holds in the anticyclotomic instance.

Apply SelmerIwasawaCohomology §3.11 to `K∞/K`. Globally the kernel of restriction is `H¹(Γ, E(K∞)[p^∞])`, which vanishes because `E(K)[p] = 0` and `Γ` pro-`p` force `E(K∞)[p] = 0`; the cokernel lies in `H²(Γ, E(K∞)[p^∞]) = 0`. At `w | N` the prime splits in `K`, so it is unramified and finitely decomposed in `K∞` and the local error is finite (Greenberg's Lemma 3.3); for the unramified condition it is zero, since `Gal(K_w^{ur}/K_{∞,w})` has order prime to `p`. At `v | p` the inertia group in `Γ` is open, so the local error is finite, bounded in terms of the `p`-part of `Ẽ(k_w)` for the residue field `k_w` of `K∞` at `w | v` (Greenberg's Lemma 3.4). The snake sequence of §3.11 gives finite kernel and cokernel, and Pontryagin duality identifies the dual of `H¹_{F_Λ}(K, M_E)[γ − 1]` with `X/(γ − 1)X`.

**Checks.**

- `augmentationControl.pro_p_invariants`: `E(K)[p] = 0` gives `E(K∞)[p] = 0`, since a pro-`p` group acting on a nonzero finite `p`-group fixes a nonzero vector. Without it the global kernel can be nonzero: if `E(K∞)[p^∞] = ℤ/p` with trivial `Γ`-action, it is `Hom(Γ, ℤ/p) ≅ ℤ/p`.
- `augmentationControl.anomalous`: At `v | p`, when `K_{∞,w}/K_v` is totally ramified, the local kernel has order `|Ẽ(k_v)[p^∞]|²` (Greenberg's Lemma 3.4), which is nonzero when `Ẽ(k_v)[p] ≠ 0`, for instance `a_p ≡ 1 (mod p)` with `K_v = ℚ_p`; the statement asserts finite kernel and cokernel, not an isomorphism.
- `augmentationControl.corank_one`: If `H¹_{F_ord}(K, E[p^∞])` has `Z_p`-corank one and `X ∼ Λ ⊕ M ⊕ M`, then `X/(γ − 1)X` has `Z_p`-rank one, so `M/(γ − 1)M` is finite and `ord_{(γ − 1)} char(M) = 0`; this is the use in Corollary 3.4.2.

The paired pseudo-isomorphism is a separate conclusion from the inequality: use specialization control and the paired finite-level structure to force even multiplicity in every height-one elementary-divisor block. At the coefficient prime `(ϖ)`, use the Eisenstein quotients `(T^m+ϖ)` from 8.28, whose normalization index is 1; for `O=ℤ_p` this is `(T^m+p)`. Over a ramified `O, T^m+p` need not be Eisenstein. The descent-inequality errors `E_𝔔` need not be uniform for this paired-structure argument, which uses only the finite-level paired decomposition; the kernels and cokernels of the comparison maps must still be uniformly bounded. At these Eisenstein quotients their normalization index is 1, so `(B)` supplies that bound. The divisibility inequality additionally requires a uniform `E_𝔔`. Hypothesis `(D)`, retained here, transports the involution symmetry to `char(M)`.

When `ρ_E|G_K` is surjective, Theorem 3.2.1 holds with `E_α = 0` and the statement reduces to Howard's.

At `𝔓_0` the method gives nothing without the corank-one hypothesis.

*Needs:* Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10); Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 4.18 Self-dual descent with explicit error constants; `PadicMeasuresIwasawaAlgebras Layer 4`; `PadicMeasuresIwasawaAlgebras §4.2`; `SelmerIwasawaCohomology Layer 3`.

### 8.32 Equality in Howard's `Λ`-adic bound for `Λ`-primitive self-dual systems

Let `K, K∞/K` (the anticyclotomic `ℤ_p`-extension), `O, Λ = O[[Gal(K∞/K)]], 𝐓 = T ⊗ Λ, 𝐀, F_Λ` and `X = Hom(H¹_{F_Λ}(K, 𝐀), ℚ_p/ℤ_p)` be as in Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10), with its hypotheses `(A)`–`(D)` and `p ≥ 5`, and assume `(E)`: for every height-one `𝔓` outside `Σ_Λ`, and for the perturbations `𝔔` used below, the specialized triple `(T_𝔓, F_𝔓, 𝓛_s(T_𝔓))` and its dual satisfy the hypotheses of Layer 5.13. `A Λ`-adic Kolyvagin system `κ ∈ KS(𝐓, F_Λ, 𝓛)` with `𝓛 ⊇ 𝓛_s` is `Λ`-primitive if for every height-one prime `𝔓` there is `k` with nonzero image in `KS(𝐓/(𝔓, m^k), F_Λ, 𝓛_j)` for all `j ≥ s`, and primitive if its image in `KS(𝐓/m, F_Λ, 𝓛)` is nonzero; primitive implies `Λ`-primitive. If `κ₁ ≠ 0` then `(a) H¹_{F_Λ}(K, 𝐓)` is torsion-free of `Λ`-rank one; `(b) X ∼ Λ ⊕ M ⊕ M` for a torsion `Λ`-module `M` with `char(M) = char(M)^ι`; `(c) char(M)` divides `char(H¹_{F_Λ}(K, 𝐓)/Λκ₁)`, with equality if `κ` is `Λ`-primitive. Elliptic instances: for `T = T_pE` with `E/ℚ` of conductor `N`, `(N, D_K) = 1`, `p ∤ ND_K`, `p ≥ 5`, good reduction at `p` and surjective residual representation, Zanarella takes `F_Λ` to be Howard's ordinary condition when `E` is ordinary at `p`, and the plus condition of Castella–Wan when `E` is supersingular at `p`. The supersingular branch requires `p` to split in `K`; there `(E)` comes from Castella–Wan's proof of their Theorem 5.12, and in the ordinary case from Howard's Proposition 2.1.3. This roadmap does not construct the plus condition or verify `(A)`–`(E)` for either instance; the instances are applications whose `(A)`–`(E)` are explicit hypotheses.

The precise hypotheses are the setting of Layer 8.28 with `(A)`–`(D)`, hypothesis `(E)` and `p ≥ 5`; `κ ∈ KS(𝐓, F_Λ, 𝓛)` with `𝓛 ⊇ 𝓛_s` and `κ₁ ≠ 0`; for the supersingular elliptic instance, `p` split in `K` and the plus local condition.

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.4, Proposition 2.4.1, Definitions 2.4.2–2.4.3 and Proposition 2.4.4, pp. 21–22 (arXiv v1)). the specialised exact formula, `Λ`-primitivity and primitivity of `Λ`-adic systems, and primitive implies `Λ`-primitive

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §2.4, Theorem 2.4.5 and its proof, pp. 22–24 (arXiv v1)). Howard's `Λ`-adic divisibility with equality for `Λ`-primitive systems, by deforming height-one primes

([Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1), §1.1, the choice of `F_Λ` and Assumption 1.1.3, pp. 5–6; §2.4, opening paragraph, p. 21 (arXiv v1)). The ordinary and plus local conditions, the split hypothesis in the supersingular case, and the specialized hypotheses `(E)` from Howard Proposition 2.1.3 and Castella–Wan's proof of Theorem 5.12

A supersingular `E` with `p` inert in `K` is not covered by the elliptic instances: Zanarella's Assumption 1.1.3 and the Castella–Wan construction of the plus condition both require `p` split in `K`.

The argument below is written for `O = ℤ_p`, as in the source; for general `O` replace `p` by the uniformizer `ϖ` in the perturbations and measure lengths over `O`, as in Layer 8.28.

`(a), (b)` and the divisibility in `(c)` are Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10).

For `𝔓 = (g) ≠ (p)`, use `𝔔_m = (g + p^m)`. For `m` sufficiently large, Hensel approximation identifies the finite `ℤ_p`-orders `Λ/𝔓` and `Λ/𝔔_m` as rings, and the normalization index is bounded. Specialization control and the DVR exact structure theorem give `m·d·ord_𝔓 char(M) = m·d·ord_𝔓 char(H¹/Λκ₁) − f_m d(κ^{(𝔔_m)}) + O(1)`, where `d = rank_{ℤ_p}(Λ/𝔓)` and `f_m` is the residue degree of `S_{𝔔_m}`; `f_m` is bounded. This branch does not cover `𝔓 = (p)`.

For `𝔓 ≠ (p), Λ`-primitivity supplies a nonzero finite quotient system and a core vertex at a fixed level `k`. The corresponding quotient representations and cartesian Selmer conditions agree along sufficiently close `𝔔_m`, bounding `d(κ^{(𝔔_m)})` by `k`. For `𝔓 = (p)`, take `𝔔_m = (p + T^m)`; this polynomial is Eisenstein, `Λ/𝔔_m` is already its normalization with uniformizer `T` and residue degree 1, and `length_{ℤ_p} Λ/(p^a, p+T^m) = ma`. The torsion-module length slope is therefore `m·ord_(p)`, with the other characteristic factors contributing `O(1)`. The control bound depends on the normalization index, which is 1 here. For `m ≥ k, Λ/(p+T^m, (p,T)^k) = Λ/(p, (p,T)^k)`, so `Λ`-primitivity and finite-level core-vertex rigidity again bound the specialized defect. This finite-quotient argument avoids treating `Λ/(p)` as a finite `ℤ_p`-order. The coefficient-prime branch uses this Eisenstein perturbation separately from the other height-one primes.

Primitive implies `Λ`-primitive: a residually nonzero system has `d = 0`, so its image at every height-one prime `𝔓` (with `(𝔓, m) = m`) is nonzero with `k(𝔓) = 1`.

For the Heegner Kolyvagin system, primitivity (Kolyvagin's conjecture in its refined form) gives the anticyclotomic main conjecture equality `char(M) = char(H¹/Λκ₁^{Hg})`.

A system that is `Λ`-primitive but has vanishing residual image is allowed: `(c)` still gives equality.

Scaling `κ` by a non-unit of `Λ` destroys `Λ`-primitivity at the primes dividing it and strictly enlarges the right-hand side of `(c)`.

*Needs:* Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10); Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 8.24 The blind spot and `Λ`-primitive Kolyvagin systems; Layer 5.13 Exact length of the Tate–Shafarevich module from a self-dual Kolyvagin system; Layer 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems.

### 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9)

Let `K∞/K` be admissible, `c` an Euler system for `(T, K∞)`, and assume `Hyp(K∞, V)` and `Hyp(K∞/K)`. Let `r` be the number of elementary divisors of `X∞` (with `r = 0` if `X∞` is pseudo-null) and `a_τ` the constant of iwasawa-evaluation-maps. Then `char(X∞)` divides `a_τ^{5r} ind_Λ(c)`, that is, `a_τ^{5r} ind_Λ(c) ⊂ char(X∞)`.

The precise hypotheses are If `c_{K,∞}` is `Λ`-torsion then `ind_Λ(c) = 0` and there is nothing to prove; otherwise `X∞` is torsion by Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2) and `r` is finite; The error `a_τ^{5r}` is an explicit integer: this is the Iwasawa-theoretic counterpart of Layer 4's error-tolerant interface, and it equals 1 exactly when `a_τ=1` or `r=0`; the first case holds under `Hyp(K∞,T)`.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Theorem 1.9, p. 101). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, Lemma 1.8, p. 101). The divisibility lemma of the proof.

Reduction: by Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting one may twist by a character of `Γ` so that Rubin's assumptions (1) and (5) hold; this changes neither `a_τ` (`τ ∈ G_{K∞}` acts on `W ⊗ ρ` as on `W`, and `G_{K∞}`-stable submodules are unchanged) nor `r` (`Tw_ρ` is a ring automorphism of `Λ` preserving elementary divisors), and `Tw_ρ` fixes the integer `a_τ^{5r}`, so the bound for `(T ⊗ ρ, c^ρ)` gives it for `(T, c)`.

Corollary VII.1.7: for `Σ ⊇ Σ_p ∪ {primes where T ramifies} ∪ {∞}` and `ψ ∈ Hom_Λ(H¹(K_Σ/F, T), Λ_F), h^r a_τ^{5r} ψ(c_F) ∈ char(X∞)Λ_F`: iterate Proposition VII.1.6 `r` times from `Ψ(0, F, M') ∋ ψ̄(κ_{F,1,M'})` (`κ_{F,1,M'}` is the image of `c_F`, Lemma IV.4.13) to `Ψ(r, F, M) ⊂ (∏ f_i)Λ_{F,M}`, and let `M` grow.

Lemma VII.1.8: for `G` finite abelian, `R` a principal ideal domain, `B` a finitely generated `R[G]`-module without `R`-torsion and `f ∈ R[G]` not a zero-divisor, if every `ψ(b), ψ ∈ Hom_{R[G]}(B, R[G])`, lies in `fR[G]`, then `b ∈ fB`.

Apply it with `B = H¹(K_Σ/F, T)`/torsion (finitely generated over `Z_p`, Proposition B.2.7) and `b = h^r a_τ^{5r} c_F`; pass to the limit over `F`, the torsion being killed by `Ann_Λ(W^{G_{K∞}})` (Lemma I.2.2(ii)), to get `h^r a_τ^{5r} c_{K,∞} ∈ char(X∞)(H¹_∞(K, T)/H¹_∞(K, T)_tors)`, hence `h^r a_τ^{5r} φ(c_{K,∞}) ∈ char(X∞)` for every `φ`.

Since `h` is prime to the principal ideal `char(X∞), a_τ^{5r} φ(c_{K,∞}) ∈ char(X∞)`.

**Checks.**

- For `r=0`, `char(X∞)=(1)` and `a_τ^{5r}=1` for every positive `a_τ`; in particular `a_τ=5` gives no error factor.
- For `a_τ=1`, the factor is 1 for every `r`, including positive `r`.
- For `r>0` and `a_τ>1`, the factor is strictly greater than 1; `r=1`, `a_τ=5` gives `5⁵`.

Under `Hyp(K∞, T), a_τ = 1` and the bound is `char(X∞) | ind_Λ(c)` (Layer 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3)).

In the example of Layer 8.10 Rubin's evaluation maps and the constant `a_τ` with `τ = (1 ϖ^m; 0 1), a_τ` is divisible by |`k|^m`, so the bound `char(X∞) | a_τ^{5r} ind_Λ(c)` is a divisibility only up to a power of `p` that is at least |`k|^{5mr}`.

*Needs:* Layer 8.29 Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6); Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`; Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2); Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; `PadicMeasuresIwasawaAlgebras §4.6`; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`.

### 8.34 Residual transfer of anticyclotomic `μ`-vanishing

Let `f` be an ordinary Eisenstein newform of weight `2r` and trivial nebentype, `p∤2N, K` imaginary quadratic with `p` and every prime dividing `N` split, and `D_K` odd, prime to `Np` and different from `−3`. Let `O` be the coefficient completion with uniformizer `π` and `T` its selected self-dual-twist lattice. Put `Λ=O[[Γ]]` for the anticyclotomic tower and `A=T⊗_OΛ^∨`, with inverse tautological action. Choose the residual extension `0→k(φ)→T/πT→k(ψ)→0, φψ=ω`, and suppose `H⁰(K,T/πT)=0`. Let `S` contain the primes away from `p` of the level and residual conductors, all split in `K`. Assume the one-dimensional anticyclotomic unramified Selmer duals of the Teichmüller lifts of `φ` and `ψ` are `Λ`-torsion with `μ=0`. Define `F_nr` by full local condition at `𝔭` and `ker[H¹(K_{𝔭̄},A)→H¹(I_{𝔭̄},A)]` at `𝔭̄`, and the analogous unramified conditions away from `p`; its `S`-imprimitive version omits those away-`p` conditions. Then both `X_nr` and `X_nr^S` are `Λ`-torsion with `μ=0`. The same conclusion holds with `𝔭` and `𝔭̄` exchanged. The one-dimensional `μ=0` input is the arithmetic theorem KY1.2.2, not the ordinary rank-one Selmer statement.

The precise hypotheses are: The ordinary Eisenstein lattice with no global residual invariants and residual extension specified in the statement; The finite-character full/unramified `μ=0` supplier, in both `p`-adic orientations and including locally 1 and `ω`; All away-`p` bad primes split in `K`; `p>2` splits in `K`.

([Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), §1.2, Theorem1.2.2 and Proposition1.2.5, pp.13–17; §1.3, Lemma1.3.6, pp.21–23; §1.4, Theorem1.4.1, pp.23–25). The finite-character `μ` input, exceptional local comparison and residual proof of unramified `μ=0`.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §1.4, Proposition1.4.2, p.11; §1.5, Theorem1.5.1, p.12 (arXiv v2)). Nonexceptional local characters and the same residual transfer argument.

For each residual character, the `μ=0` input makes its `π`-torsion Selmer group finite. Relaxing at `S` adds local terms with `μ=0`: at a split prime away from `p` the decomposition group has finite index and the local Euler polynomial is nonzero modulo `π`. Kummer comparison between the residual group and `π`-torsion has only finite kernel/cokernel from `H⁰` and local restriction; keep the trivial-character terms.

Apply the global and strict-at-`𝔭̄` local cohomology sequences to the residual extension. The strict residual Selmer group for `A[π]` lies between the two finite character Selmer groups, up to finite `H⁰` terms, hence is finite. Passing from strict to unramified at `𝔭̄` adds the residual local restriction kernel. KY Lemma1.3.6 bounds this by a finite `k`-space, including `φ|G_p=ω` and `ψ|G_p=1`. Thus the residual unramified Selmer group is finite.

Since `H⁰(K,T/πT)=0`, global Kummer comparison has zero invariant obstruction; the local invariant and restriction kernels remain finite, as in the diagrams on KY pp.24–25. Consequently `Sel_nr^S(K,A)[π]` is finite. The structure theorem for finitely generated `Λ`-modules says finiteness of the quotient of its dual by `π` is equivalent to `Λ`-torsion and `μ=0`. The primitive dual is a quotient, so it has the same vanishing property. Conjugation interchanges the two primes and twists `Γ` by inversion, preserving `(π)`.

The nonexceptional local-character case is `CGLS` Proposition1.4.2, p.11; its argument only uses the residual extension and these local comparisons. KY Theorem1.4.1, pp.24–25, supplies the previously excluded `1/ω` case. Its statement also includes `φ|G_K=ω, ψ|G_K=1`; the subsequent proof and Remark1.4.2, Lemmas1.4.3–1.4.4, pp.25–28, keep the finite global and local invariant terms. In the `μ` argument only their finiteness is used. The exact `λ` formula, including its extra 1 in the globally trivial case, is unnecessary here.

The group here is full/unramified at the two `p`-adic primes; it is not the ordinary/ordinary Selmer group.

If one residual character is globally trivial, an extra finite `k`-space changes `λ` but does not give a `Λ/(π)` summand.

The result uses the selected lattice with no global residual invariants; it does not assert lattice independence of an ordinary `μ`-invariant.

*Needs:* the finite-character `μ=0` hypothesis stated above; `SelmerIwasawaCohomology Layer 2`; `SelmerIwasawaCohomology Layer 3`; `PadicMeasuresIwasawaAlgebras Layer 4`.

### 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound

Use exactly the modular lattice, Heegner splitting assumptions and inverse `Γ`-action of 8.34, with its ordinary filtration. Write `Λ=O[[Γ]], R=Λ_{(π)}, S_ord` for the compact ordinary Selmer group and `X_ord` for the dual discrete ordinary group. Assume `rank_Λ S_ord=rank_Λ X_ord=1` and the finite-character `μ=0` input of 8.34. Then `(X_ord)_{(π)}` is free of rank one over `R`. Consequently `μ((X_ord)_tors)=0` and `μ(M)=0` for `X_ord∼Λ⊕M⊕M`. The coefficient-prime local and condition-change targets below are proved for this lattice from the stated arithmetic inputs; they are not extra `μ` or freeness assumptions on `X_ord`.

The precise hypotheses are: `p>2` split in `K`; all primes of the level and residual conductors away from `p` split in `K`; the selected lattice has `H⁰(K,T/πT)=0`; `T` is the self-dual twist of a good ordinary weight-`2r` modular representation, `r≥1`, with trivial nebentype; compact and discrete ordinary ranks are one; and the finite-character arithmetic `μ` input of 8.34. The local Galois filtration is retained with both graded characters, including the higher-weight twist.

([Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), §1.3, Proposition1.3.4, Lemmas1.3.5–1.3.6, pp.19–23; §1.4, pp.23–25; §3, pp.34–37). Local invariant finiteness, unramified `μ`-vanishing and the self-dually twisted ordinary filtration. The two Poitou–Tate sequences here give the ordinary coefficient-prime comparison.

([Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2), §3.4, pp.26–27; §4.2, Proposition4.2.1, pp.28–29). Ordinary lattice/discrete conventions and the full/zero versus ordinary comparison. The cited proposition only proves a rational formulation equivalence; it is not used as an integral `μ` theorem.

**Coefficient-prime local target (`OrdinaryCoefficientPrime.local`).** At each `w|p` the local anticyclotomic extension has open decomposition and inertia subgroups (KY Lemma1.0.2 pp.8–9). Write the graded characters as `εχ_cyc^r` and `ε^{-1}χ_cyc^{1-r}, ε` unramified. For `r=1` the quotient is unramified; for `r>1` its cyclotomic twist remains in every cochain and pairing. The argument below needs `O`-cofiniteness of invariant groups, not their finiteness or a claim that cyclotomic ramification remains ramified after restriction to the local tower.

For any of these finite-`rank O`-lattices `U`, the group `H⁰(K∞,w,U^*(1)⊗F/O)` is an `O`-submodule of `(F/O)^{rank U}`. Its Pontryagin dual is a quotient of a finite free `O`-module, hence is finitely generated over `O`. Local duality identifies this dual with `H²_Iw(U)`, with the appropriate `ι`. Every finitely generated `O`-module with continuous `Γ`-action is killed by a monic polynomial in an open generator: choose finitely many `O`-generators and apply the determinant identity to a matrix lifting that generator's action. The polynomial has unit leading coefficient and is nonzero modulo `π`. The module therefore vanishes after localization at `(π)`. This proves the required `H²` vanishings for `T⁺, T⁻` and `T` even if an invariant group has positive `O`-corank. It neither assumes nor concludes integral vanishing of `H²`.

For `U=T⁺,T⁻` or `T`, the cohomology sequence of `0→𝐔→𝐔→𝐔/π→0` (middle arrow `π`) makes `H¹(K_w,𝐔)[π]` an image of `H⁰(K_w,𝐔/π)`. The latter is zero: choose an element with nontrivial image in an open subgroup of `Γ` and raise it to a power killing the finite residual matrix action. Its action on the free `k[[Γ]]`-module is multiplication by `γ^a, a≠0`; `γ^a−1` is a non-zero-divisor. This also proves the same global `H⁰` vanishing and `π`-torsion-freeness of compact `H¹`. Finite generation and localization therefore make these `H¹` modules free over the DVR `R`. The local Euler characteristic gives ranks 1,1,2 because `K_w=ℚ_p`; the `H⁰` and `H²` ranks are zero. The filtration's long exact sequence becomes

```text
0 → H¹(K_w,𝐓⁺)_R → H¹(K_w,𝐓)_R → H¹(K_w,𝐓⁻)_R → 0.
```

The first term is the ordinary condition, and its quotient is free rank one. Restriction/corestriction adjunction and local Tate duality identify its exact annihilator with the ordinary condition for the paired discrete representation. The vanished `H²` and invariant terms are precisely what makes this assertion exact at `(π)`.

**Unramified/strict comparison target (`OrdinaryCoefficientPrime.corrections`).** At `w|p` the unramified local condition is `H¹(Fr,A^{I_w})`. Here `A=T⊗Λ^∨` with the inverse tautological action. Choose `g∈I_w` mapping to `γ^{p^s}`, a generator of an open subgroup of `Γ`. On the finite free `Λ`-dual of `A`, the relation `g−1` is a matrix of the form `γ^{p^s}C−1` with `C∈GL₂(O)`, after fixing the dual-action convention. Its determinant annihilates the inertia coinvariants by the adjugate identity. It is nonzero modulo `π`. Weierstrass preparation consequently makes those coinvariants `O`-finite; the dual of `H¹(Fr,A^{I_w})` is an `O`-submodule of them and is `O`-finite too. It vanishes over `R`, including for residual characters 1 and `ω`. KY Lemma1.3.6 pp.21–23 gives a stronger finite-kernel calculation in its selected lattice, but finiteness is unnecessary for this localization.

At a bad prime away from `p`, splitting in `K` makes the `Γ`-decomposition subgroup open (KY Lemma1.0.1 p.8). The local correction is constructed from the finite-`rank O` inertia cohomology and the relation identifying `γ^{p^s}` with Frobenius. On finitely many `O`-generators its Frobenius action has a monic annihilating polynomial; its reduction remains nonzero. This includes finite `O`-torsion in the inertia terms, rather than discarding it by taking a rational inertia-invariant space. The correction is `O`-finite and vanishes over `R`. For a free inertia-invariant lattice this is the usual nonzero local Euler polynomial; rank zero gives polynomial 1. Invariant terms in coefficient propagation are controlled by these same `O`-finite modules. Consequently the full/unramified and full/zero dual Selmer modules agree over `R`; so do the conjugate orientations. Layer 8.34 makes both zero. No assertion that these local groups vanish integrally is used.

**Arithmetic condition-change target (`OrdinaryCoefficientPrime.change`).** Write `S_{a,b}, X_{a,b}` for compact Selmer and dual discrete Selmer modules with conditions `a` at `𝔭, b` at `𝔭̄, a,b∈{0,o,f}`, retaining mutually dual away-`p` conditions. The dual label is `(a^⊥,b^⊥)`, with `0^⊥=f, f^⊥=0, o^⊥=o`, and the `Λ`-involution `ι`. In every displayed `X` term below apply `ι` as dictated by that pairing; it preserves `(π)`, ranks and freeness.

Construct the condition-change sequence at each finite tower level and finite coefficient quotient using finite Poitou–Tate (0.2 in the principal case), then Shapiro and the compact/discrete comparison of ArithmeticGaloisDuality D7 and SelmerIwasawaCohomology Layers 2–3. The finite cohomology terms satisfy Mittag–Leffler; direct limits on the discrete side are exact, and Pontryagin duality gives the compact inverse-limit sequence. First retain the `H⁰`, local `H²` and propagation-kernel terms, rather than dropping them in the finite-level sequence. The preceding local target and correction target show that all these error terms vanish over `R`. This proves, for nested conditions `F₁⊂F₂` used here, the six-term exact sequence

```text
0 → (S_F₁)_R → (S_F₂)_R → (L_F₂/L_F₁)_R
  → (X_F₁⊥)^ι_R → (X_F₂⊥)^ι_R → 0.
```

Global `H²` is kept in the underlying Poitou–Tate comparison; it is not assumed zero in order to manufacture this sequence. The Euler-characteristic comparison obtained from the same finite-level duality gives

```text
rank_Λ S_{f,0} − rank_Λ X_{0,f} = 0,
rank_Λ S_{0,f} − rank_Λ X_{f,0} = 0.
```

Indeed the complex place contributes 2 and the single relaxed `p`-adic place contributes 2; the other `p`-adic place is strict. Global invariants have rank zero, the `H⁰` terms have just been controlled, and away-`p` corrections have rank zero. This is the balanced full/zero calculation for this imaginary quadratic field, not a claim that all Selmer structures have core rank zero. Since both `X` terms vanish over `R, S_{0,f}` and `S_{f,0}` have rank zero. Their localizations inject into the `π`-torsion-free compact global `H¹`, hence are zero. Also `(S_{o,0})_R=0` by containment.

Put `L_q=[H¹(K_𝔭,𝐓)/H¹_ord(K_𝔭,𝐓)]_R` and `L_o=H¹_ord(K_{𝔭̄},𝐓)_R`; both are free rank one by `local`. Apply `change` to `(o,0)⊂(f,0)`. Its compact terms vanish and it gives

```text
0 → L_q → (X_{o,f})^ι_R → (X_{0,f})^ι_R → 0.
```

Thus `(X_{o,f})^ι_R≃L_q` is free. Applying it to `(o,0)⊂(o,o)` gives

```text
0 → (S_ord)_R → L_o → (X_{o,f})^ι_R → (X_ord)^ι_R → 0.
```

The first injection has rank-one source and target; its cokernel is torsion. Its image in the free module `(X_{o,f})^ι_R` must be zero. Exactness forces that cokernel to be zero and the final map to be an isomorphism. Therefore `(X_ord)_R` is free rank one. The conclusion about the regulator image follows from this argument; it was not a local-unit hypothesis.

For `X_ord∼Λ⊕M⊕M`, localization at `(π)` is an isomorphism up to pseudo-null modules. The torsion part has length 2 `length_R M_R`; freeness forces `M_R=0`. All other height-one divisibilities were proved by specialization with bounded errors. Since `ord_{(π)}char(M)=0` and `ord_{(π)}char(S_ord/Λκ₁)≥0`, the coefficient-prime inequality follows.

Over `R`, multiplication by `π` has a torsion cokernel while multiplication by `T=γ−1` is invertible. An `O`-finite local correction vanishes at `(π)`, even though it can affect the augmentation prime.

A single full/zero `μ=0` assertion does not replace both orientations: conjugation and the `ι`-twist must be recorded.

If `L_q` had `R`-torsion or a zero/full dual survived at `(π)`, the first exact sequence would no longer make `X_{o,f}` free. These hypotheses cannot be replaced by a comparison valid only after inverting `π`.

The three comparison targets expose `local_h0_cofinite`, `local_h2_vanish`, `ordinary_exact`, `ordinary_orthogonal`, `unramified_strict_at_pi`, `balanced_full_zero`, and `change_sixTerm`, with their coefficient/tower transition squares. Their carriers are the imported arithmetic cohomology and Selmer modules; the arithmetic verifications above belong here, rather than to an unstated ordinary-control supplier or to the height-pairing Part II.

**Named local and condition-change interfaces.** In `TauCeti.KolyvaginSystems`, `ordinaryFiltration` is the saturated line with the two displayed characters; `ordinaryLocalCondition` is the image of its `H¹` in the full local `H¹`, for the compact and paired discrete coefficients. The preceding `local` target supplies `ordinaryLocal_rank`, `ordinaryLocal_free_at_pi`, and `ordinaryLocal_orthogonal`, and `corrections` supplies `awayLocal_dual_finite_over_O` and `awayLocal_mu_zero` at the split away-`p` places. Here “finite over `O`” means finitely generated over `O`, allowing positive `O`-rank. The general invariant interface is `ordinaryLocal_h0_cofinite`; its dual `ordinaryLocal_h2_finite_over_O` gives vanishing at `(π)`. A finite invariant group for every arbitrary graded character is not needed or asserted.

The stronger names `ordinaryLocal_h0_finite` and `unramifiedKernel_finite` have the following source-qualified specialization only. Keep the same chosen lattice `T=T_f` in the self-dual twist, set `V=T⊗_O F, W_f=V/T` and `M_f=T⊗_O Λ^∨` with the inverse `Γ`-action of 8.34. For `u=γ−1` the coefficient sequence is `0→W_f→M_f→^{u}M_f→0` (KY §1.3 p.18); replacing `T` by another lattice is not implicit. Under KY Proposition1.3.4's additional local residual hypothesis `0→𝔽(ω)→T/πT→𝔽→0` and `H⁰(K,T/πT)=0` for that lattice, both `H⁰(K_w,W_f)` and `H⁰(K_w,M_f)` are finite cyclic `O`-modules, of the form `O/(π^a)` and `O/(π^b), a,b≥0`. The symbols `π` and `u` distinguish the coefficient uniformizer from the Iwasawa variable. KY Lemma1.3.6 then makes `ker(H¹(K_w,M_f)→H¹(I_w,M_f)^{Fr})` finite cyclic. For the separate restriction map with coefficient `M_f[π]`, its kernel is `𝔽` when `H⁰(K_w,M_f)` is nonzero and zero otherwise (pp.20–23). This is not an identification of that kernel with the `π`-torsion of the first kernel. Its proof uses the chosen residual ordering, the invariants of the characteristic-zero ordinary characters, and the two Frobenius coinvariant exact sequences. These assertions apply to `M_f` in those hypotheses, rather than to all subquotients `U` of `T`. They supplement the broader `O`-cofinite proof above. There is no unconditional `ordinaryLocal_h2_finite` assertion for every `U`: its valid general replacement is `O`-finiteness, which is sufficient at `(π)`.

`anticyclotomicSelmerStructure` records the nine `F_{a,b}`, with their fixed away-`p` support, and `anticyclotomicSelmerStructure_dual` records `(a,b)↦(a^⊥,b^⊥)` and `ι`. `iwasawaChangeOfConditions` is `change_sixTerm`. For this rank-two imaginary quadratic setting the general rank identity `iwasawaRankDifference` is

```text
rank_Λ S_{a,b} − rank_Λ X_{a^⊥,b^⊥} = d(a)+d(b)−2,
d(0)=0, d(o)=1, d(f)=2.
```

Derive it from the balanced `(f,0)` calculation and the six-term sequences for nested local conditions, keeping the involution. `iwasawaSelmer_torsionFree` is the `π`-torsion-freeness of these compact Selmer modules as submodules of compact global `H¹`, and hence their freeness after localization at `(π)`; it does not assert `Λ`-freeness. The global `H⁰` argument above, with `γ^a−1` on the residual power-series module, proves this assertion independently of ordinary `μ`-vanishing.

**Checks.**

- `ordinaryFiltration.twist`: At `r=1` the quotient character has cyclotomic exponent 0; at `r=2` it has exponent `−1`. Only the first can be unramified. Treating both as an untwisted unit-root quotient fails this test.
- `ordinaryLocal_free_at_pi.not_integral` and `awayLocal_mu_zero.augmentation_survives`: For an `O`-finite module with `γ` acting by 1, `γ−1` annihilates it and is a unit in `R`; the module vanishes at `(π)`, but can survive at augmentation. Conversely `Λ/(π)` survives at `(π)` and cannot be called an `O`-finite correction.
- `A` trivial rank-one discrete graded character has invariant group `F/O`, which is infinite, but its dual is `O` and still vanishes at `(π)`. This checks that the proof only uses cofiniteness. For `g` with residual action 1, the inertia determinant reduces to `(γ^{p^s}−1)²`, a nonzero power of `T` in `k[[T]]` even when `p=2`; the arithmetic theorem itself retains `p>2`.
- For local graded ranks 1 and 1 over `K_w=ℚ_p`, `ordinary_exact` has ranks `1→2→1`, including a non-split ordinary lattice. A zero ordinary line gives ranks `0→2→2` and is not this filtration.
- `iwasawaChangeOfConditions.trivial`: In the six-term sequence for identical conditions the middle local quotient is zero and both Selmer maps are identities. For `(o,0)⊂(f,0)` the dual labels are `(o,f)→(0,f)`, not `(f,o)→(f,0)`.
- Over `R` a proposed exact segment `R→R→R` with first arrow multiplication by `π` cannot have a free intermediate image equal to `R/(π)`. Exactness of the displayed sequence forces that first arrow to be a unit once its cokernel embeds in a free `R`-module. This detects the missing freeness assumption in a purely algebraic imitation of the argument.
- `awayLocal_mu_zero.inert_excluded`: If a nonsplit bad rational prime is allowed, it can split completely in the anticyclotomic tower. The open-decomposition Euler-polynomial argument then does not apply; the splitting assumptions cannot be deleted.
- `ordinaryLocal_rank.torsion_free`: For the trivial residual character over `ℚ_p, p` odd, finite-level `H¹(ℚ_p,𝔽_p)` has dimension two. This does not replace the compact rank-one calculation: on the residual Iwasawa module an inertia element acts by `γ^{p^s}−1`, which is a nonzero power of `T`, forcing `H⁰` to vanish and hence compact `π`-torsion to vanish.
- `ordinaryLocal_orthogonal.exact`: At `R`, choose dual bases `(e₁,e₂)` and `(f₁,f₂)` for the perfect compact/discrete-dual pairing. The annihilator of `Re₁` is exactly `Rf₂`. A finite-index sublattice `πRf₂` is smaller and fails the exact-annihilator condition. The arithmetic assertion here is localized at `(π)`; no universal integral finite-`H⁰` assertion is inferred.
- `anticyclotomicSelmerStructure_dual.swap`: `(f,0)` pairs with `(0,f), (o,0)` with `(o,f)`, and `(o,o)` with itself, each with `ι`. Away-`p` dual conditions are fixed along these comparisons; conjugation exchanges the two `p`-places separately.
- `iwasawaRankDifference.relaxed` and `iwasawaRankDifference.ordinary`: The differences are 2 for `(f,f), −2` for (0,0), and 0 for `(o,o)`. The ordinary value permits both groups to have rank one; zero difference alone implies neither vanishes.
- `ordinaryLocal_h0_finite.finite_order`: For a trivial rank-one discrete character, `H⁰` contains `F/O` and is infinite. For a nontrivial character `ψ`, choosing `g` with `ψ(g)≠1` bounds invariants by the finite group `(F/O)[ψ(g)−1]`. Thus a finite-character assertion must verify nontriviality on the actual local tower, not just on `G_{K_w}`.
- `unramifiedKernel_finite.cyclic`: In the source-qualified KY specialization, the restriction kernel for `M_f[π]` has dimension one or zero according to the stated invariant test. Taking `π`-torsion of `ker(res_{M_f})` is a different operation: the coefficient long exact sequences and the snake lemma bound its dimension by one, without identifying the two kernels unconditionally. A zero invariant group forces the Frobenius endomorphism in the coinvariant sequence to be surjective and hence injective on the noetherian dual; it gives zero kernel. The general `O`-cofinite argument makes no such residual dimension claim.

*Needs:* Layer 8.34; Layer 0.2; ArithmeticGaloisDuality R02.4/R02.5.1 and D7; SelmerIwasawaCohomology Layers 2–3 (finite duality, compact/discrete limits, Iwasawa Shapiro and finite generation); PadicMeasuresIwasawaAlgebras Layer 4. The named local and condition-change targets are constructed in this subsection.

### 8.36 `Λ`-adic divisibility including the augmentation prime

Let `E/ℚ, p ∤ 2N` good ordinary, `K` imaginary quadratic with `(D_K, Np) = 1`, every prime dividing `N` split in `K, p` split in `K`, and `E(K)[p] = 0, Λ` the anticyclotomic Iwasawa algebra with augmentation ideal `(γ − 1), 𝐓 = T_pE ⊗ Λ` with the ordinary Selmer structure `F_Λ, X = H¹_{F_Λ}(K, M_E)^∨` and `S = H¹_{F_Λ}(K, 𝐓)`. If `κ ∈ KS(𝐓, F_Λ, 𝓛_E)` has `κ₁ ≠ 0`, then `S` has `Λ`-rank one and there is a finitely generated torsion `Λ`-module `M` with `X ∼ Λ ⊕ M ⊕ M` and `char_Λ(M)` dividing `char_Λ(S/Λκ₁)` in `Λ[1/p]`: unlike Layer 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1), the prime `(γ − 1)` is not inverted. For the higher-weight Eisenstein setting below, the same divisibility holds integrally in `Λ`, using Layer 8.34 Residual transfer of anticyclotomic `μ`-vanishing and Layer 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound at `(π)`. The arithmetic finite-character `μ=0` theorem is an explicit supplier input, separate from the Kolyvagin-system error estimate.

The precise hypotheses are: `E/ℚ, p ∤ 2N` good ordinary, `(D_K, Np) = 1, E(K)[p] = 0`; (Sc) and (Irr) of Layer 1.14 (their analogues for `T` in the higher-weight branch); every prime dividing `N` and `p` split in `K`; `κ ∈ KS(𝐓, F_Λ, 𝓛_E)` with `κ₁ ≠ 0`; For the higher-weight branch: `f` is a normalized weight-`2r` newform of trivial nebentype, `p∤2N` is ordinary and Eisenstein, `O` is the coefficient completion, `T` is its chosen self-dual-twist lattice with `H⁰(K,T/πT)=0`, every prime dividing `N` splits in `K, p` splits in `K`, and `D_K` is odd, prime to `Np` and not `−3` (Keller–Yin introduction and §3); For the integral higher-weight branch use the finite-character anticyclotomic `μ=0` input of KY Theorem1.2.2 (including locally 1 and `ω`) with the exact residual-character and lattice conventions of Layer 8.34. The full/zero, unramified and ordinary local dictionaries at `(π)` are those in Layer 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound; no `μ` statement is transferred by nomenclature alone.

([Francesc Castella, Giada Grossi, Christopher Skinner, Mazur's main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), §6.5, Theorem 6.5.1 and its proof, p. 28 (arXiv v2)). the `Λ`-adic divisibility in `Λ[1/p]` including the augmentation prime, by using the uniform near-trivial bound at `(γ − 1)`

([Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), §3, Theorem 3.0.5 and its proof, pp. 36–37 (arXiv v2)). the weight-`2r` version, with the remark that the divisibility holds without inverting `p`

([Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), §1.2, Theorem1.2.2, pp.13–14; §1.4, Theorem1.4.1, pp.24–25). Arithmetic `μ=0` input for the coefficient-prime repair, through the explicit ordinary comparison theorem.

At height-one primes `𝔓 ≠ (p), (γ − 1)` the argument of Layer 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1) applies: specialise at `𝔔_m = (g + p^m)` and use Layer 4.18 Self-dual descent with explicit error constants with error `E_α` bounded in `m`.

At `𝔓 = (γ − 1)` the specialisations are characters `α_m ≡` 1 mod `p^m`, where `E_α` grows with `m`; replace that input by Layer 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1`(a)`, whose error is independent of `m`, so `ord_{(γ−1)} char(M) ≤ ord_{(γ−1)} char(S/Λκ₁)`.

For higher weight, specialization gives divisibility at every height-one prime other than `(π)`, including augmentation via the uniform near-trivial bound. At `(π)`, apply Layer 8.34 Residual transfer of anticyclotomic `μ`-vanishing using the finite-character `μ=0` input and `H⁰(K,T/πT)=0`. Then Layer 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound makes `X_ord` torsion-free at `(π)`, hence `M_{(π)}=0`. The coefficient-prime inequality is `0≤length_{Λ_(π)}(S/Λκ₁)_(π)`, so the characteristic-ideal divisibility holds in `Λ`. This proof does not divide a rank-dependent error by the rank along `π+T^m`. It applies to arbitrary nonzero `κ₁` once these arithmetic Selmer hypotheses hold, and does not rely on a main conjecture for `f`.

If moreover `H¹_F(K, E[p^∞])` has `ℤ_p`-corank one, the error-tolerant theorem already gave the divisibility at `(γ − 1)`; this theorem removes that corank hypothesis.

For the Heegner Kolyvagin system this gives one divisibility of the Heegner point main conjecture in `Λ[1/p]` at Eisenstein primes.

*Needs:* Layer 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1); Layer 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1; Layer 8.22 Control of Selmer groups at height-one specializations; Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 8.34 Residual transfer of anticyclotomic `μ`-vanishing; Layer 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound.

### 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3)

Let `K∞/K` be admissible and `c` an Euler system for `(T, K∞)`. If `T` satisfies `Hyp(K∞, T)` and `Hyp(K∞/K)`, then `char(X∞)` divides `ind_Λ(c), i`.`e`. `ind_Λ(c) ⊂ char(X∞)`.

The precise hypotheses are Rubin's convention: `char(X∞) = 0` when `X∞` is not torsion; if `c_{K,∞}` is torsion then `ind_Λ(c)=0` and the inclusion is automatic. This case does not force `char(X∞)=0`; for a zero Euler system and `X∞=0` it is the unit ideal; Integral divisibility needs `Hyp(K∞, T)`; under only `Hyp(K∞, V)` one gets Layer 8.38 Divisibility up to a power of `p` (Rubin, Theorem II.3.4); Valid for every `d ≥ 1` and also for `p = 2` (Rubin, after Corollary III.2.4); for `d ≥ 2` divisibility of characteristic ideals ignores pseudo-null modules, which need not be finite; This is a divisibility only; equality needs the separately sourced primitivity or main-conjecture arguments of the consumers.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Theorem 3.3, p. 28 (published Theorem 2.3.3, p. 42)). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, end, pp. 101–102). The deduction from Theorem VII.1.9.

By Lemma VII.1.3(ii), `a_τ = 1` under `Hyp(K∞, T)`; apply Layer 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9) (Rubin, proof of Theorems II.3.3 and II.3.4 at the end of VII §1).

Cyclotomic units (Rubin, Chapter III): `T* = O_{χ^{-1}}(1)` satisfies `Hyp(Q∞, T*)` with `τ = 1` and `Hyp(Q∞/Q)` since `K = Q`.

Scaling `c` by `λ ∈ Λ` multiplies `ind_Λ(c)` by `λ`, so the divisibility for `λc` is weaker; it cannot certify more than for `c`.

*Needs:* Layer 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9); Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`; Layer 8.6 Rubin's hypothesis `Hyp(K∞/K)`; Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`.

### 8.38 Divisibility up to a power of `p` (Rubin, Theorem II.3.4)

Let `K∞/K` be admissible and `c` an Euler system for `(T, K∞)`. If `V` satisfies `Hyp(K∞, V)` and `Hyp(K∞/K)`, then there is an integer `t ≥ 0` such that `char(X∞)` divides `p^t ind_Λ(c)`.

The precise hypotheses are `t` is effective: `t` can be taken with `p^t = a_τ^{5r}` up to a unit (Theorem VII.1.9); At height-one primes `𝔓 ≠ ϖΛ` (the only height-one prime containing `p`) this gives `length_{Λ_𝔓}((X∞)_𝔓) ≤ ord_𝔓(ind_Λ(c))`, the form used by Kato's Euler-system applications.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. II §3, Theorem 3.4, p. 28 (published Theorem 2.3.4, p. 42)). The statement with the same hypotheses and conclusion, expressed in roadmap notation.

([Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Ch. VII §1, end, p. 102). The deduction.

`a_τ` is a finite positive integer by Lemma VII.1.3(i); apply Layer 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9) and take `p^t` the `p`-part of `a_τ^{5r}` (the prime-to-`p` part is a unit of `Λ`).

With `Hyp(K∞, T), t = 0` recovers Theorem II.3.3.

For `T = O²` with `τ = (1 ϖ^m; 0 1), V` irreducible over `G_{K∞}` and `Hyp(K∞/K)`, the theorem applies although `Hyp(K∞, T)` fails.

*Needs:* Layer 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9); Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`; Layer 8.6 Rubin's hypothesis `Hyp(K∞/K)`.

### 8.39 Divisibility for the true Selmer group (Rubin, Theorem II.3.8)

Let `K∞/K` be admissible, `c` an Euler system for `(T, K∞)`, and suppose `V` satisfies `Hyp(K∞, V)` and `Hyp(K∞/K)`, with local conditions at `p` as in true-iwasawa-selmer-and-singular-quotient. If `loc^s_{Σp}(c_{K,∞}) ∉ H¹_{∞,s}(K_p, T)_{Λ-tors}` and `H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})` is a torsion `Λ`-module, then `Hom_O(S(K∞, W*), D)` is a torsion `Λ`-module and `(i)` for some `t ≥ 0, char(Hom_O(S(K∞, W*), D))` divides `p^t char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞}))`; (ii) if `T` satisfies `Hyp(K∞, T), char(Hom_O(S(K∞, W*), D))` divides `char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞}))`.

The precise hypotheses are The right-hand side is principal, so the divisibility is between principal ideals; The torsion hypothesis on `H¹_{∞,s}(K_p, T)/Λ loc^s(c_{K,∞})` is the rank-one condition at `p`; it is a hypothesis of each application, where it is verified through Coleman maps and explicit reciprocity laws.

([Karl Rubin, Euler systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), Ch. 2 §3, Theorem 2.3.8, p. 43). The hypotheses and first conclusion, in the published text.

([Karl Rubin, Euler systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf), Ch. 2 §3, proof of Theorem 2.3.8, p. 43). The key step of the proof.

`loc^s(c_{K,∞})` not torsion `⇒ c_{K,∞}` not torsion, so `X∞` is torsion (Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2)) and, by Layer 8.16 The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7), `Hom(S(K∞, W*), D)` is torsion with char `= char(X∞)·char(H¹_{∞,s}(K_p, T)/loc^s(H¹_∞(K, T)))`.

`loc^s(H¹_∞(K, T))` contains the non-torsion `loc^s(c_{K,∞})` and sits in a module of rank one, so it has rank one and there is `ψ: loc^s(H¹_∞(K, T)) → Λ` with pseudo-null cokernel; then `ψ(loc^s(c_{K,∞}))Λ = char(ψ(loc^s H¹_∞)/ψ(loc^s c_{K,∞})Λ) ⊃ char(loc^s(H¹_∞)/Λ loc^s(c_{K,∞}))`.

`ψ ∘ loc^s` is a functional on `H¹_∞(K, T)`, so `ind_Λ(c)` divides `ψ(loc^s(c_{K,∞}))`; combine with Layer 8.38 Divisibility up to a power of `p` (Rubin, Theorem II.3.4) (resp. Layer 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3)) and multiplicativity of characteristic ideals.

Cyclotomic units with the unit condition at `p` do not satisfy the hypotheses: `H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ` is `O` or 0, hence `Λ`-torsion, so `loc^s(c_{Q,∞})` is torsion. The cyclotomic application therefore derives `char(A∞^χ) | J² char(E∞^χ/C_{∞,χ})` from Layer 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3) and Layer 8.16 The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7) directly (Rubin, proof of Theorem III.2.7), not from this theorem.

If `H¹_f = H¹` at `p` the hypotheses fail (`H¹_{∞,s} = 0` makes `loc^s(c_{K,∞})` torsion), so the theorem does not apply; Theorems II.3.3–II.3.4 must be used instead.

*Needs:* Layer 8.16 The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7); Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2); Layer 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3); Layer 8.38 Divisibility up to a power of `p` (Rubin, Theorem II.3.4); Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`; `PadicMeasuresIwasawaAlgebras §4.6`; `PadicMeasuresIwasawaAlgebras §4.6`.

### Examples

For `p` odd, the cyclotomic `Z_p`-extension `Q∞/Q` is admissible: the Frobenius of a prime `ℓ ≠ p` maps to the image of `ℓ` in `Z_p^×/μ_{p−1} ≅ Z_p`, which has infinite order, and `p` is totally ramified.

For `K = Q(√−7), p = 3` and `K∞` the anticyclotomic `Z_3`-extension of `K`, the prime 5 is inert in `K` and splits completely in `K∞/K`: a Frobenius of 5 lies in the coset of `Gal(K∞/Q)` acting on `Γ` by inversion, so its square, the Frobenius of `5O_K`, is trivial.

The trivial extension `K/K` is not a `Z_p^d`-extension (`d ≥ 1` is required); in it every prime splits completely, so no admissibility statement is made about it.

### Dependencies

This layer uses `PadicMeasuresIwasawaAlgebras Layer 1`; `TauCetiRoadmap.ClassFieldTheory Layer 12`; Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely; Layer 0.1 Selmer triples and squarefree conductors; Layer 4.3 Rubin's hypotheses, index of divisibility and error terms; `SelmerIwasawaCohomology §2.2 (Compact and rational Selmer kernel)`; `SelmerIwasawaCohomology §2.10 (Pontryagin duals with the contragredient action)`; `SelmerIwasawaCohomology §2.18 (Selmer groups of T and W as limits)`; `SelmerIwasawaCohomology §3.1 (Iwasawa cohomology)`; `PontryaginDual`; Layer 2.2 The module of Euler systems; `SelmerIwasawaCohomology §3.5 (Universal norms are unramified away from p)`; `SelmerIwasawaCohomology §3.2 (Shapiro’s lemma for Iwasawa cohomology)`; `SelmerIwasawaCohomology §2.13 (Dual Selmer structures)`; `SelmerIwasawaCohomology §2.5 (Propagating local conditions)`; Layer 8.2 Rubin's hypotheses `Hyp(K∞, T)` and `Hyp(K∞, V)`; Layer 8.4 The `Λ`-adic class `c_{K,∞}` of an Euler system; `SelmerIwasawaCohomology §3.3 (Descent and control for Iwasawa cohomology)`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.6`; `Module.Dual`; `Ideal.span`; Layer 8.3 The Iwasawa module `X∞` of the restricted Selmer groups; Layer 2.5 Twisting Euler systems by characters of finite order; Layer 2.1 Euler polynomials and their conventions; Layer 1.7 Kolyvagin primes: `P_k, P(L, τ)` and `R_{F,M}`; Layer 4.10 Rubin's selection of primes with large localisation; Layer 3.9 Kolyvagin's derivative classes `κ_{F,r,M}`; Layer 3.13 Local behaviour of derivative classes; Layer 3.14 Kolyvagin's congruence; `SelmerIwasawaCohomology §2.19 (Poitou–Tate for Selmer groups)`; `SelmerIwasawaCohomology §2.7 (The unramified condition)`; Layer 8.5 The `Λ`-adic representation `𝐓 = T ⊗ Λ` and its Selmer structures; Layer 1.4 The ideals `I_q, I_n` and the groups `G_q, G_n`; Layer 1.8 The finite–singular comparison map; Layer 1.9 The Selmer structures `F_a^b(c)`; Layer 3.3 Kolyvagin systems, weak Kolyvagin systems and their limits; `SelmerIwasawaCohomology Layer 3`; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.3`; Layer 8.9 Twisting Euler systems by characters of infinite order; Layer 8.7 The `Λ`-adic index of divisibility `ind_Λ`; Layer 8.6 Rubin's hypothesis `Hyp(K∞/K)`; `PadicMeasuresIwasawaAlgebras Layer 4`; `ArithmeticGaloisDuality §R02.2.1 (The Hochschild–Serre spectral sequence)`; `SelmerIwasawaCohomology §2.6 (From V to T and W; saturation)`; `SelmerIwasawaCohomology §2.15 (Finite against unramified classes at bad primes)`; `Ideal.height`; Layer 8.8 The true Iwasawa Selmer group and the singular local term at `p`; Layer 8.12 `Λ`-adic Kolyvagin systems; Layer 2.4 The conductor-indexed presentations; Layer 3.15 Derivative classes form a weak Kolyvagin system; their finite parts; Layer 3.17 The map from Euler systems to Kolyvagin systems; `PadicMeasuresIwasawaAlgebras §4.3`; `IsIntegralClosure`; `IsDiscreteValuationRing`; `Polynomial.IsDistinguishedAt`; `UniqueFactorizationMonoid`; Layer 8.15 Kernels and cokernels of restriction along the tower; Layer 8.14 Invariance of the Iwasawa-theoretic statements under twisting; `PadicMeasuresIwasawaAlgebras Layer 5`; `SelmerIwasawaCohomology Layer 4`; Layer 8.18 Specialization of `Λ`-adic Kolyvagin systems at height-one primes; Layer 8.13 The exceptional set `Σ_Λ` of height-one primes; Layer 1.12 The Mazur–Rubin 2004 hypotheses `(H.0)`–`(H.6)` over `ℚ`; Layer 0.7 The canonical and the unramified Selmer structures; Layer 0.6 Selmer modules of quotients and torsion submodules; `SelmerIwasawaCohomology §2.17 (Local duality for the finite conditions on T and W_M)`; `ArithmeticGaloisDuality §R02.4.3 (Poitou–Tate duality and the nine-term exact sequence)`; Layer 0.8 The core rank of a cartesian Selmer structure; Layer 0.10 Core rank of the canonical and unramified structures; Layer 5.1 Divisibility indices, elementary divisors and primitivity; Layer 5.3 Kolyvagin systems in core rank one; Layer 8.20 `X∞` is finitely generated over `Λ`; Layer 8.10 Rubin's evaluation maps and the constant `a_τ`; `ArithmeticGaloisDuality §R02.1.3 (Rationalisation of lattice cohomology)`; `Module.IsTorsion`; Layer 8.24 The blind spot and `Λ`-primitive Kolyvagin systems; Layer 8.22 Control of Selmer groups at height-one specializations; Layer 4.20 The Kolyvagin system bound; Layer 5.2 Howard's self-dual Selmer triples and hypotheses `H`.0–`H`.5; Layer 5.5 The generalised Cassels pairing and the structure `R^ε ⊕ M ⊕ M`; Layer 5.10 Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring; `PadicMeasuresIwasawaAlgebras §4.2`; `PadicMeasuresIwasawaAlgebras §4.1`; Layer 8.25 Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2); Layer 8.21 The rank-one exceptional actions (Rubin, Lemma VII.3.7); `PadicMeasuresIwasawaAlgebras §4.1`; `PadicMeasuresIwasawaAlgebras §4.2`; Layer 8.27 Weak Leopoldt from a `Λ`-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6); Layer 8.19 Mazur–Rubin's principal index `Ind(c)`; Layer 8.23 The generic core `rank χ(𝐓)` (Mazur–Rubin, Lemma 5.3.16); Layer 5.6 Structure of the dual Selmer group from a Kolyvagin system; Layer 8.28 The self-dual `Λ`-adic Kolyvagin bound (Howard, Theorem 2.2.10); Layer 4.18 Self-dual descent with explicit error constants; Layer 5.13 Exact length of the Tate–Shafarevich module from a self-dual Kolyvagin system; Layer 5.12 Divisibility profile and primitivity of self-dual Kolyvagin systems; Layer 8.29 Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6); the finite-character `μ=0` hypothesis stated above; `SelmerIwasawaCohomology Layer 2`; Layer 8.34 Residual transfer of anticyclotomic `μ`-vanishing; Layer 8.35 OrdinaryCoefficientPrime.local/corrections/change; Layer 0.2 finite self-injective arithmetic duality; Layer 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1); Layer 4.19 Kolyvagin bounds with error independent of the twist, for characters close to 1; Layer 8.35 From unramified `μ`-vanishing to the ordinary coefficient-prime bound; Layer 8.33 The error-tolerant Iwasawa bound `char(X∞) | a_τ^{5r} ind_Λ(c)` (Rubin, Theorem VII.1.9); Layer 8.16 The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7); Layer 8.37 Rubin's Iwasawa divisibility `char(X∞) | ind_Λ(c)` (Theorem II.3.3); Layer 8.38 Divisibility up to a power of `p` (Rubin, Theorem II.3.4); `PadicMeasuresIwasawaAlgebras §4.6`; `PadicMeasuresIwasawaAlgebras §4.6`.

The proof also uses Rubin Chapter VII §§5–7 (Propositions 5.1–5.2, Lemmas 6.1–6.3, Lemma 7.1–Proposition 7.7).

The rank-two conjugate-self-dual ordinary bound is Layer 8.31 The error-tolerant self-dual `Λ`-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1) and Layer 8.36 `Λ`-adic divisibility including the augmentation prime; higher-weight image constants are inputs of the applications.

## Downstream consumers

Applications to Heegner points and generalised Heegner cycles use the derivative constructions, self-dual bounds and specialization theory with their arithmetic inputs. Cyclotomic-unit and Kato Euler-system applications use the Layer 2 carriers and the Layer 4 and 8 bounds. Rank-zero and rank-one Birch–Swinnerton-Dyer applications use the ordinary rank-two conjugate-self-dual bound, with their higher-weight image constants as inputs. Higher-rank class-group applications use Layers 6–7 with the archimedean Rubin–Stark data of Layer 7.7 as hypotheses. Each application supplies its own classes, reciprocity laws and verifications of the hypotheses used here; this roadmap imports no theorem from them.

## References

- [Karl Rubin, Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Author's 1999 draft of Annals of Mathematics Studies 147 (Princeton University Press, 2000), 187 pp., TeX output of 4 August 1999; chapter-relative numbering
- [Karl Rubin, Euler Systems](https://wstein.org/people/rubin/book/hEulerSystems.pdf). Published version. Annals of Mathematics Studies 147 (Princeton University Press, 2000), xi `+ 227` pp; the author's file hosted by W. Stein
- [Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/abs/2008.02571v2). arXiv:2008.02571v2 (authors' final version), 34 pp; published in Inventiones mathematicae 227 (2022), 517–580
- [Francesc Castella, Giada Grossi, Christopher Skinner, Mazur's main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2). arXiv:2303.04373v2, 33 pp.
- [Ashay Burungale, Francesc Castella, Giada Grossi, Christopher Skinner, Non-vanishing of Kolyvagin systems and Iwasawa theory](https://arxiv.org/abs/2312.09301v2). arXiv:2312.09301v2 (18 January 2026), 33 pp.
- [Timo Keller, Mulun Yin, On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2). arXiv:2402.12781v2, 61 pp.
- [Francesc Castella, Ming-Lun Hsieh, Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf). Author's version (dated 2 July 2022) of Mathematische Annalen 370 (2018), 567–628, from the second author's page
- [Murilo Zanarella, On Howard's main conjecture and the Heegner point Kolyvagin system](https://arxiv.org/abs/1908.09197v1). arXiv:1908.09197v1, 50 pp.
- [Wei Zhang, Selmer groups and the indivisibility of Heegner points](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf). Cambridge Journal of Mathematics2(2014),191–253
- [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones mathematicae 228 (2022), 107–375; the NSF Public Access Repository copy, published pagination
- [Barry Mazur and Karl Rubin, Kolyvagin systems](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf). Memoirs of the American Mathematical Society168(2004), no.799; authors’ version dated20October2003,`102PDFpages`, printed pagination
- [Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1). arXiv:1312.4052v1 (14 December 2013), 32 pp.; published in Journal de Théorie des Nombres de Bordeaux 28 (2016)
- [David Burns and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems](https://arxiv.org/abs/1612.06187v1). arXiv:1612.06187v1; §§2.4–2.6, 3.2–3.3 and 4.3 for the arithmetic determinantal-system constructions.
- [David Burns, Ryotaro Sakamoto and Takamichi Sano, On the theory of higher rank Euler, Kolyvagin and Stark systems, II](https://arxiv.org/abs/1805.08448v1). arXiv:1805.08448v1 (22 May 2018), 51 pp.; the only version on arXiv
- [Benjamin Howard, The Heegner point Kolyvagin system](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf). Compositio Mathematica140(2004),1439–1472; published version.
- [Samit Dasgupta and Mahesh Kakde, On the Brumer–Stark conjecture](https://arxiv.org/abs/2010.00657v3). arXiv:2010.00657v3, 99 pp.; published in Annals of Mathematics 197 (2023), 289–388
- [Jan Nekovář, The Euler system method for CM points on Shimura curves](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf). Archived author manuscript, 53 pp. (main text ends on p. 51).
- [Ryotaro Sakamoto, Stark systems over Gorenstein local rings](https://msp.org/ant/2018/12-10/ant-v12-n10-p02-s.pdf). Algebra & Number Theory 12 (2018), 2295–2326; published article, functional-first contraction in Lemma 4.13 and Proposition 4.14.
- [Takamichi Sano, Refined abelian Stark conjectures and the equivariant leading term conjecture of Burns](https://arxiv.org/abs/1406.4623v1). arXiv:1406.4623v1
- [Barry Mazur and Karl Rubin, Controlling Selmer groups in the higher core rank case](https://www.numdam.org/article/JTNB_2016__28_1_145_0.pdf). Journal de Théorie des Nombres de Bordeaux 28 (2016), 145–183; Numdam version of record,
- [Benjamin Howard, The Heegner point Kolyvagin system](https://arxiv.org/pdf/1202.6340v1). arXiv:1202.6340v1 (28 February 2012); published in Compositio Mathematica (2004), no. 6, 1439–1472
- [Kâzım Büyükboduk, Λ-adic Kolyvagin systems](https://arxiv.org/pdf/0706.0377v2). arXiv:0706.0377v2 (30 March 2011); published in International Mathematics Research Notices (2011), doi:10.1093/imrn/rnq186
- [Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2). arXiv:2008.02571v2 (14 September 2021, final version); published in Inventiones Mathematicae 227 (2022), 517–580
- [Jan Nekovář, Kolyvagin’s method for Chow groups of Kuga–Sato varieties](https://archive.mpim-bonn.mpg.de/994/1/preprint_1990_78.pdf). MPIM1990-78 author preprint, 32 PDF pages, printed pagination offset3

- [Bernadette Perrin-Riou, Systèmes d’Euler p-adiques et théorie d’Iwasawa](https://www.numdam.org/item/AIF_1998__48_5_1231_0/), Annales de `l`’Institut Fourier 48 (1998), 1231–1307; §1.2, pp.1236–1240, and Proposition2.2.5, pp.1249–1250, for the abelian cyclotomic trace and local-congruence setting.
- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0/), Astérisque 295 (2004), 117–290; §13.1–13.4, pp.224–226, for the cyclotomic Euler-system convention and method.
