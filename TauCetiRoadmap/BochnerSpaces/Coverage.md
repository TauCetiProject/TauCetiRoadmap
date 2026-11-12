# Source coverage for Bochner spaces

This is a secondary index into the [Bochner spaces roadmap](README.md).
The roadmap gives the mathematical targets and their hypotheses; this index
connects them to the source without imposing the book's implementation order.
An entry records specification coverage, not a completed Lean formalization.

The source is the author-supplied updated `Integration.tex`, main text
sections 1.1–1.3, ending before `\section{Notes}`. Its SHA-256 is
`019bcb4e24884e8ba8cb9de72a1125e51c00aa6e7c42908cefedf7e1f75fb5fd`.
The chapter notes, commented-out passages, and material after `\endinput`
are excluded. No source TeX is redistributed here.

Source identifiers are TeX labels. An identifier such as `L182` denotes an
unlabelled environment starting at that line of this source; prose is located
by line intervals. The tables account for all 103 main-text theorem,
proposition, lemma, corollary, definition, remark, and example environments,
as well as the substantive definitions, assertions, and constructions in
running text. Routine proof steps belong to the indicated result's proof.
Independent helper statements and interfaces are included explicitly.

“Native input” refers to the supplying Mathlib or Tau Ceti modules identified
in the README's existing-library table. A target may reuse such an input and
only need a comparison lemma. The formulations section below makes changes
of hypotheses and conventions explicit.

## Measurability

### Functions on a measurable space

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 31–44 | Real and complex scalars, restriction of scalars, continuous dual and bilinear evaluation | Conventions; native normed spaces and duals; BanachSpaceTheory B1 |
| Prose, lines 48–59 and 68–93 | Norm-Borel, weak and strong measurability; cylindrical measurable structures and finite-coordinate cylinders; weak-star dense linear subspaces separate points | BS1.1; BanachSpaceTheory B1 |
| `prop:cyl`; `cor:Borel-measurable` | Equality of cylindrical and Borel structures in separable Banach spaces; scalar criterion for Borel measurability | BS1.1 |
| `L182`; prose, lines 188–194 | Simple functions, scalar-vector elementary tensors and their finite spans | Native simple-function and scalar-multiplication APIs; BS1.3 and BS3.2 |
| `def:str-meas`; prose, lines 204–209 | Strong measurability and the separable-target comparison with Borel measurability | BS1.1; native `StronglyMeasurable` |
| `L211` | The identity on a nonseparable space is Borel measurable but not strongly measurable, even with the full power-set domain structure | BS9, identity example; BS1.1's separable-range criterion |
| Prose, lines 223–229 | Separably valued and weakly measurable functions | Conventions; BS1.1 |
| `thm:pettis-meas-1` | Pointwise Pettis criterion using the full dual or a weak-star dense linear subspace; approximants in a closed target subspace | BS1.1 and BS1.3 |
| `cor:simple-dominated`; `cor:str-meas-subspace` | Norm-dominated approximants and closed-subspace transport | BS1.3 |
| `cor:Ylimit`; `cor:str-meas` | Stability under pointwise limits; Borel measurability plus separable range | BS1.3 and BS1.1 |
| Prose, lines 381–387 | Continuous composition when the continuous map is defined only on an open set containing the range | BS1.3 |
| `cor:Fcomposition`; `lem:sepBorel` | Borel composition and separability of its image | BS1.3; the complete separable metric-domain formulation described below |

### Functions on a measure space

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| `L437`; `def:str-mu-meas`; prose, lines 443–462 | Finite-measure-support simple functions, a.e. equality, strong $\mu$-measurability, scalar convention and finite-measure exhaustions | Conventions; native a.e. filter, `AEFinStronglyMeasurable` and sigma-finiteness APIs; BS1.2–BS1.3 |
| `prop:strongly-mu_sigma-finite`; `prop:version` | Sigma-finite support and strongly measurable representatives; converse under sigma-finiteness | BS1.2 and BS1.5; native input |
| `ex:const1` | A nonzero constant has finite-support measurability exactly for sigma-finite measures | BS9, constant-function example |
| `rem:str-meas-completion` | Measurability on the completed domain, with global separability and the sigma-finite converse | BS1.5 |
| `rem:pre-image` | Borel preimages and their measure are independent of the chosen measurable representative | BS1.5 |
| Prose, lines 549–554; `thm:pettis-meas-2` | Essential separability, weak $\mu$-measurability and the second Pettis criterion, including closed-subspace approximants | Conventions; BS1.2–BS1.3 |
| `cor:musimple-dominated`; `cor:str-mu-meas-Y`; `cor:limit` | Dominated finite-support approximants, closed-subspace transport and a.e. limits | BS1.3 |
| `cor:composition`; prose, lines 669–672 | Borel composition with the sigma-finiteness or zero-preservation condition; failure without either condition | BS1.3; BS9, constant-composition example |
| `cor:ae-equal`; prose, lines 674–677 | Scalar a.e. equality against a separating subspace gives one common vector equality outside a null set | BS1.2; pointwise version in BS1.1 |
| `ex:str-meas-T` | Reflection of measurability through injective bounded maps from separable domains; failure for $L^\infty(0,1)\hookrightarrow L^2(0,1)$ | BS1.6; BS9, moving-indicator example |

### Operator-valued functions

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 715–731 | Translation operators have continuous orbits and pairwise operator-norm distance two; failure of operator-norm strong measurability | BS9, translation-field example |
| `def:str-meas-oper-val`; prose, lines 740–746 | Orbitwise measurability and its distinction from measurability in operator norm | Conventions; BS1.4 |
| `prop:sot-op`; `L765` | Applying a measurable operator field to a measurable vector field; composition of operator fields | BS1.4; Tau Ceti Carathéodory API |

## Integration

### The Bochner integral

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 787–794; `def:Bochner`; prose, lines 802–820 | Simple integrals, independence of representations, linearity and norm bound; $L^1$ approximation, existence and independence of the limiting integral; a.e. congruence | BS2 foundations; native Bochner and simple-density inputs |
| `prop:Bochner` | Norm-integrability criterion and integral norm estimate | BS2 foundations; native input |
| Prose, lines 847–852; `prop:subspace` | Indicators, restrictions, closed target-subspace integrability and membership of the integral | BS2 foundations; BS1.3 |
| Prose, lines 864–887, including `eq:Bochner-T` | Commutation with bounded operators and scalar evaluations; closed graphs, graph norm and completeness; closed graph theorem | BS2 foundations and BS2.1; native closed-graph input |
| `thm:Hille`; prose, lines 925–926 | Closed-operator integration, graph-valued integrability and domain membership | BS2.1 |
| `L935` | Dominated convergence in $L^1$ and convergence of integrals | BS2, dominated-convergence interface; native input |
| `prop:subst` | Integrability equivalence and substitution for a measurable pushforward | BS2, substitution interface; native input |
| Prose, lines 980–998 | Product measurable structures and measures; pointwise and a.e. measurability of sections | BS2, product interface; native product and strong-measurability inputs |
| `prop:Fubini` | Section integrability, integrability of iterated integrals and equality with the product integral | BS2, Fubini interface; native input |
| `rem:Fubini-nonsigmafinite` | Fubini on finite-rectangle-supported functions for arbitrary measures; diagonal counterexample without localization | BS2, localized Fubini statement; BS4.1; BS9, diagonal example |
| `lem:convexSetsHyperplanes` | Countable affine half-space representation of closed convex sets | BS2.2 |
| Prose, lines 1096–1099; `lem:convexFnSupAffine` | Lower semicontinuity and countable affine-minorant representation of convex functions | BS2.2; native lower-semicontinuity and convexity notions |
| `prop:Jensen` | Jensen's inequality for the Bochner integral | BS2.2 |
| Prose, lines 1159–1163; `prop:absconv` | Convex hull, closure and membership of a probability integral in the closed convex hull | BS2.2; native convex hull |
| `prop:Lp-subspace` | Detecting closed convex constraints from averages | BS2.3, with the measure hypotheses explained below |
| `prop:int-null` | Detection of a.e. equality by integrals over a generating pi-system | BS2.3, for arbitrary measures |

### The Bochner spaces $L^p(S;X)$

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 1231–1235; `L1237`; prose, lines 1250–1268 | A.e. quotient, $L^p$ norms, completeness, a.e.-convergent subsequences, $L^1$ and Bochner integrability, membership via the norm | Conventions; BS3.1; native `Lp` and `MemLp` |
| `L1272` | The support-restricted infinity endpoint and the non-sigma-finite constant-function obstruction | Conventions; BS3.1; BS9 |
| Prose, lines 1290–1295 | The closed subspace associated with a smaller sigma-algebra | BS3.1, with the trimmed measure |
| `prop:Linfty` | Scalar tests for essential boundedness and the exact norm formula | BS3.4 |
| `lem:TfClosed` | Closed-graph boundedness of scalar evaluation into $L^1$ on an arbitrary closed dual subspace | BS3.4, in the stronger $L^p$ form; consumed by BS6.1 |
| `lem:simple-dense` | Finite-support simple density for finite $p$, elementary tensor density, bounded local-in-measure approximation at infinity | BS3.2 |
| `rem:stepfunctions`, including prose at lines 1386–1388 | Generating-algebra simple approximation; cube-supported step-function approximation on $\mathbb R^d$ | BS3.2 |
| `L1391` | Countably-valued finite-support approximation at the infinity endpoint | BS3.2; the construction referred to in the next chapter is stated here explicitly |
| `prop:Mink-cont`; `cor:Fub-Lp` | Mixed-norm contraction and interchange isometry for arbitrary measures | BS4.1 |
| `prop:Lp(Lp)` | Product/iterated Bochner $L^p$ identification and the representative formulas | BS4.2 |
| Prose, lines 1486–1488 | Failure of the product/iterated identification at infinity | BS9, moving-indicator/product example |
| `prop:funnyFubini` | Joint representatives and pointwise evaluation of $L^p$-valued integrals for finite $p$; product-a.e. uniqueness under sigma-finiteness | BS4.3 |
| `L1562` | Infinity-endpoint evaluation when the second measure is sigma-finite | BS4.3 |
| `L1568`; prose, lines 1585 and 1594–1596 | Exact and measure-essential countable generation, purely infinite measures, symmetric difference and restricted measurable structures | BS3.3; native restriction APIs |
| `L1588` | Countable generation of Euclidean Borel sets and generation modulo null sets, but not exact countable generation, of the Lebesgue completion | BS3.3 |
| `prop:Lp-sep` | Separability criterion, purely infinite/sigma-finite decomposition and isometric restriction | BS3.3 |

### Convolution and mollification on $\mathbb R^d$

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 1651–1654; `L1657` | Euclidean Lebesgue measure, convolution, a.e. integrability and Young's bound | BS5; native measure and Tau Ceti convolution APIs |
| Prose, lines 1679–1683; `lem:denseCcLp` | Compactly supported continuous density, including the regular locally compact version mentioned in the prose | BS5; native continuous-function density input |
| `prop:approx-identity` | General integrable-kernel dilation and convergence to $(\int k)f$ | BS5 |
| Prose, line 1732 | Pointer to a later differentiation/convergence topic | Scope boundary: pointwise differentiation is outside this roadmap |

### The Pettis integral

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 1743–1757 | General closed dual test subspace, bounded scalar-evaluation map, the $\tau(X,Y)$-integral and its defining pairing | BS6.1 |
| `ex:weak-int`; `ex:weaks-int` | Dunford and weak-star integrals | BS6.1 |
| Prose, lines 1777–1782 | Weak integrability gives Pettis integrability in reflexive targets | BS6.4 |
| `L1785`; prose, lines 1791–1794; `prop:Pettis-sigma-finite` | Adjoint and set-integral definitions of Pettis integrability; scalar $L^\infty$ integration functionals and their duality relation | BS6.2; BS8.1 and the scalar duality supplier, with endpoint conventions kept explicit |
| Prose, lines 1857–1860 | Bochner integrability implies Pettis integrability and equality of set integrals | BS6.1–BS6.2 |
| `thm:pettis_int_op`; `cor:pettis-wLp` | Weak $L^p$ criterion, scalar multipliers and the finite-measure corollary | BS6.4 |
| `ex:Pettis-c0`; prose, lines 1922 and 1935–1942 | Failure at $p=1$; a total weak integral in the space does not ensure setwise Pettis integrability | BS9, $c_0$ example and its cancellation variant |
| `thm:BesPel`; `prop:weakL1` | Bessaga–Pełczyński criterion and Pettis integrability for targets containing no $c_0$ | BS6.4; BanachSpaceTheory B3 suppliers |
| `prop:int-null-Pettis` | Set-integral uniqueness | BS6.5, with essential separability; BS9 supplies the obstruction without it |
| `prop:Jensen-Pettis`; `prop:absconv-Pettis` | Pettis Jensen inequality and the closed-convex-hull conclusion | BS6.5 |
| `prop:Lp-subspace-Pettis` | Convex constraints detected by averages | BS6.5, with essential separability and sigma-finiteness |

## Duality of Bochner spaces

### Elementary duality results

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 2089–2092 | Scalar $L^p$ duality | Scalar supplier in BanachSpaceTheory B5; existing-library table |
| Prose, lines 2103–2110; `prop:LpLq-norming` | Integral pairing, Hölder bound, isometry, closedness and norming range, including a closed norming dual subspace | BS8.1 |
| Prose, lines 2187–2188; `cor:LpLq-norming-cor` | Finite simple functions need not be dense at infinity, but norm the $L^1$ space through the pairing | BS3.2 and BS8.1 |
| Prose, lines 2197–2204; `prop:dual-ellpX`; prose, lines 2212–2213 | Atoms, atomic measure spaces, arbitrary-index sequence norms and duality, including the sigma-finite $p=1$ case | BS8.3; BanachSpaceTheory B3; native `lp` |

### Duality and the Radon–Nikodým property

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| Prose, lines 2265–2275; `L2277` | Norm-countable additivity, unconditionality, variation, bounded variation, domination and absolute continuity | BS7.1; native `VectorMeasure` and variation |
| Prose, lines 2288–2290; `L2292` | Finite variation of scalar complex measures and its failure for harmonic-coordinate vector measures | BS9; native scalar variation input |
| `lem:vector-measure-bddvar`; `L2324` | Variation as a finite measure and the equivalent absolute-continuity/small-set criteria | BS7.1 |
| `lem:vector-measure` | Vector measure induced by a Bochner density, variation formula and domination for bounded densities | BS7.1; native and Tau Ceti density APIs |
| `def:RNP` | Relative Radon–Nikodým property | BS7.2 |
| `thm:LpX-dual` | Relative RNP of the dual is equivalent to surjectivity of the Bochner duality map | BS8.2 |
| `lem:mu-nu`; prose, lines 2449–2452 | Simultaneously finite, bounded-density exhaustion for two sigma-finite measures | BS7.1 |
| `lem:exhaustion` | General measurable-set property exhaustion principle | BS7.1 |
| `cor:LpX-dual` | Arbitrary-measure duality for $1<p<\infty$ | BS8.2, including localization of a functional to sigma-finite support |
| `L2671`; prose, lines 2678–2682 | Counting-measure summation functional missing a support-restricted $L^\infty$ density; infinite-measure singleton obstruction for the native endpoint | BS9 |

### More about the Radon–Nikodým property

| Source | Mathematical content | Roadmap target or input |
| --- | --- | --- |
| `L2695`; prose, lines 2701–2707 | Representable operators and equality of operator and density norms | BS7.3 |
| `thm:RNP-repr` | Relative RNP versus representability of all $L^1$ operators | BS7.3 |
| Prose, lines 2812–2830 | Conditional expectation as an $L^2$ projection; integral preservation, positivity, modulus inequality, $L^1$ contraction and the adjoint $L^\infty$ realization | BS7.4; native conditional-expectation inputs; explicit trimmed-measure hypothesis |
| `lem:RNP-subsigma` | Passage of relative RNP to a smaller sigma-algebra | BS7.4, under the measure hypotheses explained below |
| `thm:RNP-sep` | Separable determination of relative RNP; inheritance by closed subspaces | BS7.4 |
| `lem:int-relcomp`; `lem:repres-sep` | Relative norm compactness of the range of an indefinite Bochner integral and of indicator images under a representable operator | BS7.3 |
| Prose, lines 2956–2958; `thm:RNP-sepdual-refl` | Reflexivity and RNP of reflexive spaces and separable dual spaces | BS7.5; BanachSpaceTheory B1–B2 and the independent reflexive-density supplier B4.0 |
| `L3015`; `L3023` | Duality consequences and classical $\ell^p$ and scalar $L^p$ RNP examples | BS8.2 and BS7.5 |
| `L3030` | Failure of RNP for $c_0$, $\ell^\infty$, $C[0,1]$ and $L^\infty(0,1)$; sine-coordinate operator and closed $c_0$ embeddings | BS9, including coefficient decay and the nonrepresentability argument |
| `L3051` | Failure of RNP for $L^1(0,1)$ | BS9, using the equivalent range-compactness obstruction for the identity operator |
| `thm:RNP-[0,1]`; `def:RNP-revisited` | Universality of the unit interval and intrinsic RNP | BS7.2 and BS7.5 |
| Prose, lines 3110–3118; `L3120` | Divisibility and atomlessness; generating dyadic partitions | BS7.5 |
| Prose, lines 3171–3186; `lem:mapping-j` | Measure-algebra quotient, metric, Boolean operations and measure; measure-preserving isomorphism and induced scalar $L^1$ isometry | BS3.3 and BS7.5 |
| Constructions in the proofs at lines 1826–1839, 2513–2619 and 3212–3322 | Finite-measure reduction by a positive weight; localization and gluing of densities; divisible/countably generated/finite/sigma-finite reductions | BS7.1, BS7.5 and BS8.2; native conditional expectation through BS7.4 |

## Formulations and conventions

- **Measurability and the infinity endpoint.** The book's strong
  $\mu$-measurability is finite-support measurability, not just native a.e.
  strong measurability. The README distinguishes the two and represents the
  book's infinity space by $L^\infty_\sigma$. Endpoint counterexamples and
  pairings use the appropriate carrier.
- **Completion.** The pointwise strong-measurability statement on the completed
  domain retains globally separable range. Essential separability is enough
  for an a.e. representative, but not for the entire original range.
- **Borel images (`lem:sepBorel`).** BS1.3 specifies the complete separable
  metric-domain result needed for a closed separable Banach subspace. The
  source states a broader result for a merely separable metric domain.
  Its cardinality comparison alone does not justify that generality:
  uncountability of $I$ does not imply $2^{|I|}>2^{\aleph_0}$.
  This index therefore records the Polish-domain formulation, not a claim
  to formalize that broader statement as written.
- **Convex constraints detected by averages.** BS2.3 uses sigma-finiteness,
  or additionally $0\in C$ for arbitrary measures. On a purely infinite
  measure space there may be no positive finite-measure sets to test, so the
  unrestricted source statement needs this qualification.
- **Pettis uniqueness and detection.** BS6.5 retains essential separability
  when deducing one vector a.e. equality or inclusion from scalar tests.
  BS9's $t\mapsto e_t$ example shows why bare Pettis integrability does not
  suffice for the source's unqualified uniqueness statement.
- **Smaller sigma-algebras.** Sigma-finiteness of the ambient measure does
  not imply sigma-finiteness of the trimmed measure. BS7.4 states the finite
  and sigma-finite versions with their actual hypotheses and constructs the
  bounded scalar extension of conditional expectation explicitly.
- **Equivalent constructions.** The main mathematical result may use another
  proof: for example, nonrepresentability of the $L^1(0,1)$ identity is
  obtained from range compactness. Independent source lemmas, such as the
  general exhaustion principle, remain explicit targets even when a
  different proof of a later theorem could avoid them.

## Additional specified material

The README also explicitly specifies some useful supporting results, such as
projective tensor-product identification, orbit integration and the
Orlicz–Pettis countable-additivity interface. Those targets are governed by
the README. Their presence does not require coverage of the chapter notes.
